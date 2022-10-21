<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
date_default_timezone_set("Asia/Bangkok");

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include "../../connect.php";
include "../../function.php";

$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	$date_now = date("Y-m-d");
	$sToken = "";
	$sMessage = "";

	$sql = "SELECT * FROM line WHERE name = 'ven' AND status=1";
	$query = $conn->prepare($sql);
	$query->execute();
	$res = $query->fetch(PDO::FETCH_OBJ);
	
	if($query->rowCount()){
		$sToken = $res->token;
		$sMessage .= 'ตารางเวร '.DateThai($date_now)."\n";	
		$sql = "SELECT v.*
					FROM ven as v
					WHERE v.ven_date = '$date_now' AND (v.status=1 OR v.status=2)
					ORDER BY v.ven_time ASC";
			$query = $conn->prepare($sql);
			$query->execute();
			$result = $query->fetchAll(PDO::FETCH_OBJ);
	
			foreach($result as $rs){
				$rs->DN == 'กลางวัน' ? $sMessage .= "☀️ ": $sMessage .= "🌙 " ; 
				$sMessage .= $rs->u_name."\n";
			}
		
			http_response_code(200);
			echo sendLine($sToken,$sMessage);

	}else{
		$sql = "SELECT * FROM line WHERE name = 'admin'";
		$query = $conn->prepare($sql);
		$query->execute();
		$res = $query->fetch(PDO::FETCH_OBJ);
		$sToken = $res->token;

		$sMessage = 'ไม่สามารถแจ้งผ่านกลุ่ม ven ได้';
		http_response_code(200);
		echo sendLine($sToken,$sMessage);
	}
	    
}    

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	
	$date_now = date("Y-m-d H:i:s");
	$sToken 	= $data->token;
	$sMessage 	= $data->message;
	
	http_response_code(200);
	echo sendLine($sToken,$sMessage);
	    
}    
?>