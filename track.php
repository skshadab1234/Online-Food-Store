<?php
session_start();
include('database.inc.php');
include('function.inc.php');
include('constant.inc.php');
if(!isset($_SESSION['FOOD_USER_ID'])){
	redirect(FRONT_SITE_PATH.'shop');
}
if(isset($_GET['id']) && $_GET['id']>0){
	
	$id=get_safe_value($_GET['id']);
}
	$sql="select * from order_master where id= '$id'";

$res=mysqli_query($con,$sql);
$row = mysqli_fetch_assoc($res);

$order_date = $row['added_on'];
$new_order = date('D, M,Y', strtotime($order_date));
$sql="select order_master.*,order_status.order_status as order_status_str from order_master,order_status where order_master.order_status=order_status.id and order_master.id='$id' order by order_master.id desc";
      $res=mysqli_query($con,$sql);
      if(mysqli_num_rows($res)>0){
         $orderRow=mysqli_fetch_assoc($res);
      }else{
         redirect('index.php');
      }
?>


<!doctype html>
<html class="no-js" lang="zxx">
<head>

	<!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Track Order id : <?= $id ?></title> <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- plugins:css -->
  <link rel="stylesheet" href="admin/assets/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="admin/assets/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="admin/assets/css/dataTables.bootstrap4.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="admin/assets/css/bootstrap-datepicker.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="admin/assets/css/style.css">

<!-- 
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="stylesheet" href="<?php echo FRONT_SITE_PATH?>assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="<?php echo FRONT_SITE_PATH?>assets/css/ionicons.min.css">
        <link rel="stylesheet" href="<?php echo FRONT_SITE_PATH?>assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="<?php echo FRONT_SITE_PATH?>assets/css/style.css">
        <link rel="stylesheet" href="<?php echo FRONT_SITE_PATH?>assets/css/responsive.css">
         <link rel="stylesheet" href="admin/assets/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="admin/assets/css/dataTables.bootstrap4.css"> -->
<style type="text/css">
    .hh-grayBox {
   background-color: #F8F8F8;
   margin-bottom: 20px;
   padding: 35px;
  margin-top: 20px;
}
.pt45{padding-top:45px;}

.order-tracking:nth-child(1){
   margin: 0;
}
.order-tracking{
   text-align: center;
   width: 216px;
   position: relative;
   display: block;
   margin-top: 114px;
}
.order-tracking .is-complete{
   display: block;
   position: relative;
   border-radius: 50%;
   height: 30px;
   width: 30px;
   border: 0px solid #AFAFAF;
   background-color: #f7be16;
   margin: 0 auto;
   transition: background 0.25s linear;
   -webkit-transition: background 0.25s linear;
   z-index: 2;
}
.order-tracking .is-complete:after {
   display: block;
   position: absolute;
   content: '';
   height: 14px;
   width: 7px;
   top: -2px;
   bottom: 0;
   left: 5px;
   margin: auto 0;
   border: 0px solid #AFAFAF;
   border-width: 0px 2px 2px 0;
   transform: rotate(45deg);
   opacity: 0;
}
.order-tracking.completed .is-complete{
   border-color: #27aa80;
   border-width: 0px;
}
.order-tracking.completed .is-complete:after {
   border-color: #fff;
   border-width: 0px 3px 3px 0;
   width: 7px;
   left: 11px;
   opacity: 1;
}



.order-tracking .is-cancel{
   display: block;
   position: relative;
   border-radius: 50%;
   height: 30px;
   width: 30px;
   border: 0px solid #AFAFAF;
   background-color: red;
   margin: 0 auto;
   transition: background 0.25s linear;
   -webkit-transition: background 0.25s linear;
   z-index: 2;
}
.order-tracking .is-cancel:after, .is-cancel:before  {
   display: block;
   position: absolute;
   content: '';
   height: 14px;
   width: 7px;
   top: -2px;
   bottom: 0;
   left: 5px;
   margin: auto 0;
   border: 0px solid #AFAFAF;
   border-width: 0px 2px 2px 0;
   transform: rotate(45deg);
   opacity: 0;
}
.order-tracking.cancel .is-cancel{
   border-color: red;
   border-width: 0px;
}
.order-tracking.cancel .is-cancel:before {
  border-color: #fff;
    border-width: 0px 4px 0px 0;
    width: 15px;
    left: 11px;
    top: -6px;
    opacity: 1;
    transform: rotate(139deg);
    height: 20px;
}

.order-tracking.cancel .is-cancel:after {
  border-color: #fff;
    border-width: 0px 4px 0px 0;
    width: 9px;
    left: 12px;
    top: 4px;
    opacity: 1;
    transform: rotate(221deg);
    height: 21px;
}


