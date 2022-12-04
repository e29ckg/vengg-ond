<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include "../../connect.php";
include "../../function.php";

$data = json_decode(file_get_contents("php://input"));

// http_response_code(200);
// echo json_encode(array('status' => true, 'message' => 'ok', 'responseJSON' => $data));
// exit; 

// The request is using the POST method
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $datas = array();   

    try{        
        $id     = $data->id;

        $sql = "SELECT * FROM ven_change WHERE ven_id1 = '$id' OR ven_id2='$id' OR ven_id1_old = '$id' OR ven_id2_old='$id'";
        $query = $conn->prepare($sql);
        $query->execute();
        $res = $query->fetch(PDO::FETCH_OBJ);

        if($query->rowCount()){

            http_response_code(200);
            echo json_encode(array('status' => false, 'message' => 'ไม่สามารถลบได้เนื่องจากมีรายชื่อในใบเปลี่ยนเวร'));
            exit;                

        }else{
            // if(__GOOGLE_CALENDAR__){            
            //     $sql = "SELECT gcal_id FROM ven WHERE id = $id";
            //     $query = $conn->prepare($sql);
            //     $query->execute();
            //     if($query->rowCount()){
            //         $rs = $query->fetch(PDO::FETCH_OBJ);
            //         gcal_remove($rs->gcal_id);    
            //     }                
            // }
            $sql = "DELETE FROM ven WHERE id = $id";
            $conn->exec($sql);
    
            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'DEL ok'));
            exit;                

        }

      
        
        
    }catch(PDOException $e){
        // echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}




