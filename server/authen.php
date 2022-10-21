<?php 

header('Content-Type: text/html; charset=UTF-8');
require_once 'connect.php' ; 
require_once 'function.php' ; 

function isActive ($data) {
    $array = explode('/', $_SERVER['REQUEST_URI']);
    $key = array_search("pages", $array);
    $moduleName = $array[$key + 1];
    return $moduleName === $data ? 'active' : '' ;
}

function isActiveFile ($data) {
    $basename = basename($_SERVER['REQUEST_URI'], ".php");
    return $basename === $data ? 'active' : '' ;
}

function pathCurrent() {
    $array = explode('/', $_SERVER['REQUEST_URI']);
    $key = array_search("pages", $array);
    $moduleName = $array[$key + 1];
    $basename = basename(parse_url($_SERVER["SCRIPT_FILENAME"], PHP_URL_PATH), ".php");
    return $moduleName . "/" . $basename;
}

if( !isset($_SESSION['AD_ID'] ) ){
    header('Location: ../../login.php');  
}

/** หน้าที่ admin เข้าไม่ได้ */
$menuAdmin = array("asu/index", "asu/work_name", "asu/user_ven", "asu/ven_com", "asu/ven_set","asu/report","asu/ven_approve","users/index");

if($_SESSION['AD_ROLE'] == '1'){
    if(in_array(pathCurrent(), $menuAdmin)){
        header('Location: ../dashboard');
    }
}

/** หน้าที่ admin เข้าไม่ได้ */
// $menuAdmin = array("account/index", "account/form-create", "account/form-edit");

// if($_SESSION['AD_ROLE'] == 'admin'){
//     if(in_array(pathCurrent(), $menuAdmin)){
//         header('Location: ../dashboard');
//     }
// }

?>