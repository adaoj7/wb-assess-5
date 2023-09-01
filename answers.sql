SELECT * FROM cupcakes;
SELECT * FROM customers;
SELECT * FROM orders;
-- Problem 1
SELECT email FROM customers ORDER BY email;
-- Problem 2
SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE fname = 'Elizabeth' AND lname = 'Crocker') ORDER BY customer_id;
-- Problem 3
SELECT SUM(num_cupcakes) FROM orders WHERE processed = false
-- Problem 4
SELECT cupcakes.name, SUM(orders.num_cupcakes) FROM cupcakes  LEFT JOIN orders ON  cupcakes.id = orders.cupcake_id GROUP BY cupcakes.name ORDER BY cupcakes.name;
-- Problem 5
SELECT customers.email, SUM(orders.num_cupcakes) AS total FROM customers LEFT JOIN orders ON customers.id = orders.customer_id GROUP BY customers.email ORDER BY customers.email;
-- Problem 6
SELECT fname, lname, email FROM customers JOIN orders ON customers.id = orders.customer_id WHERE cupcake_id = (SELECT id FROM cupcakes WHERE name = 'funfetti') AND orders.processed = true GROUP BY customers.fname, customers.lname, customers.email;