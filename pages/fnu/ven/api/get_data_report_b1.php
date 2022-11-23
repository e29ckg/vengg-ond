<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");
date_default_timezone_set("Asia/Bangkok");

include 'vendor/autoload.php';
use PhpOffice\PhpWord\IOFactory;
use PhpOffice\PhpWord\TemplateProcessor;

include_once "dbconfig.php";
include_once "./function.php";

// $DN1_PRICE = 2500;  /** ผู้พิพากษากลางคืน   16:30:00    */
// $DN1_PRICE = 1200;  /** จนท กลางคืน      16:30:55    */
// $DN2_PRICE = 3000;  /** ผู้พิพากษากลางวัน   08:30:00    */
// $DN2_PRICE = 1500;  /** จนท กลางคืน      08:30:01, 08:30:11, 08:30:22    */

$_count = 0;
$price_dn1_all = 0;
$price_dn2_all = 0;
$error='';

// $ven_mounth = date("Y-m-d");
// $date_end = date('Y-m-d', strtotime('+7 days'));
// $ven_mounth = date_format($ven_mounth,"Y-m");
//action.php

$data = json_decode(file_get_contents("php://input"));

$VEN_COM_ID = date($data->ven_com_id);
$datas = array();

// http_response_code(200);
//         echo json_encode(array('status' => false, 'massege' => 'ไม่พบข้อมูล', 'responseJSON' => $data->month));
// exit;
try{    
    
    // $sql = "SELECT user_id,fname,name,sname,bank_account, bank_comment FROM `profile` ORDER BY st ASC";
    // $query = $dbcon->prepare($sql);
    // $query->execute();
    // $datas = $query->fetchAll(PDO::FETCH_OBJ);
    
    $sql = "SELECT ven_date, price FROM `ven` WHERE ven_com_idb ='$VEN_COM_ID' AND (status=1 OR status=2) GROUP BY ven_date;";
    $query = $dbcon->prepare($sql);
    $query->execute();
    $day = $query->fetchAll(PDO::FETCH_OBJ);
    $day_num = count($day);


    /** วันหยุด  $HLD */
    // $sql = "SELECT ven_date FROM `ven` WHERE ven_month = '$DATE_MONTH' AND DN = 'กลางวัน' ORDER BY `ven_date` ASC;";
    // $query = $dbcon->prepare($sql);
    // $query->execute();
    // $res_holiday = $query->fetchAll(PDO::FETCH_OBJ);
    // $HLD_count = count($res_holiday);

    // $sql = "SELECT * FROM ven_user GROUP BY user_id ORDER BY 'order' ASC";
    $sql = "SELECT * FROM profile WHERE status = 10 ORDER BY st ASC";
    $query = $dbcon->prepare($sql);
    $query->execute();
    $users = $query->fetchAll(PDO::FETCH_OBJ);

    if (count($users) > 0) {

    //     foreach ($result as $rs){
           
    //         $sql_profile = "SELECT fname, name, sname, phone, bank_account, bank_comment FROM profile WHERE user_id='$rs->user_id'";
    //         $query_profile = $dbcon->prepare($sql_profile);
    //         $query_profile->execute();
    //         $result_profile = $query_profile->fetchAll(PDO::FETCH_OBJ);

    //         // $sql_ven = "SELECT * FROM ven WHERE user_id='$rs->user_id' AND ven_month = '$DATE_MONTH' AND status='1'";
    //         $sql_ven = "SELECT v.ven_date, v.ven_time, v.DN, vc.u_role, vc.ven_com_name, vc.price, v.user_id, v.ven_com_id
    //                     FROM ven_com as vc 
    //                     INNER JOIN ven as v 
    //                     ON vc.id = v.ven_com_id 
    //                     WHERE v.ven_month = '$DATE_MONTH' AND v.user_id = $rs->user_id AND v.`status` = 1 ORDER BY v.ven_date ASC, v.ven_time ASC;";;
    //         $query_ven = $dbcon->prepare($sql_ven);
    //         $query_ven->execute();
    //         $result_ven = $query_ven->fetchAll(PDO::FETCH_OBJ);

    //         if (count($result_ven) > 0) {
    //             // $dn_1_count = 0;
    //             // $dn_1_price = 0;
    //             // $dn_2_count = 0;
    //             // $dn_2_price = 0;
    //             $price_total = 0;
                
    //             foreach ($result_ven as $rs_ven){
    //                 // $TIME['16:30:00']['PRICE'];
    //                 // if($TIME[$rs_ven->ven_time]){
    //                     // $time = $TIME[$rs_ven->ven_time]['PRICE'];
    //                     $price_total = $price_total + $rs_ven->price;
    //                 // }
                    
    //                 // if($TIME[$rs_ven->ven_time]){
    //                     if($rs_ven->DN === 'กลางวัน'){
    //                         $price_dn1_all = $price_dn1_all + $rs_ven->price;
    //                     }else {
    //                         $price_dn2_all = $price_dn2_all + $rs_ven->price;
    //                     }
    //                 // }else {
    //                     // $error = 'Ven_Time error';
    //                 // }

    //             }
    //         }else{
    //             $price_total = 0;
    //         }
    //         $price_all = $price_dn1_all + $price_dn2_all;

    //         if($price_total){
    //             $_count++;
    //             array_push($datas,array(
    //                 'no'            => $_count,
    //                 'user_id'       => $rs->user_id,
    //                 'user_name'     => $result_profile[0]->fname.$result_profile[0]->name.' '.$result_profile[0]->sname, 
    //                 'month'         => $DATE_MONTH,
    //                 'bank_account'  => $result_profile[0]->bank_account,
    //                 'bank_comment'  => $result_profile[0]->bank_comment,
    //                 'phone'         => $result_profile[0]->phone,
    //                 'price_total'   =>  $price_total, 
    //                 'error'         => $error
    //             ));
    //         }
    //     }
    // } 

    // $doc_date = date("Y-m-d");
    // $doc_date  = DateThai_full($doc_date);

    // // if (count($result) > 0) {
    //     http_response_code(200);
    //     echo json_encode(array(
    //         'doc_date'      =>$doc_date, 
    //         'status'        => true, 
    //         'massege'       => 'ok',
    //         'month'         => DateThai_ym($DATE_MONTH),
    //         'day_num'       => $day_num,
    //         'holiday_num'   => $HLD_count,
    //         'count'         => $_count,
    //         'price_all'     => $price_all,             
    //         'price_all_text' => Convert($price_all),             
    //         'datas'         => $datas,
    //         // 'responseJSON' => $result
    //     ));
    // }else {
    //     http_response_code(200);
    //     echo json_encode(array('status' => false, 'massege' => 'ไม่พบข้อมูล', 'responseJSON' => null));
    }
        http_response_code(200);
        echo json_encode(array('status' => true, 'massege' => 'ไม่พบข้อมูล', 'responseJSON' => $datas));
    
}catch(PDOException $e){
    echo "Faild to connect to database" . $e->getMessage();
    http_response_code(400);
    echo json_encode(array('status' => false, 'massege' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
}

