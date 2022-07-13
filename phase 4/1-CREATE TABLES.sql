-- Create a new database called 'MovieSystem'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Drop the database if ir already exist
IF EXISTS (
	SELECT [name]
		FROM sys.databases
		WHERE [name] = N'MovieSystem'
)
DROP DATABASE MovieSystem
GO

CREATE DATABASE MovieSystem
GO

USE MovieSystem
GO

-- Drop all existing functions and procedures in this database
Declare @sql NVARCHAR(MAX) = N'';
SELECT @sql = @sql + N' DROP FUNCTION ' 
                   + QUOTENAME(SCHEMA_NAME(schema_id)) 
                   + N'.' + QUOTENAME(name)
FROM sys.objects
WHERE type_desc LIKE '%FUNCTION%';
Exec sp_executesql @sql
GO

Declare @sql NVARCHAR(MAX) = N'';
SELECT @sql = @sql + N' DROP PROCEDURE ' 
                   + QUOTENAME(SCHEMA_NAME(schema_id)) 
                   + N'.' + QUOTENAME(name)
FROM sys.objects
WHERE type_desc LIKE '%PROCEDURE%';
Exec sp_executesql @sql
GO

------------- Create tables -------------------
CREATE TABLE MOVIE(
	id int IDENTITY,
	lang nvarchar(20) NOT NULL,
	movieName nvarchar(50) NOT NULL,
	made_date date NOT NULL,
	summary text NOT NULL,
	cost int NOT NULL,
	sales int,
	duration time NOT NULL,
	PRIMARY KEY(id),
	CONSTRAINT chck_cost CHECK(cost > 0),
	CONSTRAINT chck_sales CHECK(sales > 0),
);

CREATE TABLE GENRE(
	id int IDENTITY,
	genre nvarchar(20) NOT NULL,
	movie int NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(movie) REFERENCES MOVIE(id) ON DELETE CASCADE,
	CONSTRAINT chck_genre CHECK(genre IN ('Drama', 'Action', 'Horror', 'Comedy', 'Western', 
											'Romance', 'Music', 'Adventure')),
	UNIQUE(genre, movie),
);

CREATE TABLE USERINFO  (
	username nvarchar(16) NOT NULL,
	email nvarchar(50) NOT NULL,
	firstname nvarchar(50) NOT NULL,
	lastname nvarchar(50) NOT NULL,
	bdate date NOT NULL,
	age int NOT NULL,
	PRIMARY KEY(username),
);

CREATE TABLE PHONE (
	id int IDENTITY,
	number nvarchar(11) NOT NULL,
	username nvarchar(16) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(username) REFERENCES USERINFO(username) ON DELETE CASCADE,
	UNIQUE(number, username),
);

CREATE TABLE ARTIST(
	id int IDENTITY,
	email nvarchar(50) NOT NULL,
	firstname nvarchar(50) NOT NULL,
	lastname nvarchar(50) NOT NULL,
	bdate date NOT NULL,
	age int NOT NULL,
	gender nvarchar(1) NOT NULL,
	nationality nvarchar(50) NOT NULL,
	rating float DEFAULT 0 NOT NULL,
	biography text,
	PRIMARY KEY(id),
	CONSTRAINT chck_artist_gender CHECK(gender IN ('M', 'F', 'U')), --U == Unknown
);

CREATE TABLE AWARD(
	id int IDENTITY,
	awardname nvarchar(50) NOT NULL,
	awardyear int NOT NULL,
	artist int NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(artist) REFERENCES ARTIST(id) ON DELETE CASCADE,
	UNIQUE(awardname, awardyear, artist),
);

CREATE TABLE SOCIALPAGE(
	id int IDENTITY,
	media nvarchar(20) NOT NULL,
	pageaddr nvarchar(500) NOT NULL,
	artist int NOT NULL
	PRIMARY KEY(id),
	FOREIGN KEY(artist) REFERENCES ARTIST(id) ON DELETE CASCADE,
	UNIQUE(artist, media),
);

CREATE TABLE DIRECTOR(
	id int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES ARTIST(id) ON DELETE CASCADE,
);

CREATE TABLE PRODUCER(
	id int NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(id) REFERENCES ARTIST(id) ON DELETE CASCADE,
);

