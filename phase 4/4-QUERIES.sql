USE MovieSystem
GO
---------- Queries ------------

-- 1 :	مشاهده فیلم های یک کارگردان با نام sample name &
select m.* 
from MOVIE as m, DIRECTOR as dr, DIRECT as d , ARTIST as a
where dr.id = d.director and d.movie=m.id and a.id=dr.id and a.lastname = 'Modiri' ;

-- 2 : 	مشاهده فیلم های یک تهیه کننده با نام sample name &
select m.* 
from MOVIE as m, PRODUCER as pr, PRODUCE as p, ARTIST as a
where pr.id = p.producer and p.movie=m.id and a.id=pr.id and  a.lastname = 'Pit';

-- 3 :  مشاهده فیلم ها بر اساس حروف الفبا &

select m.* 
from MOVIE as m
order by m.movieName ;

-- 4 : 	مشاهده فیلم ها بر اساس ژانر ها &
select m.movieName , g.genre
from MOVIE as m, GENRE as g
where m.id = g.movie ;

-- or : &

select m.movieName , g.genre
from MOVIE as m, GENRE as g
where m.id = g.movie 
order by g.genre ;

-- 5 : 	مشاهده فیلم بر اساس زبان &
select m.*
from MOVIE as m
order by m.lang;

-- 6 : مشاهده فیلم ها بر اساس سال ساخت &
select m.* 
from MOVIE as m
order by m.made_date ;


-- 7 : مشاهده فیلم های انگلیسی که بعد سال 2010 ساخته شدند &

select m.*
from MOVIE as m
where YEAR(m.made_date) > 2010 and m.lang = 'English';

-- 8 : تعداد فیلم هایی که کارگردان های ایرانی ساخته اند &
select COUNT(m.id)
from MOVIE m, DIRECTOR dr, ARTIST a, DIRECT d
where dr.id=a.id and a.nationality='Iranian' and dr.id = d.director and d.movie=m.id;

-- 9 : تعداد جایزه های هنرمد با نام 'samplename' &
select COUNT(aw.id)
from ARTIST as ar,  AWARD as aw
where ar.lastname = 'Pacino' and aw.artist=ar.id;

-- 10 : نام کاربرانی که بیشتر از 1 شماره تلفن دارند &
select u.*
from USERINFO as u
where (select COUNT(p.id)from PHONE as p where p.username=u.username) > 1 ;

-- 11 : مشاهده کارگردانان بر اساس کشور &
select a.*
from DIRECTOR as d, ARTIST as a
where a.id=d.id
order by a.nationality ;

-- 12 : مشاهده تعداد فیلم هایی که هر کارگردان ساخته &
select COUNT(m.id) as count, a.firstname, a.lastname
from DIRECTOR as dr , MOVIE as m, DIRECT as d, ARTIST as a
where dr.id=d.director and d.movie=m.id and  a.id=dr.id
group by a.firstname, a.lastname;

-- 13 : لیست فیلم ها مرتب شده بر اساس میانگین امتیاز آنها
select m.* , MovieSystem.dbo.get_movie_score(m.movieName)  as avrg
from MOVIE as m
order by avrg DESC;

-- 14 : لیست همه کارگردان های غیر ایرانی &

select a.lastname , a.firstname
from DIRECTOR as d, ARTIST as a
where d.id=a.id
EXCEPT
select a.lastname ,a.firstname
from DIRECTOR as d, ARTIST as a
where a.nationality = 'Iranian' and d.id=a.id;

-- 15 : لیست بازیگرانی که هنوز فیلمی بازی نکرده اند &
select ar.firstname, ar.lastname
from ARTIST as ar , ACTOR as ac
where ac.id=ar.id
EXCEPT 
select ar.firstname, ar.lastname
from ARTIST as ar , ACTOR as ac, MOVIE as m, ACT as act
where act.actor = ac.id and act.movie=m.id and ar.id=ac.id;

-- 16 : نمایش گران ترین فیلم دردسترس &

select m.*
from MOVIE as m
where m.cost = (select MAX(MOVIE.cost) from MOVIE)

-- 17 : تعداد کامنت های هر فیلم  &

select m.movieName, count(c.id) as comment_count
from MOVIE as m, COMMENT as c
where c.movie=m.id
group by m.movieName;

-- 18 : لیست بازیگران مرد با قد بیشتر از 180 که بیشتر از 3 جایزه برده اند  &

select ac.*
from ACTOR as ac, ARTIST as ar
where ac.id = ar.id and ac.height > 179 and (select COUNT(aw.id) from AWARD as aw where aw.artist=ar.id) > 2 ;

-- 19 : لیست همه دست اندر کاران فیلم نمونه  &

select ar.firstname, ar.lastname
from ARTIST as ar, MOVIE as m, ACTOR as ac, ACT as act
where ar.id=ac.id and act.actor=ac.id and act.movie=m.id and  m.movieName = 'Sky Castle'
UNION
select ar.firstname, ar.lastname
from ARTIST as ar, MOVIE as m, DIRECTOR as dr, DIRECT as d
where ar.id=dr.id and d.director=dr.id and d.movie=m.id and m.movieName = 'Sky Castle'
UNION
select ar.firstname, ar.lastname
from ARTIST as ar, MOVIE as m, PRODUCER as pr, PRODUCE as p
where ar.id=pr.id and p.producer=pr.id and p.movie=m.id and m.movieName = 'Sky Castle';

-- 20 : آدرس صفحه مجازی هنرمند با بیشترین امتیاز &

select sp.pageaddr
from SOCIALPAGE as sp, ARTIST as ar
where ar.rating = (select MAX(ARTIST.rating) from ARTIST) and sp.artist=ar.id;


USE MASTER 
GO