-- Do not remove this row for proper solution testing
DROP INDEX IF EXISTS idx_products_category;

CREATE INDEX idx_products_price ON products (category);

select * from products where category = 'Electronics'
