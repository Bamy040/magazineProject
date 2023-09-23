--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for MySQL, Версия 8.1.22.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 26.05.2021 21:44:32
-- Версия сервера: 5.7.25
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Удалить таблицу `ammo-proizvod`
--
DROP TABLE IF EXISTS `ammo-proizvod`;

--
-- Удалить таблицу `gun-ammo`
--
DROP TABLE IF EXISTS `gun-ammo`;

--
-- Удалить процедуру `pr_ammo`
--
DROP PROCEDURE IF EXISTS pr_ammo;

--
-- Удалить таблицу `ammo`
--
DROP TABLE IF EXISTS ammo;

--
-- Удалить функцию `f_delete_zakaz`
--
DROP FUNCTION IF EXISTS f_delete_zakaz;

--
-- Удалить таблицу `zakaz`
--
DROP TABLE IF EXISTS zakaz;

--
-- Удалить процедуру `pr_zakaz`
--
DROP PROCEDURE IF EXISTS pr_zakaz;

--
-- Удалить процедуру `pr_zakaz_ammo`
--
DROP PROCEDURE IF EXISTS pr_zakaz_ammo;

--
-- Удалить функцию `f_full_zakaz`
--
DROP FUNCTION IF EXISTS f_full_zakaz;

--
-- Удалить таблицу `zakaz-info`
--
DROP TABLE IF EXISTS `zakaz-info`;

--
-- Удалить процедуру `pr_buyer`
--
DROP PROCEDURE IF EXISTS pr_buyer;

--
-- Удалить функцию `f_add_buyer`
--
DROP FUNCTION IF EXISTS f_add_buyer;

--
-- Удалить функцию `f_login`
--
DROP FUNCTION IF EXISTS f_login;

--
-- Удалить таблицу `buyer`
--
DROP TABLE IF EXISTS buyer;

--
-- Удалить процедуру `pr_guns`
--
DROP PROCEDURE IF EXISTS pr_guns;

--
-- Удалить процедуру `pr_typegun`
--
DROP PROCEDURE IF EXISTS pr_typegun;

--
-- Удалить функцию `f_zakaz`
--
DROP FUNCTION IF EXISTS f_zakaz;

--
-- Удалить таблицу `gun`
--
DROP TABLE IF EXISTS gun;

--
-- Удалить таблицу `type`
--
DROP TABLE IF EXISTS type;

--
-- Удалить таблицу `seria`
--
DROP TABLE IF EXISTS seria;

--
-- Удалить функцию `f_add_proizv`
--
DROP FUNCTION IF EXISTS f_add_proizv;

--
-- Удалить функцию `f_delete_proizvod`
--
DROP FUNCTION IF EXISTS f_delete_proizvod;

--
-- Удалить таблицу `proizvod`
--
DROP TABLE IF EXISTS proizvod;

