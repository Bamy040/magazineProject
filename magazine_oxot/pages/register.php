<?php include './aut_code.php';
include '../config.php';
include './reg_aut_code.php';?>
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
                    <header>
                        <h2>
                            <div class="container">
    <h1>Регистрация</h1>
    <hr>
        <form name="f1" action="register.php" method="get" >
    Паспорт серия и номер</br>
    <input type="text" placeholder="Серия номер" name="passport" required></br>
    
    <br>Имя </br>
    <input type="text" placeholder="Имя" name="name" required></br>
    
    <br>Фамилия</br>
        <input type="text" placeholder="Фамилия" name="last" required></br>
    
    <br>Возраст</br>
    <input type="text" placeholder="Возраст" name="age" required></br>
    
    <br>Номер лицензии</br>
    <input type="text" placeholder="Номер лицензии" name="license" required></br>
    
    <br>Город</br>
    <input type="text" placeholder="Город" name="city" ></br>

    <br>Логин</br>
    <input type="text" placeholder="Введите логин" name="user_login" required></br>
     
    <br>Пароль</br>
    <input type="password" placeholder="Введите пароль" name="user_password" required></br>
    <hr>
     

    <br><input type="submit" class="registerbtn" name="btnreg" value="Регистрация">
        </form>
  </div>
</form>
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
                   Copyright &copy; 2020 <a href="/" rel="copyright">Localhost</a>.
                   This is the module.
               </footer>
    </div>
</body>
</html>
