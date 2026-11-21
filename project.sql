


RESTAURANT ORDER & INVENTORY MANAGEMENT SYSTEM
MYSQL DATABASE code
Submitted By: CHERVIRALA ROSHINI
Batch: 104 R BATCH
Submitted To: 10,000 CODERS Coaching Center
Year: 2026













create database project;
use project;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255)
);
CREATE TABLE Menu_Items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100),
    category VARCHAR(50), -- e.g., Starter, Main Course, Dessert
    price DECIMAL(10,2),
    availability_status VARCHAR(20) -- Available / Out of Stock
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20), -- Placed / Completed / Cancelled
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id)
);
CREATE TABLE Inventory (
    item_code INT PRIMARY KEY,
    ingredient_name VARCHAR(100),
    quantity_in_stock INT,
    unit VARCHAR(20), -- e.g., kg, liters, pieces
    reorder_level INT
);
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);
CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY,
    supplier_id INT,
    item_code INT,
    purchase_date DATE,
    quantity INT,
    total_cost DECIMAL(10,2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (item_code) REFERENCES Inventory(item_code)
);
CREATE TABLE Recipe_Ingredients (
    item_id INT,
    item_code INT,
    quantity_required INT,
    PRIMARY KEY (item_id, item_code),
    FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id),
    FOREIGN KEY (item_code) REFERENCES Inventory(item_code)
);

Tasks 
🔹 Basic Queries 
● Insert sample data (5–10 rows per table). 
INSERT INTO Customers VALUES 
(1, 'Alice Smith', '1234567890', 'alice@email.com', '123 Main St'),
(2, 'Bob Johnson', '0987654321', 'bob@email.com', '456 Elm St'),
(3, 'Charlie Brown', '5556667777', 'charlie@email.com', '789 Oak St'),
(4, 'David Lee', '4445556666', 'david@email.com', '321 Pine St'),
(5, 'Eve Davis', '3334445555', 'eve@email.com', '654 Maple St');
INSERT INTO Menu_Items VALUES 
(1, 'Margherita Pizza', 'Main Course', 350.00, 'Available'),
(2, 'Garlic Bread', 'Starter', 150.00, 'Available'),
(3, 'Chocolate Lava Cake', 'Dessert', 200.00, 'Available'),
(4, 'Pasta Alfredo', 'Main Course', 400.00, 'Out of Stock'),
(5, 'Caesar Salad', 'Starter', 250.00, 'Available');
INSERT INTO Orders VALUES 
(1, 1, '2025-10-05', 500.00, 'Completed'),
(2, 2, '2025-10-12', 350.00, 'Completed'),
(3, 3, '2025-10-20', 200.00, 'Placed'),
(4, 4, '2025-11-01', 400.00, 'Cancelled'),
(5, 5, '2025-11-05', 250.00, 'Completed');
INSERT INTO Order_Items VALUES 
(1, 1, 1, 1, 350.00),
(2, 1, 2, 1, 150.00),
(3, 2, 1, 1, 350.00),
(4, 3, 3, 1, 200.00),
(5, 4, 4, 1, 400.00),
(6, 5, 5, 1, 250.00);
INSERT INTO Inventory VALUES 
(1, 'Pizza Dough', 50, 'pieces', 20),
(2, 'Cheese', 30, 'kg', 10),
(3, 'Tomato Sauce', 25, 'liters', 5),
(4, 'Pasta', 40, 'kg', 15),
(5, 'Lettuce', 20, 'kg', 10);
INSERT INTO Recipe_Ingredients VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(4, 4, 2),
(5, 5, 1);
INSERT INTO Suppliers VALUES 
(1, 'Fresh Farms', '1112223333', 'contact@freshfarms.com'),
(2, 'Dairy Co', '2223334444', 'sales@dairyco.com'),
(3, 'Pasta Makers', '3334445555', 'info@pastamakers.com'),
(4, 'Veggie Supply', '4445556666', 'order@veggiesupply.com'),
(5, 'Sauce Inc', '5556667777', 'hello@sauceinc.com');
INSERT INTO Purchases VALUES 
(1, 1, 1, '2025-10-01', 100, 200.00),
(2, 2, 2, '2025-10-05', 50, 500.00),
(3, 5, 3, '2025-10-10', 30, 150.00),
(4, 3, 4, '2025-11-02', 40, 400.00),
(5, 4, 5, '2025-11-05', 30, 100.00);
•	Display all menu items with price greater than 300. 
select*from menu_items where price>300;
 
 List all customers who placed orders in October 2025. 
select distinct order_date,c.* from customers c join orders o on c.customer_id=o.customer_id
where o.order_date between '2025-10-01'and '2025-10-31';
 
 Find all menu items marked as “Out of Stock.” 
select*from menu_items where availability_status ='out of stock';


 
 Show details of all completed orders. 
select*from orders where status='completed';
 

Joins 
● List customer names with their ordered item names. 
select c.name,m.item_name from customers c
join orders o on c.customer_id=o.customer_id
join order_items oi on o.order_id=oi.order_id
join menu_items m on oi.item_id =m.item_id;
 
● Display order details with item name and quantity. 
SELECT o.order_id, m.item_name, oi.quantity
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Menu_Items m ON oi.item_id = m.item_id;
 
● Show all orders with total amount and customer details. 
SELECT o.order_id, o.total_amount, c.name, c.phone, c.email
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;
 
● List suppliers with ingredients they supply.
SELECT DISTINCT s.supplier_name, i.ingredient_name
FROM Suppliers s
JOIN Purchases p ON s.supplier_id = p.supplier_id
JOIN Inventory i ON p.item_code = i.item_code; 
 
● Get details of menu items used in orders along with their category. 
SELECT DISTINCT m.item_name, m.category, m.price
FROM Menu_Items m
JOIN Order_Items oi ON m.item_id = oi.item_id;
 