--
-- Создать таблицу `proizvod`
--
CREATE TABLE proizvod (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  info varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `name` для объекта типа таблица `proizvod`
--
ALTER TABLE proizvod
ADD UNIQUE INDEX name (name);

DELIMITER $$

--
-- Создать функцию `f_delete_proizvod`
--
CREATE FUNCTION f_delete_proizvod (proiz int(11))
RETURNS int(11)
BEGIN
  DELETE
    FROM proizvod
  WHERE id = proiz;
  RETURN 1;
END
$$

--
-- Создать функцию `f_add_proizv`
--
CREATE FUNCTION f_add_proizv (proizv varchar(50), inf varchar(50))
RETURNS int(11)
BEGIN
  INSERT INTO proizvod (name, info)
    VALUES (proizv, inf);
  RETURN 1;
END
$$

DELIMITER ;

--
-- Создать таблицу `seria`
--
CREATE TABLE seria (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  `proizvod-id` int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `name` для объекта типа таблица `seria`
--
ALTER TABLE seria
ADD UNIQUE INDEX name (name);

--
-- Создать внешний ключ
--
ALTER TABLE seria
ADD CONSTRAINT FK_seria_proizvod_id FOREIGN KEY (`proizvod-id`)
REFERENCES proizvod (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `type`
--
CREATE TABLE type (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `name` для объекта типа таблица `type`
--
ALTER TABLE type
ADD UNIQUE INDEX name (name);

--
-- Создать таблицу `gun`
--
CREATE TABLE gun (
  id int(11) NOT NULL AUTO_INCREMENT,
  number int(11) NOT NULL,
  `type-id` int(11) NOT NULL,
  `seria-id` int(11) NOT NULL,
  price decimal(19, 2) NOT NULL,
  name varchar(50) NOT NULL,
  photo varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `number` для объекта типа таблица `gun`
--
ALTER TABLE gun
ADD UNIQUE INDEX number (number);

--
-- Создать внешний ключ
--
ALTER TABLE gun
ADD CONSTRAINT FK_gun_seria_id FOREIGN KEY (`seria-id`)
REFERENCES seria (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE gun
ADD CONSTRAINT FK_gun_type_id FOREIGN KEY (`type-id`)
REFERENCES type (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

DELIMITER $$

--
-- Создать функцию `f_zakaz`
--
CREATE FUNCTION f_zakaz (ser int(11), kol int(11))
RETURNS int(11)
BEGIN
  DECLARE c int;
  SELECT
    g.price INTO c
  FROM gun g
  WHERE g.`seria-id` = ser;
  SET c = c * kol;
  RETURN c;
END
$$

--
-- Создать процедуру `pr_typegun`
--
CREATE PROCEDURE pr_typegun (typ varchar(50))
BEGIN
  SELECT
    g.number,
    g.name,
    t.name AS 'type',
    s.name AS 'seria',
    g.price
  FROM gun g
    JOIN seria s
      ON g.`seria-id` = s.id
    JOIN type t
      ON g.`type-id` = t.id
  WHERE t.name LIKE typ;
END
$$

--
-- Создать процедуру `pr_guns`
--
CREATE PROCEDURE pr_guns (IN gn varchar(50))
BEGIN
  SELECT
    g.name AS 'gun_name',
    g.number,
    t.name AS 'type',
    s.name AS 'seria',
    g.price
  FROM gun g
    JOIN seria s
      ON g.`seria-id` = s.id
    JOIN type t
      ON g.`type-id` = t.id
  WHERE s.name LIKE gn;
END
$$

DELIMITER ;

--
-- Создать таблицу `buyer`
--
CREATE TABLE buyer (
  id int(11) NOT NULL AUTO_INCREMENT,
  passport varchar(255) NOT NULL,
  name varchar(50) NOT NULL,
  last varchar(255) NOT NULL,
  age int(11) NOT NULL,
  town varchar(255) DEFAULT NULL,
  license int(11) NOT NULL,
  login varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 12,
AVG_ROW_LENGTH = 1365,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `license` для объекта типа таблица `buyer`
--
ALTER TABLE buyer
ADD UNIQUE INDEX license (license);

--
-- Создать индекс `login` для объекта типа таблица `buyer`
--
ALTER TABLE buyer
ADD UNIQUE INDEX login (login);

--
-- Создать индекс `passport` для объекта типа таблица `buyer`
--
ALTER TABLE buyer
ADD UNIQUE INDEX passport (passport);

DELIMITER $$

--
-- Создать функцию `f_login`
--
CREATE FUNCTION f_login (log varchar(50), pass varchar(50))
RETURNS int(11)
BEGIN
  DECLARE c int;
  SELECT
    COUNT(b.id) INTO c
  FROM buyer b
  WHERE b.login LIKE log
  AND b.password LIKE pass;
  RETURN c;
END
$$

--
-- Создать функцию `f_add_buyer`
--
CREATE FUNCTION f_add_buyer (nam varchar(50), fam varchar(50), passp varchar(255), cit varchar(50), lic int(11), vozr int(11), log varchar(255), pass varchar(255))
RETURNS int(11)
BEGIN
  INSERT INTO buyer (name, last, passport, town, license, age, login, password)
    VALUES (nam, fam, passp, cit, lic, vozr, log, pass);
  RETURN 1;
END
$$

--
-- Создать процедуру `pr_buyer`
--
CREATE PROCEDURE pr_buyer (IN bu varchar(50))
BEGIN
  SELECT
    b.name,
    b.last,
    b.age,
    b.town,
    b.passport,
    b.license
  FROM buyer b
  WHERE b.last LIKE bu;
END
$$

DELIMITER ;

--
-- Создать таблицу `zakaz-info`
--
CREATE TABLE `zakaz-info` (
  id int(11) NOT NULL AUTO_INCREMENT,
  number int(11) NOT NULL,
  date datetime NOT NULL,
  `buyer-id` int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 33,
AVG_ROW_LENGTH = 744,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `number` для объекта типа таблица `zakaz-info`
--
ALTER TABLE `zakaz-info`
ADD UNIQUE INDEX number (number);

--
-- Создать внешний ключ
--
ALTER TABLE `zakaz-info`
ADD CONSTRAINT `FK_zakaz-info_buyer_id` FOREIGN KEY (`buyer-id`)
REFERENCES buyer (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

DELIMITER $$

--
-- Создать функцию `f_full_zakaz`
--
CREATE FUNCTION f_full_zakaz (buyid int(11), dat date, gi int(11), kol int(11), ai int(11))
RETURNS int(11)
BEGIN
  DECLARE i,
          a int;
  SELECT
    z.number INTO a
  FROM `zakaz-info` z
  ORDER BY z.number DESC
  LIMIT 1;
  SET a = a + 1;
  INSERT INTO `zakaz-info` (number, date, `buyer-id`)
    VALUES (a, dat, buyid);
  SELECT
    z.id INTO i
  FROM `zakaz-info` z
  ORDER BY z.id DESC
  LIMIT 1;
  INSERT INTO zakaz (`ammo-id`, `gun-id`, count, `zakaz-info`)
    VALUES (ai, gi, kol, i);
  RETURN i;
END
$$

--
-- Создать процедуру `pr_zakaz_ammo`
--
CREATE PROCEDURE pr_zakaz_ammo (IN zk varchar(50))
BEGIN
  SELECT
    z1.number,
    b.last,
    a.caliber,
    z.count,
    a.price,
    a.name AS 'ammo_name',
    z1.date
  FROM zakaz z
    JOIN `zakaz-info` z1
      ON z.`zakaz-info` = z1.id
    JOIN buyer b
      ON z1.`buyer-id` = b.id
    JOIN ammo a
      ON z.`ammo-id` = a.id
  WHERE b.last LIKE zk;
END
$$

--
-- Создать процедуру `pr_zakaz`
--
CREATE PROCEDURE pr_zakaz (IN zk varchar(50))
BEGIN
  SELECT
    z1.number,
    b.last,
    t.name AS 'type',
    z.count,
    g.price,
    g.name AS 'gun_name',
    z1.date
  FROM zakaz z
    JOIN `zakaz-info` z1
      ON z.`zakaz-info` = z1.id
    JOIN buyer b
      ON z1.`buyer-id` = b.id
    JOIN gun g
      ON z.`gun-id` = g.id
    JOIN seria s
      ON g.`seria-id` = s.id
    JOIN type t
      ON g.`type-id` = t.id
  WHERE b.last LIKE zk;
END
$$

DELIMITER ;

--
-- Создать таблицу `zakaz`
--
CREATE TABLE zakaz (
  id int(11) NOT NULL AUTO_INCREMENT,
  `gun-id` int(11) DEFAULT NULL,
  `ammo-id` int(11) DEFAULT NULL,
  count int(11) NOT NULL,
  `zakaz-info` int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 18,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_zakaz` для объекта типа таблица `zakaz`
--
ALTER TABLE zakaz
ADD UNIQUE INDEX UK_zakaz (`gun-id`, `zakaz-info`);

--
-- Создать внешний ключ
--
ALTER TABLE zakaz
ADD CONSTRAINT FK_zakaz_gun_id FOREIGN KEY (`gun-id`)
REFERENCES gun (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE zakaz
ADD CONSTRAINT `FK_zakaz_zakaz-info_id` FOREIGN KEY (`zakaz-info`)
REFERENCES `zakaz-info` (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

DELIMITER $$

--
-- Создать функцию `f_delete_zakaz`
--
CREATE FUNCTION f_delete_zakaz (buy int(11))
RETURNS int(11)
BEGIN
  DELETE
    FROM zakaz
  WHERE id = buy;
  RETURN 1;
END
$$

DELIMITER ;

--
-- Создать таблицу `ammo`
--
CREATE TABLE ammo (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  caliber varchar(255) NOT NULL,
  articul varchar(255) NOT NULL,
  price decimal(19, 2) NOT NULL,
  photo varchar(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `articul` для объекта типа таблица `ammo`
--
ALTER TABLE ammo
ADD UNIQUE INDEX articul (articul);

--
-- Создать индекс `name` для объекта типа таблица `ammo`
--
ALTER TABLE ammo
ADD UNIQUE INDEX name (name);

DELIMITER $$

--
-- Создать процедуру `pr_ammo`
--
CREATE PROCEDURE pr_ammo (IN am varchar(50))
BEGIN
  SELECT
    a.name,
    a.caliber,
    a.articul
  FROM ammo a
  WHERE a.articul LIKE am;
END
$$

DELIMITER ;

--
-- Создать таблицу `gun-ammo`
--
CREATE TABLE `gun-ammo` (
  id int(11) NOT NULL AUTO_INCREMENT,
  `ammo-id` int(11) NOT NULL,
  `gun-id` int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_gun-ammo` для объекта типа таблица `gun-ammo`
--
ALTER TABLE `gun-ammo`
ADD UNIQUE INDEX `UK_gun-ammo` (`ammo-id`, `gun-id`);

--
-- Создать внешний ключ
--
ALTER TABLE `gun-ammo`
ADD CONSTRAINT `FK_gun-ammo_ammo_id` FOREIGN KEY (`ammo-id`)
REFERENCES ammo (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE `gun-ammo`
ADD CONSTRAINT `FK_gun-ammo_gun_id` FOREIGN KEY (`gun-id`)
REFERENCES gun (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать таблицу `ammo-proizvod`
--
CREATE TABLE `ammo-proizvod` (
  id int(11) NOT NULL AUTO_INCREMENT,
  `ammo-id` int(11) NOT NULL,
  `proizvod-id` int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_ammo-proizvod` для объекта типа таблица `ammo-proizvod`
--
ALTER TABLE `ammo-proizvod`
ADD UNIQUE INDEX `UK_ammo-proizvod` (`ammo-id`, `proizvod-id`);

--
-- Создать внешний ключ
--
ALTER TABLE `ammo-proizvod`
ADD CONSTRAINT `FK_ammo-proizvod_ammo_id` FOREIGN KEY (`ammo-id`)
REFERENCES ammo (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Создать внешний ключ
--
ALTER TABLE `ammo-proizvod`
ADD CONSTRAINT `FK_ammo-proizvod_proizvod_id` FOREIGN KEY (`proizvod-id`)
REFERENCES proizvod (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- 
-- Вывод данных для таблицы proizvod
--
INSERT INTO proizvod VALUES
(1, 'ТЕХКРИМ', 'Улица мира'),
(2, 'BARNAUL', 'Улица руставели'),
(3, 'Концерн Калашников', 'Улица ульянова'),
(4, 'TulAmmo', 'Улица сизова'),
(5, 'Remington', 'Улица коменданта');

-- 
-- Вывод данных для таблицы buyer
--
INSERT INTO buyer VALUES
(1, '4017883111', 'Петр', 'Ивлев', 34, 'Санкт-Петербург', 123314, 'petr', '3321'),
(2, '4017554321', 'Алексей', 'Жадный', 19, 'Москва', 332113, 'alex', '1222'),
(3, '4011290018', 'Владимир', 'Хиль', 55, 'Ростов', 133456, 'vladim', '1234'),
(4, '4017405725', 'Роман', 'Поднебесный', 16, 'Самра', 113344, 'roma', 'roma'),
(5, '4015009987', 'Артемий ', 'Отшельник', 65, 'Тверь', 776890, 'artem', 'tema'),
(6, '4017651327', 'Василий', 'Грибенко', 25, 'Санкт-Петербург', 322145, 'vasi', 'vasili'),
(7, '4017345466', 'Даниил', 'Лебор', 32, 'Пермь', 332145, 'dan', 'dan'),
(8, '4015490067', 'Владимир', 'Ильин', 23, 'Новгород', 290075, 'ilin', 'il'),
(9, '4015637890', 'Артемий', 'Володин', 21, 'Ростов', 224412, 'volod', 'vol'),
(10, '4013252327', 'Василь', 'Быков', 23, 'Санкт-Петербург', 323158, 'admin1', '12344'),
(11, '4014553321', 'Василий', 'Иванов', 32, 'Москва', 320976, 'admin', '123');

-- 
-- Вывод данных для таблицы type
--
INSERT INTO type VALUES
(2, 'Автомат'),
(1, 'Пистолет'),
(3, 'Ружье');

-- 
-- Вывод данных для таблицы seria
--
INSERT INTO seria VALUES
(1, 'avc-113', 5),
(2, 'asx-112', 3),
(3, 'vvc-235', 3),
(4, 'jxa-387', 3),
(5, 'jjc-337', 5),
(6, 'gff-568', 2),
(7, 'vss-213', 1);

-- 
-- Вывод данных для таблицы `zakaz-info`
--
INSERT INTO `zakaz-info` VALUES
(1, 1, '2021-03-28 00:00:00', 11),
(2, 2, '2021-03-19 00:00:00', 2),
(3, 3, '2021-03-10 00:00:00', 3),
(4, 4, '2021-03-11 00:00:00', 11),
(5, 5, '2021-03-01 00:00:00', 4),
(6, 6, '2021-02-22 00:00:00', 5),
(7, 7, '2021-02-13 00:00:00', 5),
(8, 8, '2021-02-11 00:00:00', 4),
(15, 11, '2021-05-05 00:00:00', 4),
(17, 9, '2021-05-02 00:00:00', 4),
(18, 10, '2021-05-02 00:00:00', 4),
(19, 15, '2021-05-04 00:00:00', 4),
(20, 16, '2021-05-25 00:00:00', 11),
(21, 17, '2021-05-25 00:00:00', 11),
(22, 18, '2021-05-26 00:00:00', 11),
(23, 19, '2021-06-01 00:00:00', 11),
(24, 20, '2021-05-25 00:00:00', 11),
(26, 21, '2021-05-25 00:00:00', 11),
(27, 22, '2021-05-18 00:00:00', 2),
(28, 23, '2021-05-12 00:00:00', 11),
(29, 24, '2021-05-18 00:00:00', 2),
(31, 25, '2021-05-18 00:00:00', 11),
(32, 26, '2021-05-18 00:00:00', 2);

-- 
-- Вывод данных для таблицы gun
--
INSERT INTO gun VALUES
(1, 11, 1, 6, 11500.00, 'ТТ', 'TT.jpg'),
(2, 22, 1, 5, 9800.00, '1911RAC', '1911RAC.jpg'),
(3, 33, 2, 3, 19800.00, 'AK-47', 'AK47.jpg'),
(4, 44, 3, 1, 20100.00, 'Remington 870', 'remi870.jpg'),
(5, 55, 3, 2, 25670.00, 'Cайга-410', 'saiga-410.jpg'),
(6, 66, 2, 4, 18500.00, 'АК-112', 'ak112.jpg'),
(7, 77, 1, 7, 10900.00, 'Р226Т', 'p226T.jpeg');

-- 
-- Вывод данных для таблицы ammo
--
INSERT INTO ammo VALUES
(1, 'патроны 7.62x25', '7.62x25', '11', 115.00, '7.62x25.jpeg\r\n'),
(2, 'патроны 9x18', '9x18', '112', 120.00, '9x18.jpeg'),
(3, 'патроны 5.45x39', '5.45x39', '113', 130.00, '5.45x39.jpeg'),
(4, 'патроны 7.62x39', '7,62x39', '114', 136.00, '7,62x39.jpeg'),
(5, 'патроны .45 ACP', '.45 ACP', '115', 144.00, '.45 ACP.jpeg'),
(6, 'патроны дробь', '16x70 дробь', '116', 151.00, '16x70 дробь.jpeg');

-- 
-- Вывод данных для таблицы zakaz
--
INSERT INTO zakaz VALUES
(1, 4, NULL, 2, 1),
(2, 1, NULL, 1, 2),
(3, 6, NULL, 1, 3),
(4, 5, NULL, 1, 4),
(5, 1, NULL, 2, 5),
(14, NULL, 1, 3, 27),
(15, NULL, 5, 5, 28),
(16, NULL, 2, 3, 29),
(17, 2, NULL, 1, 31);

-- 
-- Вывод данных для таблицы `gun-ammo`
--
INSERT INTO `gun-ammo` VALUES
(4, 1, 4),
(5, 1, 6),
(1, 2, 1),
(2, 2, 2),
(3, 3, 2),
(6, 5, 3);

-- 
-- Вывод данных для таблицы `ammo-proizvod`
--
INSERT INTO `ammo-proizvod` VALUES
(1, 1, 1),
(7, 1, 2),
(2, 2, 1),
(3, 3, 2),
(8, 4, 2),
(4, 4, 3),
(9, 5, 3),
(5, 5, 4),
(10, 6, 3),
(6, 6, 5);

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;