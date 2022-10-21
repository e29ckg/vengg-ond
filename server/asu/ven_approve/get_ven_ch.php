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

    // The request is using the POST method
    try{
        $sql = "SELECT * FROM ven_change GROUP BY ven_month ORDER BY ven_month DESC LIMIT 20";
        $query = $conn->prepare($sql);
        // $query->bindParam(':kkey',$data->kkey, PDO::PARAM_STR);
        $query->execute();
        $res_g = $query->fetchAll(PDO::FETCH_OBJ);
        
        $sql = "SELECT vc.*
                FROM ven_change AS vc
                WHERE status=1 OR status=2 
                ORDER BY id DESC LIMIT 100";
        $query = $conn->prepare($sql);
        // $query->bindParam(':kkey',$data->kkey, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetchAll(PDO::FETCH_OBJ);

        if($query->rowCount() > 0){                        //count($result)  for odbc
            foreach($result as $rs){
                $sql = "SELECT fname, name, sname FROM profile WHERE user_id='$rs->user_id1'";
                $query = $conn->prepare($sql);
                $query->execute();
                $profile1 = $query->fetch(PDO::FETCH_OBJ);

                $sql = "SELECT fname, name, sname FROM profile WHERE user_id='$rs->user_id2'";
                $query = $conn->prepare($sql);
                $query->execute();
                $profile2 = $query->fetch(PDO::FETCH_OBJ);
                
                array_push($datas,array(
                    'id'    => $rs->id,
                    'ven_month'  => $rs->ven_month,
                    'ven_date1'  => $rs->ven_date1,
                    'ven_date2'  => $rs->ven_date2,
                    'user_id1'  => $rs->user_id1,
                    'user_id2'  => $rs->user_id2,
                    'name1' => $profile1->fname.$profile1->name.' '.$profile1->sname,
                    'name2' => $profile2->fname.$profile2->name.' '.$profile2->sname,
                    'DN'  => $rs->DN,
                    'create_at'  => $rs->create_at,
                    'status'  => $rs->status
                ));
            }
            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'สำเร็จ', 'respJSON' => $datas ,'respJSON_G' => $res_g ));
            exit;
        }
     
        http_response_code(200);
        echo json_encode(array('false' => true, 'message' => 'ไม่พบข้อมูล '));
    
    }catch(PDOException $e){
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}