<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include "../../connect.php";
include "../../function.php";

// $data = json_decode(file_get_contents("php://input"));


if ($_SERVER['REQUEST_METHOD'] === 'GET') {

$datas = array();

    try{

        $sql = "SELECT name, price, color FROM ven_name_sub";
        $query = $conn->prepare($sql);
        $query->execute();
        $res = $query->fetchAll(PDO::FETCH_OBJ);

        $sql = "SELECT v.id, v.ven_date, v.ven_time, v.u_role, v.price, p.name, p.sname FROM ven as v 
                INNER JOIN `profile` as p ON v.user_id = p.user_id
                WHERE (v.status = 1 OR v.status = 2 OR v.status = 5) AND p.`status` = 10
                ORDER BY v.ven_date DESC, v.ven_time ASC
                LIMIT 500";
        $query = $conn->prepare($sql);
        $query->execute();
        $result = $query->fetchAll(PDO::FETCH_OBJ);

        if($query->rowCount() > 0){                        //count($result)  for odbc
            foreach($result as $rs){
                $bgcolor = getColor($rs->u_role, $rs->price);
                array_push($datas,array(
                    'id'    => $rs->id,
                    'title' => $rs->name. ' '. $rs->sname,
                    'start' => $rs->ven_date.' '.$rs->ven_time,
                    'backgroundColor' => $bgcolor,
                ));
            }
            http_response_code(200);
            echo json_encode(array('status' => true, 'massege' => 'สำเร็จ', 'respJSON' => $datas));
            exit;
        }
     
        http_response_code(200);
        echo json_encode(array('status' => true, 'massege' => 'ไม่พบข้อมูล ', 'respJSON' => $datas));
    
    }catch(PDOException $e){
        // echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'massege' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}

function getColor($d,$price){    
    $color = '';
    foreach($GLOBALS['res'] as $rs){
        if($rs->name == $d && $rs->price == $price){
            $color = $rs->color;
            break;
        }
    }
    return $color; 
}

