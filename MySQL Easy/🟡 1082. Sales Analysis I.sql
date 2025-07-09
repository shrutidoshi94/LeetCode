/*Table: Product

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
 

Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.

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
| 2         | 2          | 3        | 2019-06-02 | 1        | 800   |
| 3         | 3          | 4        | 2019-05-13 | 2        | 2800  |
+-----------+------------+----------+------------+----------+-------+

Result table:
+-------------+
| seller_id   |
+-------------+
| 1           |
| 3           |
+-------------+
Both sellers with id 1 and 3 sold products with the most total price of 2800.*/

--Solution:
SELECT seller_id
FROM Sales
GROUP BY seller_id
HAVING SUM(price) = (
    SELECT MAX(total_sales)
    FROM (
        SELECT seller_id, SUM(price) AS total_sales
        FROM Sales
        GROUP BY seller_id
    ) AS seller_totals
);

/* Using a CTE or subquery alias to 
    •	Inner subquery: computes SUM(price) per seller.
	•	Middle subquery: gets the MAX(total_sales).
	•	Outer query: filters sellers whose total sales match that max.*/

-- Alternative solution using ALL:

SELECT seller_id
FROM Sales
GROUP BY seller_id
HAVING
    SUM(price) >= ALL (
        SELECT SUM(price)
        FROM Sales
        GROUP BY seller_id
    );

-- Wrong solution:

SELECT seller_id
FROM Sales
GROUP BY seller_id
HAVING SUM(price) = 
    (SELECT SUM(price)
    FROM Sales
    GROUP BY seller_id
    ORDER BY SUM(price) DESC
    LIMIT 1)

-- Using LIMIT in a subquery inside a HAVING clause can be problematic — especially in MySQL or similar databases.