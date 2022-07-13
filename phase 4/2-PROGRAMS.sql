USE MovieSystem
GO

----------------------------- FUNCTIONS :

-- compute age
CREATE FUNCTION	compute_age(@birth_date date)
RETURNS INT
AS 
BEGIN
	RETURN YEAR(CURRENT_TIMESTAMP) - YEAR(@birth_date);
END;
GO

-- get movie average score by movie name &
CREATE FUNCTION	get_movie_score(@movie_name nvarchar(50))
RETURNS FLOAT
AS 
BEGIN
	return (SELECT AVG(s.scoreval) score FROM SCORE as s, MOVIE as m WHERE s.movie=m.id AND m.movieName=@movie_name);
END;
GO



----------------------------- PROCEDURES

-- انتخاب همه دست اندر کاران یک فیلم بر اساس نام فیلم &
CREATE PROCEDURE selectAllArtists @movieTitle nvarchar(30)
AS
select ar.firstname, ar.lastname
from ARTIST as ar, MOVIE as m, ACTOR as ac, ACT as act
where ar.id=ac.id and act.actor=ac.id and act.movie=m.id and  m.movieName = @movieTitle
UNION
select ar.firstname, ar.lastname
from ARTIST as ar, MOVIE as m, DIRECTOR as dr, DIRECT as d
where ar.id=dr.id and d.director=dr.id and d.movie=m.id and m.movieName = @movieTitle
UNION
select ar.firstname, ar.lastname
from ARTIST as ar, MOVIE as m, PRODUCER as pr, PRODUCE as p
where ar.id=pr.id and p.producer=pr.id and p.movie=m.id and m.movieName = @movieTitle;
GO

-- مشاهده همه فیلم های یک کاگردان براساس نام او
CREATE PROCEDURE directorMovies @directorName nvarchar(30)
AS
select m.* 
from MOVIE as m, DIRECTOR as dr, DIRECT as d , ARTIST as a
where dr.id = d.director and d.movie=m.id and a.id=dr.id and a.lastname = @directorName;
GO



------------------------------- VIEWS

-- یک جدول از فیلم های از سال 2010 تا سال 2020
CREATE VIEW [Recent_Movies] AS
SELECT m.*
FROM MOVIE as m
WHERE YEAR(m.made_date) > 2010 AND YEAR(m.made_date) < 2020 ;
GO

-- یک جدول از فیلم های اکشن
CREATE VIEW [Action_Movies] AS
SELECT m.* 
FROM MOVIE as m, GENRE as g
WHERE g.movie=m.id and g.genre='Action';
GO



--------------------------------- Triggers
-- check artist age matchs with the birth date
CREATE TRIGGER set_age
ON ARTIST 
INSTEAD OF INSERT
AS
BEGIN
INSERT INTO ARTIST 
SELECT I.email, I.firstname, I.lastname, I.bdate, MovieSystem.dbo.compute_age(I.bdate),
		I.gender, I.nationality, I.rating, I.biography, I.startyear
FROM inserted I
END
GO


-- check email is valid
CREATE TRIGGER chck_mail
ON USERINFO
INSTEAD OF INSERT
AS
BEGIN
declare @em nvarchar(50)
select @em = I.email from INSERTED I
if @em   NOT LIKE '_%@_%._%'
begin
	RAISERROR ('email is not valid' ,10,1)
	ROLLBACK TRANSACTION
end
else
begin
	INSERT INTO USERINFO
	SELECT I.* FROM INSERTED I
end
END
GO


----------------------------------- Test Programs
--USE MovieSystem
--GO
--select a.*, MovieSystem.dbo.compute_age(a.bdate) as age
--from ARTIST as a;

--select m.movieName, MovieSystem.dbo.get_movie_score(m.movieName)
--from MOVIE as m
--where m.movieName='Batman';

--EXEC directorMovies @directorName='Mohammadzade';
--EXEC selectAllArtists @movieTitle='Batman';

--SELECT * FROM [Recent_Movies];
--SELECT * FROM [Action_Movies];

USE MASTER
GO