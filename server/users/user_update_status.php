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


if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if($data->user_id && $data->st){
        $user_id = $data->user_id;
        $st = $data->st;
    }else{
        http_response_code(200);
        echo json_encode(array('staus' => false, 'message' => 'no-data'));
        exit;
    }    
$datas = array();
    // The request is using the POST method
    try{
        $sql = "SELECT id FROM profile WHERE user_id = :user_id";
        $query = $conn->prepare($sql);
        $query->bindParam(':user_id',$user_id, PDO::PARAM_INT);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_OBJ);

        if(empty($result)){
            http_response_code(200);
            echo json_encode(array('status' => false, 'message' => 'ไม่มี user นี้อยู่ในระบบ'));
            exit;
        } 
        $date_time = Date("Y-m-d h:i:s");
        $st == 10 ? $str = 1 : $str = 99 ;

        $sql = "UPDATE profile 
                SET status = :status, updated_at = :updated_at, st=:st
                WHERE user_id = :user_id";
        $query = $conn->prepare($sql);
        $query->bindParam(':status',$st, PDO::PARAM_STR);
        $query->bindParam(':updated_at',$date_time, PDO::PARAM_STR);       
        $query->bindParam(':st',$str, PDO::PARAM_INT);       
        $query->bindParam(':user_id',$user_id, PDO::PARAM_INT);       
        $query->execute();   

        $sql = "UPDATE user 
                SET status = :status, updated_at = :updated_at
                WHERE id = :id";
        $query = $conn->prepare($sql);
        $query->bindParam(':status',$st, PDO::PARAM_STR);
        $query->bindParam(':updated_at',$date_time, PDO::PARAM_STR);       
        $query->bindParam(':id',$user_id, PDO::PARAM_INT);       
        $query->execute();   

        http_response_code(200);
        echo json_encode(array('status' => true, 'message' => 'สำเร็จ'));
        exit;
       
    }catch(PDOException $e){
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'ERROR เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}