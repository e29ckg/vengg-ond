<?php 

require_once('../../server/authen.php'); 

?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php require_once('../includes/_header.php') ?>

</head>
<body>
<div id="app">
        <?php require_once('../includes/_sidebar.php') ?>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <h3>ใบเปลี่ยนเวร</h3>
            </div>
            
            <div class="page-content" id="venApp" v-cloak> 
                <section class="row" >           
                    <div class="col-12 col-lg-12">
                        <!-- {{ven_Chs}} -->
                        <!-- {{ven_Chs_g}} -->
                        <div class="row">
                            <div class="col-12 text-end mb-2">
                            </div>
                            <div class="col col-12" v-if="ven_app_g">                                
                                <div class="card" v-for='vag in ven_app_g'>
                                    <div class="card-body" >
                                        
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th colspan="2" class="text-start">
                                                    เวรเดือน {{vag.ven_month}} 
                                                    </th>

                                                </tr>
                                            </thead>
                                            <tbody  v-for="va in ven_app">
                                                <tr v-if="va.ven_month == vag.ven_month">
                                                        <td >  
                                                            <!-- เลขคำสั่งที่ {{va.ven_Ch_num}} | ลงวันที่ {{va.ven_Ch_date}} | {{va.ven_Ch_name}} ({{va.ven_name}}) -->
                                                            | {{va.id}} | {{va.name1}} <<>> {{va.name2}} <br> 
                                                            {{va.create_at}} | {{va.status}} | {{va.st}} <br>
                                                            {{va.ven_date1}} <<>> {{va.ven_date2}}
                                                            <!-- {{va}} -->
    
                                                        </td>
                                                       
                                                        <td class="text-end col " style="width: 150px;">
                                                            <button class="btn btn-warning btn-sm me-2" @click="ven_ch_app(va.id)" v-if="va.status != 1">อนุมัติ</button>
                                                            <button class="btn btn-danger btn-sm" @click="ven_ch_cancle(va.id)" v-else>ยกเลิก</button>
                                                        </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>                           
                        </div>    
                    </div>
                 
                </section>

                <!-- Modal venUser Form -->
                <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#ven_Ch" ref="show_va_form" hidden >
                        เพิ่มคำสั่ง
                </button>
                <!-- Modal venUser Form -->
                <div class="modal fade" id="ven_Ch" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel" > </h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ref="close_va"></button>
                            </div>
                            <div class="modal-body">
                                <!-- {{va_form}} -->
                                <!-- {{va_form_act}} -->
                                
                                
                            </div>
                        </div>
                    </div>
                </div>


            </div>

            <?php require_once('../includes/_footer.php') ?>
        </div>
    </div>
    <script src="../../assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../../assets/js/bootstrap.bundle.min.js"></script>

    <script src="../../assets/js/main.js"></script>
    <!--  -->
    <script src="../../node_modules/vue/dist/vue.global.js"></script>
    <script src="../../node_modules/vue/dist/vue.global.prod.js"></script>
    <script src="../../node_modules/axios/dist/axios.js"></script>
    <script src="../../node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
    <script src="./js/ven_approve.js"></script>
</body>

</html>