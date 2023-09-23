<?php include './aut_code.php';
include '../config.php';
include './code_lich.php';;
?>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Шаблоны страниц</title>
    
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
        <h3>Главная</h3>
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
                        
                            
                        </form>
                    </header>
                   
                    </table>
                </article>
                <article>
                    <?php if(isset($_COOKIE['log'])):?>
                    <header>
                        <h2>
                            
                           
</h2>
                    </header>
                    <p>
                              
                         
                    </p>
                 
                    
                
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
                   Copyright &copy; 2020 <a href="/" rel="copyright">Localhost</a>.
                   This is the module.
               </footer>
    </div>
</body>
</html>