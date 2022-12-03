<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include "../connect.php";

// $data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
 
if(isset($_SESSION['AD_ID'])){
    $ssid = $_SESSION['AD_ID'];

}else{
    $ssid = '';
}
$datas = array();


    // The request is using the POST method
    
    try{
        $sql = "SELECT name, price, color FROM ven_name_sub";
        $query = $conn->prepare($sql);
        // $query->bindParam(':kkey',$data->kkey, PDO::PARAM_STR);
        $query->execute();
        $res = $query->fetchAll(PDO::FETCH_OBJ);
        

        $sql = "SELECT id, ven_date, ven_time, user_id, u_name, u_role, DN, price, ven.status
        FROM ven    
        WHERE status = 1 OR status = 2
        ORDER BY ven_date DESC, ven_time ASC
        LIMIT 800";
        $query = $conn->prepare($sql);
        // $query->bindParam(':kkey',$data->kkey, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetchAll(PDO::FETCH_OBJ);

        if($query->rowCount() > 0){                        //count($result)  for odbc
            foreach($result as $rs){
                $rs->DN == 'กลางวัน' ? $d = '☀️' : $d = '🌙';
                $bgcolor = getColor($rs->u_role, $rs->price);
                if($rs->status == 2 ){
                    $bgcolor ='Yellow' ;
                    $textC = 'black';
                }else{      
                    if($rs->user_id == $_SESSION['AD_ID']){
                        $bgcolor = 'Gold' ;
                        $textC = 'write';
                    } else{
                        $bgcolor = $bgcolor ;
                        $textC = 'write';
                    }
                }
                array_push($datas,array(
                    'id'    => $rs->id,
                    'title' => $d.' '.$rs->u_name,
                    'start' => $rs->ven_date.' '.$rs->ven_time,
                    'allDay' => true,
                    'backgroundColor' => $bgcolor,
                    'textColor' => $textC
                ));
            }
            
            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'สำเร็จ', 'respJSON' => $datas, 'ssid' => $ssid));
            exit;
        }
     
        http_response_code(200);
        echo json_encode(array('status' => true, 'message' => 'ไม่พบข้อมูล ', 'respJSON' => $datas, 'ssid' => $ssid));
    
    }catch(PDOException $e){
        // echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
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




