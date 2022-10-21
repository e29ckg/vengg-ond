<?php 

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header('Content-Type: text/html; charset=UTF-8');
header("Content-Type: application/json; charset=utf-8");
require_once('../connect.php');
require_once('../function.php');

$data = json_decode(file_get_contents("php://input"));

// if (isset($_POST['authen'])) {
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // $username = cleanData($_POST['username']);
    // $password = cleanData($_POST['password']);
    $username = cleanData($data->username);
    $password = cleanData($data->password);
    
    // $stmt = $conn->prepare("SELECT * FROM users WHERE username = :username AND status = 'true' ");
    $stmt = $conn->prepare("SELECT u.*, p.fname, p.name, p.sname, p.img, p.dep 
                            FROM user as u     INNER JOIN profile as p ON p.user_id = u.id
                            WHERE u.username = :username AND u.status = 10 ");
    $stmt->execute(array(":username" => $username));
    $row = $stmt->fetch(PDO::FETCH_OBJ);
    // $row = $stmt->fetch(PDO::FETCH_ASSOC);


    if( !empty($row) && password_verify($password, $row->password_hash) ) {
        unset($row->password);
        empty($row->img) ?  $u_image = 'avatar.png' : $u_image = $row->img;
        $_SESSION['AD_ID'] = $row->id;
        $_SESSION['AD_FIRSTNAME'] = $row->name;
        $_SESSION['AD_LASTNAME'] = $row->sname;
        $_SESSION['AD_USERNAME'] = $row->username;
        $_SESSION['AD_IMAGE'] = $u_image;
        $_SESSION['AD_ROLE'] = $row->role;
        $_SESSION['AD_STATUS'] = $row->status;
        
        // header('Location: ../../pages/index.php');    
        http_response_code(200);
        $response = array('status'=>true,'message' => 'success', 'ss_uid'=>$_SESSION['AD_ID']);
        echo json_encode($response);
        exit;

    } else {
        // echo "<script> alert('ไม่สามารถเข้าสู่ระบบได้')</script>";
        // header("Refresh:0; url=../../login.php");
        http_response_code(200);
        $response = array('status'=>false, 'message' => 'ไม่สามารถเข้าระบบได้');
        echo json_encode($response);
        exit;
    }
}