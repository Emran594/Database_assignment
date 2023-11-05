--Task 1:
SELECT 
    c.id AS customer_id,
    c.name AS customer_name,
    c.email AS customer_email,
    c.location AS customer_location,
    COUNT(o.id) AS total_orders
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name, c.email, c.location
ORDER BY total_orders DESC;



--Task 2:

SELECT 
    oi.order_id,
    p.name AS product_name,
    oi.quantity,
    (oi.quantity * p.price) AS total_amount
FROM order_item oi
INNER JOIN products p ON oi.product_id = p.id
ORDER BY oi.order_id ASC;

--Task 3:
SELECT
    c.name AS category_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM categories c
INNER JOIN products p ON c.id = p.category_id
INNER JOIN order_item oi ON p.id = oi.product_id
GROUP BY c.id, category_name
ORDER BY total_revenue DESC;

--Task 4:
SELECT
    c.name AS customer_name,
    SUM(oi.unit_price * oi.quantity) AS total_purchase_amount
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
INNER JOIN order_item oi ON o.id = oi.order_id
GROUP BY c.id, customer_name
ORDER BY total_purchase_amount DESC
LIMIT 5;
