--=========================================================================== 2 ЛР ===========================================================================
create table Academics (
  ID int primary key,
  FIO nvarchar(150),
  Birthdate date,
  Specialization nvarchar(50),
  Year_invocation int
)

insert into Academics(ID, FIO, Birthdate, Specialization,Year_invocation)
values
(1, 'Аничков Николай Николаевич', '1885-11-03', 'медицина', 1939),
(2, 'Бартольд Василий Владимирович', '1869-11-15', 'историк', 1913),
(3, 'Белопольский Аристарх Аполлонович', '1854-07-13', 'астрофизик', 1903),
(4, 'Бородин Иван Парфеньевич', '1847-01-30', 'ботаник', 1902),
(5, 'Вальден Павел Иванович', '1863-07-26', 'химик-технолог', 1910),
(6, 'Вернадский Владимир Иванович', '1863-03-12', 'геохимик', 1908),
(7, 'Виноградов Павел Гаврилович', '1854-11-30', 'историк', 1914),
(8, 'Ипатьев Владимир Николаевич', '1867-11-21', 'химик', 1916),
(9, 'Истрин Василий Михайлович', '1865-02-22', 'филолог', 1907),
(10, 'Карпинский Александр Петрович', '1847-01-07', 'геолог', 1889),
(11, 'Коковцов Павел Константинович', '1861-07-01', 'историк', 1906),
(12, 'Курнаков Николай Семёнович', '1860-12-06', 'химик', 1913),
(13, 'Марр Николай Яковлевич', '1865-01-06', 'лингвист', 1912),
(14, 'Насонов Николай Викторович', '1855-02-26', 'зоолог', 1906),
(15, 'Ольденбург Сергей Фёдорович', '1863-09-26', 'историк', 1903),
(16, 'Павлов Иван Петрович', '1849-09-26', 'физиолог', 1907),
(17, 'Перетц Владимир Николаевич', '1870-01-31', 'филолог', 1914),
(18, 'Соболевский Алексей Иванович', '1857-01-07', 'лингвист', 1900),
(19, 'Стеклов Владимир Андреевич', '1864-01-09', 'математик', 1912)

--1.	Вывести ФИО, специализацию и дату рождения всех академиков.
select
a.FIO as 'ФИО', a.Specialization as 'Специализация', a.Birthdate as 'Дата рождения' 
from Academics a

--2.	Создать вычисляемое поле «О присвоении звания», которое содержит информацию об академиках в виде: «Петров Петр Петрович получил звание в 1974».
select concat(a.FIO, ' получил звание в ', a.Year_invocation) as'О присвоении звания' from Academics a;

--3.	Вывести ФИО академиков и вычисляемое поле «Через 5 лет после присвоения звания».
select a.FIO,  a.Year_invocation + 5 as 'Через 5 лет после присвоения звания' from Academics a;

--4.	Вывести список годов присвоения званий, убрав дубликаты.
select distinct a.Year_invocation from Academics a

--5.	Вывести список академиков, отсортированный по убыванию даты рождения.
select a.FIO, a.Birthdate from Academics a order by a.Birthdate desc
--6.	Вывести список академиков, отсортированный в обратном алфавитном порядке специализаций, по убыванию года присвоения звания, и в алфавитном порядке ФИО.
select a.FIO, a.Specialization, a.Year_invocation
from Academics a
order by a.FIO asc
--a.Year_invocation desc
--a.Specialization asc

--7.	Вывести первую строку из списка академиков, отсортированного в обратном ал-фавитном порядке ФИО.
select top 1 a.FIO from Academics a order by a.FIO asc

--8.	Вывести фамилию академика, который раньше всех получил звание.
select top 1 a.FIO, a.Year_invocation from Academics a order by a.Year_invocation asc

--9.	Вывести первые 10% строк из списка академиков, отсортированного в алфавитном порядке ФИО.
select top 10 percent  a.FIO from Academics a order by a.FIO asc

--10.	Вывести из таблицы «Академики», отсортированной по возрастанию года присво-ения звания, список академиков, у которых год присвоения звания – один из первых пяти в отсортированной таблице.
 select top 5 a.FIO, a.Year_invocation from Academics a order by a.Year_invocation asc

--11.	Вывести, начиная с десятого, список академиков, отсортированный по возраста-нию даты рождения.
select a.FIO, a.Birthdate from Academics a order by a.Birthdate asc offset 8 rows
--12.	Вывести девятую и десятую строку из списка академиков, отсортированного в ал-фавитном порядке ФИО.
 select a.FIO from Academics a order by a.FIO asc offset 9 rows fetch next 10 rows only


 --=========================================================================== 3 ЛР ===========================================================================

 create table Countries( 
	C_Name nvarchar(100),
	Capital nvarchar(100),
	Area int,
	Population int,
	Continent nvarchar(50)
)
insert into Countries (C_Name, Capital, Area, Population, Continent)
values
	('Австрия', 'Вена', 83858, 8741753, 'Европа'),
	('Азербайджан', 'Баку', 86600, 9705600, 'Азия'),
	('Албания', 'Тирана', 28748, 2866026, 'Европа'),
	('Алжир', 'Алжир', 2381740, 39813722, 'Африка'),
	('Ангола', 'Луанда', 1246700, 25831000, 'Африка'),
	('Аргентина', 'Буэнос-Айрес', 2766890, 43847000, 'Южная Америка'),
	('Афганистан', 'Кабул', 647500, 29822848, 'Азия'),
	('Бангладеш', 'Дакка', 144000, 160221000, 'Азия'),
	('Бахрейн', 'Манама', 701, 1397000, 'Азия'),
	('Белиз', 'Бельмопан', 22966, 377968, 'Северная Америка'),
	('Белоруссия', 'Минск', 207595, 9498400, 'Европа'),
	('Бельгия', 'Брюссель', 30528, 11250585, 'Европа'),
	('Бенин', 'Порто-Ново', 112620, 11167000, 'Африка'),
	('Болгария', 'София', 110910, 7153784, 'Европа'),
	('Боливия', 'Сукре', 1098580, 10985059, 'Южная Америка'),
	('Ботсвана', 'Габороне', 600370, 2209208, 'Африка'),
	('Бразилия', 'Бразилиа', 8511965, 206081432, 'Южная Америка'),
	('Буркина-Фасо', 'Уагадугу', 274200, 19034397, 'Африка'),
	('Бутан', 'Тхимпху', 47000, 784000, 'Азия'),
	('Великобритания', 'Лондон', 244820, 65341183, 'Европа'),
	('Венгрия', 'Будапешт', 93030, 9830485, 'Европа'),
	('Венесуэла', 'Каракас', 912050, 31028637, 'Южная Америка'),
	('Восточный Тимор', 'Дили', 14874, 1167242, 'Азия'),
	('Вьетнам', 'Ханой', 329560, 91713300, 'Азия')

--1.	Вывести названия и столицы пяти наибольших стран по площади.
select top 5 c.C_Name, c.Capital, c.Area from Countries c order by c.Area desc

--2.	Вывести список африканских стран, население которых не превышает 1 млн. чел.
select * from Countries c 
where c.Population < 1000000 and c.Continent = 'Африка'

--3.	Вывести список стран, население которых больше 5 млн. чел., а площадь меньше 100	тыс. кв. км, и они расположены не в Европе.
select * from Countries c
where c.Population > 5000000 AND c.Area < 100000 AND c.Continent != 'Европа';

--4.	Вывести список стран Северной и Южной Америки, население которых больше 20	млн. чел., или стран Африки, у которых население больше 30 млн. чел.
select * from Countries c 
where (c.Continent = 'Южная Америка' or c.Continent = 'Северная Америка') and c.Area < 20000000
	or
	(c.Continent = 'Африка') and c.Area < 30000000	
--5.	Вывести список стран, население которых составляет от 10 до 100 млн. чел., а пло-щадь не больше 500 тыс. кв. км.
select * from Countries c
where (c.Population between 10 and 100000000) and c.Area > 500000

--6.	Вывести список стран, названия которых не начинаются с буквы «К».
select * from Countries c
where c.C_Name not like 'К%'
--7.	Вывести список стран, в названии которых третья буква – «а», а предпоследняя – «и».
select * from Countries c
where c.C_Name  like '__а%и_'

--8.	Вывести список стран, в названии которых вторая буква – гласная.
select * from Countries c
where c.C_Name like '_[ауоыиэяюёе]%'

--9.	Вывести список стран, названия которых начинаются с букв от «К» до «П».
select * from Countries c
where c.C_Name like '[К-П]%'

--10.	Вывести список стран, названия которых начинаются с букв от «А» до «Г», но не с буквы «Б».
select * from Countries c
where c.C_Name like '[А-Г]%' and c.C_Name like '[^Б]%'

--11.	Вывести список стран, столицы которых есть в базе.
select c.Capital from Countries c

--12.	Вывести список стран Африки, Северной и Южной Америки.
select * from Countries c
where c.Continent != 'Европа'

 --=========================================================================== 4 ЛР ===========================================================================
 --1.	Вывести список академиков, отсортированный по количеству символов в ФИО.
 select * from Academics a
 order by (len(a.FIO))

