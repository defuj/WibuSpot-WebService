<?php
if(!empty($_GET['cek'])){
  $versi = $_GET['cek'];
  $app_update = 0;

  foreach (glob("*.apk*") as $filename) {
      $app_update = substr($filename, 0, strrpos($filename, '.'));
  }

  $response['status']= 'update';
  if($app_update > $versi){
    $response['status']= 'update';
    $response['app']= $app_update.".apk";
  }else{
    $response['status']= 'lastest';
  }

  echo json_encode($response);
}
?>
