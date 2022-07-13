USE MovieSystem
GO


INSERT INTO MOVIE VALUES
('English','Wolf of the Wall Street','2012-10-05','cahjca cjh ajcja gja gsj as',50000000,70000000,'2:10:56'),
('Persian','Barcode','2013-11-05','cahjca adasdjk aasdsadas gja gsj as',5000000,80000000,'2:20:36'),
('Arabic','Habibi','2020-07-15','cahjca cjh ajcja gjasck kdsc das',56000000,75000000,'2:17:59'),
('French','parler mon pere','2005-02-05','cahjca cjh ack akjd;a adlakssssssssssssssssssj as',57000000,80000000,'1:25:25'),
('English','Batman','2014-10-05','cahjklk lklk vd ajcja gja gsj as',50000000,70000000,'1:10:56'),
('Spanish','La casa de papel','2017-12-05','cahj csdc cjh vdvv ajcja gja gsj as',45000000,120000000,'2:25:56'),
('English','ُSuperman','2022-01-09','cahjca cjh ajcja gja  sfd dsf as',1000000,9000000,'2:30:00'),
('Persian','day 0','2018-06-25','cahjca cjh ajcjasf sfs sf gsj as',53000000,71000000,'2:46:56'),
('English','The Professor','2012-11-11','cahjca cj;l sld ssf fgja gsj as',78000000,52000000,'1:20:56'),
('Korean','Sky Castle','2010-10-10','cahjca cjh ajcjlk sfl fsf ;l; as',22000000,35000000,'2:36:47');

INSERT INTO GENRE VALUES
('Drama',5),
('Action',4),
('Horror',10),
('Comedy',7),
('Western',1),
('Romance',3),
('Music',2),
('Adventure',6),
('Narrative',9),
('History',8);

INSERT INTO USERINFO VALUES
('farzanRm','farzanrahmani@gmail.com','Farzan','Rahmani','2002-02-20',20,'M'),
('MohammadO','mohammadOsoolian@gmail.com','Mohammad','Osoolian','2003-6-25',19,'M'),
('Tahmasios','AhmadRezaTahmasebi@gmail.com','Ahmadreza','Tahmasebi','2002-07-15',20,'M'),
('ZahraT','zahraTab@yahoo.com','Zahra','Tabatabaee','2002-11-27',19,'F'),
('Hani','hanieAsadi@gmail.com','Hanie','Asadi','2002-02-20',20,'F'),
('Meli','melikaMohammadi@gmail.com','Melika','MohammadiFakhar','2002-12-20',19,'U'),
('PMR','maryambehroozi@yahoo.com','Maryam','Behroozi','2002-05-20',20,'F'),
('Alirezaw','AlirezaEslam@yandex.com','Alireza','Eslamikhah','2001-10-15',20,'U'),
('SinaAlj','sinalinejad@iust.ac.ir','Sina','Alinejad','2001-11-25',20,'M');

INSERT into Phone VALUES
('09128357533','farzanRm'),
('09126219486','farzanRm'),
('09122222222','MohammadO'),
('09121111111','Tahmasios'),
('09121212121','SinaAlj'),
('09123456789','Alirezaw'),
('09127654321','PMR'),
('09123002010','Meli'),
('09127845123','ZahraT'),
('09127894562','Hani');