--2.	Вывести список академиков, убрать лишние пробелы в ФИО.
select trim(a.FIO) as 'fio'from Academics a

--3.	Найти позиции «ов» в ФИО каждого академика. Вывести ФИО и номер позиции.
select a.FIO, charindex('ОВ', a.FIO) as' Позиция "ОВ"' from Academics a

--4.	Вывести ФИО и последние две буквы специализации для каждого академика.
select a.FIO, right(a.Specialization, 2) as 'Последние 2 буквы' from Academics a

--5.	Вывести список академиков, ФИО в формате Фамилия и Инициалы.
select a.FIO,
substring(a.FIO,1, charindex(' ', a.FIO)- 1) + 
substring(a.FIO, charindex(' ', a.FIO), 2) + '.' + 
substring(a.FIO, charindex(' ', a.FIO, charindex(' ',a.FIO)-0),2) + '.'
 as 'Фамилия и Инициалы'
from Academics a

--6.	Вывести список специализаций в правильном и обратном виде. Убрать дубликаты.
select 
distinct a.Specialization as 'Правильный вид',
reverse(a.Specialization) as 'Обратный вид' 
from Academics a

--7.	Вывести свою фамилию в одной строке столько раз, сколько вам лет.
declare @name nvarchar(25) = 'Ахат ', @age int = 18
select replicate(@name, @age) as 'Результат'

--9.	Вывести количество дней до конца семестра.
declare @EndDate date = '2023-12-29'
select datediff(day, getdate(), @EndDate) AS DaysLeft;

--10.	Вывести количество месяцев от вашего рождения.
declare @b_d date = '2005-05-09', @date date = getdate()
select datediff(month, @b_d, @date)
--11.	Вывести ФИО и високосность года рождения каждого академика.
select a.FIO, a.Birthdate, iif(year(Birthdate) % 4 = 0, 'Високосный', 'Невисокосный')
as Результат
FROM Academics a;

--12.	Вывести список специализаций без повторений. Для каждой специализации выве-сти «длинный» или «короткий», в зависимости от количества символов.
select distinct a.Specialization,
case
when len(a.Specialization) < 7 then 'короткий'
else 'длинный' end as 'Результат'
from Academics a

 --=========================================================================== 5 ЛР ===========================================================================
 --1.	Вывести минимальную площадь стран.
 select min(c.Area) as 'Минимальная площадь' from Countries c

--2.	Вывести наибольшую по населению страну в Северной и Южной Америке.
select max(c.Population), c.Continent from Countries c
where c.Continent in ('Северная Америка', 'Южная Америка')
group by c.Continent

--3.	Вывести среднее население стран. Результат округлить до одного знака.
select avg(c.Population), c.Continent from Countries c group by c.Continent


--4.	Вывести количество стран, у которых название заканчивается на «ан», кроме стран, у которых название заканчивается на «стан».
select count(c.C_Name) as 'Результат'
from Countries c
where c.C_Name like '%ан%' and c.C_Name not like '%стан%'


--5.	Вывести количество континентов, где есть страны, название которых начинается с буквы «Р».
select count(c.C_Name) as 'Результат'
from Countries c
where left(c.C_Name, 1) = 'Р'

--6.	Сколько раз страна с наибольшей площадью больше, чем страна с наименьшей пло-щадью?
select (max(c.Area) / min(c.Area)) as 'Ответ' from Countries c

--7.	Вывести количество стран с населением больше, чем 100 млн. чел. на каждом кон-тиненте. Результат отсортировать по количеству стран по возрастанию.
select c.Continent, count(c.C_Name) from Countries c
where c.Population > 100000000
group by c.Continent
order by count(c.C_Name) asc 

--8.	Вывести количество стран по количеству букв в названии. Результат отсортировать по убыванию.
select len(c.C_Name) as 'Кол-во букв', count(c.C_Name) as 'Кол-во стран'
from Countries c
group by len(c.C_Name)
order by len(c.C_Name) desc

--9.	Ожидается, что через 20 лет население мира вырастет на 10%. Вывести список континентов с прогнозируемым населением:
select c.Continent, sum(c.Population) as 'Сейчас', sum(c.Population * 1.1)  as 'через 20 лет'  from Countries c
group by c.Continent

--10.	Вывести список континентов, где разница по площади между наибольшими и наименьшими странами не более в 10000 раз:
select C.Continent
from Countries c
group by c.Continent
having (max(c.Area) / min(c.Area)) < 10000
--11.	Вывести среднюю длину названий Африканских стран.
select avg(len(c.C_Name)) from Countries c where c.Continent = 'Африка'

--12.	Вывести список континентов, у которых средняя плотность среди стран с населе-нием более 1 млн. чел. больше, чем 30 чел. на кв. км.
select C.Continent
from Countries c
where c.Population > 1000000
group by c.Continent
having avg(c.Population / c.Area) > 30

 --=========================================================================== 6 ЛР ===========================================================================--
 CREATE TABLE Faculty (
  Abbreviation varchar(2),
  Title varchar(50)
)

INSERT INTO Faculty (Abbreviation, Title) VALUES
  ('ен', 'Естественные науки'),
  ('гн', 'Гуманитарные науки'),
  ('ит', 'Информационные технологии'),
  ('фм', 'Физико-математический');
  
CREATE TABLE Kafedra (
  Code varchar(2),
  Name varchar(50),
  FcultyAbbreviation varchar(2)
);  

INSERT INTO Kafedra VALUES
  ('вм', 'Высшая математика', 'ен'),
  ('ис', 'Информационные системы', 'ит'),
  ('мм', 'Математическое моделирование', 'фм'),
  ('оф', 'Общая физика', 'ен'),
  ('пи', 'Прикладная информатика', 'ит'),
  ('эф', 'Экспериментальная физика', 'фм');
  
CREATE TABLE Employee (
  TabNumber int, 
  Code varchar(2),
  LastName varchar(50),
  Position varchar(50),
  Salary varchar(20),
  Shef int
)

INSERT INTO Employee  VALUES
  (101, 'пи', 'Прохоров П.П.', 'зав. кафедрой', '35 000,00 р.', 101),
  (102, 'пи', 'Семенов С.С.', 'преподаватель', '25 000,00 р.', 101),
  (105, 'пи', 'Петров П.П.', 'преподаватель', '25 000,00 р.', 101),
  (153, 'пи', 'Сидорова С.С.', 'инженер', '15 000,00 р.', 102),
  (201, 'ис', 'Андреев А.А.', 'зав. кафедрой', '35 000,00 р.', 201),
  (202, 'ис', 'Борисов Б.Б.', 'преподаватель', '25 000,00 р.', 201),
  (241, 'ис', 'Глухов Г.Г.', 'инженер', '20 000,00 р.', 201),
  (242, 'ис', 'Чернов Ч.Ч.', 'инженер', '15 000,00 р.', 202),
  (301, 'мм', 'Басов Б.Б.', 'зав. кафедрой', '35 000,00 р.', 301),
  (302, 'мм', 'Сергеева С.С.', 'преподаватель', '25 000,00 р.', 301),
  (401, 'оф', 'Волков В.В.', 'зав. кафедрой', '35 000,00 р.', 401),
  (402, 'оф', 'Зайцев З.З.', 'преподаватель', '25 000,00 р.', 401),
  (403, 'оф', 'Смирнов С.С.', 'преподаватель', '15 000,00 р.', 401),
  (435, 'оф', 'Лисин Л.Л.', 'инженер', '20 000,00 р.', 402),
  (501, 'вм', 'Кузнецов К.К.', 'зав. кафедрой', '35 000,00 р.', 501),
  (502, 'вм', 'Романцев Р.Р.', 'преподаватель', '25 000,00 р.', 501), 
  (503, 'вм', 'Соловьев С.С.', 'преподаватель', '25 000,00 р.', 501),
  (601, 'эф', 'Зверев З.З.', 'зав. кафедрой', '35 000,00 р.', 601),
  (602, 'эф', 'Сорокина С.С.', 'преподаватель', '25 000,00 р.', 601),
  (614, 'эф', 'Григорьев Г.Г.', 'инженер', '20 000,00 р.', 602);
  
CREATE TABLE Specialty (
  Number nvarchar(25),
  Direction varchar(100),
  Code varchar(2)
)

INSERT INTO Specialty  VALUES
  (1, 'Прикладная математика', 'мм'),
  (2, 'Информационные системы и технологии', 'ис'),
  (3, 'Прикладная информатика', 'пи'),
  (4, 'Ядерные физика и технологии', 'эф'),
  (5, 'Бизнес-информатика', 'ис');
  
CREATE TABLE Discipline (
  Code int,
  Volume int,
  Title varchar(50),
  Kaf_code varchar(2)
)

INSERT INTO Discipline  VALUES
  (101, 320, 'Математика', 'вм'),
  (102, 160, 'Информатика', 'пи'),
  (103, 160, 'Физика', 'оф'),
  (202, 120, 'Базы данных', 'ис'),
  (204, 160, 'Электроника', 'эф'),
  (205, 80, 'Программирование', 'пи'),
  (209, 80, 'Моделирование', 'мм');
  
