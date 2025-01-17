select count(r.rental_id) as "total_rentals", f.title, f.film_id
from payment p
join rental r on r.rental_id = p.rental_id
join inventory i on i.inventory_id = r.inventory_id
join film f on f.film_id = i.film_id
group by 2,3
order by 1 desc;

/*cte way*/
with cte_1 as (
select count(r.rental_id) as "total_rentals", f.title, f.film_id
from payment p
join rental r on r.rental_id = p.rental_id
join inventory i on i.inventory_id = r.inventory_id
join film f on f.film_id = i.film_id
group by 2,3
order by 1 desc)
select title, film_id, total_rentals
from cte_1; 

/*  Determine the total sales for each film.*/
with cte_1 as (
select f.title, f.film_id, sum(p.amount) as "total_sales"
from payment p
join rental r on r.rental_id = p.rental_id
join inventory i on i.film_id = r.inventory_id
join film f on f.film_id = i.film_id
group by 1,2
order by 3 desc)
select title, film_id, total_sales
from cte_1;

/* Identify the top-performing films in terms of rentals and revenue.*/
select f.title, f.rental_rate as "Rentals", f.rental_duration, sum(p.amount) as "Revenue"
from payment p
join rental r on r.rental_id = p.rental_id
join inventory i on i.film_id = r.inventory_id
join film f on f.film_id = i.film_id
group by 1,2,3
order by 2 desc,3 desc, 4 desc;

/* Analyze trends in rental duration.*/
select title, rental_duration, release_year,length, rating
from film
group by 1,2,3,4,5
order by rental_duration desc, length desc, rating desc; 



