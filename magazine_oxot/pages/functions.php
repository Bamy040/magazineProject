<?php
function radio_proizvod($radio_name,$con){
    $sql = " SELECT *
    FROM proizvod p";
    $query = mysqli_query($con, $sql);
    while ($r = mysqli_fetch_assoc($query)){
       $id = $r['id'];
       $name = $r['name'];
       $inf = $r['info'];
       echo "<input name='$radio_name' type='radio' value='$id'/>$id........$inf......$name</br>";
}
}
function combo($combo,$con,$tab,$field){
$sql="SELECT * FROM $tab";
$query=  mysqli_query($con, $sql);
if(isset($_REQUEST["$combo"])){
    $g_name=$_REQUEST["$combo"];
} else 
  $g_name='1';  

 echo "</br><select name='$combo'>";
while($r=  mysqli_fetch_assoc($query)){
    $a=$r["$field"];
    $id=$r['id'];
    if($g_name==$id)
        $select='selected';
    else 
        $select='';
    echo"<option value='".$id."' $select>$a</option>";
}
echo '</select>';
}
?>