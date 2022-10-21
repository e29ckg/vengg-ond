<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET,HEAD,OPTIONS,POST,PUT");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
// header("'Access-Control-Allow-Credentials', 'true'");
// header('Content-Type: application/javascript');
header("Content-Type: application/json; charset=utf-8");

include '../../vendor/autoload.php';
use PhpOffice\PhpWord\IOFactory;
use PhpOffice\PhpWord\TemplateProcessor;

include "../connect.php";
include "../function.php";

$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $data->id;
    
    $datas = array();

    // The request is using the POST method
    try{
        $sql = "SELECT vc.id , vc.ven_month, vc.ven_date1, vc.ven_date2, v.ven_com_idb, v.ven_com_name, vc.ven_com_num_all, vc.DN, vc.u_role, vc.user_id1, vc.ven_id1, vc.ven_id2, vc.user_id2, vc.status, vc.create_at
                FROM ven_change as vc  
                INNER JOIN ven as v ON v.id = vc.ven_id1
                WHERE vc.id = :id";
        $query = $conn->prepare($sql);
        $query->bindParam(':id',$id, PDO::PARAM_INT);
        $query->execute();
        $res = $query->fetch(PDO::FETCH_OBJ);

        if($query->rowCount() > 0){                        //count($result)  for odbc
            $doc_date           = DateThai_full($res->create_at);
            $ven_com_num_all    = $res->ven_com_num_all;
            $ven_com_date       = "";  
            $ven_com_idb        = "";   
            $ven_com_name       = $res->ven_com_name;   
            $name1              = "";   
            $name2              = "";   
            $name_dep1          = "";   
            $name_dep2          = ""; 
            $ven_date1          = "";   
            $ven_date2          = "";   
          
            
            $sql = "SELECT vc.ven_com_date
                    FROM ven_com as vc
                    WHERE id = :id";
            $query = $conn->prepare($sql);
            $query->bindParam(':id',$res->ven_com_idb, PDO::PARAM_INT);
            $query->execute();
            $res_vc = $query->fetch(PDO::FETCH_OBJ);
            $ven_com_date       = DateThai_full($res_vc->ven_com_date); 

            $sql = "SELECT p.fname, p.name, p.sname, p.dep
                    FROM profile as p  
                    WHERE user_id = :user_id";
            $query = $conn->prepare($sql);
            $query->bindParam(':user_id',$res->user_id1, PDO::PARAM_INT);
            $query->execute();
            $res_p = $query->fetch(PDO::FETCH_OBJ);
            $name1      = $res_p->fname.$res_p->name.' '.$res_p->sname; 
            $name_dep1  = $res_p->dep; 
            
            $sql = "SELECT p.fname, p.name, p.sname, p.dep
                    FROM profile as p  
                    WHERE user_id = :user_id";
            $query = $conn->prepare($sql);
            $query->bindParam(':user_id',$res->user_id2, PDO::PARAM_INT);
            $query->execute();
            $res_p = $query->fetch(PDO::FETCH_OBJ);
            $name2       = $res_p->fname.$res_p->name.' '.$res_p->sname; 
            $name_dep2   = $res_p->dep; 

            $res->DN == 'กลางวัน' ? $time = '08.30 – 16.30' : $time = '16.30 – 08.30 ';  
            $ven_date1       = DateThai_full($res->ven_date1).' ตั้งแต่เวลา '.$time.' นาฬิกา';   
            if($res->ven_id2 !=''){
                $ven_date2       = ' และข้าพเจ้าจะมาปฎิบัติหน้าที่แทน '. $name2 .' ในวันที่ '.DateThai_full($res->ven_date2).' ตั้งแต่เวลา '.$time.' นาฬิกา'; 
            }else{
                $ven_date2       = ' ในวันที่ '.DateThai_full($res->ven_date2).' ตั้งแต่เวลา '.$time.' นาฬิกา'; 
            }



            /**สร้างเอกสาร docx */
            $templateProcessor = new TemplateProcessor('ven_tm.docx');//เลือกไฟล์ template ที่เราสร้างไว้
            $templateProcessor->setValue('doc_date', $doc_date);//อัดตัวแปร รายตัว
            $templateProcessor->setValue('ven_com_num_all', $ven_com_num_all);//อัดตัวแปร รายตัว
            $templateProcessor->setValue('ven_com_date', $ven_com_date);
            $templateProcessor->setValue('ven_com_name', $ven_com_name);
            $templateProcessor->setValue('name1', $name1);
            $templateProcessor->setValue('name2', $name2);
            $templateProcessor->setValue('name_dep1', $name_dep1);
            $templateProcessor->setValue('name_dep2', $name_dep2);
            $templateProcessor->setValue('ven_date1', $ven_date1);
            $templateProcessor->setValue('ven_date2', $ven_date2);
            $templateProcessor->saveAs('../../uploads/ven.docx');//สั่งให้บันทึกข้อมูลลงไฟล์ใหม่

           
            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => 'OK', 'respJSON' => $res));
            exit;
        }
     
        http_response_code(200);
        echo json_encode(array('status' => true, 'message' => 'ไม่พบข้อมูล '));
    
    }catch(PDOException $e){
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}


