CREATE TABLE Customer (
    Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR(255) NOT NULL,
    Customer_tel INT NOT NULL
);

CREATE TABLE Product (
    Product_id INT PRIMARY KEY,
    Product_name VARCHAR(255) NOT NULL,
    Category VARCHAR(255) NOT NULL,
    Price FLOAT CHECK (Price > 0) NOT NULL
);

CREATE TABLE Orders (
    Order_id INT PRIMARY KEY,
    Cust_id INT,
    Prod_id INT,
    OrderDate DATE,
    Quantity INT,
    Total_amount FLOAT,
    CONSTRAINT fk_cust_id FOREIGN KEY (Cust_id) REFERENCES Customer(Customer_id),
    CONSTRAINT fk_prod_id FOREIGN KEY (Prod_id) REFERENCES Product(Product_id)
);

INSERT INTO Customer (Customer_id, Customer_name, Customer_tel)
VALUES (1, 'Alice', '0688482046'), (2, 'Bob', '0623648920'), (3, 'Charlie', '0687462120');

INSERT INTO Product (Product_id, Product_name, Category, Price)
VALUES (1, 'IPHONE', 'widget', 8400), (2, 'IPAD', 'widget', 1200), (3, 'CALCULATOR', 'gadget', 3900);

INSERT INTO Orders (Order_id, Cust_id, Prod_id, OrderDate, Quantity, Total_amount)
VALUES (1, 1, 1, '2021-01-01', 3, 25200), (2, 2, 1, '2021-01-02', 5, 6000), (3, 3, 3, '2021-01-03', 2, 7800);

SELECT c.Customer_name, 
    SUM(p1.Price * o1.Quantity) AS widget_cost, 
    SUM(p2.Price * o2.Quantity) AS gadget_cost, 
    (SUM(p1.Price * o1.Quantity) + SUM(p2.Price * o2.Quantity)) AS total_cost
FROM Customer c 
JOIN Orders o1 ON c.Customer_id = o1.Cust_id 
JOIN Product p1 ON o1.Prod_id = p1.Product_id AND p1.Category = 'widget'
JOIN Orders o2 ON c.Customer_id = o2.Cust_id 
JOIN Product p2 ON o2.Prod_id = p2.Product_id AND p2.Category = 'gadget'
WHERE EXISTS (
    SELECT 1 FROM Orders o3
    JOIN Product p3 ON o3.Prod_id = p3.Product_id AND p3.Category = 'widget'
    WHERE o3.Cust_id = c.Customer_id)
    
AND EXISTS (
SELECT 1 FROM Orders o4
    JOIN Product p4 ON o4.Prod_id = p4.Product_id AND p4.Category = 'gadget'
    WHERE o4.Cust_id = c.Customer_id
    )
GROUP BY c.Customer_name;


