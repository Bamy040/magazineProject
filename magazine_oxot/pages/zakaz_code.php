<?php
if(isset($_REQUEST['sub_zakazg'])){
    $name=$_COOKIE['fam'];
    $sql = "CALL pr_zakaz('$name')";
    echo "sql= $sql";
    $query = mysqli_query($con, $sql);
    echo "<tr class='zag'><td width='200'>Номер</td><td width='300'>Фамилия</td><td width='300'>Название</td><td width='300'>Тип</td><td width='300'>Кол-во</td><td width='300'>Цена</td><td width='300'>Дата</td></tr>";
     while ($r = mysqli_fetch_assoc($query)){
        $number = $r['number'];
        $last = $r['last'];
        $nameg = $r['gun_name'];
        $count = $r['count'];
        $type = $r['type'];
        $price = $r['price'];
        $date= $r['date'];
        echo "<tr><td>$number</td><td>$last</td><td>$nameg</td><td>$type</td><td>$count</td><td>$price</td><td>$date</td></tr>";
     }
}
if(isset($_REQUEST['sub_zakaza'])){
    $name=$_COOKIE['fam'];
    $sql = "CALL pr_zakaz_ammo('$name')";
    echo "sql= $sql";
    $query = mysqli_query($con, $sql);
    echo "<tr class='zag'><td width='200'>Номер</td><td width='300'>Фамилия</td><td width='300'>Название</td><td width='300'>Тип</td><td width='300'>Кол-во</td><td width='300'>Цена</td><td width='300'>Дата</td></tr>";
     while ($r = mysqli_fetch_assoc($query)){
        $number = $r['number'];
        $last = $r['last'];
        $namea = $r['ammo_name'];
        $count = $r['count'];
        $caliber = $r['caliber'];
        $price = $r['price'];
        $date= $r['date'];
        echo "<tr><td>$number</td><td>$last</td><td>$namea</td><td>$caliber</td><td>$count</td><td>$price</td><td>$date</td></tr>";
     }
}
?>