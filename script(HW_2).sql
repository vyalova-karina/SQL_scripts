-- Выведите имя, фамилию персонажей и название книги, которая на них числится
SELECT fname, lname, book_name
FROM characters
INNER JOIN library
ON characters.char_id = library.char_id;
-- Выведите имя, фамилию персонажей и название книги, вне зависимости от того, есть ли у них книги или нет
SELECT fname, lname, book_name
FROM characters
RIGHT JOIN library
ON characters.char_id = library.char_id;
-- Выведите название книги и имя патронуса, вне зависимости от того, есть ли информация о держателе книги в таблице или нет
SELECT book_name, patronus
FROM characters
LEFT JOIN library
ON characters.char_id = library.char_id;
-- Выведите имя, фамилию, возраст персонажей и название книги, которая на них числится, при условии, что все владельцы книг должны быть старше 15 лет
SELECT fname, lname, age, book_name
FROM characters
INNER JOIN library
ON characters.char_id = library.char_id
WHERE age > 15;
-- Выведите имя персонажа, название книги, дату выдачи и дату завершения, при условии, что он младше 15 лет и его патронус неизвестен
SELECT fname, book_name, start_date, end_date
FROM characters
INNER JOIN library
ON characters.char_id = library.char_id
WHERE age < 15 AND patronus <> 'Unknown';
-- Используя вложенный запрос количество книг, у которых end_date больше, чем end_date у Hermione
SELECT COUNT(book_id)
FROM library
WHERE end_date > (SELECT end_date
				  FROM library
				  WHERE char_id = 2);
-- С помощью вложенного запроса выведите имена всех патронусов, у которых владельцы старше возраста персонажа, у которого патронус Unknown
SELECT patronus
FROM characters
WHERE age > (SELECT age
FROM characters
WHERE patronus = 'Unknown');                  