CREATE TABLE ACTOR(
	id int NOT NULL,
	height integer NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (id) REFERENCES ARTIST(id) ON DELETE CASCADE,
);


CREATE TABLE COMMENT(
	id int IDENTITY,
	username nvarchar(16) NOT NULL,
	movie int NOT NULL,
	ctext text NOT NULL,
	cdate date NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(username) REFERENCES USERINFO(username) ON DELETE CASCADE,
	FOREIGN KEY (movie) REFERENCES MOVIE(id) ON DELETE CASCADE,
);

CREATE TABLE PLAYLIST(
	id int IDENTITY,
	listname nvarchar(50) NOT NULL,
	username nvarchar(16) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(username) REFERENCES USERINFO(username) ON DELETE CASCADE,
	UNIQUE(listname, username),
);

CREATE TABLE CONTAIN(
	movie int NOT NULL,
	playlist int NOT NULL,
	PRIMARY KEY(movie, playlist),
	FOREIGN KEY(movie) REFERENCES MOVIE(id) ON DELETE CASCADE,
	FOREIGN KEY (playlist) REFERENCES PLAYLIST(id) ON DELETE CASCADE,
);

CREATE TABLE PRODUCE(
	movie int NOT NULL,
	producer int NOT NULL,
	PRIMARY KEY(movie, producer),
	FOREIGN KEY(movie) REFERENCES MOVIE(id) ON DELETE CASCADE,
	FOREIGN KEY(producer) REFERENCES PRODUCER(id) ON DELETE CASCADE,
);

CREATE TABLE ACT(
	movie int NOT NULL,
	actor int NOT NULL,
	PRIMARY KEY(movie, actor),
	FOREIGN KEY(movie) REFERENCES MOVIE(id) ON DELETE CASCADE,
	FOREIGN KEY(actor) REFERENCES ACTOR(id) ON DELETE CASCADE,
);

CREATE TABLE DIRECT(
	movie int NOT NULL,
	director int NOT NULL,
	PRIMARY KEY(movie, director),
	FOREIGN KEY(movie) REFERENCES MOVIE(id) ON DELETE CASCADE,
	FOREIGN KEY(director) REFERENCES DIRECTOR(id) ON DELETE CASCADE,
);

CREATE TABLE SCORE(
	movie int NOT NULL,
	username nvarchar(16),
	scoreval int NOT NULL,
	scoredate date NOT NULL,
	PRIMARY KEY(movie, username),
	FOREIGN KEY(movie) REFERENCES MOVIE(id) ON DELETE CASCADE,
	FOREIGN KEY(username) REFERENCES USERINFO(username) ON DELETE CASCADE,
	CONSTRAINT chck_movie_score CHECK(scoreval IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
);

-- UPDATE TABLE
ALTER TABLE ARTIST
ADD startyear int;

ALTER TABLE USERINFO
ADD gender nvarchar(1) NOT NULL;

-- ADD CONSTRAINT
ALTER TABLE USERINFO
ADD	CONSTRAINT chck_user_gender CHECK(gender IN ('M', 'F', 'U')); --U == Unknown

ALTER TABLE SOCIALPAGE 
ADD CONSTRAINT chck_media CHECK(media IN ('Instagram', 'Facebook', 'Twitter'));

ALTER TABLE MOVIE
ADD CONSTRAINT chck_duration CHECK(duration > '00:00:00');

-- UPDATE CONSTRAINT
ALTER TABLE GENRE
DROP CONSTRAINT chck_genre;
ALTER TABLE GENRE
ADD CONSTRAINT chck_genre CHECK(genre IN ('Drama', 'Action', 'Horror', 'Comedy', 'Western', 
											'Romance', 'Music', 'Adventure', 'Narrative',
											'Fantasy', 'Animation' ,'Science', 'History'));

ALTER TABLE SCORE 
DROP CONSTRAINT chck_movie_score;
ALTER TABLE SCORE 
ADD	CONSTRAINT chck_movie_score CHECK(scoreval IN (1, 2, 3, 4, 5));

-- DELETE CONSTRAINT
ALTER TABLE MOVIE 
DROP CONSTRAINT chck_cost

ALTER TABLE MOVIE 
DROP CONSTRAINT chck_sales

