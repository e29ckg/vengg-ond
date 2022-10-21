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

// http_response_code(200);
// echo json_encode(array('status' => true, 'message' => 'ok', 'responseJSON' => $data));
// exit; 

// The request is using the POST method
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $datas = array();    
    $act = $data->act;

    try{
        if($act == 'insert'){
            $vc      = $data->vc; 

            $id = time();
            $ven_com_num    = $vc->ven_com_num;
            $ven_com_date   = $vc->ven_com_date;
            $ven_month      = $vc->ven_month;
            $ven_com_name   = $vc->ven_com_name;
            $ven_name       = $vc->ven_name;
            $ref            = generateRandomString();
            $status         = 1 ;

            $sql = "INSERT INTO ven_com(id, ven_com_num, ven_com_date, ven_month, ven_com_name, ven_name, ref, `status`) 
                    VALUE(:id, :ven_com_num, :ven_com_date, :ven_month, :ven_com_name, :ven_name, :ref, :status);";        
            $query = $conn->prepare($sql);
            $query->bindParam(':id',$id, PDO::PARAM_INT);
            $query->bindParam(':ven_com_num',$ven_com_num, PDO::PARAM_STR);
            $query->bindParam(':ven_com_date',$ven_com_date, PDO::PARAM_STR);
            $query->bindParam(':ven_month',$ven_month, PDO::PARAM_STR);
            $query->bindParam(':ven_com_name',$ven_com_name, PDO::PARAM_STR);
            $query->bindParam(':ven_name',$ven_name, PDO::PARAM_STR);
            $query->bindParam(':ref',$ref , PDO::PARAM_STR);
            $query->bindParam(':status',$status , PDO::PARAM_INT);
            $query->execute();

            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'ok', 'responseJSON' => $vc));
            exit;                
        }    
        if($act == 'update'){
            $vc   = $data->vc; 
            $id   = $vc->id;

            $ven_com_num    = $vc->ven_com_num;
            $ven_com_date   = $vc->ven_com_date;
            $ven_month      = $vc->ven_month;
            $ven_com_name   = $vc->ven_com_name;
            $ven_name       = $vc->ven_name;

            $create_at  = Date("Y-m-d h:i:s");

            $sql = "UPDATE ven_com SET ven_com_num=:ven_com_num, ven_com_date=:ven_com_date, ven_month=:ven_month, ven_com_name=:ven_com_name, ven_name=:ven_name 
                    WHERE id = :id";   

            $query = $conn->prepare($sql);
            $query->bindParam(':ven_com_num',$ven_com_num, PDO::PARAM_STR);
            $query->bindParam(':ven_com_date',$ven_com_date, PDO::PARAM_STR);
            $query->bindParam(':ven_month',$ven_month, PDO::PARAM_STR);
            $query->bindParam(':ven_com_name',$ven_com_name, PDO::PARAM_STR);
            $query->bindParam(':ven_name',$ven_name, PDO::PARAM_STR);
            $query->bindParam(':id',$id, PDO::PARAM_INT);
            $query->execute();

            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'ok', 'responseJSON' => $datas));
            exit;                
        }  
        if($act == 'delete'){
            $id     = $data->id;

            $sql = "SELECT * FROM ven WHERE ven_com_idb=:id";
            $query = $conn->prepare($sql);
            $query->bindParam(':id',$id, PDO::PARAM_STR);
            $query->execute();
            $result = $query->fetchAll(PDO::FETCH_OBJ);

            if($query->rowCount()){
                http_response_code(200);
                echo json_encode(array('status' => false, 'message' => 'ไม่สามารถลบได้'));
                exit;   
            }else{
                $sql = "DELETE FROM ven_com WHERE id = $id";
                $conn->exec($sql);
                http_response_code(200);
                echo json_encode(array('status' => true, 'message' => 'DEL ok'));
                exit;                

            }

        }  
        if($act == 'status'){
            $id     = $data->id;
            $st     = $data->st;
            $sql = "UPDATE ven_com SET `status`= $st WHERE id = $id";
            $conn->exec($sql);

            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'ok'));
            exit;                
        }  
        
        
    }catch(PDOException $e){
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}




