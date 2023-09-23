<?php
if(isset($_REQUEST['del_proizv'])){
$id= $_REQUEST['rad_proizv'];
$sql = "SELECT f_delete_proizvod($id)";
echo "sql= $sql";
echo "id= $id";
$query = mysqli_query($con, $sql);
}
if(isset($_REQUEST['del_zakaz'])){
$id= $_REQUEST['allzak'];
$sql = "SELECT f_delete_zakaz($id)";
$query = mysqli_query($con, $sql);
}
if(isset($_REQUEST['add_proizv'])){
$name = $_REQUEST['txt_name'];
$inf = $_REQUEST['txt_inf'];
$sql = " SELECT f_add_proizv('$name','$inf')";
echo "sql= $sql";
echo "name= $name";
$query = mysqli_query($con, $sql);
}
?>