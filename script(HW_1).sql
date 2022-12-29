SELECT * FROM characters;
-- Выведите имя, фамилию, патронуса всех персонажей, у которых есть patronus или он известен
SELECT fname, lname, patronus 
FROM characters
WHERE patronus IS NOT NULL AND patronus <> 'Unknown';
-- Выведите фамилию персонажей, у которых последняя буква в фамилии ‘e’ 
SELECT lname 
FROM characters
WHERE lname LIKE '%e';
-- Посчитайте общий возраст всех персонажей и выведите это на экран
SELECT SUM(age)
FROM characters;
-- Выведите имя, фамилию и возраст персонажей по убыванию их возраста
SELECT fname, lname, age
FROM characters
ORDER BY age DESC;
-- Выведите имя персонажа и возраст, у которых последний находится в диапазоне от 50 до 100 лет
SELECT fname, age
FROM characters
WHERE age BETWEEN 50 AND 100;
-- Выведите возраст всех персонажей так, чтобы среди них не было тех, у кого он одинаковый
SELECT DISTINCT age
FROM characters;
-- Выведите всю информацию о персонажах, у которых faculty = Gryffindor и чей возраст больше 30 лет
SELECT * 
FROM characters
WHERE faculty = 'Gryffindor' AND age > 30;
-- Выведите имена первых трех факультетов из таблицы, так чтобы факультеты не повторялись
SELECT faculty 
FROM characters
LIMIT 3;
-- Выведите имена всех персонажей, у которых имя начинается с ‘H’ и состоит из 5 букв, или чье имя начинается с ‘L’
SELECT fname 
FROM characters
WHERE fname REGEXP '^H....$' OR fname REGEXP '^L';
-- Посчитайте средний возраст всех персонажей 
SELECT AVG(age)
FROM characters;
-- Удалите персонажа с ID = 11
DELETE FROM characters
WHERE char_id = 11;
-- Выведите фамилию всех персонажей, которые содержат в ней букву ‘a’
SELECT lname
FROM characters
WHERE lname LIKE '%a%';
-- Используйте псевдоним для того, чтобы временно замените Используйте псевдоним для того, чтобы временно замените принца-полукровки
SELECT fname as Half_Blood_Prince
FROM characters 
WHERE fname = 'Severus';
-- Выведите id и имена всех патронусов в алфавитном порядки, при условии что они есть или известны
SELECT char_id, patronus
FROM characters
WHERE patronus IS NOT NULL AND patronus <> 'Unknown'
ORDER BY patronus ASC;
-- Используя оператор IN, выведите имя и фамилию тех персонажей, у которых фамилия Crabbe, Granger или Diggory
SELECT fname, lname
FROM characters
WHERE lname IN ('Crabbe', 'Granger', 'Diggory');
-- Выведите минимальный возраст персонажа
SELECT MIN(age)
FROM characters; 
-- Используя оператор HAVING посчитайте количество персонажей на каждом факультете, оставив только те факультеты, где количество студентов больше 1
SELECT faculty, COUNT(char_id)
FROM characters
GROUP BY faculty
HAVING COUNT(char_id) > 1; 
-- Используя оператор CASE опишите следующую логику: Выведите имя и фамилию персонажа, а также следующий текстовое сообщение:
SELECT fname, lname,
CASE
    WHEN faculty = 'Gryffindor' THEN 'Godric'
    WHEN faculty = 'Slytherin' THEN 'Salazar'
    WHEN faculty = 'Ravenclaw' THEN 'Rowena'
    WHEN faculty = 'Hufflepuff' THEN 'Helga'
    ELSE 'Muggle'
END AS Founders
FROM characters;
-- Используя регулярное выражение найдите фамилии персонажей, которые не начинаются с букв H, L или S и выведите их
SELECT lname 
FROM characters 
WHERE NOT lname REGEXP '^[HLS]';