CREATE TABLE Request (
  Code int,
  Number varchar(50),
)

INSERT INTO Request  VALUES
  (101, '01.03.04'),
  (205, '01.03.04'),
  (209, '01.03.04'),

  (101, '09.03.02'),
  (102, '09.03.02'),
  (103, '09.03.02'),
  (202, '09.03.02'),
  (205, '09.03.02'),
  (209, '09.03.02'),

  (101, '09.03.03'),
  (102, '09.03.03'),
  (103, '09.03.03'),
  (202, '09.03.03'),
  (205, '09.03.03'),

  (101, '14.03.02'),
  (102, '14.03.02'),
  (103, '14.03.02'),
  (204, '14.03.02'),

  (101, '38.03.05'),
  (103, '38.03.05'),
  (202, '38.03.05'),
  (209, '38.03.05')

  






CREATE TABLE Zav_kaf (
  TabNumber int,
  Experience int 
);

INSERT INTO Zav_kaf VALUES
  (101, 15),
  (201, 18),
  (301, 20),
  (401, 10),
  (501, 18),
  (601, 8);
  
CREATE TABLE Engineer (
  TabNumber int,
  Specialty varchar(50)
);

INSERT INTO Engineer (TabNumber, Specialty) VALUES
  (153, 'электроник'),
  (241, 'электроник'),
  (242, 'программист'),
  (435, 'электроник'),
  (614, 'программист');
  
CREATE TABLE Teacher (
  TabNumber int,
  Title varchar(50),
  Degree varchar(20)
);

INSERT INTO Teacher (TabNumber, Title, Degree) VALUES
  (101, 'профессор', 'д. т.н.'),
  (102, 'доцент', 'к. ф.-м. н.'),
  (105, 'доцент', 'к. т.н.'),
  (201, 'профессор', 'д. ф.-м. н.'),
  (202, 'доцент', 'к. ф.-м. н.'),
  (301, 'профессор', 'д. т.н.'),
  (302, 'доцент', 'к. т.н.'),
  (401, 'профессор', 'д. т.н.'),
  (402, 'доцент', 'к. т.н.'),
  (403, 'ассистент', '-'),
  (501, 'профессор', 'д. ф.-м. н.'),
  (502, 'профессор', 'д. ф.-м. н.'),
  (503, 'доцент', 'к. ф.-м. н.'),
  (601, 'профессор', 'д. ф.-м. н.');

CREATE TABLE Student (
  RegNumber int,
  Number int, 
  LastName varchar(50)
);

INSERT INTO Student (RegNumber, Number, LastName) VALUES
  (10101, 9, 'Николаева Н. Н.'),
  (10102, 9, 'Иванов И. И.'),
  (10103, 9, 'Крюков К. К.'),
  (20101, 2, 'Андреев А. А.'),
  (20102, 2, 'Федоров Ф. Ф.'),
  (30101, 4, 'Бондаренко Б. Б.'),
  (30102, 4, 'Цветков К. К.'),
  (30103, 4, 'Петров П. П.'),
  (50101, 1, 'Сергеев С. С.'),
  (50102, 1, 'Кудрявцев К. К.'),
  (80101, 5, 'Макаров М. М.'),
  (80102, 5, 'Яковлев Я. Я.');
  
CREATE TABLE Exam (
  Date date,
  Dis_Code int,
  RegNumber int,
  TabNumber int,
  Auditorium varchar(10),
  Grade int
);


INSERT INTO Exam  VALUES
  ('2015-06-05', 102, 10101, 102, 'т505', 4),
  ('2015-06-05', 102, 10102, 102, 'т505', 4),
  ('2015-06-05', 202, 20101, 202, 'т506', 4),
  ('2015-06-05', 202, 20102, 202, 'т506', 3),
  ('2015-06-07', 102, 30101, 105, 'ф419', 3),
  ('2015-06-07', 102, 30102, 101, 'т506', 4),
  ('2015-06-07', 102, 80101, 102, 'м425', 5),
  ('2015-06-09', 205, 80102, 402, 'м424', 4),
  ('2015-06-09', 209, 20101, 302, 'ф333', 3),
  ('2015-06-10', 101, 10101, 501, 'т506', 4),
  ('2015-06-10', 101, 10102, 501, 'т506', 4),
  ('2015-06-10', 204, 30102, 601, 'ф349', 5),
  ('2015-06-10', 209, 80101, 301, 'э105', 5),
  ('2015-06-10', 209, 80102, 301, 'э105', 4),
  ('2015-06-12', 101, 80101, 502, 'с324', 4),
  ('2015-06-15', 101, 30101, 503, 'ф417', 4),
  ('2015-06-15', 101, 50101, 501, 'ф201', 5),
  ('2015-06-15', 101, 50102, 501, 'ф201', 3), 
  ('2015-06-15', 103, 10101, 403, 'ф414', 4),
  ('2015-06-17', 102, 10101, 102, 'т505', 5);

 -- 1.	Вывести из таблиц «Кафедра», «Специальность» и «Студент» данные о студентах, которые обучаются на данном факультете (например, «ит»).
select st.LastName, s.Direction, k.Name from Student st
inner join Specialty s on s.Number = st.Number
inner join Kafedra k on s.Code = k.Code
where k.FacultyAbbreviation = 'ит'
--2.	Вывести из таблиц «Кафедра», «Специальность» и «Сотрудник» данные о выпус-кающих кафедрах (факультет, шифр, название, фамилию заведующего).
-- Выпускающей счита-ется та кафедра, на которую есть ссылки в таблице «Специальность».
select f.Title, k.Code, k.Name, e.LastName from Kafedra k
inner join Employee e on e.Code = k.Code
inner join Faculty f on f.Abbreviation = k.FacultyAbbreviation
where e.Position = 'зав. кафедрой'



--3.	Вывести в запросе для каждого сотрудника номер и фамилию его непосредствен-ного руководителя. Для заведующих кафедрами поле руководителя оставить пустым.
select e.TabNumber, e.LastName, s.LastName from Employee e
join Employee s on s.Shef = e.Shef

--4.	Вывести список студентов, сдавших минимум два экзамена.
select s.LastName from Student s
join Exam e on e.RegNumber = s.RegNumber
group by s.LastName
having count(s.RegNumber) >= 2

--5.	Вывести список инженеров с зарплатой, меньшей 20000 руб.
select e.LastName from Employee e
join Engineer en on en.TabNumber = e.TabNumber
where e.Salary < '20000 р.'

--6.	Вывести список студентов, сдавших экзамены в заданной аудитории.
select distinct s.LastName from Student s join Exam e on e.RegNumber = s.RegNumber
where e.Auditorium = 'т505'

--7.	Вывести из таблиц «Студент» и «Экзамен» учетные номера и фамилии студентов,
-- а также количество сданных экзаменов и средний балл для каждого студента только 
 --для тех студентов, 
--у которых средний балл не меньше заданного (например, 4).
select s.RegNumber, s.LastName, count(ex.RegNumber), avg(ex.Auditorium) as средняя_оценка from Student s
join Exam ex on ex.RegNumber = s.RegNumber
group by s.LastName,  s.RegNumber
having avg(ex.Auditorium) >= 4
--8.	Вывести список заведующих кафедрами и их зарплаты, и степень.
select e.LastName, e.Salary, zk.Experience from Zav_kaf zk
join Employee e on e.TabNumber = zk.TabNumber

--9.	Вывести список профессоров.
select e.LastName from Employee e
join Teacher t on t.TabNumber = e.TabNumber
where t.Title = 'профессор'

--10.	Вывести название дисциплины, фамилию, должность и степень преподавателя,
 --дату и место проведения экзаменов в хронологическом порядке в заданном интервале 
 --даты.
 select d.Title, e.LastName,t.Title, t.Degree, ex.Date, ex.Grade  from Exam ex
 join Discipline d on d.Code = ex.Dis_Code
 join Employee e on e.TabNumber = ex.TabNumber
 join Teacher t on t.TabNumber = e.TabNumber
 where ex.Date between '05.06.2015' and '10.06.2015'
--11.	Вывести фамилию преподавателей, принявших более трех экзаменов.
select e.LastName from Employee e
join Teacher t on e.TabNumber = t.TabNumber
join Exam ex on e.TabNumber = ex.TabNumber
group by e.LastName
having count(ex.Dis_Code) > 3

--12.	Вывести список студентов, не сдавших ни одного экзамена в указанной дате.
select st.LastName from Student st
join Exam ex on ex.RegNumber = st.RegNumber
where st.RegNumber not in (
 select ex.RegNumber from Exam ex
 where ex.Date = '05.06.2015' 
)

 --=========================================================================== 7 ЛР ===========================================================================--
-- 1.	Вывести объединенный результат выполнения запросов, 
--которые выбирают страны с площадью меньше 500 кв. км и 
--с площадью больше 5 млн. кв. км:
select c.C_Name from Countries c
where c.Area < 500
union
(select c.C_Name from Countries c
where c.Area > 5000000 )

