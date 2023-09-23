<?php
if(isset($_REQUEST['filter'])){
$idt= $_REQUEST['alltype'];
$sql = "SELECT g.id,g.photo, g.number,g.name,t.name AS 'type',s.name AS 'seria',g.price
   FROM gun g JOIN seria s ON g.`seria-id` = s.id 
   JOIN type t ON g.`type-id` = t.id
   WHERE t.id LIKE '$idt'";
} else{
   $sql = "  SELECT g.id,g.photo, g.number,g.name,t.name AS 'type',s.name AS 'seria',g.price
  FROM gun g JOIN seria s ON g.`seria-id` = s.id 
   JOIN type t ON g.`type-id` = t.id";
}
    $query = mysqli_query($con, $sql);
    echo "<tr class='zag'><td width='200'>Id</td><td width='200'>Фотография</td><td width='200'>Название</td><td width='200'>Серия</td><td width='300'>Типо оружия</td><td width='300'>Цена</td></tr>";
     while ($r = mysqli_fetch_assoc($query)){
        $id = $r['id'];
        $photo = $r['photo'];
        $type = $r['type'];
        $seria = $r['seria'];
        $price = $r['price'];
        $name=$r['name'];
        echo "<tr><td><input name='radio_id' type='radio' value='$id'/>$id</td><td><img src='../img/$photo' width='140px'></td><td>$name</td><td>$seria</td><td>$type</td><td>$price</td>";
     }

if(isset($_REQUEST['buy'])){
    $date = $_REQUEST['date'];
    if(isset($_COOKIE['bid'])){$bid = $_COOKIE['bid'];}
    $kolv=$_REQUEST['kolv'];
    $ida = "null";
    $idg = $_REQUEST['radio_id'];
    $sql = "SELECT f_full_zakaz($bid,'$date',$idg,$kolv,$ida)";
    $query = mysqli_query($con, $sql);
    
}


?>