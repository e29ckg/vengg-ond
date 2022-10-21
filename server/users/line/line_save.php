<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include "../../connect.php";
include "../../function.php";
require_once('../../authen.php'); 

$data = json_decode(file_get_contents("php://input"));


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $act = $data->act;
       
    $datas = array();
    // The request is using the POST method
    try{
        if($act =='insert'){
            $line = $data->line;

            $sql = "INSERT INTO line(name, token, status) 
                    VALUE('$line->name', '$line->token', 1);";   
            $query = $conn->prepare($sql);

            if($query->execute()){ 
                http_response_code(200);
                echo json_encode(array('status' => true, 'message' => 'บันทึกข้อมูลสำเร็จ'));
                exit;            
            }
        }
        if($act == 'update'){ 
            $line = $data->line;

            $sql = "UPDATE line SET 
                        name = :name,
                        token = :token
                        WHERE id = :id";
            $query = $conn->prepare($sql);
            $query->bindParam('name',$line->name, PDO::PARAM_STR);
            $query->bindParam('token',$line->token, PDO::PARAM_STR);
            $query->bindParam('id',$line->id, PDO::PARAM_INT);
            
            if($query->execute()){ 
                http_response_code(200);
                echo json_encode(array('status' => true, 'message' => 'บันทึกข้อมูลสำเร็จ'));
                exit;            
            }
        }
        if($act == 'set_st'){            
            $sql = "UPDATE line SET 
                        status = :status
                        WHERE id = :id";
            $query = $conn->prepare($sql);
            $query->bindParam('status',$data->st, PDO::PARAM_INT);
            $query->bindParam('id',$data->id, PDO::PARAM_INT);
            $query->execute();
            if($query->execute()){ 
                http_response_code(200);
                echo json_encode(array('status' => true, 'message' => 'บันทึกข้อมูลสำเร็จ'));
                exit;            
            }
        }
        if($act == 'del'){            
            $sql = "DELETE FROM line WHERE id = :id";
            $query = $conn->prepare($sql);
            $query->bindParam('id',$data->id, PDO::PARAM_INT);
            $query->execute();
            if($query->execute()){ 
                http_response_code(200);
                echo json_encode(array('status' => true, 'message' => 'ลบข้อมูลสำเร็จ'));
                exit;            
            }
        }
        


        http_response_code(200);
        echo json_encode(array('status' => true, 'message' => '------'));
        exit;
       
    }catch(PDOException $e){
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'ERROR เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}