--2.	Вывести список стран с площадью больше 1 млн. кв. км,
-- исключить страны с насе-лением меньше 100 млн. чел.:
select c.C_Name from Countries c
where c.Area > 1000000
union
(select c.C_Name from Countries c
where c.Population < 10000000)

--3.	Вывести список стран с площадью меньше 500 кв. км и
-- с населением меньше 100	тыс. чел.
select c.C_Name from Countries c
where c.Area < 500
union
(select c.C_Name from Countries c
where c.Population < 100000 )

 --=========================================================================== 8 ЛР ===========================================================================--
 --1.	Вывести список стран и процентное соотношение площади каждой из них к общей площади всех стран мира.
SELECT C_Name, (Area * 100 / (SELECT SUM(Area) FROM Countries)) AS Percentage 
   FROM Countries

 --  2.	Вывести список стран мира, плотность населения которых больше, чем средняя плотность населения всех стран мира.
select c.C_Name, c.Capital, c.Area, c.Population, c.Continent from Countries c
where c.Population > (select AVG(c.Population) from Countries c)
--3.	С помощью подзапроса вывести список европейских стран, население которых меньше 5 млн. чел.
select * from 
(select *
from Countries c 
where c.Continent = 'Европа') a where Population < 5000000
--4.	Вывести список стран и процентное соотношение их площади к суммарной пло-щади той части мира, где они находятся.

select *, round(cast(Population AS float) * 100 /
(select sum(Population)
from dbo.Countries c
where
c.Continent = c2.Continent), 3) as Процентное_соотношение
FROM
Countries c2

--5.	Вывести список стран мира, площадь которых больше, чем средняя площадь стран той части света, где они находятся.
 select C_Name  from Countries 
where Area > (select AVG(Area) from Countries where Continent = Countries.Continent)
--6.	Вывести список стран мира, которые находятся в тех частях света, средняя плот-ность населения которых превышает общемировую.
 select * from Countries  c
 where Continent in (select Continent from Countries group by Continent having AVG(Population/Area) > (select AVG(Population/Area) from Countries))

--7.	Вывести список южноамериканских стран, в которых живет больше людей, чем в любой африканской стране.
select C_Name  from Countries 
where Continent = 'Южная Америка' and Population > (select MAX(Population) from Countries where Continent = 'Африка')
--8.	Вывести список африканских стран, в которых живет больше людей, чем хотя бы в	одной южноамериканской стране.
select C_Name  from Countries 
where Continent = 'Африка' and Population > (select MAX(Population) from Countries where Continent = 'Южная Америка')


--9.	Если в Африке есть хотя бы одна страна, площадь которой больше 2 млн. кв. км, вывести список всех африканских стран.
select * from Countries c
where c.Continent = 'Африка'
and EXISTS (select c.C_Name from Countries c where Continent = 'Африка' and c.Area > 2000000 )

--10.	Вывести список стран той части света, где находится страна «Фиджи».
select C_Name  from Countries 
where Continent = (select Continent from Countries where C_Name = 'Фиджи')
--11.	Вывести список стран, население которых не превышает население страны «Фи-джи».
select C_Name  from Countries 
where Population <= (select Population from Countries where C_Name = 'Фиджи')

--12.	Вывести название страны с наибольшим населением среди стран с наименьшей площадью на каждом континенте.
 select C_Name  from Countries 
 where Population = (select MAX(Population) from Countries
  where Area = (select MIN(Area) from Countries
   where Continent = Countries.Continent ))


 --=========================================================================== 9 ЛР ===========================================================================--


--1.	Создать таблицу «Управление_ВашаФамилия». Определить основной ключ, иден-тификатор, значение по умолчанию
CREATE TABLE Control (
	ID INT CONSTRAINT Control_ManakovID PRIMARY KEY,
	Surname NVARCHAR(40) CONSTRAINT DF_Control DEFAULT 'Манаков' )
--2.	Создать таблицу «Страны_ВашаФамилия». Определить основной ключ, разреше-ние / запрет на NULL, условие на вводимое значение.
CREATE TABLE Countries_fam (
	ID INT CONSTRAINT Countries_ID PRIMARY KEY,
	Square INT CONSTRAINT CK_Countries_Square CHECK (Square > 10000) NOT NULL
)
--3.	Создать таблицу «Цветы_ВашаФамилия». Определить основной ключ, значения столбца «ID» сделать уникальными, для столбца «Класс» установить значение по умолчанию «Двудольные».
CREATE TABLE Flowers
(
	ID INT CONSTRAINT Flowers_ID PRIMARY KEY,
	Class NVARCHAR(40) CONSTRAINT DF_Flowers DEFAULT 'Двудольные'
)
--4.	Создать таблицу «Животные_ВашаФамилия». Определить основной ключ, значе-ния столбца «ID» сделать уникальными, для столбца «Отряд» установить значение по умол-чанию «Хищные».
CREATE TABLE Animal (
	ID INT CONSTRAINT Animal_ID PRIMARY KEY,
	Squad NVARCHAR(40) CONSTRAINT DF_Animal DEFAULT 'Хищные')

 --=========================================================================== 10 ЛР ===========================================================================--

 CREATE TABLE Student_sch
(
  ID INT PRIMARY KEY IDENTITY(1,1),
  Last_Name VARCHAR(50) NOT NULL,
  Subject VARCHAR(50) NOT NULL,
  School VARCHAR(50) NOT NULL,
  Score FLOAT CHECK ((Score >= 0) AND (Score <= 100)) NULL
)
--1.	В таблицу «Ученики» внести новую запись для ученика школы № 18 Трошкова, оценка которого по химии неизвестна.
INSERT INTO Student_sch ( Last_Name, Subject, School, Score)
VALUES
('Трошков', 'Химия', 'Школа № 18', NULL)

--2.	В таблицу «Ученики» внести три строки.
INSERT INTO Student_sch
VALUES
	('Никитин', 'Химия', 'МБОУ СОШ №2', 50),
	('Петров', 'Русский язык', 'Школа №20', NULL),
	('Петрова', 'Мфтематика', 'Школа №18', 90)
--3.	В таблице «Ученики» изменить данные Трошкова, школу исправить на № 21, пред-мет на математику, а оценку на 56.
UPDATE Student_sch
SET School = 'Школа №21', Subject = 'Математика', Score = 56
WHERE Last_Name = 'Трошков'

--4.	В таблице «Ученики» изменить данные всех учеников по химии, оценку увеличить на 10%, если она ниже 60 баллов.
UPDATE Student_sch
SET Score = Score + (Score* 0.1)
WHERE Subject = 'Химия' AND Score < 60

--5.	В таблице «Ученики» удалить данные всех учеников из школы №21.
DELETE FROM Student_sch
WHERE School = 'Школа №21'

--6.	Создать таблицу «Гимназисты» и скопировать туда данные всех гимназистов, кроме тех, которые набрали меньше 60 баллов.
SELECT Id, Last_Name, Subject, School, Score 
INTO Licei From Student_sch
Where Score >= 60

--7.	Очистить таблицу «Гимназисты».
TRUNCATE TABLE Licei

 --=========================================================================== 11 ЛР ===========================================================================--

 INSERT INTO  Student_sch VALUES
( N'Иванова', N'Математика', N'Лицей', 98.5),
( N'Петров', N'Физика', N'Лицей', 99),
( N'Сидоров', N'Математика', N'Лицей', 88), 
( N'Полухина', N'Физика', N'Гимназия', 78),
( N'Матвеева', N'Химия', N'Лицей', 92),
( N'Касимов', N'Химия', N'Гимназия', 68),
( N'Нурулин', N'Математика', N'Гимназия', 81),
( N'Авдеев', N'Физика', N'Лицей', 87),
(N'Никитина', N'Химия', N'Лицей', 94), 
(N'Барышева', N'Химия', N'Лицей', 88);
 --1.	Даны числа A и B. Найти и вывести их произведение.
DECLARE @a INT, @b INT, @c INT
SET @a = 12
SET @b = 29
SET @c = @a * @b
PRINT @c
--2.	В таблице «Ученики» найти разницу между средними баллами лицеистов и гимназистов.
DECLARE @licey FLOAT, @gimn FLOAT, @diff FLOAT 
SET @licey = ( SELECT AVG(Score) 
FROM Student_sch s
WHERE School = 'Лицей' )
SET @gimn = ( SELECT AVG(Score)
FROM Student_sch s
WHERE School = 'Гимназия' )
SET @diff = ABS(@licey - @gimn)
PRINT @diff

--3.	В таблице «Ученики» проверить на четность количество строк.
DECLARE @col_str int
set @col_str = (Select count(s.Id) from Student_sch s)
if (@col_str%2 = 0)
print 'четное = ' + CAST(@col_str AS VARCHAR(4))
else 
print 'нечетное = ' + CAST(@col_str AS VARCHAR(4))

