<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include "../connect.php";
include "../function.php";
$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $data->id;
    
    $datas = array();

    // The request is using the POST method
    try{
        
        $sql = "SELECT vc.id,  
                    v1o.u_name as u_name_old1, v1o.gcal_id as gcal_id1, 
                    v2o.u_name as u_name_old2, v2o.gcal_id as gcal_id2
                FROM ven_change as vc  
                LEFT JOIN ven AS v1o ON v1o.id = vc.ven_id1_old
                LEFT JOIN ven AS v2o ON v2o.id = vc.ven_id2_old
                WHERE vc.id = :id ";

                $query = $conn->prepare($sql);
                $query->bindParam(':id',$id, PDO::PARAM_STR);
                $query->execute();
                $result = $query->fetch(PDO::FETCH_OBJ);


        if($query->rowCount() > 0){                        //count($result)  for odbc
            $conn->beginTransaction();
            $sql = "UPDATE ven_change as vc
                    LEFT JOIN ven AS v1 ON v1.id = vc.ven_id1
                    LEFT JOIN ven AS v2 ON v2.id = vc.ven_id2
                    LEFT JOIN ven AS v1o ON v1o.id = vc.ven_id1_old
                    LEFT JOIN ven AS v2o ON v2o.id = vc.ven_id2_old								
                    SET 
                        vc.`status` = 77,
                        v1.`status` = 77,
                        v2.`status` = 77,
                        v1o.`status` = 1,
                        v2o.`status` = 1
                    WHERE vc.id = :id";
            $query2 = $conn->prepare($sql);
            $query2->bindParam(':id',$id, PDO::PARAM_STR);
            $query2->execute();
            $conn->commit();
            if($query2->rowCount()){   

                /**google calendar */
                if($result->gcal_id1){gcal_update($result->gcal_id1,$result->u_name_old1,'',1);}
                if($result->gcal_id2){gcal_update($result->gcal_id2,$result->u_name_old2,'',1);}

                //ส่ง line ot ven_admin
                $sql = "SELECT token FROM line WHERE name = 'ven_admin'";
                $query = $conn->prepare($sql);
                $query->execute();
                $res = $query->fetch(PDO::FETCH_OBJ);
                $sToken = $res->token;
                $sMessage = 'มีการยกเลิกเวร '.$id."\n";
                $res_line = sendLine($sToken,$sMessage);

                http_response_code(200);
                echo json_encode(array('status' => true, 'message' => 'สำเร็จ'));
                exit;
            }  
    // $st = 1;
    //         $sql = "UPDATE ven SET ven.status = :status WHERE id = :id";
    //         $query = $conn->prepare($sql);
    //         $query->bindParam(':status',$st, PDO::PARAM_INT);
    //         $query->bindParam(':id',$result->ven_id1_old, PDO::PARAM_INT);
    //         $query->execute();
            
    //         $st = 1;
    //         $sql = "UPDATE ven SET ven.status = :status WHERE id = :id";
    //         $query = $conn->prepare($sql);
    //         $query->bindParam(':status',$st, PDO::PARAM_INT);
    //         $query->bindParam(':id',$result->ven_id2_old, PDO::PARAM_INT);
    //         $query->execute();
            
    //         $st = 77;
    //         $sql = "UPDATE ven SET ven.status = :status WHERE id = :id";
    //         $query = $conn->prepare($sql);
    //         $query->bindParam(':status',$st, PDO::PARAM_INT);
    //         $query->bindParam(':id',$result->ven_id1, PDO::PARAM_INT);
    //         $query->execute();

    //         $sql = "UPDATE ven SET ven.status = :status WHERE id = :id";
    //         $query = $conn->prepare($sql);
    //         $query->bindParam(':status',$st, PDO::PARAM_INT);
    //         $query->bindParam(':id',$result->ven_id2, PDO::PARAM_INT);
    //         $query->execute();
            
    //         $sql = "UPDATE ven_change SET ven_change.status = :status WHERE id = :id";
    //         $query = $conn->prepare($sql);
    //         $query->bindParam(':status',$st, PDO::PARAM_INT);
    //         $query->bindParam(':id',$result->id, PDO::PARAM_INT);
    //         $query->execute();

           

            
        }
    
    }catch(PDOException $e){
        $conn->rollback();
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}


