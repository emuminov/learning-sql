/* INEQUALITY CONDITIONS */
select distinct c.email
from customer c
inner join rental r
on c.customer_id = r.customer_id
/* <> operator means inequality */
where date(r.rental_date) <> '2005-06-14'

/* RANGE CONDITIONS */
select customer_id, rental_date
from rental
where rental_date >= '2005-06-14'
  and rental_date <= '2005-06-16';

/* same thing can be achieved with between operator
between operator is inclusive */
select customer_id, rental_date
from rental
where rental_date between '2005-06-14' and '2005-06-16';

/* works on numbers too */
select customer_id, payment_date, amount
from payment
where amount between 10.0 and 11.99;

/* works on strings too */
select first_name, last_name
from customer
where last_name between 'FA' and 'FRB';

/* MEMBERSHIP CONDITIONS */
select title, rating
from film
/* same thing as or */
where rating in ('G', 'PG');

/* membership can be checked with subqueries as well
this subquery returns 3 movies, takes rating from each of them, and forms
membership values from rating column ('G', 'PG') */
select title, rating
from film where rating in (
  select rating
  from film
  where title like '%PET%'
);

/* MATCHING CONDITIONS */
select last_name, first_name
from customer
/* takes 1 character from the left side of the string */
where left(last_name, 1) = 'Q';

/* wildcards
% means it can be filled with any number of characters
_ means it can be filled only with one character*/
select last_name, first_name
from customer
where last_name like '_A_T%S';

/* regular expressions */
select last_name, first_name
from customer
where last_name regexp '^[QY]';

/* NULL
nothing is equal to null, even null */
select rental_id, customer_id, return_date
from rental
where return_date = null;

/* for comparing to null there is an is operator */
select rental_id, customer_id, return_date
from rental
where return_date is null;

/* not operator is applicable here */
select rental_id, customer_id, return_date
from rental
where return_date is not null;