--4.	Дано четырехзначное число. Вывести сумму его цифр.
DECLARE @sum INT, @var INT, @e INT, @d INT, @s INT, @t INT
SET @sum = 4243
SET @t = @sum / 1000
SET @s = (@sum / 100) % 10
SET @d = (@sum / 10) % 10
SET @e = @sum % 10
SET @var = @e + @d + @s + @t
PRINT '@var = ' + CAST(@var AS NVARCHAR(4))

--5.	Даны случайные целые числа a, b и c. Найти наименьшее из них.
DECLARE @A_5 INT = RAND() * 100, @B_5 INT = RAND() * 100, @C_5 INT = RAND() * 100
PRINT '@A_5 = ' + CAST(@A_5 AS NVARCHAR(3))
PRINT '@B_5 = ' + CAST(@B_5 AS NVARCHAR(3))
PRINT '@C_5 = ' + CAST(@C_5 AS NVARCHAR(3))
IF @A_5 > @B_5 AND @B_5 > @C_5
 PRINT 'Наименьшее @C_5 = ' + CAST(@C_5 AS NVARCHAR(3))
IF @A_5 > @B_5 AND @B_5 < @C_5
 PRINT 'Наименьшее @B_5 = ' + CAST(@B_5 AS NVARCHAR(3))
IF @A_5 < @B_5 AND @B_5 < @C_5
 PRINT 'Наименьшее @A_5 = ' + CAST(@A_5 AS NVARCHAR(3))
IF @A_5 < @B_5 AND @B_5 > @C_5 AND @A_5 > @C_5
 PRINT 'Наименьшее @C_5 = ' + CAST(@C_5 AS NVARCHAR(3))
IF @A_5 < @B_5 AND @B_5 > @C_5 AND @A_5 < @C_5
 PRINT 'Наименьшее @A_5 = ' + CAST(@A_5 AS NVARCHAR(3))
IF @A_5 < @B_5 AND @A_5 = @C_5
PRINT 'Наименьшее @B_5 = ' + CAST(@B_5 AS NVARCHAR(3))
IF @A_5 > @B_5 AND @B_5 = @C_5
PRINT 'Наименьшее @A_5 = ' + CAST(@A_5 AS NVARCHAR(3))

--6.	Дано случайное целое число a. Проверить, делится ли данное число на 11.
DECLARE @a_6 INT = RAND() * 100
IF @a_6 % 11 = 0
PRINT CAST(@a_6 AS VARCHAR(3)) + ' делится на 11'
ELSE
PRINT CAST(@a_6 AS VARCHAR(3)) + ' не делится на 11'

--7.	Дано случайное целое число N (N < 1000). Если оно является степенью числа 3, то вывести «Да», если не является – вывести «Нет».
DECLARE @A_7 INT = RAND() * 1000
WHILE @A_7 % 3 = 0
SET @A_7 = @A_7 / 3
IF @A_7 = 1
PRINT CAST(@a_7 AS VARCHAR(4)) + ' Да'
ELSE
PRINT CAST(@a_7 AS VARCHAR(4)) + ' Нет'

--8.	Даны случайные целые числа a и b. Найти наименьший общий кратный (НОК).
DECLARE @aNOK INT = RAND() * 1000, @bNOK INT = RAND() * 1000 
PRINT '@aNOK = ' + CAST(@aNOK AS VARCHAR(4)) 
PRINT '@bNOK = ' + CAST(@bNOK AS VARCHAR(4))
WHILE @aNOK != @bNOK
BEGIN
IF @aNOK > @bNOK
SET @aNOK = @aNOK - @bNOK
ELSE
SET @bNOK = @bNOK - @aNOK
END
PRINT 'НОK = ' + CAST(@aNOK AS VARCHAR(4))

--9.	Даны два целых числа A и B (A<B). Найти сумму квадратов всех целых чисел от A до B включительно.
DECLARE @aVER INT = 2, @bA INT = 5, @SuM1 INT = 0
WHILE @aVER <= @bA
BEGIN
SET @SuM1 = @SuM1 + (@aVER * @aVER)
SET @aVER = @aVER + 1
END
PRINT 'Сумма = ' + CAST(@SuM1 AS VARCHAR(5))

--10.	Найти первое натуральное число, которое при делении на 2, 3, 4, 5, и 6 дает остаток 1, но делится на 7.
DECLARE @A10 INT = 1
WHILE @A10 < 500
BEGIN
IF(@A10 % 2 = 1) AND (@A10 % 3 = 1) AND (@A10 % 4 = 1) AND (@A10 % 5 = 1) AND (@A10 % 6 = 1) AND (@A10 % 7 = 0)
PRINT @A10
SET @A10 = @A10 + 1
END

--11.	Вывести свою фамилию на экран столько раз, сколько в нем букв.
DECLARE @surname NVARCHAR(50)
SET @surname = 'Манаков'
DECLARE @i INT
SET @i = 1
WHILE @i <= LEN(@surname)
BEGIN
    PRINT @surname
    SET @i = @i + 1
END
--12.	Напишите код для вывода на экран с помощью цикла:

--Н

--иНи

--жиНиж

--нжиНижн

--енжиНижне

--венжиНижнев

--авенжиНижнева

--равенжиНижневар

--травенжиНижневарт

--отравенжиНижневарто

--вотравенжиНижневартов

--свотравенжиНижневартовс

--ксвотравенжиНижневартовск

DECLARE @text NVARCHAR(MAX)
SET @text = 'Нижневартовск'
DECLARE @i INT
SET @i = 1
WHILE @i <= LEN(@text)
BEGIN
    DECLARE @formattedText NVARCHAR(MAX)
    IF @i = 1
    BEGIN
        SET @formattedText = SUBSTRING(@text, 1, 1)
    END
    ELSE
    BEGIN
        SET @formattedText = REPLICATE('', LEN(@text) - @i) + REVERSE(SUBSTRING(@text, 2, @i - 1)) + SUBSTRING(@text, 1, @i)
    END    
    PRINT @formattedText
    SET @i = @i + 1
END

 --=========================================================================== 12 ЛР ===========================================================================--
 --1. Напишите функцию для вывода названия страны с заданной столицей, и вызовите ее.
CREATE FUNCTION Func1
(@capital AS VARCHAR(100))
RETURNS VARCHAR(100)
AS 
BEGIN
 DECLARE @S AS VARCHAR(100) SELECT
  @S = C_Name FROM
  Countries WHERE
  Capital = @capital RETURN @S + ' ' + @capital
END
SELECT dbo.Func1('Вена')
--2. Напишите функцию для перевода населения в млн. чел. и вызовите ее.
CREATE FUNCTION Func2(
@population AS FLOAT)
RETURNS FLOAT
AS
BEGIN DECLARE @P AS FLOAT
 SET @P = ROUND(@Population / 1000000, 2) RETURN @P
END

SELECT c.C_Name, c.Capital ,c.Continent,
c.Area, dbo.Func2 (c.Population) AS Население_млн_чел
FROM Countries c
--3. Напишите функцию для вычисления плотности населения заданной части света и вызовите ее.
CREATE FUNCTION Func_3
(@Population AS INT,@Square AS FLOAT)
RETURNS FLOAT
AS
BEGIN
 DECLARE @P AS FLOAT SET @P = ROUND(CAST(@Population AS FLOAT) / @Square, 2)
 RETURN @P
 END

SELECT c.C_Name, c.Capital,c.Area,c.Population,dbo.Func_3(c.Population, c.Area) AS Плотность
FROM Countries c
WHERE c.Continent = 'Европа'
ORDER BY Плотность DESC
--4. Напишите функцию для поиска страны, третьей по населению и вызовите ее.
Create function Func_4()
Returns VARCHAR(100)
AS BEGIN 
 DECLARE @P AS VARCHAR(100) DECLARE @M1 AS FLOAT
 DECLARE @M2 AS FLOAT DECLARE @M3 AS FLOAT
 SELECT 
  @M1 = MAX(c.Population) FROM Countries c

 Select   @M2 = Max(c.Population)
 From Countries c 
 Where c.Population < @M1
 Select   @M3 = Max(c.Population)
 From Countries c Where c.Population < @M2
 SELECT @P = c.C_Name
 FROM Countries c WHERE c.Population = @M3
 Return @p
END

Select dbo.Func_4() AS [3 по населению страна]
--5. Напишите функцию для поиска страны с максимальным населением в заданной ча-сти света и вызовите ее. Если часть света не указана, выбрать Азию.
create function Func_5
(@Cont AS VARCHAR(100) = 'Азия')
returns varchar(100)as
begin
declare @p as varchar(100)
declare @m as float
select @m = max(c.Population)from Countries c
where c.Continent = @Cont
select @p = c.C_Name
From Countries c
where Continent = @Cont and c.Population = @m 
return @p
end

select dbo.Func_5('Европа')
select dbo.Func_5(DEFAULT)
--6. Напишите функцию для замены букв в заданном слове от третьей до предпослед-ней на “тест” и примените ее для столицы страны.
create function func_6
(@a as varchar(100))
returns varchar(100)
as 
begin
return LEFT(@A, 2) + replicate('Тест', LEN(@a)-2) + RIGHT(@a,1)
end

