<?php

session_start();
// error_reporting(E_ALL);
error_reporting(0);
define("__GOOGLE_CALENDAR__",false);

date_default_timezone_set("Asia/Bangkok");

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "vengg";

/** เชื่อมต่อฐานข้อมูลด้วย PHP PDO */
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname;charset=utf8", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
} catch(PDOException $e) {
    // echo "การเชื่อมต่อฐานข้อมูลล้มเหลว: " . $e->getMessage();
    http_response_code(200);
    $response = array('status'=>false,'message' => 'การเชื่อมต่อฐานข้อมูลล้มเหลว:'  . $e->getMessage());
    echo json_encode($response);
    die();
}

//error handler function
function customError($errno, $errstr) {
    // echo "Error: [$errno] $errstr";
    http_response_code(200);
    $response = array('status'=>false,'message' => "Error: [$errno] $errstr");
    echo json_encode($response);
    die();
}

//set error handler
// set_error_handler("customError");

//trigger error
// echo($test);