INSERT into ARTIST VALUES
('xvz@gmail.com','Navid','MohammadZade','1980-01-02',42,'M','Iranian',2.5,'df ffgh ff cvbb',2009),
('abc@gmail.com','Parinaz','IzadYar','1985-05-12',37,'F','Iranian',4.5,'df jj kdv ffgh ff cvbb',2012),
('Tannaz@yahoo.com','Tannaz','Tabatabaee','1987-11-05',35,'F','Iranian',4.2,'df ffgh ff lk;lfb ffb cvbb',2011),
('NazBay@gmail.com','Nazanin','Bayati','1997-03-02',25,'F','Iranian',4,'df f csdc sdsdcscfgh ff cvbb',2015),
('ParsaP@gmail.com','Parsa','PiroozFar','1972-05-02',50,'F','Iranian',5,'df ffgh ff cfgb fb fvv vbb',1990),
('BradPit@gmail.com','Brad','Pit','1965-01-02',57,'M','American',4.75,'df sd bhad av ffgh ff cvbb',1985),
('AnjelinaJJ@gmail.com','Angelina','Julie','1970-11-22',52,'F','American',5,' knfkv dvdv fvdv df ffgh ff cvbb',1987),
('Urs456@gmail.com','Úrsula','Corberó','1989-08-11',32,'F','Spanish',3.5,'sscd df ffgh ff cvbb',2008),
('xvz@gmail.com','Ahmed El','Sakka','1973-07-01',49,'M','Egyptian',2.5,'df ffghdcscd sdcsdcsd ff cvbb',2002),
('AlPacino@iust.ac.ir','Alfredo James','Pacino','1940-05-25',82,'M','American',5,'sl dcsd df ffgh ff cvbb',1965),
('MehMod@gmail.com','Mehran','Modiri','1960-01-01',62,'M','Iranian',4,'kkj scsdc jklj',1975),
('Asghar@yahoo.com','Asghar','Farhadi','1965-05-05',57,'M','Iranian',4.7,'cscdsdc',1977),
('Quentin_Tarantino@gmail.com','Quentin','Tarantino','1963-05-27',59,'M','American',4.9,'csds scds scdsdc',1979),
('Martin_Scorsese@yahoo.com','Martin','Scorsese','1942-05-05',79,'M','American',4.7,'c kkj dcsdc ccdd scdsdc',1959),
('MohsenChegini@yahoo.com','Mohsen','Chegini','1967-05-05',55,'M','Iranian',3.2,'c dcsdcsdc kkj dcsdc ccdd scdsdc',1990),
('KathleenKennedy@yahoo.com','Kathleen','Kennedy','1953-05-05',69,'F','American',4.55,'c kkj dcsdc ccdd scdsdc',1989);

INSERT into AWARD VALUES
('Oscar',1970,10),
('Oscar',1980,10),
('Oscar',1977,10),
('Oscar',1986,10),
('Cannes',2005,1),
('Golden Gloob',2014,2),
('Berlin',2018,3),
('Fajr',2021,4),
('Bafta',2017,6),
('Oscar',2018,12),
('Cannes',2019,12),
('PGA Milestone Award',2022,16);

INSERT into SOCIALPAGE VALUES
('Instagram','navidMohammadZade',1),
('Twitter','navidMoh',1),
('Instagram','ParinazIzad',2),
('Twitter','Parinazzz',2),
('Instagram','Tannaz',3),
('Twitter','NazaninBayati',4),
('Facebook','navidMohZade',1),
('Facebook','BradPit',6),
('Instagram','AnjelinaJJ',7),
('Facebook','ÚrsulaC',8),
('Instagram','ÚrsulaCo',8),
('Twitter','Ahmed El Sakka',9);

INSERT INTO DIRECTOR VALUES
(10),
(6),
(9),
(1),
(11),
(12),
(13),
(14);

INSERT INTO PRODUCER VALUES
(6),
(10),
(11),
(12),
(13),
(14),
(15),
(16);

INSERT INTO ACTOR VALUES
(1,180),
(2,170),
(3,167),
(4,165),
(5,182),
(6,180),
(7,170),
(8,185),
(9,187),
(10,180);

INSERT INTO COMMENT VALUES
('farzanRm',1,'Fantabulous and amazing','2022-07-03'),
('MohammadO',3,'Bullshit','2021-07-03'),
('Tahmasios',5,'Fantabulous and Loving','2022-09-03'),
('ZahraT',7,'fantastic!!!!!!','2022-07-12'),
('Hani',9,'Great','2019-10-10'),
('Meli',2,'Completely Miserable','2018-03-03'),
('PMR',6,'Absolute mess','2015-03-01'),
('Alirezaw',4,'could not be better than this','2022-07-03'),
('Alirezaw',1,'Fantabulous and amazing','2021-01-19');

