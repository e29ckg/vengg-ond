<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include "../connect.php";
include "../function.php";

$data = json_decode(file_get_contents("php://input"));


if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if($_SESSION['AD_ROLE'] != 9){
        http_response_code(200);
        echo json_encode(array('staus' => false, 'message' => 'ไม่มีสิทธิ์'));
        exit;
    }

    if($data->user){
        $user = $data->user;
    }else{
        http_response_code(200);
        echo json_encode(array('staus' => false, 'message' => 'no-data'));
        exit;
    }    

$datas = array();
    // The request is using the POST method
    try{
        $sql = "SELECT id FROM user WHERE id = :id";
        $query = $conn->prepare($sql);
        $query->bindParam(':id',$user->id, PDO::PARAM_INT);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_OBJ);

        if(empty($result)){
            http_response_code(200);
            echo json_encode(array('status' => false, 'message' => 'ไม่มี user นี้อยู่ในระบบ'));
            exit;
        } 

        $date_time = Date("Y-m-d H:i:s");
        if($user->password  != null){
            $password = $user->password;
            $password_hash = password_hash($password, PASSWORD_BCRYPT);
            $sql = "UPDATE user SET 
                    username = :username,
                    password_hash = :password_hash,
                    user.role = :role
                    WHERE id = :id";
            $query = $conn->prepare($sql);
            $query->bindParam(':username',$user->username, PDO::PARAM_STR);
            $query->bindParam(':password_hash',$password_hash, PDO::PARAM_STR);
            $query->bindParam(':role',$user->role, PDO::PARAM_INT);      
            $query->bindParam(':id',$user->id, PDO::PARAM_INT);       
            $query->execute();  
            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'สำเร็จ.'));
            exit;

        }else{
            $sql = "UPDATE user SET 
                    username = :username,
                    user.role = :role
                    WHERE id = :id";
            $query = $conn->prepare($sql);
            $query->bindParam(':username',$user->username, PDO::PARAM_STR);
            $query->bindParam(':role',$user->role, PDO::PARAM_INT);      
            $query->bindParam(':id', $user->id, PDO::PARAM_INT);       
            $query->execute(); 
            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'สำเร็จ'));
            exit; 
        }

        http_response_code(200);
        echo json_encode(array('status' => true, 'message' => 'สำเร็จ-no-update'));
        exit;
       
    }catch(PDOException $e){
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'ERROR เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}