<?php
    $sql = "SELECT a.id, a.name,a.caliber,a.articul,a.price,a.photo
  FROM ammo a ";
    $query = mysqli_query($con, $sql);
    echo "<tr class='zag'><td width='200'>Id</td><td width='200'>Фотография</td><td width='200'>Название</td><td width='200'>Калибр</td><td width='300'>Артикуль/td><td width='300'>Цена</td></tr>";
     while ($r = mysqli_fetch_assoc($query)){
        $id = $r['id'];
        $photo = $r['photo'];
        $caliber = $r['caliber'];
        $articul = $r['articul'];
        $price = $r['price'];
        $name=$r['name'];
        echo "<tr><td><input name='radio_id' type='radio' value='$id'/>$id</td><td><img src='../img/$photo' width='140px'></td><td>$name</td><td>$caliber</td><td>$articul</td><td>$price</td>";
     }
if(isset($_REQUEST['buya'])){
  $date = $_REQUEST['date'];
    $bid = $_COOKIE['bid'];
    $kolv=$_REQUEST['kolv'];
    $idg = "null";
    $ida = $_REQUEST['radio_id'];
    $sql = "SELECT f_full_zakaz($bid,'$date',$idg,$kolv,$ida)";
    $query = mysqli_query($con, $sql);
}
?>