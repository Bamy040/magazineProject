<?php
if(isset($_COOKIE['log'])){
$user_log=$_COOKIE['log'];
$user_pass=$_COOKIE['pass'];
 $sql ="SELECT b.name,b.last,b.license,b.passport
  FROM buyer b 
  WHERE b.login  LIKE '$user_log' AND b.password LIKE '$user_pass' " ;              
     $query = mysqli_query($con, $sql);
     $r=  mysqli_fetch_assoc($query);
      $namel = $r['name'];
      $famil = $r['last'];
      $license=$r['license'];
      $passport=$r['passport'];
}
?>