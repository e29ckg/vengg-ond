<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include "../connect.php";
include "../function.php";

// $data = json_decode(file_get_contents("php://input"));


if ($_SERVER['REQUEST_METHOD'] === 'POST') {

$datas = array();

    // The request is using the POST method
    try{
        // $sql = "SELECT ven_month FROM ven_com GROUP BY ven_month ORDER BY ven_month DESC LIMIT 20";
        // $query = $conn->prepare($sql);
        // // $query->bindParam(':kkey',$data->kkey, PDO::PARAM_STR);
        // $query->execute();
        // $res_g = $query->fetchAll(PDO::FETCH_OBJ);

        $res_g = array();
        $sql = "SELECT * FROM ven_com ORDER BY ven_month DESC LIMIT 100";
        $query = $conn->prepare($sql);
        // $query->bindParam(':kkey',$data->kkey, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetchAll(PDO::FETCH_OBJ);

        if($query->rowCount() > 0){                        //count($result)  for odbc  
            $month = '';          
                        
            foreach($result as $rs){

                if($rs->ven_month != $month){
                    array_push($res_g,array(
                        'ven_month'=> $rs->ven_month,
                        'ven_month_th'=> DateThai_MY($rs->ven_month)
                    ));
                    $month = $rs->ven_month;
                }
                
                if($rs->ven_month == $month){
                    array_push($datas,array(
                        'id'  => $rs->id,
                        'ven_month'    => $rs->ven_month,
                        'ven_com_num'  => $rs->ven_com_num,
                        'ven_com_date' => $rs->ven_com_date,
                        'ven_com_date_th' => DateThai_full($rs->ven_com_date),
                        'ven_name'  => $rs->ven_name,
                        'status'    => $rs->status
                    ));  
                }              
            }
            
            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'สำเร็จ', 'respJSON' => $datas, 'respJSON_G' => $res_g ));
            exit;
        }
     
        http_response_code(200);
        echo json_encode(array('status' => false, 'message' => 'ไม่พบข้อมูล '));
    
    }catch(PDOException $e){
        // echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}