<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include "../connect.php";

$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

$datas = array();


    // The request is using the POST method
    try{
        $sql = "SELECT id, user_id, u_name
        FROM ven_user    
        WHERE ven_name = :ven_name AND uvn = :uvn";
        $query = $conn->prepare($sql);
        $query->bindParam(':ven_name',$data->ven_name, PDO::PARAM_STR);
        $query->bindParam(':uvn',$data->uvn, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetchAll(PDO::FETCH_OBJ);

        if($query->rowCount() > 0){                        //count($result)  for odbc
            // foreach($result as $rs){
            //     $rs->DN == 'กลางวัน' ? $d = '☀️' : $d = '🌙';
            //     $rs->status == 1 ? $bgcolor ='blue' : $bgcolor = 'red';
            //     array_push($datas,array(
            //         'id'    => $rs->id,
            //         'title' => $d.' '.$rs->u_name,
            //         'start' => $rs->ven_date.' '.$rs->ven_time,
            //         'backgroundColor' => $bgcolor,
            //     ));
            // }
            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'สำเร็จ', 'respJSON' => $result));
            exit;
        }
     
        http_response_code(200);
        echo json_encode(array('status' => true, 'message' => 'ไม่พบข้อมูล ', 'respJSON' => $datas));
    
    }catch(PDOException $e){
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}


