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
        $conn->beginTransaction();

        $sql = "SELECT vc.id , ven_month, ven_date1, ven_date2,ven_com_num_all,DN,u_role,user_id1,user_id2,ven_id1_old,ven_id2_old,ven_id1,ven_id2
                FROM ven_change as vc  
                WHERE id = :id ";
        $query = $conn->prepare($sql);
        $query->bindParam(':id',$id, PDO::PARAM_INT);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_OBJ);

        
        $st = 1;
        $sql = "UPDATE ven SET ven.status = :status WHERE id = :id";
        $query = $conn->prepare($sql);
        $query->bindParam(':status',$st, PDO::PARAM_INT);
        $query->bindParam(':id',$result->ven_id1_old, PDO::PARAM_INT);
        $query->execute();
        
        $st = 1;
        $sql = "UPDATE ven SET ven.status = :status WHERE id = :id";
        $query = $conn->prepare($sql);
        $query->bindParam(':status',$st, PDO::PARAM_INT);
        $query->bindParam(':id',$result->ven_id2_old, PDO::PARAM_INT);
        $query->execute();
        
        $st = 77;
        $sql = "UPDATE ven SET ven.status = :status WHERE id = :id";
        $query = $conn->prepare($sql);
        $query->bindParam(':status',$st, PDO::PARAM_INT);
        $query->bindParam(':id',$result->ven_id1, PDO::PARAM_INT);
        $query->execute();

        $sql = "UPDATE ven SET ven.status = :status WHERE id = :id";
        $query = $conn->prepare($sql);
        $query->bindParam(':status',$st, PDO::PARAM_INT);
        $query->bindParam(':id',$result->ven_id2, PDO::PARAM_INT);
        $query->execute();
        
        $sql = "UPDATE ven_change SET ven_change.status = :status WHERE id = :id";
        $query = $conn->prepare($sql);
        $query->bindParam(':status',$st, PDO::PARAM_INT);
        $query->bindParam(':id',$result->id, PDO::PARAM_INT);
        $query->execute();

        $conn->commit();

        // if($query->rowCount() > 0){                        //count($result)  for odbc
            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'สำเร็จ'));
            exit;
        // }
    
    }catch(PDOException $e){
        $conn->rollback();
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}


