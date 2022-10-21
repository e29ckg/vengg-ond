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

$sms = '';
// http_response_code(200);
// echo json_encode(array('status' => true, 'message' => 'ok', 'responseJSON' => $data));
// exit; 

// The request is using the POST method
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $datas = array();   

    try{        
        
            $data_event = $data->data_event; 

            $id         = $data_event->id;
            // sort($data_event->ven_com_id);
            // $ven_com_id = json_encode($data_event->ven_com_id);
            $ven_com_id = $data_event->ven_com_id;
            sort($ven_com_id);
            $ven_com_idb = $data_event->ven_com_idb ;

            $ven_com_name  = '';
            $ven_com_num_all  = '';
            $y = count($data_event->ven_com_id);
            $x =  0;
            $va = array();

            // gettype($ven_com_id);
            if($y >= 1){
                $ven_com_idb = $ven_com_id[0];
                $sms = 'ตรวจสอบเบิกเงินในคำสั่งด้วยนะจ๊ะ';
            }else{
                $ven_com_idb = '';
            }
            
            foreach($data_event->ven_com_id as $cvi){
                $x++;
                $sql    = "SELECT ven_com_name, ven_com_num FROM ven_com WHERE id = $cvi";
                $query  = $conn->prepare($sql);
                $query->execute();
                $res    = $query->fetch(PDO::FETCH_OBJ);
                $ven_com_num_all    .= $res->ven_com_num;
                $ven_com_name       .= $res->ven_com_name ;
                if($x == $y){
                    $ven_com_name       .= '';
                    $ven_com_num_all    .= '';
                }else{
                    $ven_com_name       .= ', ' ;
                    $ven_com_num_all    .= ', ' ;
                }
            }            

            $ven_com_id = json_encode($ven_com_id);

            $sql = "UPDATE ven SET ven_com_id=:ven_com_id, ven_com_idb=:ven_com_idb, ven_com_name=:ven_com_name, ven_com_num_all=:ven_com_num_all  WHERE id = :id";   

            $query = $conn->prepare($sql);
            $query->bindParam(':ven_com_id',$ven_com_id, PDO::PARAM_STR);
            $query->bindParam(':ven_com_idb',$ven_com_idb, PDO::PARAM_STR);
            $query->bindParam(':ven_com_name',$ven_com_name, PDO::PARAM_STR);
            $query->bindParam(':ven_com_num_all',$ven_com_num_all, PDO::PARAM_STR);
            $query->bindParam(':id',$id, PDO::PARAM_INT);
            $query->execute();

            if($sms ==''){$sms='ok.';}

            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => $sms , 'responseJSON' => count($data_event->ven_com_id).' '. $x .' '. json_encode($va)  ));
            exit;  
        
        
    }catch(PDOException $e){
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}