select dbo.func_6(Capital) from Countries
--7. Напишите функцию, которая возвращает количество стран, не содержащих в назва-нии заданную букву.
Create function func_7
(@c as char(1))
returns int
as
begin
declare @k as int
select @k = Count(*) from Countries
where charindex(@c, C_Name) = 0
return @K
end

select dbo.func_7('г')
--8. Напишите функцию для возврата списка стран с площадью меньше заданного числа и вызовите ее.
Create function func_8
( @n as int)returns table
as
return (select * from Countries where Area < @N)

select * from dbo.func_8(25600)
--9. Напишите функцию для возврата списка стран с населением в интервале заданных значений и вызовите ее.
create function func_9
( @a as float, @b as float)
returns table
as return (select * from Countries c
where c.Population between @a and @b )

select * from dbo.func_9(100000, 10000000)
--10. Напишите функцию для возврата таблицы с названием континента и суммарным населением и вызовите ее.
create function func_10()
returns @countSpr 
table (name varchar(100), spread float)
as begin
insert @countSpr select Continent, sum(c.Population) from Countries c
group by Continent
return
end

select * from dbo.func_10()
--11. Напишите функцию IsPalindrom(P) целого типа, возвращающую 1, если целый па-раметр P (P > 0) является палиндромом, и 0 в противном случае.
CREATE FUNCTION dbo.IsPalindrom (@n AS INT)
RETURNS INT
AS
BEGIN
    DECLARE @temp AS INT
    SET @temp = @n
    DECLARE @rev AS INT
    SET @rev = 0
    DECLARE @dig AS INT
    DECLARE @result AS INT
    WHILE (@n > 0)
    BEGIN
        SET @dig = @n % 10
        SET @rev = @rev * 10 + @dig
        SET @n = @n / 10
    END
    IF (@temp = @rev)
        SET @result = 1
    ELSE
        SET @result = 0
    RETURN @result
END
SELECT dbo.IsPalindrom(1234321)

--12.  Напишите функцию Quarter(x, y) целого типа, определяющую номер координатной четверти, 
--содержащей точку с ненулевыми вещественными координатами (x, y).
CREATE FUNCTION Quarter(@x float, @y float)
RETURNS int
AS  
BEGIN
  DECLARE @q int
  IF @x > 0 AND @y > 0 SET @q = 1
  IF @x < 0 AND @y > 0 SET @q = 2
  IF @x < 0 AND @y < 0 SET @q = 3
  IF @x > 0 AND @y < 0 SET @q = 4

  RETURN @q
END

SELECT dbo.Quarter(4.5, -1.04)

--13.  Напишите функцию IsPrime(N) целого типа, возвращающую 1, 
--если целый пара-метр N (N > 1) является простым числом, и 0 в противном случае.
CREATE FUNCTION IsPrime(@num int)
RETURNS bit
AS
BEGIN
  DECLARE @i int = 2
  WHILE @i < @num
  BEGIN
    IF @num % @i = 0 RETURN 0
    SET @i += 1
  END
  RETURN 1
END

SELECT dbo.IsPrime(13)
--14.  Напишите код для удаления созданных вами функций 
DROP FUNCTION IsPrime

 --=========================================================================== 13 ЛР ===========================================================================--
 --1.	Создайте представление, содержащее список африканских стран, население которых больше 10 млн. чел., а площадь больше 500 тыс. кв. км, и используйте его.
Create View View_1
As
Select c.* from Countries c
Where c.Population > 10000000 and c.Area > 500000 and c.Continent = 'Африка'
select * from View_1
--2.	Создайте представление, содержащее список континентов, среднюю площадь стран, которые находятся на нем, среднюю плотность населения, и используйте его.
Create view View_2 (Continent, Area, Population)
as
Select c.Continent 'Континент', avg(c.Area) 'Площадь',avg(c.Population/ c.Area) 'Плотность' from Countries c
Group by c.Continent
select * from View_2
--3.  Создайте представление, содержащее фамилии преподавателей, их должность, 
--зва-ние, степень, место работы, количество их экзаменов, и используйте его.
CREATE VIEW TeachersInfo AS
SELECT
  e.LastName, 
  e.Position,
  t.Title,
  t.Degree,
  k.Name AS Department,
  COUNT(x.Dis_Code) AS ExamsCount
FROM Employee e
JOIN Teacher t ON e.TabNumber = t.TabNumber
JOIN Kafedra k ON e.Code = k.Code
LEFT JOIN Exam x ON x.TabNumber = e.TabNumber
WHERE e.Position LIKE '%преподаватель%'
GROUP BY 
  e.LastName, e.Position, t.Title, t.Degree, k.Name

SELECT * FROM TeachersInfo
--4.	Создайте табличную переменную, содержащую три столбца («Номер месяца», «Название месяца», «Количество дней»), заполните ее для текущего года, и используйте ее.
DECLARE @View_4 TABLE
(
    [Номер месяца] INT,
    [Название месяца] NVARCHAR(MAX),
    [Количество дней] INT
)
DECLARE @Date DATE = DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()), 0) -- Начало текущего года
DECLARE @Year INT = YEAR(GETDATE()) -- Текущий год
WHILE @Year = YEAR(@Date)
BEGIN
    DECLARE @MonthName NVARCHAR(MAX) = FORMAT(@Date, 'MMMM', 'ru-RU')
    DECLARE @MonthNumber INT = MONTH(@Date)
    DECLARE @DaysInMonth INT = DAY(EOMONTH(@Date))
    INSERT INTO @View_4 ([Номер месяца], [Название месяца], [Количество дней])
    VALUES (@MonthNumber, @MonthName, @DaysInMonth)
    SET @Date = DATEADD(MONTH, 1, @Date) 
END
SELECT * FROM @View_4
--5.	Создайте табличную переменную, содержащую список стран, площадь которых в 100	раз меньше, чем средняя площадь стран на континенте, где они находятся, и используйте ее.
DECLARE @View_5 TABLE
(
Nazvanie NVARCHAR(MAX),
Square5 FLOAT,
Continent NVARCHAR(MAX)
)
INSERT INTO @View_5
SELECT c.C_Name, c.Area, c.Continent FROM Countries c
WHERE c.Area * 100 < (SELECT AVG(c.Area) FROM Countries c)
SELECT Nazvanie, Square5, Continent FROM @View_5 
--6.	Создайте локальную временную таблицу, имеющую три столбца («Номер недели», «Количество экзаменов», «Количество студентов»), заполните и используйте ее.
SELECT
DATEPART(WEEK, Date) AS [Номер недели], 
COUNT(DISTINCT e.Dis_Code) AS [Количество экзаменов], 
COUNT(DISTINCT e.RegNumber) AS [Количество студентов]
INTO View_6
FROM dbo.Exam e
GROUP BY DATEPART(WEEK, Date)

SELECT * FROM View_6
--7.	Создайте глобальную временную таблицу, содержащую название континентов, наибольшую и наименьшую площадь стран на них, заполните и используйте ее.
CREATE TABLE View_7
(
Continent VARCHAR(50),
SquareMax FLOAT,
SquareMin FLOAT
)
INSERT INTO View_7
(Continent, SquareMax, SquareMin)
SELECT Continent,
MAX(c.Area) AS [Наибольшая площадь],
MIN(c.Area) AS [Наименьшая площадь]
FROM Countries c
group by c.Continent
SELECT * FROM View_7
select * from Countries c
order by c.Area desc
--8.	С помощью обобщенных табличных выражений напишите запрос для вывода списка сотрудников, чьи зарплаты меньше, чем средняя зарплата по факультету, их зарплаты и назва-ние факультета.
WITH FacAvgSalaries AS
(
  SELECT f.Title, AVG(CAST(e.Salary AS int)) AS AvgSalary
  FROM Employee e
  JOIN Kafedra k ON e.Code = k.Code
  JOIN Faculty f ON k.FacultyAbbreviation = f.Abbreviation
  GROUP BY f.Title
)
SELECT
  e.LastName, e.Salary, s.Title AS Faculty  
FROM Employee e
JOIN FacAvgSalaries s ON e.Salary < s.AvgSalary
--9.	Напишите команды для удаления всех созданных вами представлений.
DROP VIEW dbo.View_1
DROP VIEW dbo.View_2
DROP VIEW dbo.TeachersInfo
 --=========================================================================== 14 ЛР ===========================================================================--
  --1.	Создайте курсор, содержащий отсортированные по баллам фамилии и баллы уче-ников, откройте его, выведите первую строку, закройте и освободите курсор.

 DECLARE myCursor CURSOR FOR
SELECT ss.Last_Name, ss.Score
FROM Student_sch ss
ORDER BY Score DESC;
OPEN myCursor;
DECLARE @Surname NVARCHAR(MAX);
DECLARE @Scores INT;
FETCH NEXT FROM myCursor INTO @Surname, @Scores;
PRINT 'Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
CLOSE myCursor;
DEALLOCATE myCursor;

