<?php include './aut_code.php';
include '../config.php';
include './functions.php';
include './code_admin.php';
include './code_lich.php';
?>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Оружейный магазин</title>
    
    <!--[if IE]>
	<script>
		document.createElement('header');
		document.createElement('nav');
		document.createElement('section');
		document.createElement('article');
		document.createElement('aside');
		document.createElement('footer');
	</script>
<![endif]-->
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="main">
    <header>
        <h3><?php echo "$namel $famil";?></h3>
        <img class="image" src="../img/shapka.jpg" alt="" />

    </header>
        <nav>
            <ul>
                <li><a href="../index.php" class="active">Главная</a></li>
                <li><a href="guns.php">Оружие</a></li>
                <li><a href="pages/page_2.php">Патроны</a></li>
                <li><a href="pages/page_3.php">Корзина</a></li>   
                
                
            </ul>
        </nav>
               <section>
                  
       
            <section>
                <article>
                    <header>
                        
                            
                        </form>
                    </header>
                   
                    </table>
                </article>
                <article>
                    <?php if(isset($_COOKIE['log'])&& $_COOKIE['log']==='admin'):?>
                    <header>
                        <h2>
                            
                           
</h2>
                    </header>
                    <p>
                              
                          Здесь будет код 
                    </p>
                          <form name="f1" action="admin_page.php" method="get">
                              <input name="sub_del" type="submit" value="Вывести производителей">
                              <input name="all_zakaz" type="submit" value="Вывести все заказы">
                          </form>
                    <form name="f2" action="admin_page.php" method="get">
                          <?php 
                          if(isset($_REQUEST['sub_del'])):
    radio_proizvod('rad_proizv',$con);
?><input name="del_proizv" type="submit" value="Удалить"></br>
    
      <br><input name="txt_name" type="text"></br>
      <input name="txt_inf" type="text"></br>
      <input name="add_proizv" type="submit" value="Добавить">
      <?php endif;?>
                      <?php if(isset($_REQUEST['all_zakaz'])):
                           combo('allzak', $con, 'zakaz', 'id');
                          
                          ?> 
                        <input name="del_zakaz" type="submit" value="Удалить"><?php endif;?>
                    </form>
                </article>
<?php endif;  ?>
            </section>
            <aside>
                
                <h2>
                    News</h2>
                
                <ul>
                    
            

                </ul>
            </aside>
              
        </section>
               <footer>
                   
               </footer>
    </div>
</body>
</html>