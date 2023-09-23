<?php
if (isset($_REQUEST['btnreg'])) {
    $pasp = $_REQUEST['passport'];
    $name = $_REQUEST['name'];
    $last = $_REQUEST['last'];
    $age = $_REQUEST['age'];
    $town = $_REQUEST['city'];
    $lic = $_REQUEST['license'];
    $user_login = $_REQUEST['user_login'];
    setcookie('login', $user_login);
    $user_password = $_REQUEST['user_password'];
    setcookie('password', $user_password);
    $sql = "SELECT f_add_buyer('$name','$last',$pasp,'$town',$lic,$age,'$user_login','$user_password')";
    echo $sql;
    $query = mysqli_query($con, $sql);
}
?>
