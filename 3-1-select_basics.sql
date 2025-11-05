/* statement to select version, database user and database name */
select version(), user(), database();

/* SELECT CLAUSE */
/* select clause can give, besides data included in the table,
include additional columns, that can be anything */
select language_id,
'COMMON' as language_usage, /* data {optional as} column_alias_name */
language_id * 3.14 lang_pi_value, /* `as` keyword can be omited */
upper(name) language_name
from language;

/* DISTINCT TO FETCH UNIQUE VALUES */
/* big list of all actor ids which repeat */
/* 5462 rows */
select actor_id from film_actor order by actor_id;

/* 200 rows */
select distinct actor_id from film_actor order by actor_id;

/* same thing as not specifying distinct */
/* 5462 rows */
select all actor_id from film_actor order by actor_id;

/* FROM CLAUSE */
/* The from clause defines the tables used by a query, along with the means of linking the
tables together. */
/* from can be used on:
hard tables
derived tables
temporary tables
virtual tables
*/
/* example usage on a derived table */
select concat (cust.last_name, ' ', cust.first_name) full_name
from (select first_name, last_name from customer where first_name = 'jessie') cust;

/* temporary tables disappear after a session */
create temporary table actors_j (
actor_id smallint(5),
first_name varchar (45),
last_name varchar (45)
);

insert into actors_j
select actor_id, first_name, last_name /* data insertion and select can be combined */
from actor
where last_name like 'J%';

select * from actors_j;

/* views don't store any actual data, and instead they reuse existing data */
create view cust_vw as
select customer_id, first_name, last_name, active
from customer;

select * from cust_vw;

/* table links and inner join */
select
  customer.first_name,
  customer.last_name,
  time(rental.rental_date) rental_time
from
  customer
inner join
  rental
on
  customer.customer_id = rental.customer_id
where date(rental.rental_date) = '2005-06-14';

/* table aliases: same query, but shorter to write */
select
  c.first_name,
  c.last_name,
  time(r.rental_date) rental_time
from
  customer c
inner join
  rental r
on
  c.customer_id = r.customer_id
where date(r.rental_date) = '2005-06-14';

/* WHERE CLAUSE */
/* used for filtering of rows */
select title
from film
where rating = 'G' and rental_duration >= 7;

select title, rating, rental_duration
from film
where (rating = 'G' and rental_duration >= 7)
  or (rating = 'PG-13' and rental_duration < 4)

/* GROUP BY CLAUSE */
/* HAVING CLAUSE */
/*  */
select c.first_name, c.last_name, count(*)
from customer c
    inner join rental r
    on c.customer_id = r.customer_id
group by c.first_name, c.last_name
having count(*) >= 40;
