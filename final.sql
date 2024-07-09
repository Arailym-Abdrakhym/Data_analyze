CREATE DATABASE sales_final;

USE sales_final;

CREATE TABLE T_TAB1 (
    ID INT PRIMARY KEY,
    GOODS_TYPE VARCHAR(255),
    QUANTITY INT,
    AMOUNT DECIMAL(10, 2),
    SELLER_NAME VARCHAR(255)
);

CREATE TABLE T_TAB2 (
    ID INT PRIMARY KEY,
    NAME VARCHAR(255),
    SALARY DECIMAL(10, 2),
    AGE INT
);

INSERT INTO T_TAB1 (ID, GOODS_TYPE, QUANTITY, AMOUNT, SELLER_NAME) VALUES
(1, 'MOBILE PHONE', 2, 400000, 'MIKE'),
(2, 'KEYBOARD', 1, 10000, 'MIKE'),
(3, 'MOBILE PHONE', 1, 50000, 'JANE'),
(4, 'MONITOR', 1, 110000, 'JOE'),
(5, 'MONITOR', 2, 80000, 'JANE'),
(6, 'MOBILE PHONE', 1, 130000, 'JOE'),
(7, 'MOBILE PHONE', 1, 60000, 'ANNA'),
(8, 'PRINTER', 1, 90000, 'ANNA'),
(9, 'KEYBOARD', 2, 10000, 'ANNA'),
(10, 'PRINTER', 1, 80000, 'MIKE');

INSERT INTO T_TAB2 (ID, NAME, SALARY, AGE) VALUES
(1, 'ANNA', 110000, 27),
(2, 'JANE', 80000, 25),
(3, 'MIKE', 120000, 25),
(4, 'JOE', 70000, 24),
(5, 'RITA', 120000, 29);
 /* 
Задача №1
Напишите запрос, который вернёт список уникальных категорий товаров (GOODS_TYPE).
Какое количество уникальных категорий товаров вернёт запрос?
Задача №2
Напишите запрос, который вернет суммарное количество и суммарную стоимость проданных мобильных телефонов.
Какое суммарное количество и суммарную стоимость вернул запрос?
Задача №3
Напишите запрос, который вернёт список сотрудников с заработной платой > 100000.
Какое кол-во сотрудников вернул запрос?
Задача №4
Напишите запрос, который вернёт минимальный и максимальный возраст сотрудников, а также минимальную и максимальную заработную плату.
Задача №5
Напишите запрос, который вернёт среднее количество проданных клавиатур и принтеров.
Задача №6
Напишите запрос, который вернёт имя сотрудника и суммарную стоимость проданных им товаров.
Задача №7
Напишите запрос, который вернёт имя сотрудника, тип товара, кол-во товара, стоимость товара, заработную плату и возраст сотрудника MIKE.
Задача №8
Напишите запрос, который вернёт имя и возраст сотрудника, который ничего не продал.
Сколько таких сотрудников?
Задача №9
Напишите запрос, который вернёт имя сотрудника и его заработную плату с возрастом меньше 26 лет?
Какое количество строк вернул запрос?
Задача №10
Сколько строк вернёт следующий запрос:
 
select
*
from T_TAB1 t
join T_TAB2 t2 on t2.name = t.seller_name
where t2.name = 'RITA';
 */ 
 
 
-- Задача №1
SELECT DISTINCT GOODS_TYPE FROM T_TAB1;
-- 4 уникальных категорий товаров: MOBILE PHONE, KEYBOARD, MONITOR, PRINTER.

-- Задача №2
SELECT SUM(QUANTITY) AS TotalQuantity, SUM(AMOUNT) AS TotalAmount 
FROM T_TAB1 
WHERE GOODS_TYPE = 'MOBILE PHONE';
-- Суммарное количество: 5, суммарная стоимость: 640000.

-- Задача №3
SELECT NAME 
FROM T_TAB2 
WHERE SALARY > 100000;
-- 3 сотрудника: ANNA, MIKE, RITA.

-- Задача №4
SELECT MIN(AGE) AS MinAge, MAX(AGE) AS MaxAge, MIN(SALARY) AS MinSalary, MAX(SALARY) AS MaxSalary 
FROM T_TAB2;
-- Минимальный возраст: 24, максимальный возраст: 29, минимальная зарплата: 70000, максимальная зарплата: 120000.

-- Задача №5
SELECT AVG(QUANTITY) AS AvgQuantity 
FROM T_TAB1 
WHERE GOODS_TYPE IN ('KEYBOARD', 'PRINTER');
-- Среднее количество: 1.2500

-- Задача №6
SELECT SELLER_NAME, SUM(AMOUNT) AS TotalAmount 
FROM T_TAB1 
GROUP BY SELLER_NAME;
-- MIKE: 490000, JANE: 190000, JOE: 240000, ANNA: 160000

-- Задача №7
SELECT t.SELLER_NAME, t.GOODS_TYPE, t.QUANTITY, t.AMOUNT, t2.SALARY, t2.AGE 
FROM T_TAB1 t 
JOIN T_TAB2 t2 ON t.SELLER_NAME = t2.NAME 
WHERE t.SELLER_NAME = 'MIKE';

-- Задача №8
SELECT NAME, AGE 
FROM T_TAB2 
WHERE NAME NOT IN (SELECT SELLER_NAME FROM T_TAB1);
-- 1 сотрудник: RITA, 29 лет.

-- Задача №9
SELECT NAME, SALARY 
FROM T_TAB2 
WHERE AGE < 26;
-- 3 строки: JANE, MIKE, JOE.

-- Задача №10
SELECT * 
FROM T_TAB1 t 
JOIN T_TAB2 t2 ON t2.NAME = t.SELLER_NAME 
WHERE t2.NAME = 'RITA';
-- Запрос не вернёт ни одной строки, так как RITA ничего не продала.



