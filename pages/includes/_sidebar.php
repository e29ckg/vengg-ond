<div id="sidebar" class="active d-print-none">
    <div class="sidebar-wrapper active">
        <div class="sidebar-header">
            <div class="d-flex justify-content-between">
                <div class="logo">
                    <a href="#" class="fs-5"> <i class="bi bi-person-circle"></i> <?=$_SESSION['AD_FIRSTNAME'] .' '. $_SESSION['AD_LASTNAME']?></a>
                    <a href="../logout.php" onclick="return confirm('ต้องการออกจากระบบ..')" class="btn btn-danger btn-sm">logout</a>
                </div>
                <div class="toggler">
                    <a class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                </div>
            </div>
        </div>
        <div class="sidebar-menu">
            <ul class="menu">
                <li class="sidebar-title">Menu</li>

                <li class="sidebar-item <?php echo isActive('dashboard') ?>">
                    <a href="../dashboard/" class='sidebar-link'>
                        <i class="bi bi-grid-fill"></i>
                        <span>หน้าแรก</span>
                    </a>
                </li>
                <li class="sidebar-item <?php echo isActive('history') ?>">
                    <a href="../history/" class='sidebar-link'>
                        <i class="bi bi-grid-fill"></i>
                        <span>ประวัติการเปลี่ยน</span>
                    </a>
                </li>
                <?php if($_SESSION['AD_ROLE'] == '9'){ ?>
                <li class="sidebar-item  has-sub <?php echo isActive('asu') ?>">
                    <a href="#" class='sidebar-link'>
                        <i class="bi bi-stack"></i>
                        <span>อำนวยการ</span>
                    </a>
                    <ul class="submenu <?php echo isActive('asu') ?>">                        
                        <li class="submenu-item <?php echo isActiveFile('ven_approve') ?>">
                            <a href="../asu/ven_approve.php">อนุมัติใบเปลี่ยนเวร</a>
                        </li>                        
                        <li class="submenu-item <?php echo isActiveFile('report') ?>">
                            <a href="../asu/report.php">รายงานการจัดเวร</a>
                        </li>                        
                        <li class="submenu-item <?php echo isActiveFile('ven_set') ?>">
                            <a href="../asu/ven_set.php" target="_blank">จัดเวร</a>
                        </li>
                        <li class="submenu-item <?php echo isActiveFile('ven_com') ?>">
                            <a href="../asu/ven_com.php">เพิ่มคำสั่ง</a>
                        </li>
                        <li class="submenu-item <?php echo isActiveFile('user_ven') ?>">
                            <a href="../asu/user_ven.php">เตรียมผู้อยู่เวร</a>
                        </li>
                        <li class="submenu-item <?php echo isActiveFile('work_name') ?>">
                            <a href="../asu/work_name.php">ชื่อเวร/กลุ่มหน้าที่</a>
                        </li>
                        
                    </ul>
                </li>
                
                <li class="sidebar-item  has-sub <?php echo isActive('users') ?>">
                    <a href="#" class='sidebar-link'>
                        <i class="bi bi-stack"></i>
                        <span>admin</span>
                    </a>
                    <ul class="submenu <?php echo isActive('users') ?>">
                        
                        <li class="submenu-item <?php echo isActive('users') ?>">
                            <a href="../users/">จัดการสมาชิก</a>
                        </li>
                        <li class="submenu-item <?php echo isActiveFile('line') ?>">
                            <a href="../users/line.php">ตั่งค่า Line</a>
                        </li>
                        <li class="submenu-item <?php echo isActiveFile('fname') ?>">
                            <a href="../users/fname.php">คำนำหน้าชื่อ</a>
                        </li>
                        <li class="submenu-item <?php echo isActiveFile('dep') ?>">
                            <a href="../users/dep.php">ตำแหน่ง</a>
                        </li>
                        <li class="submenu-item <?php echo isActiveFile('group') ?>">
                            <a href="../users/group.php">กลุ่มงาน</a>
                        </li>
                        
                        
                    </ul>
                </li>
                <?php } ?>
                <!-- <li class="sidebar-item  has-sub">
                    <a href="#" class='sidebar-link'>
                        <i class="bi bi-stack"></i>
                        <span>Components</span>
                    </a>
                    <ul class="submenu ">
                        <li class="submenu-item ">
                            <a href="component-alert.html">Alert</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-badge.html">Badge</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-breadcrumb.html">Breadcrumb</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-button.html">Button</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-card.html">Card</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-carousel.html">Carousel</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-dropdown.html">Dropdown</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-list-group.html">List Group</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-modal.html">Modal</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-navs.html">Navs</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-pagination.html">Pagination</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-progress.html">Progress</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-spinner.html">Spinner</a>
                        </li>
                        <li class="submenu-item ">
                            <a href="component-tooltip.html">Tooltip</a>
                        </li>
                    </ul>
                </li> -->

                

            </ul>
        </div>
        <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
    </div>
</div>