Aggregate Functions 
● Count total number of orders placed in a month. 
select count(*) as total_orders from orders where order_date between '2025-10-01'and '2025-10-31';
 
● Find total revenue earned. 
select sum(total_amount) as total_revenue from orders where status='completed';
 
● Get the average order amount. 
select avg(total_amount)as average_order_amount from orders;
 
● Show the most expensive dish on the menu. 
select *from menu_items order by price desc limit 1;
 
● Find the total quantity of each ingredient in stock. 
SELECT ingredient_name, quantity_in_stock, unit
FROM Inventory;
 

Subqueries 
● Find customers who haven’t placed any orders. 
select*from customers
where customer_id not in (select customer_id from orders);
 
● Retrieve menu items that were never ordered. 
select*from menu_items where item_id not in(select item_id from order_items);
 
● Get ingredients below reorder level. 
select* from inventory where quantity_in_stock<reorder_level;
 
● Find suppliers who haven’t made any recent deliveries. 
select*from suppliers where supplier_id not in( select supplier_id from purchases where purchase_date>current_date);
 
● Get orders whose total amount is above average. 
select *from orders where total_amount>(select avg(total_amount) from orders);
 

🔹 Updates & Deletes
•	Update menu item availability after an order is completed.
update menu_items set availability_status= 'out of stock' where item_id=4;
● Change supplier contact details. 
update inventory set quantity_in_stock =quantity_in_stock+50
where item_code=1;
● Delete cancelled orders. 
delete from customers 
where customer_id not in( select customer_id from orders);
● Update ingredient stock after new purchase. 
UPDATE Inventory
SET quantity_in_stock = quantity_in_stock + 50
WHERE item_code = 1;
● Delete customers with no order history. 
DELETE FROM Customers 
WHERE customer_id NOT IN (SELECT customer_id FROM Orders);
🔹 Advanced (Triggers, Views, Procedures) 
● Trigger: Reduce inventory quantity automatically when an order is placed.
DELIMITER // 
CREATE TRIGGER trg_reduce_inventory
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
    UPDATE Inventory i
    JOIN Recipe_Ingredients r ON i.item_code = r.item_code
    SET i.quantity_in_stock = i.quantity_in_stock - (NEW.quantity * r.quantity_required)
    WHERE r.item_id = NEW.item_id;
END //

DELIMITER ;
● View: Show combined order report (Customer, Items, Total Amount).
CREATE VIEW Order_Report AS
SELECT 
    c.name AS customer_name,
    o.order_id,
    o.order_date,
    m.item_name,
    oi.quantity,
    oi.subtotal,
    o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Menu_Items m ON oi.item_id = m.item_id;
SELECT * FROM Order_Report; 
● Procedure: Generate daily sales summary. 
DELIMITER //
CREATE PROCEDURE daily_sales_summary(IN summary_date DATE)
BEGIN
    SELECT 
        summary_date AS Date,
        COUNT(order_id) AS Total_Orders,
        COALESCE(SUM(total_amount), 0) AS Total_Sales
    FROM Orders
    WHERE order_date = summary_date AND status = 'Completed';
END //
DELIMITER ;
CALL daily_sales_summary('2025-10-05');
 
● Transaction: Add order and order items only if all items are available. 
DELIMITER //
CREATE TRIGGER trg_reduce_inventory
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
-- Store the NEW values into variables first to avoid MySQL alias confusion
DECLARE v_ordered_item INT;
DECLARE v_ordered_qty INT;
SET v_ordered_item = NEW.item_id;
SET v_ordered_qty = NEW.quantity;
-- Update inventory using the variables instead of NEW.item_id
UPDATE Inventory i
JOIN Recipe_Ingredients r ON i.item_code = r.item_code
SET i.quantity_in_stock = i.quantity_in_stock - (v_ordered_qty * r.quantity_required)
WHERE r.item_id = v_ordered_item;
END //
DELIMITER ;

🔹 Reports / Analysis 
● Top 5 selling dishes by quantity. 
SELECT m.item_name, SUM(oi.quantity) as total_sold
FROM Order_Items oi
JOIN Menu_Items m ON oi.item_id = m.item_id
JOIN Orders o ON oi.order_id = o.order_id
WHERE o.status != 'Cancelled'
GROUP BY m.item_name
ORDER BY total_sold DESC
LIMIT 5;
 
● Monthly revenue report for 2025. 
SELECT MONTH(order_date) as month, SUM(total_amount) as revenue
FROM Orders
WHERE YEAR(order_date) = 2025 AND status = 'Completed'
GROUP BY MONTH(order_date)
ORDER BY month;
 
● Most frequent customers and their total spending. 
SELECT c.name, COUNT(o.order_id) as total_orders, SUM(o.total_amount) as total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC, total_spent DESC;
 
● Ingredients most frequently restocked. 
SELECT i.ingredient_name, COUNT(p.purchase_id) as restock_count, SUM(p.quantity) as total_purchased
FROM Inventory i
JOIN Purchases p ON i.item_code = p.item_code
GROUP BY i.ingredient_name
ORDER BY restock_count DESC, total_purchased DESC;
 
● Supplier who provides the highest quantity of items. 
SELECT s.supplier_name, SUM(p.quantity) as total_supplied
FROM Suppliers s
JOIN Purchases p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_name
ORDER BY total_supplied DESC
LIMIT 1;
 
● Category of dishes generating the highest revenue. 
SELECT m.category, SUM(oi.subtotal) as total_revenue
FROM Menu_Items m
JOIN Order_Items oi ON m.item_id = oi.item_id
JOIN Orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY m.category
ORDER BY total_revenue DESC
LIMIT 1
 