--2.	Создайте курсор с прокруткой, содержащий список учеников, откройте его, выве-дите пятую, предыдущую, с конца четвертую, следующую, первую строку, закройте и освобо-дите курсор.
DECLARE myScrollCursor CURSOR SCROLL FOR
SELECT ss.Last_Name, Score
FROM Student_sch ss
ORDER BY ss.Last_Name;
OPEN myScrollCursor;
DECLARE @Surname NVARCHAR(MAX);
DECLARE @Scores INT;
FETCH ABSOLUTE 5 FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Пятая строка: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
FETCH PRIOR FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Предыдущая строка: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
FETCH RELATIVE -4 FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Четвертая с конца строка: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
FETCH NEXT FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Следующая строка: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
FETCH FIRST FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Первая строка: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
CLOSE myScrollCursor;
DEALLOCATE myScrollCursor;
--3.	Создайте курсор с прокруткой, содержащий список учеников, откройте его, выве-дите последнюю, шесть позиций назад находящуюся, четыре позиций вперед находящуюся строку, закройте и освободите курсор.
DECLARE myScrollCursor CURSOR SCROLL FOR
SELECT ss.Last_Name, Score
FROM Student_sch ss
ORDER BY ss.Last_Name;
OPEN myScrollCursor;
DECLARE @Surname NVARCHAR(MAX);
DECLARE @Scores INT;
FETCH LAST FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Последняя строка: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
FETCH RELATIVE -6 FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Строка, находящаяся на шесть позиций назад: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
FETCH RELATIVE 4 FROM myScrollCursor INTO @Surname, @Scores;
PRINT 'Строка, находящаяся на четыре позиции вперед: Фамилия: ' + @Surname + ', Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
CLOSE myScrollCursor;
DEALLOCATE myScrollCursor;
--4.	С помощью курсора, вычислите сумму баллов у учеников с наибольшим и наименьшим баллом.
-- Объявляем курсор для наибольшего балла
DECLARE @MaxScore INT;
DECLARE @MinScore INT;
DECLARE myCursor CURSOR FOR
SELECT MAX(Score) AS MaxScore, MIN(Score) AS MinScore
FROM Student_sch ss;
OPEN myCursor;
FETCH NEXT FROM myCursor INTO @MaxScore, @MinScore;
DECLARE @SumMaxScore INT;
DECLARE @SumMinScore INT;
SET @SumMaxScore = 0;
SET @SumMinScore = 0;
DECLARE @StudentScore INT;
DECLARE maxScoreCursor CURSOR FOR
SELECT Score
FROM Student_sch ss
WHERE Score = @MaxScore;
OPEN maxScoreCursor;
FETCH NEXT FROM maxScoreCursor INTO @StudentScore;
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SumMaxScore = @SumMaxScore + @StudentScore;
    FETCH NEXT FROM maxScoreCursor INTO @StudentScore;
END;
CLOSE maxScoreCursor;
DEALLOCATE maxScoreCursor;
DECLARE minScoreCursor CURSOR FOR
SELECT Score
FROM Student_sch ss
WHERE Score = @MinScore;
OPEN minScoreCursor;
FETCH NEXT FROM minScoreCursor INTO @StudentScore;
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SumMinScore = @SumMinScore + @StudentScore;
    FETCH NEXT FROM minScoreCursor INTO @StudentScore;
END;
CLOSE minScoreCursor;
DEALLOCATE minScoreCursor;
PRINT 'Сумма баллов у учеников с наибольшим баллом: ' + CAST(@SumMaxScore AS NVARCHAR(MAX));
PRINT 'Сумма баллов у учеников с наименьшим баллом: ' + CAST(@SumMinScore AS NVARCHAR(MAX));
CLOSE myCursor;
DEALLOCATE myCursor;
--5.	С помощью курсора, сгенерируйте строку вида «Ученики <список фамилий и названий предметов, разделенных запятыми> участвовали в олимпиаде».
-- Объявляем курсор для выборки фамилий и предметов учеников
DECLARE myCursor CURSOR FOR
SELECT ss.Last_Name, ss.Subject
FROM Student_sch ss ;
OPEN myCursor;
DECLARE @SurnameName NVARCHAR(MAX);
DECLARE @Surname NVARCHAR(MAX);
DECLARE @Specialization NVARCHAR(MAX);
SET @SurnameName = 'Ученики ';
DECLARE @AddData BIT;
SET @AddData = 0;
FETCH NEXT FROM myCursor INTO @Surname, @Specialization;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @AddData = 1
        SET @SurnameName = @SurnameName + ', ';
    SET @SurnameName = @SurnameName + @Surname + ' (' + @Specialization + ')';
    SET @AddData = 1;
    FETCH NEXT FROM myCursor INTO @Surname, @Specialization;
END;
CLOSE myCursor;
DEALLOCATE myCursor;
SET @SurnameName = @SurnameName + ' участвовали в олимпиаде';
PRINT @SurnameName;
--6.	Создайте курсор, содержащий список учеников, с его помощью выведите учеников с нечетной позицией.
DECLARE myCursor CURSOR FOR
SELECT ss.Last_Name
FROM Student_sch ss;
OPEN myCursor;
DECLARE @Surname NVARCHAR(MAX);
DECLARE @Position INT;
SET @Position = 1;
FETCH NEXT FROM myCursor INTO @Surname;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @Position % 2 = 1
    BEGIN
        PRINT 'Ученик с нечетной позицией: ' + @Surname;
    END
    SET @Position = @Position + 1;
    FETCH NEXT FROM myCursor INTO @Surname;
END;
CLOSE myCursor;
DEALLOCATE myCursor;
--7.	Создайте курсор, содержащий отсортированный по убыванию баллов список уче-ников, откройте его, для каждого ученика выведите фамилию, предмет, школу, баллы и про-центное соотношение баллов с предыдущим учеником.
DECLARE myCursor CURSOR FOR
SELECT ss.Last_Name, ss.Subject, ss.School, ss.Score
FROM Student_sch ss
ORDER BY Score DESC;
OPEN myCursor;
DECLARE @Surname NVARCHAR(MAX);
DECLARE @Specialization NVARCHAR(MAX);
DECLARE @School NVARCHAR(MAX);
DECLARE @Scores INT;
DECLARE @LastScores INT;
DECLARE @Procent DECIMAL(5,2);
SET @Surname = '';
SET @Specialization = '';
SET @School = '';
SET @Scores = 0;
SET @LastScores = 0;
FETCH NEXT FROM myCursor INTO @Surname, @Specialization, @School, @Scores;
WHILE @@FETCH_STATUS = 0
BEGIN
    IF @LastScores = 0
        SET @Procent = 0;
    ELSE
        SET @Procent = (CAST(@Scores AS DECIMAL(5,2)) / CAST(@LastScores AS DECIMAL(5,2))) * 100;
    PRINT 'Фамилия: ' + @Surname;
    PRINT 'Предмет: ' + @Specialization;
    PRINT 'Школа: ' + @School;
    PRINT 'Баллы: ' + CAST(@Scores AS NVARCHAR(MAX));
    PRINT 'Процентное соотношение с предыдущим учеником: ' + CAST(@Procent AS NVARCHAR(MAX)) + '%';
    PRINT '---------------------------------------';
    SET @LastScores = @Scores;
    FETCH NEXT FROM myCursor INTO @Surname, @Specialization, @School, @Scores;
END;
CLOSE myCursor;
DEALLOCATE myCursor;
 --=========================================================================== 15 ЛР ===========================================================================--

--1. Вывести список учеников и разницу между баллами ученика и максимальным баллом в каждой строке.
 SELECT *, s.Score - MAX(s.Score) OVER() AS Разница FROM Student_sch s

--2. Вывести список учеников и процентное соотношение к среднему баллу в каждой строке.
SELECT s.Last_Name, s.Score * 100 / AVG(s.Score) OVER() AS Процент  FROM Student_sch s

--3. Вывести список учеников и минимальный балл в школе в каждой строке.
SELECT s.Last_Name, MIN(s.Score) OVER(PARTITION BY s.School) AS Мин_балл  FROM Student_sch s
--4. Вывести список учеников и суммарный балл в школе в каждой строке, отсортировать по школам в оконной функции.
SELECT s.Last_Name, SUM(s.Score) OVER(PARTITION BY s.School ORDER BY s.School) AS сумм_балл FROM Student_sch s
--5. Вывести список учеников и номер строки при сортировке по фамилиям в обратном алфавитном порядке.
SELECT ROW_NUMBER() OVER (ORDER BY s.Last_name DESC) AS Номер_строки, s.Last_Name
FROM Student_sch s
ORDER BY s.Last_Name DESC
 --6. Вывести список учеников, номер строки внутри школы и количество учеников в школе при сортировке по баллам по убыванию.
 SELECT  ROW_NUMBER() OVER (PARTITION BY s.School ORDER BY s.Score DESC),
