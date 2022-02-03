

use sakila;

-- 1. How many distinct (different) actors' last names are there?
select count(distinct last_name)
from actor;

-- 2. In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table)
select count(distinct language_id)
from language;

-- 3. How many movies were released with `"PG-13"` rating?
select count(film_id) from film where rating = "PG-13";

-- 4. Get 10 the longest movies from 2006.
select title, length from film where release_year = 2006 order by length limit 10;

-- 5. How many days has been the company operating (check `DATEDIFF()` function)?
select datediff(max(return_date), min(rental_date)) as total_days_rented from rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.
select substring(rental_date, 6, 2)
as month,
substring(rental_date, 9, 2) as weekday
from rental limit 20;

-- 7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.
select rental_date, dayname(rental_date), if(weekday(rental_date) < 6, "workday", "weekend") as day_type
from rental;

-- 8. How many rentals were in the last month of activity? A: Feb 2006 - 182 rentals

select DATE_FORMAT(rental_date, '%Y-%m')
as last_month, 
count(rental_id) as count_rental
from rental
group by last_month
order by last_month desc; 