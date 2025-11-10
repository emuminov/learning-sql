/* 4-1 exercise */
/* Q: Which of the payment IDs would be returned by the following filter conditions?
customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23')
A: payments with ids 101 and 107 */

/* 4-2 exercise */
/* Q: Which of the payment IDs would be returned by the following filter conditions?
customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '2005-06-19')
A: all payments of customer_id 5, except payments 109 and 114 */

/* 4-3 exercise */
select *
from payment
where amount in (1.98, 7.98, 9.98);

/* 4-4 exercise */
select customer_id, last_name
from customer
where last_name like '_A%W%';
