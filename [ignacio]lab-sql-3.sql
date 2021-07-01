-- 1 How many distinct (different) actors' last names are there?
select distinct count(`last_name`)
from actor;

-- 2 In how many different languages where the films originally produced? (Use the column language_id from the film table)
select distinct count(`language_id`)
from film;

-- 3 How many movies were released with "PG-13" rating?
select count(film_id)
from film
where rating='PG-13';

-- 4 Get 10 the longest movies from 2006.
select *
from film
where release_year=2006
order by length desc
limit 10; 

-- 5 How many days has been the company operating (check DATEDIFF() function)?
-- select substring_index(rental_date, ' ', 1)
SELECT DATEDIFF(max(rental_date),min(rental_date)) AS DateDiff
from rental;

-- 6 Show rental info with additional columns month and weekday. Get 20.
select *, month(substring_index(rental_date, ' ', 1)) as month, weekday(rental_date) as weekday
from rental
limit 20;

-- 7 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. Check the CASE function.
select *,
	case
		when weekday(substring_index(rental_date, ' ', 1)) <5 then "workday"
		when weekday(substring_index(rental_date, ' ', 1)) >5 then "weekend"
	end as day_type
from rental;

-- 8 How many rentals were in the last month of activity?
select count(rental_id), month(substring_index(rental_date, ' ', 1)) as month, year(substring_index(rental_date, ' ', 1)) as year
from rental
group by month(substring_index(rental_date, ' ', 1)), year(substring_index(rental_date, ' ', 1))
order by year(substring_index(rental_date, ' ', 1)) DESC, month(substring_index(rental_date, ' ', 1)) DESC
limit 1;