<?php include './config.php';
include './pages/reg_aut_code.php';
include './pages/aut_code.php';
include './pages/code_lich.php';
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
    <link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="main">
    <header>
        <h3><?php if(isset($_COOKIE['log'])){ echo "$namel $famil";}?></h3>
        <img class="image" src="img/shapka.jpg" alt="" />

    </header>
        <nav>
            <ul>
                <li><a href="index.php" class="active">Главная</a></li>
                <li><a href="pages/guns.php">Оружие</a></li>
                <li><a href="pages/ammo.php">Патроны</a></li>  
                <?php if(isset($_COOKIE['enter'])==null):?>
                <li><a href="pages/register.php">Регистрация</a></li>
                <?php endif;?>
                <?php if(isset($_COOKIE['log'])):?>
                <li><a href="pages/lichkab_page.php">Личный кабинет</a></li> 
                <?php endif; ?>
                <?php if(isset($_COOKIE['log']) && $_COOKIE['log']==='admin' ): ?>
                <li><a href="pages/admin_page.php">Администратор</a></li>  
                <?php endif; ?>
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
                    <header>
                        <h2>
                            <?php 
                            if(isset($_COOKIE['enter'])!= null){
                            $name_c = $_COOKIE['name'];
                            $fam_c = $_COOKIE['fam'];
                            if($name_c != null){
                                echo "<br>Здравствуйте, $name_c $fam_c"; }
                                
                            }else {
                                echo '<br>Пройдите регистрацию';
                            }  
                           
?></h2>
                    </header>
                    <p>
                       
                            
                       
                    </p>
                </article>

            </section>
            <aside>
                
                <h2>
                    News</h2>
                
                <ul>
                    <form name="log_pole" action="index.php" method="get">
                    <table style="background-color: #d2dce0"> 
                        <tr><input name ="login" type="text"  placeholder="Логин" style="width:115px" ></tr>
                        <tr><input name ="password" type="text"  placeholder="Пароль" style="width:115px"></tr>
                        
                    </table>
                    <input name ="accept" type="submit" value="Войти" >
                    <input name="exit" type="submit" value="Выйти">
                    
                </form>
                    <form name="log_pole" action="pages/register.php" method="get">
                    </form>

                </ul>
            </aside>
              
        </section>
               <footer>
                  
               </footer>
    </div>
</body>
</html>

