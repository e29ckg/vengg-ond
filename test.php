<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include "./server/connect.php";
include "./server/function.php";

$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	// $name = '2222222';
	// $start = '2022-10-22 22:29:00';

	// $res = json_decode(gcal_insert($name,$start));
	// echo $res->resp->id;

	// $id = 'bs9erifhe62635r1ghgbl27dh0';
	
	// echo gcal_update($gcal_id,$name,'',5);
	
	// echo gcal_remove($gcal_id);
	$datas =array();
	$id = 1666155312;

	// $sql = "SELECT * FROM ven WHERE ven_month='2022-11' AND status=1 AND gcal_id IS NULL";
	$sql = "SELECT * FROM ven WHERE ven_month='2022-11' AND gcal_id IS NOT NULL";
	$query = $conn->prepare($sql);  
	// $query->bindParam(':id',$id, PDO::PARAM_STR);
	$query->execute();
	$result = $query->fetchAll(PDO::FETCH_OBJ);
	if($query->rowCount()){
		foreach($result as $rs){
				$name = $rs->u_name;
				$start = $rs->ven_date.' '.$rs->ven_time;
	// 			// $start = '2022-10-22 22:29:00';

				// $res = json_decode(gcal_insert($name,$start));
				// $sql = "UPDATE ven SET gcal_id =:gcal_id WHERE id = :id"; 
				// $gcal_id =$res->resp->id;
				
				$res = gcal_remove($rs->gcal_id);
				$sql = "UPDATE ven SET gcal_id =:gcal_id WHERE id = :id";   
				$gcal_id =null;

				$query = $conn->prepare($sql);
				$query->bindParam(':gcal_id',$gcal_id, PDO::PARAM_STR);
				$query->bindParam(':id',$rs->id, PDO::PARAM_INT);
				$query->execute(); 

			array_push($datas,array(
				'id'    => $rs->id,
				'start' => $rs->ven_date.' '.$rs->ven_time
			));
		}
		http_response_code(200);
		echo json_encode(array('status' => true, 'massege' => 'สำเร็จ', 'respJSON' => $res));
		exit;
	}else{
		http_response_code(200);
		echo json_encode(array('status' => false, 'massege' => 'null',));
		exit;
	}

}    

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	/**
	 * 	post
	 * 
	 * 	token or username
	 * 	message
	 * 
	 */
	
	$date_now = date("Y-m-d H:i:s");
	$sMessage = '';

	if(isset($data->token)){
		$sToken 	= $data->token;
	}else{
		if(isset($data->username)){
			$sql = "SELECT * FROM line WHERE name = '$data->username'";
			$query = $conn->prepare($sql);
			$query->execute();
			$res = $query->fetch(PDO::FETCH_OBJ);
			$sToken = $res->token;
		}else{
			http_response_code(200);
			echo json_encode(array('status' => true, 'message' => 'ไม่พบข้อมูล Token'));
			exit;
		}
	}

	$sMessage .= $data->message;
	$sMessage .= "\n";
	$sMessage .= $date_now;

	
	http_response_code(200);
	echo sendLine($sToken,$sMessage);
	    
}    
?>