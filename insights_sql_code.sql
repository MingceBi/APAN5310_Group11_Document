

/*

The SQL follows how the dashboard is arranged and therefore is
divided into three parts: 

1.Customer and Sales
2.Product and Cost
3.Customer Rating + Loyalty Program


Beyond the dashboard, we used additional queries to acquire more insights
and is listed in the "additional queries" at the bottom

*/


/*
Part 1: Customer and Sales
*/



--1.SQL to find total sales for each store--
SELECT
    Sales.store_id,
    Store.store_name,
    SUM(Payment.total_payment) AS total_sales_amount
FROM
    Sales
JOIN
    Payment ON Sales.sales_id = Payment.sales_id
JOIN
    Store ON Store.store_id = Sales.store_id
GROUP BY
    Sales.store_id,
    Store.store_name
ORDER BY
    total_sales_amount DESC;


--2.SQL to find transaction counts by Payment method for each store --
--Payment method includes paypal, credit card etc. --
SELECT
    Sales.store_id,
    Payment.payment_method,
    COUNT(Payment.payment_id) AS transaction_count
FROM
    Payment
JOIN
    Sales ON Payment.sales_id = Sales.sales_id
GROUP BY
    Sales.store_id, Payment.payment_method
ORDER BY
    Sales.store_id, transaction_count DESC;



--3.SQL to find Number of Sales per store--
SELECT
    store_id,
    COUNT(*) AS total_sales_count
FROM
    Sales
GROUP BY
    store_id
ORDER BY
    total_sales_count DESC;



--4.SQL to find summed Revenue per store for each date--
SELECT
    Sales.store_id,
    Sales.sales_date,
    SUM(Payment.total_payment) AS total_revenue
FROM
    Sales
JOIN
    Payment ON Sales.sales_id = Payment.sales_id
GROUP BY
    Sales.store_id, Sales.sales_date
ORDER BY
    Sales.store_id, Sales.sales_date;


--5.SQL to find which products sold the most overall (top 10)--
SELECT
    Product.product_id,
    Product.product_name,
    SUM(SpecificSales.quantity) AS total_quantity_sold
FROM
    SpecificSales
JOIN
    Product ON SpecificSales.product_id = Product.product_id
GROUP BY
    Product.product_id, Product.product_name
ORDER BY
    total_quantity_sold DESC
    LIMIT 10;


--6.SQL to find the highest spending customers--
SELECT
    Customer.customer_id,
    Customer.first_name,
    Customer.last_name,
    Customer.email,
    Customer.phone,
    SUM(Payment.total_payment) AS total_spent
FROM
    Customer
JOIN
    Sales ON Customer.customer_id = Sales.customer_id
JOIN
    Payment ON Sales.sales_id = Payment.sales_id
GROUP BY
    Customer.customer_id, Customer.first_name, Customer.last_name, Customer.email, Customer.phone
ORDER BY
    total_spent DESC;



/*
Part 2: Product and Cost
*/

--7.SQL to find the top suppliers based on product value (top 10) --
--meaning that we bought the most values of goods from these supplier--
SELECT
    Supplier.supplier_id,
    Supplier.name,
    SUM(product_orders.quantity * product_orders.unit_price) AS total_value
FROM
    orders
JOIN
    product_orders ON orders.order_id = product_orders.order_id
JOIN
    Supplier ON orders.supplier_id = Supplier.supplier_id
GROUP BY
    Supplier.supplier_id, Supplier.name
ORDER BY
    total_value DESC
    LIMIT 10;


--8.SQL for inspecting number of orders per store --
SELECT 
    st.store_id, 
    st.store_name,
    COUNT(DISTINCT sto.order_id) AS order_count
FROM 
    Store st
JOIN 
    stores_Orders sto ON st.store_id = sto.store_id
GROUP BY 
    st.store_id, 
    st.store_name
ORDER BY 
    order_count DESC;


--9.SQL for number of orders in each month --
SELECT
  DATE_TRUNC('month', Orders.stock_date) AS "stock_date",
  COUNT(*) AS count
FROM
  Orders
GROUP BY
  DATE_TRUNC('month', Orders.stock_date)
ORDER BY
  DATE_TRUNC('month', Orders.stock_date) ASC


-- 10.SQL for finding the quarterly averaged fixed and variable costs --
SELECT
  DATE_TRUNC('quarter', OperatingCost.date) AS "date",
  AVG(OperatingCost.fixed_cost) AS "avg",
  AVG(OperatingCost.variable_cost) AS "avg_2"
FROM
  OperatingCost
GROUP BY
  DATE_TRUNC('quarter', OperatingCost.date)
ORDER BY
  DATE_TRUNC('quarter', OperatingCost.date) ASC


/*
Part 3: Customer Rating + Loyalty Program
*/


--11.SQL for Finding Average rating per store and number of ratings per store --
SELECT
    Store.store_id,
    Store.store_name,
    AVG(CustomerRating.rating) AS average_rating,
    COUNT(CustomerRating.rating) AS number_of_ratings
FROM
    CustomerRating
JOIN
    Store ON CustomerRating.store_id = Store.store_id
GROUP BY
    Store.store_id, Store.store_name
ORDER BY
    average_rating DESC;



--12.SQL for finding the distribution of number of ratings --
SELECT
  (
    FLOOR(((customerrating.rating - 1.0) / 0.5)) * 0.5
  ) + 1.0 AS rating,
  COUNT(*) AS count
FROM
  customerrating
GROUP BY
  (
    FLOOR(((customerrating.rating - 1.0) / 0.5)) * 0.5
  ) + 1.0
ORDER BY
  (
    FLOOR(((customerrating.rating - 1.0) / 0.5)) * 0.5
  ) + 1.0 ASC


-- 13.SQL for finding number of customers in different loyal level for each store --
SELECT 
    st.store_id,
    st.store_name,
    lp.level,
    COUNT(c.customer_id) AS customer_count
FROM 
    Customer c
JOIN 
    LoyaltyProgram lp ON c.loyalty_id = lp.loyalty_id
JOIN 
    Sales s ON c.customer_id = s.customer_id
JOIN 
    Store st ON s.store_id = st.store_id
GROUP BY 
    st.store_id, 
    st.store_name, 
    lp.level
ORDER BY 
    st.store_id, 
    lp.level;





--14.SQL for finding number of customers based on loyalty level--
SELECT
  loyaltyprogram.level AS level,
  COUNT(*) AS count
FROM
  loyaltyprogram
GROUP BY
  loyaltyprogram.level
ORDER BY
  loyaltyprogram.level ASC




/*

Additional Insights:

*/

--15. SQL to find the top performing employees based on how --
--many sale transactions they made--
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    COUNT(s.sales_id) AS sales_count
FROM
    Sales s
JOIN
    Employee e ON s.employee_id = e.employee_id
GROUP BY
    e.employee_id, e.first_name, e.last_name
ORDER BY
    sales_count DESC
    LIMIT 10;



