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
$usename = $data->username;
$sMessage = $data->message;

//ส่ง line ot ven_admin
    $sql = "SELECT token FROM line WHERE name = '$usename'";
    $query = $conn->prepare($sql);
    $query->execute();
    $res = $query->fetch(PDO::FETCH_OBJ);
    $sToken = $res->token;
    if($query->rowCount()){
        sendLine($sToken,$sMessage) ;
    }
    http_response_code(200);
            echo json_encode(array('status' => false, 'message' => $data));
            exit;
    // $chOne = curl_init(); 
    // curl_setopt( $chOne, CURLOPT_URL, "https://notify-api.line.me/api/notify"); 
    // curl_setopt( $chOne, CURLOPT_SSL_VERIFYHOST, 0); 
    // curl_setopt( $chOne, CURLOPT_SSL_VERIFYPEER, 0); 
    // curl_setopt( $chOne, CURLOPT_POST, 1); 
    // curl_setopt( $chOne, CURLOPT_POSTFIELDS, "message=".$sMessage); 
    // $headers = array( 'Content-type: application/x-www-form-urlencoded', 'Authorization: Bearer '.$sToken.'', );
    // curl_setopt($chOne, CURLOPT_HTTPHEADER, $headers); 
    // curl_setopt( $chOne, CURLOPT_RETURNTRANSFER, 1); 
    // $result = curl_exec( $chOne );
    // //Result error 
    // // if(curl_error($chOne)) 
    // // { 
        // // 	return 'error:' . curl_error($chOne); 
        // // } 
        // // else { 
            // // 	$result_ = json_decode($result, true); 
            // // 	return "status : ".$result_['status']; echo "message : ". $result_['message'];
            // // } 
            // curl_close( $chOne );
        ?>