.order-tracking p {
   color: #A4A4A4;
   font-size: 16px;
   margin-top: 8px;
   margin-bottom: 0;
   line-height: 20px;
}

.order-tracking p span{font-size: 14px;}
.order-tracking.completed p{color: #000;}
.order-tracking::before {
  content: '';
    display: block;
    width: 4px;
    height: calc(60% - -12px);
    background-color: #f7be16;
    top: -92px;
    position: absolute;
    left: 105px;
    z-index: 0;
}
.order-tracking:first-child:before{display: none;}
.order-tracking.completed:before{background-color: #27aa80;}
.order-tracking.cancel:before{background-color: red;}


</style>
    </head>
	<body>

 <div class="container-fluid mt-5 d-flex justify-content-center w-100">
            <div class="page-header mt5">
               <h3 class="page-title"> Tracking Details :-   

<a href="javascript:void(0)" data-toggle="modal" data-target="#myModal">see update</a>

               </h3>
            </div>
         </div>
         

<div class="container pb-20">
	<h4><b>Tracking Details: </b></h4>
 <div class="container-fluid mt-5 d-flex justify-content-center w-100">
            <div class="table-responsive w-100">
               <table class="table"  id="order-listing">
                  <thead>
                     <tr class="bg-dark">
                        <th class="text-center">Date/Address</th>
                        <th class="text-center">Remarks</th>
                        <th class="text-center">Location</th>
                     </tr>
                  </thead>
				 <?php
                        $getTrackById=getTrackById($id);
                        // prx($getTrackById);
                        foreach($getTrackById as $track){
                           $added_on = $track['added_on'];
                           $new = date('d, M,Y h:i:s', strtotime($added_on));
                           $times_Ago  = times_ago($added_on);

                        ?>

                     <tr class="text-center">
                        <td><?= $new ?></td>
                        <td><?= $track['order_status'] ?> <?= $track['delay_msg'] ?> <small><?= $times_Ago ?></small></td>
                        <td>
                          <?php
                           if (empty($track['arrived_at'])) {
                              echo "<span style='color:red'>N/A</span>";                              
                           }else{
                              echo $track['arrived_at'];
                           }

                           ?>
                        </td>
                     </tr>
                     <?php 
                        } ?>
</table>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-body">
                     <div class="row justify-content-between" style="display: flex;flex-direction: column;">
                        <div class="order-tracking completed">
                           <span class="is-complete" style="background-color: #27aa80 "></span>
                           <p>Ordered<br><span> <?php  echo dateFormat($orderRow['added_on'])?></span></p>
                        </div>

                           <?php 
                                  $getTrackById=getTrackById($id);
                                  foreach($getTrackById as $track){
                           $cook_date =  $track['added_on'];
                           $final_time = times_ago($cook_date);


                            $outofdelivery_date =  $track['added_on'];
                           $new_date_delivered = date("M d,Y/D", strtotime($outofdelivery_date));
                           $delivered_time = date("h:i A", strtotime($outofdelivery_date));
                           $outofdelivery_date = times_ago($outofdelivery_date);

                              $cancel = "completed";
                              $is_cancel = "is-complete";
                              $color = "#27aa80";
                              if ($track['message']  == 5) {
                                 $cancel = "cancel";
                                 $is_cancel = "is-cancel";
                                 $color = "red";
                              }
                              ?>

                        <div class="order-tracking <?= $cancel ?>">
                           <span class="<?= $is_cancel ?>"  style="background-color: <?= $color ?> "></span>
                           <p> <?= $track['order_status'] ?><br><span><?php
                              if ($track['message'] == 4) {
                                 echo $new_date_delivered."<br> (".$delivered_time .") <br>".$outofdelivery_date;
                              }else{
                                 echo $final_time;
                              }

                            ?></span></p>
                        </div>
                              <?php
                           }

                        ?>


                        
               </div>
            </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
      </div>
</div>

</div>
 <!-- plugins:js -->
  <script src="admin/assets/js/vendor.bundle.base.js"></script>
  <script src="admin/assets/js/jquery.dataTables.js"></script>
  <script src="admin/assets/js/dataTables.bootstrap4.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="admin/assets/js/Chart.min.js"></script>
  <script src="admin/assets/js/bootstrap-datepicker.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="admin/assets/js/off-canvas.js"></script>
  <script src="admin/assets/js/hoverable-collapse.js"></script>
  <script src="admin/assets/js/template.js"></script>
  <script src="admin/assets/js/settings.js"></script>
  <script src="admin/assets/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="admin/assets/js/data-table.js"></script>
  <!-- End custom js for this page-->
</body>

</html>