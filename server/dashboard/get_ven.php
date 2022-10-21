<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include "../connect.php";

$data = json_decode(file_get_contents("php://input"));
$id = $data->id; //id_ven ที่เลือก

$user_id = $data->uid;     //user_id ของผู้ใชระบบ

$date_now = Date("Y-m-d");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

$datas = array();

    // The request is using the POST method
    try{
        $sql = "SELECT v.*,p.name,p.img 
        FROM ven as v 
        INNER JOIN profile as p
        ON v.user_id = p.user_id
        WHERE v.id = $id 
        ORDER BY v.ven_date DESC";
        $query = $conn->prepare($sql);
        // $query->bindParam(':kkey',$data->kkey, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_OBJ);

        /** ประวัติการเปลี่ยน */
        // $sql = "SELECT vc.*FROM ven_change as vc                 
        //         WHERE ven_month=:ven_month AND ven_com_num_all = :ven_com_num_all 
        //         AND DN=:DN  AND u_role=:u_role AND (vc.ven_date1 = :ven_date OR vc.ven_date2 = :ven_date2)
        //         ORDER BY vc.id DESC";
        // $query = $conn->prepare($sql);
        // $query->bindParam(':ven_month',$result->ven_month, PDO::PARAM_STR);
        // $query->bindParam(':ven_com_num_all',$result->ven_com_num_all, PDO::PARAM_STR);
        // $query->bindParam(':DN',$result->DN, PDO::PARAM_STR);
        // $query->bindParam(':u_role',$result->u_role, PDO::PARAM_STR);
        // $query->bindParam(':ven_date',$result->ven_date, PDO::PARAM_STR);
        // $query->bindParam(':ven_date2',$result->ven_date, PDO::PARAM_STR);
        // $query->execute();
        // $res_vh = $query->fetchAll(PDO::FETCH_OBJ);

        $sql = "SELECT v.*
        FROM ven as v 
        WHERE ven_date=:ven_date AND ven_month=:ven_month AND ven_com_num_all = :ven_com_num_all 
        AND DN=:DN AND u_role=:u_role  AND (v.status = 1 OR v.status = 2 OR v.status = 4 )
        ORDER BY v.id DESC";
        $query = $conn->prepare($sql);
        $query->bindParam(':ven_date',$result->ven_date, PDO::PARAM_STR);
        $query->bindParam(':ven_month',$result->ven_month, PDO::PARAM_STR);
        $query->bindParam(':ven_com_num_all',$result->ven_com_num_all, PDO::PARAM_STR);
        $query->bindParam(':DN',$result->DN, PDO::PARAM_STR);
        $query->bindParam(':u_role',$result->u_role, PDO::PARAM_STR);
        $query->execute();
        $res_vh = $query->fetchAll(PDO::FETCH_OBJ);


        /** เวรที่สามารถเปลี่ยนได้ */
        $sql = "SELECT v.*FROM ven as v                 
                WHERE v.user_id = :user_id AND ven_month=:ven_month  AND ven_com_num_all = :ven_com_num_all 
                AND DN=:DN  AND u_role=:u_role AND ven_date >= :ven_date AND v.status =1
                ORDER BY ven_date ASC";
        $query = $conn->prepare($sql);
        $query->bindParam(':user_id',$user_id, PDO::PARAM_STR);
        $query->bindParam(':ven_month',$result->ven_month, PDO::PARAM_STR);
        $query->bindParam(':ven_com_num_all',$result->ven_com_num_all, PDO::PARAM_STR);
        $query->bindParam(':DN',$result->DN, PDO::PARAM_STR);
        $query->bindParam(':u_role',$result->u_role, PDO::PARAM_STR);
        $query->bindParam(':ven_date',$date_now, PDO::PARAM_STR);
        $query->execute();
        $res_vfu = $query->fetchAll(PDO::FETCH_OBJ);

        //หาเวรที่ไม่สามารถเปลี่ยนได้
        


        // if($query->rowCount() > 0){                        //count($result)  for odbc
            // foreach($result as $rs){
            //     array_push($datas,array(
            //         'id'    => $rs->id,
            //         'title' => $rs->name,
            //         'start' => $rs->ven_date.' '.$rs->ven_time,
            //     ));
            // }
            http_response_code(200);
            echo json_encode(array(
                'status' => true, 
                'message' => 'สำเร็จ',
                'respJSON' => $result ,
                'my_v' => $res_vfu,
                'vh' => $res_vh,
                'd_now' => $date_now
                ));
            exit;
        // }
     
        // http_response_code(200);
        // echo json_encode(array('status' => true, 'message' => 'ไม่พบข้อมูล ', 'respJSON' => $result));
    
    }catch(PDOException $e){
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}