s.Last_Name,  COUNT(*) OVER (PARTITION BY s.School)
FROM  Student_sch s
ORDER BY  s.Score DESC
--7. Вывести список учеников и ранг по баллам.
SELECT s.Last_Name,  s.Score,RANK() OVER (ORDER BY s.Score DESC) AS ранг 
FROM Student_sch s
--8. Вывести список учеников и сжатый ранг по баллам. Результат отсортировать по фамилии в алфавитном порядке.
SELECT  s.Last_Name, s.Score,  DENSE_RANK() OVER (ORDER BY s.Score DESC) AS сжатый_ранг
FROM  Student_sch s
ORDER BY  s.Last_Name ASC
--9.Вывести список учеников, распределенных по пяти группам по фамилии.
SELECT
NTILE(5) OVER(ORDER BY s.Last_name) AS Группа, s.Last_Name
FROM
Student_sch s
--10.Вывести список учеников, распределенных по трем группам по баллам внутри школы.
SELECT
NTILE(3) OVER(ORDER BY s.Score) AS Группа , s.Last_Name
FROM
Student_sch s
WHERE s.School = 'Лицей'
--11. Вывести список учеников и разницу с баллами ученика, находящегося выше на три позиции при сортировке по возрастанию баллов.
SELECT  s.Last_Name,
  s.Score,  s.Score - LAG(s.Score, 3) OVER (ORDER BY s.Score ASC) AS Разница
FROM   Student_sch s
ORDER BY  s.Score ASC
--12.Вывести список учеников и разницу с баллами следующего ученика при сорти-ровке по убыванию баллов, значение по умолчанию использовать 0.
SELECT s.Last_Name AS ученик, COALESCE(s.Score - s1.Score, 0) AS разница_с_следующим_учеником
FROM Student_sch s 
LEFT JOIN Student_sch  s1 ON s.ID = s1.ID + 1
ORDER BY s.Score DESC;

 --=========================================================================== 16 ЛР ===========================================================================--

--1. Напишите запрос, который выводит максимальный балл учеников по школам, по каждому предмету по каждой школе и промежуточные итоги. 
SELECT MAX(s.Score) 'Максимальный балл', s.School, s.Subject FROM Student_sch s
GROUP BY s.Subject, s.School WITH ROLLUP
--2. Напишите запрос, который выводит минимальный балл учеников по школам и по предметам, и промежуточные итоги. 
SELECT s.Subject, 
s.School,MIN(s.Score) AS мин_балл 
FROM Student_sch s
GROUP BY s.Subject, s.School WITH CUBE 
--3. Напишите запрос, который выводит средний балл учеников по школам и по предметам. 
SELECT s.Subject,s.School,AVG(s.Score) AS средний_балл 
FROM Student_sch s
GROUP BY GROUPING SETS(s.Subject, s.School) 
--4. Напишите запрос, который выводит количество учеников по каждой школе по предметам и промежуточные итоги. NULL значения заменить на соответствующий текст. 
SELECT COALESCE(s.Subject, 'ИТОГО') AS Предмет,COALESCE(s.School, 'Итого') AS Школа, 
COUNT(s.Last_Name) AS Количество
FROM Student_sch s
GROUP BY ROLLUP(s.Subject, s.School) 
--5. Напишите запрос, который выводит суммарный балл учеников по школам и по пред-метам, и промежуточные итоги. В итоговых строках NULL значения заменить на соответству-ющий текст в зависимости от группировки. 
SELECT 
IIF(GROUPING(s.Subject)=1, 'ИТОГО', s.Subject) AS Предмет, 
IIF(GROUPING(s.School)=1, 'Итого', s.School) AS Школа , 
COUNT(s.Last_name) AS Количество
FROM Student_sch s
GROUP BY CUBE(s.Subject,s.School)
--6. Напишите запрос, который выводит максимальный балл учеников по школам и по предметам. В итоговых строках NULL значения заменить на соответствующий текст в зави-симости от уровней группировки. 
SELECT CASE GROUPING_ID(s.Subject, s.School) 
WHEN 1 THEN 'Итого по предметам' 
WHEN 3 THEN 'Итого' 
ELSE ''END AS Итого ,
ISNULL(s.Subject, '') AS Предмет,ISNULL(s.School, '') AS Школа ,MAX(s.Score) AS Количество
FROM Student_sch s
GROUP BY ROLLUP(s.Subject, s.School) 
--7. Напишите запрос, который выводит средний балл учеников по школам в столбцы. 
SELECT s.School, AVG(s.Score) AS Average_Score
FROM Student_sch s
GROUP BY s.School
--8. Напишите запрос, который выводит средний балл учеников по школам в столбцы и по предметам в строки. 
SELECT s.Subject, AVG(CASE WHEN s.School = 'Гимназия' THEN s.Score END) AS 'Гимназия', 
AVG(CASE WHEN s.School = 'Лицей' THEN s.Score END) AS 'Лицей'FROM Student_sch s
GROUP BY s.Subject;
--9. Напишите запрос, который выводит названия предметов, фамилии учеников и школы в один столбец. 
SELECT CONCAT(s.Subject, ', ', s.Last_Name, ', ', s.School) AS Info
FROM Student_sch s

----=========================================================================== 17 --===========================================================================
 --1.	Создайте и запустите динамический SQL-запрос, выбирающий первые N строк из заданной таблицы.
DECLARE @DSQL VARCHAR(100)
DECLARE @TN VARCHAR(50)
SET @TN = 'Ученики'
SET @DSQL = 'SELECT top 3 * from dbo.Student_sch s' + @TN
EXECUTE (@DSQL)
--2.	Создайте и запустите динамический SQL-запрос, выбирающий все страны из таб-лицы «Страны», последняя буква названия которых расположена в заданном диапазоне.
DECLARE @L1 CHAR(1)
DECLARE @L2 CHAR(1)
SET @L1 = 'а'
SET @L2 = 'д'
EXECUTE ('SELECT * FROM Countries c WHERE c.C_Name  LIKE ''%[' + @L1 + '-' + @L2 +']''')
--3.	Создайте временную таблицу #Temp и добавьте к ней название столбцов таблицы «Страны». Создайте курсор, который, построчно читая таблицу #Temp, выбирает каждый раз соответствующий столбец из таблицы «Страны».
CREATE TABLE #Temp (
  Name VARCHAR(255),
  MainCity VARCHAR(255),
  Square FLOAT,
  Population BIGINT,
  Continent VARCHAR(255)
);
INSERT INTO #Temp 
SELECT *
FROM Countries;
DECLARE cursor_countries1 CURSOR FOR 
SELECT Name, MainCity, Square, Population, Continent
FROM #Temp;
DECLARE @Name VARCHAR(255),
        @Capital VARCHAR(255),
        @Square FLOAT,
        @Population BIGINT,
        @Continent VARCHAR(255);
OPEN cursor_countries1;
FETCH NEXT FROM cursor_countries1 INTO @Name, @Capital, @Square, @Population, @Continent;
WHILE @@FETCH_STATUS = 0
BEGIN
PRINT @Name;
FETCH NEXT FROM cursor_countries1 INTO @Name, @Capital, @Square, @Population, @Continent;
END
CLOSE cursor_countries1;
DEALLOCATE cursor_countries1;
DROP TABLE #Temp;

--4.	Создайте процедуру, которая принимает как параметр список столбцов, название таблицы и выбирает заданные столбцы из заданной таблицы.
CREATE PROCEDURE SelectColumnsFromTable(
    @columns VARCHAR(MAX),
    @tableName VARCHAR(100)
)
AS
BEGIN
    DECLARE @sqlQuery NVARCHAR(MAX)
    SET @sqlQuery = 'SELECT ' + @columns + ' FROM ' + @tableName  
    EXEC sp_executesql @sqlQuery
END
EXEC SelectColumnsFromTable 'C_Name, Capital, Area', 'Countries'
--5.	Создайте процедуру, принимающую как параметр список столбцов, название таб-лицы, название проверяемого столбца, знак сравнения, значение проверки и выбирающую за-данные столбцы из заданной таблицы в заданных условиях.
CREATE PROCEDURE SelectProcedur_
    @Columns NVARCHAR(MAX),
    @TableName NVARCHAR(MAX),
    @CheckColumn NVARCHAR(MAX),
    @ComparisonOperator NVARCHAR(2),
    @ComparisonValue INT
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)
    SET @SQL = 'SELECT ' + @Columns + ' FROM ' + @TableName + ' WHERE ' + @CheckColumn + ' ' + @ComparisonOperator + ' ' + CAST(@ComparisonValue AS NVARCHAR(MAX)) 
    EXEC sp_executesql @SQL
END
EXEC SelectProcedur_ 'C_Name, Capital, Area', 'Countries', 'Population', '>', 100000
--6.	Выберите список европейских стран из таблицы «Страны» и экспортируйте в RAW формате XML.
Select * from Countries c
Where c.Continent = 'Европа'
For XML RAW
--7.	Выберите список стран с населением больше 100 млн. чел. из таблицы «Страны» и экспортируйте в PATH формате XML.
Select * from Countries c
Where c.Population > 100000000
For XML PATH
--8.	Выберите список учеников из школы «Лицей» из таблицы «Ученики» и экспорти-руйте в PATH формате JSON
Select * from Student_sch ss
Where ss.School = 'Лицей'
FOR JSON PATH
