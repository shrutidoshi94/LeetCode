/* 1083. Sales Analysis II

Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
| unit_price   | int     |
+--------------+---------+
product_id is the primary key of this table.

Table: Sales

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| seller_id   | int     |
| product_id  | int     |
| buyer_id    | int     |
| sale_date   | date    |
| quantity    | int     |
| price       | int     |
+------ ------+---------+
This table has no primary key, it can have repeated rows.
product_id is a foreign key to Product table.

Write an SQL query that reports the buyers who have bought S8 but not iPhone. Note that S8 and iPhone are products present in the Product table.

The query result format is in the following example:

Product table:
+------------+--------------+------------+
| product_id | product_name | unit_price |
+------------+--------------+------------+
| 1          | S8           | 1000       |
| 2          | G4           | 800        |
| 3          | iPhone       | 1400       |
+------------+--------------+------------+

Sales table:
+-----------+------------+----------+------------+----------+-------+
| seller_id | product_id | buyer_id | sale_date  | quantity | price |
+-----------+------------+----------+------------+----------+-------+
| 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |
| 1         | 2          | 2        | 2019-02-17 | 1        | 800   |
| 2         | 1          | 3        | 2019-06-02 | 1        | 800   |
| 3         | 3          | 3        | 2019-05-13 | 2        | 2800  |
+-----------+------------+----------+------------+----------+-------+

Result table:
+-------------+
| buyer_id    |
+-------------+
| 1           |
+-------------+
The buyer with id 1 bought an S8 but didn't buy an iPhone. The buyer with id 3 bought both.*/

-- Solution:

SELECT DISTINCT S.buyer_id
FROM Sales AS S
JOIN Product AS P 
ON S.product_id = P.product_id
WHERE P.product_name = 'S8' 
AND S.buyer_id NOT IN (
    SELECT S2.buyer_id
    FROM Sales AS S2
    JOIN Product AS P2 
	ON S2.product_id = P2.product_id
    WHERE P2.product_name = 'iPhone'
);

-- Alternative Solution using case statement:

SELECT buyer_id
FROM Sales
JOIN Product 
ON Sales.product_id = Product.product_id
WHERE 
    product_name IN ('S8', 'iPhone')
GROUP BY buyer_id
HAVING 
    SUM(CASE WHEN product_name = 'S8' THEN 1 ELSE 0 END) > 0 AND
    SUM(CASE WHEN product_name = 'iPhone' THEN 1 ELSE 0 END) = 0;

