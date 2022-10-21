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
$vcid = $data->vcid;



if ($_SERVER['REQUEST_METHOD'] === 'POST') {

$datas = array();

    // The request is using the POST method
    try{

        $sql = "SELECT * FROM ven_com WHERE id = $vcid";
        $query = $conn->prepare($sql);
        $query->execute();
        $vc = $query->fetch(PDO::FETCH_OBJ);



        $sql = "SELECT * FROM ven WHERE ven_month = '$vc->ven_month' AND status=2 ORDER BY ven_date ASC, ven_time ASC";
        $query = $conn->prepare($sql);
        $query->execute();
        $result = $query->fetchAll(PDO::FETCH_OBJ);

        $x  = 0;
        $n  = $query->rowCount();

        $vd = array();

        if($query->rowCount() > 0){                        //count($result)  for odbc
            $vd_o = '';
            foreach($result as $rs){
                $aVCI = json_decode($rs->ven_com_id);
                foreach($aVCI as $r){
                    if($r == $vcid){
                        if($vd_o != $rs->ven_date){
                            array_push($vd,$rs->ven_date);
                            $vd_o = $rs->ven_date;
                        }
                    }
                }
            }
//             http_response_code(200);
// echo json_encode(array('false' => true, 'message' => $vd));
// exit; 

            foreach($vd as $r){                         /**    เวียนวัน  $r วันที่ 2022-11-01  */
                $vt         = array();
                $u_namej    = array();
                $u_name     = array();
                $u_role     = array();
                $cmt        = array();

                $OLD_VT = '';
                $OLD_UNAME = '';
                foreach($result as $rs){
                    if($rs->ven_date == $r){
                        // if(count($rs->ven_com_id) > 0){

                            foreach(json_decode($rs->ven_com_id) as $v){
                                if($vcid == $v){
        
                                    $vt_s = substr($rs->ven_time, 0, -3);
                                    if($OLD_VT != $vt_s){
                                        array_push($vt,$vt_s);
                                        $OLD_VT = $vt_s;
                                    }
            
                                    if($OLD_UNAME != $rs->u_name){
                                        $st_ul      = strlen($rs->u_role);
                                        $st_urlo    = $rs->u_role;
                                        if($st_ul > 30){
                                            $st_urlo = substr($st_urlo, 0, 30);
                                        }
                                        if($st_urlo == 'ผู้พิพากษา'){
                                            array_push($u_namej,$rs->u_name );
                                        }else{
                                            array_push($u_name,$rs->u_name);
                                            array_push($cmt,$rs->u_role);
                                        }
                                        $OLD_UNAME = $rs->u_name;
                                    }
                                }
    
                            }
                        // }

                    }
                }

                array_push($datas,array(
                    'ven_date'  => $r,
                    'ven_time'  => $vt,
                    'u_namej'  => $u_namej,
                    'u_name'    => $u_name,
                    'cmt'       => $cmt,
                ));
            }
            
            http_response_code(200);
            echo json_encode(array('status' => true, 'message' => ' สำเร็จ ', 'respJSON' => $datas , 'vc'=>$vc));
            exit;
        }
     
        http_response_code(200);
        echo json_encode(array('false' => true, 'message' => 'ไม่พบข้อมูล '));
    
    }catch(PDOException $e){
        echo "Faild to connect to database" . $e->getMessage();
        http_response_code(400);
        echo json_encode(array('status' => false, 'message' => 'เกิดข้อผิดพลาด..' . $e->getMessage()));
    }
}