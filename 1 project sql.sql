---5.Looking at July 2021 data, what do you think is our biggest problem and how would you
---recommend fixing it?

select sales_order_status,order_item_id,ordered_quantity,
  order_quantity_accepted,rate, year(creation_time) as year
   from sales_orders a join sales_orders_items b on 
  a.order_id = b.fk_order_id where year(creation_time)= 2021 AND 
  sales_order_status = 'pending'
  order by sales_order_status,order_quantity_accepted;
  
---1.Make a dataset (Using SQL) named “daily_logins” which contains the number of
---logins on a daily basis
SELECT
 cast([login_time] as date) as Date,
  user_id,
  COUNT(*) AS No_of_logins
FROM login_logs
GROUP BY
  (login_time),
  user_id
ORDER BY
 (login_time),
  user_id;

---3.Prepare a report regarding our growth between the 2 years. Please try to answer the
---following question.
 
 select sales_order_status,order_item_id,ordered_quantity,
  order_quantity_accepted,rate, year(creation_time) as year
   from sales_orders a join sales_orders_items b on 
  a.order_id = b.fk_order_id 
  order by year(creation_time), sales_order_status,order_quantity_accepted;

  SELECT YEAR(creation_time) years,
       SUM(rate) as sales,
       COUNT(order_quantity_accepted) as 'number of order'
FROM sales_orders a join sales_orders_items b on 
  a.order_id = b.fk_order_id
WHERE sales_order_status = 'pending'
GROUP BY YEAR(creation_time);

---.6 Does the login frequency affect the number of orders made?
select login_log_id,order_id,login_time,creation_time,sales_order_status from
login_logs a join sales_orders b on a.user_id=b.fk_buyer_id 
order by order_id, login_time,creation_time;

---7.Give at least 2 insights that are not mentioned above and are 
---not clearly visible from the data.
---Back order date
---sell through rate
SELECT YEAR(creation_time) years,
       SUM(rate) as sales,
       COUNT(order_quantity_accepted) as 'number of order'
FROM sales_orders a join sales_orders_items b on 
  a.order_id = b.fk_order_id
WHERE sales_order_status = 'pending'
GROUP BY YEAR(creation_time);
---
SELECT YEAR(creation_time) years,
       SUM(rate) as sales,
       COUNT(order_quantity_accepted) as 'number of order'
FROM sales_orders a join sales_orders_items b on 
  a.order_id = b.fk_order_id
WHERE sales_order_status = 'shipped'
GROUP BY YEAR(creation_time);

SELECT YEAR(creation_time) years,
       LAG(rate) OVER ( ORDER BY YEAR(creation_time) ) AS Revenue_Previous_Year
FROM   sales_orders a join sales_orders_items b on 
  a.order_id = b.fk_order_id;