INSERT INTO PLAYLIST VALUES
('Romantic Movies','farzanRm'),
('Horror Movies','farzanRm'),
('Masterpieces','farzanRm'),
('Comedy Movies','SinaAlj'),
('Funny Movies','PMR'),
('Old Movies','Hani'),
('My Movies','Tahmasios'),
('MHS','MohammadO'),
('Dramas','Meli');

INSERT INTO CONTAIN VALUES
(1,1),
(3,1),
(7,1),
(5,2),
(4,2),
(6,3),
(1,4),
(9,4),
(5,5),
(6,6),
(7,7),
(1,8),
(2,8),
(3,8),
(10,9),
(8,9);

INSERT INTO PRODUCE VALUES
(1,14),
(2,16),
(3,11),
(4,13),
(5,10),
(6,15),
(7,12),
(8,6),
(9,6),
(10,16);

INSERT INTO ACT VALUES
(1,1),
(1,4),
(1,5),
(1,9),
(2,10),
(2,2),
(2,3),
(3,1),
(3,8),
(4,6),
(5,7),
(5,10),
(5,1),
(6,10),
(6,2),
(7,2),
(8,6),
(8,5),
(9,4),
(10,3),
(10,7),
(10,8);

INSERT INTO DIRECT VALUES
(1,10),
(2,6),
(3,1),
(4,9),
(5,10),
(6,14),
(7,12),
(8,6),
(9,13),
(10,11);

INSERT INTO SCORE VALUES
(1,'farzanRm',3,'2020-05-17'),
(1,'MohammadO',4,'2022-05-17'),
(1,'ZahraT',5,'2021-11-17'),
(2,'farzanRm',3,'2020-01-11'),
(3,'PMR',2,'2017-12-22'),
(3,'farzanRm',3,'2020-06-17'),
(4,'Tahmasios',1,'2020-07-17'),
(5,'Meli',2,'2021-06-11'),
(6,'MohammadO',3,'2020-05-17'),
(6,'Alirezaw',3,'2020-05-17'),
(7,'farzanRm',5,'2022-07-22'),
(7,'Hani',3,'2021-04-06'),
(7,'ZahraT',4,'2020-03-26'),
(7,'SinaAlj',1,'2019-05-30'),
(8,'farzanRm',2,'2017-05-31'),
(9,'MohammadO',3,'2019-05-17'),
(9,'Meli',1,'2020-06-17'),
(10,'Tahmasios',4,'2015-01-19'),
(10,'farzanRm',4,'2019-01-18'),
(10,'Hani',5,'2016-12-19');



-- Update , Delete rows
UPDATE MOVIE
SET lang = 'Chinese', movieName= 'Kung Fu Hustle'
WHERE id = 10;

UPDATE MOVIE
SET made_date = '2018-12-11'
WHERE id = 7;

UPDATE GENRE
SET genre = 'Science'
WHERE id = 6;

DELETE FROM USERINFO
WHERE username = 'SinaAlj';

UPDATE Phone
SET number = '09102118947'
WHERE id = 2;

DELETE FROM ARTIST 
WHERE id=14;

UPDATE AWARD
set awardname = 'Tony Award for Best Performance'
WHERE id = 2;

DELETE FROM AWARD
WHERE id = 3;

UPDATE SOCIALPAGE
SET
media = 'Facebook',
pageaddr = 'PariNazI'
WHERE id = 4;

DELETE FROM DIRECTOR
WHERE id = 13;

 
DELETE FROM PRODUCER
WHERE id = 15;

DELETE FROM ACTOR
WHERE id = 4;

DELETE FROM COMMENT 
WHERE id = 7;

DELETE FROM PLAYLIST 
WHERE id=6;

DELETE FROM CONTAIN 
WHERE movie=7 AND playlist = 7;

DELETE FROM SCORE
WHERE movie = 10 And username = 'farzanRm';
DELETE FROM SCORE
WHERE movie = 7 And username = 'Hani';

USE MASTER 
GO