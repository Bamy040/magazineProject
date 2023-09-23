<?php include './aut_code.php';
include '../config.php';
include './functions.php';
include './code_lich.php';?>
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
        <h3><?phpif(isset($_COOKIE['log'])){ echo "$namel $famil"};?></h3>
        <img class="image" src="../img/shapka.jpg" alt="" />

    </header>
        <nav>
            <ul>
                <li><a href="../index.php" class="active">Главная</a></li>
                <li><a href="guns.php">Оружие</a></li>
                <li><a href="ammo.php">Патроны</a></li>
                <?php if(isset($_COOKIE['log'])):?>
                <li><a href="pages/lichkab_page.php">Личный кабинет</a></li> 
                <?php endif; ?>
               
                
                
            </ul>
        </nav>
               <section>
       
                   
            <section>
                <article>
                    <header>
                         
                        
                        <form name='f1' action="guns.php" method="get">
                           
                           
                            <?php combo('alltype', $con, 'type', 'name');?>
                           <input name="filter" type="submit" value="Применить Фильтр"/><br></br>
                 <table cellpadding="0" cellspacing="0" class="border" >
                        <?php include './guns_code.php'; ?>
                    </table>
                        </br><input name="date" type="date" value=""/>
                        Количество <input name="kolv" type="text" value=""/><br>
                         <?php if(isset($_COOKIE['log'])):?><input name="buy" type="submit" value="Купить"/><br><?php endif; ?>   
                    </form>
                            
                        </form>
                    </header>
                   
                    </table>
                </article>
                <article>
                    <header>
                        <h2>
                            
                           </h2>
                    </header>
                    <p>
                       
                            
                       
                    </p>
                </article>

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
