<?php

use function PHPSTORM_META\type;

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include "../../connect.php";
include "../../function.php";

$data = json_decode(file_get_contents("php://input"));

$sms_err = array();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if($_SESSION['AD_ROLE'] != 9){
        http_response_code(200);
        echo json_encode(array('staus' => false, 'message' => 'ไม่มีสิทธิ์'));
        exit;
    }
   

$datas = array();
    // The request is using the POST method
    try{

        // $sql = "SELECT ven WHERE ven_name = '$data->ven_name' AND  ven_month = '$data->ven_month'";
        // $query = $conn->prepare($sql);       
        // $query->execute(); 
        // $result = $query->fetchAll(PDO::FETCH_OBJ);
        // foreach($result as $r){
        //     if($r->ven_com_idb ==''){
        //         array_push($sms_err,'คำสั่งเบิก เวร'.$r->ven_name.' วันที่ '.$r->ven_date);
        //     }
        // }
        // if($sms_err){
        //     http_response_code(200);
        //     echo json_encode(array('status' => true, 'message' => $sms_err));
        //     exit;
        // }


        $ven_month = $data->ven_month;
        // $sql = "UPDATE ven SET status = 1 WHERE ven_name = '$data->ven_name' AND  ven_month = '$data->ven_month'";
        $sql = "UPDATE ven SET status = 1 WHERE status = 2 AND ven_month = '$ven_month'";
        $query = $conn->prepare($sql);       
        $query->execute();   

        if($query->rowCount()){
            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'สำเร็จ '));
            exit;
        } else {
            http_response_code(200);
            echo json_encode(array('status' => false, 'message' => 'ไม่มีรายการ update'));
            exit;
        }

       
    }catch(PDOException $e){
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'ERROR เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}