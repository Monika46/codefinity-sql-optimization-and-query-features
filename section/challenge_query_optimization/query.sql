-- Analyze the original query with EXPLAIN
EXPLAIN
SELECT p.name, SUM(s.quantity) AS total_sold
FROM products p
JOIN sales s ON p.product_id = s.product_id
WHERE p.category = 'Electronics'
GROUP BY p.name;

CREATE INDEX if not exists idx_products_price ON products (category);
CREATE INDEX if not exists idx_sales_price ON sales (product_id);

EXPLAIN SELECT p.name, SUM(s.quantity) AS total_sold
FROM (select * from products where category = 'Electronics') as p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.name;