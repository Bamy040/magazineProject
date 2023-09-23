<?php

header('Content-Type:text/html; charset=utf-8');

$host='localhost';
$user='root';
$pass='vertrigo';
$db='magazine_oxot';

//$host='localhost';
//$user='id15777364_daniil';
//$pass='Dan-Ankvab32';
//$db='id15777364_magaz';





$con=  mysqli_connect($host, $user, $pass, $db);
if($con)    echo '................yes';
else    echo '..............no';

//$sql='select * from teacher';
//$query=  mysqli_query($con, $sql);
//while ($r=  mysqli_fetch_assoc($query)){
//    echo 'last='.$r['last'];
//}


?>

