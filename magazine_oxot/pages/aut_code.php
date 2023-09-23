<?php if(isset($_REQUEST['accept'])){
    $name = null;
    $fam= null;
     $user_log=$_REQUEST['login'];
     $user_pass=$_REQUEST['password'];
     $sql = "SELECT f_login('$user_log','$user_pass') AS full_log";
     $query = mysqli_query($con, $sql);
     $r=  mysqli_fetch_assoc($query);
     $count = $r['full_log'];
      if($count > 0){
                        setcookie('log', $user_log,  time()+3600);
                        setcookie('pass', $user_pass,  time()+3600); 
                        setcookie('enter',1,  time()+3600);
                        $sql ="SELECT b.name,b.last,b.login,b.password,b.id
  FROM buyer b 
  WHERE b.login  LIKE '$user_log' AND b.password LIKE '$user_pass' " ;              
     $query = mysqli_query($con, $sql);
     $r=  mysqli_fetch_assoc($query);
      $name = $r['name'];
      $fam = $r['last'];
      $bid = $r['id'];
        setcookie('name', $name,  time()+3600);
        setcookie('fam', $fam,  time()+3600);
        setcookie('bid',$bid,  time()+3600);
        
                        exit("<meta http-equiv='refresh' content='0; url=$_SERVER[PHP_SELF]'>");
                        }        
}
if(isset($_REQUEST['exit'])){
    setcookie('log','');
    setcookie('pass','');
    setcookie('enter','');
    setcookie('bid','');
    exit("<meta http-equiv='refresh' content='0; url=$_SERVER[PHP_SELF]'>");
}
?>
