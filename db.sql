
-- FIRST THING CREATED THE CREATED THE  bookstore_db;

CREATE DATABASE bookstoreDB;
USE bookstoreDB;

-- CREATED TABLES -----------

CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL,
    language_code CHAR(2) NOT NULL
);


---book_language table data---
INSERT INTO book_language (language_name, language_code) VALUES 
('English', 'EN'),
('Swahili', 'SW'),
('Arabic', 'AR'),
('French', 'FR'),
('Amharic', 'AM');




----- publisher table=------------------------------------------------------------------
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    location VARCHAR(255)
);


-- Publisher table data --------------
INSERT INTO publisher (publisher_name, location) VALUES 
('Kwani Trust', 'Nairobi, Kenya'),
('Cassava Republic Press', 'Abuja, Nigeria'),
('HSRC Press', 'Cape Town, South Africa'),
('Farafina Books', 'Lagos, Nigeria'),
('Mkuki na Nyota', 'Dar es Salaam, Tanzania');


-------------BOOOK TABLE-------------------------------
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) UNIQUE,
    page_count INT,
    publication_date DATE,
    language_id INT,
    publisher_id INT,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)

);


-----------------BOOK TABLE DATA-------------------
INSERT INTO book (title, isbn, page_count, publication_date, language_id, publisher_id, price, description) VALUES 
('Half of a Yellow Sun', '9780007200283', 433, '2006-08-11', 1, 4, 2500.00, 'A novel set during the Biafran War, telling the story of the war through the perspective of the main characters.'),
('Wizard of the Crow', '9780099502685', 766, '2006-08-08', 1, 1, 3200.00, 'A novel set in the fictional Free Republic of Aburiria, it chronicles the corruption and rot of a postcolonial African state.'),
('Things Fall Apart', '9780385474542', 209, '1958-06-17', 1, 2, 1800.00, 'The debut novel by Chinua Achebe that examines European colonization from an African perspective.'),
('Death and the King''s Horseman', '9780413540805', 77, '1975-01-01', 1, 3, 1500.00, 'A play based on a real incident that took place during the colonial era in Nigeria.'),
('July''s People', '9780140061406', 160, '1981-11-12', 1, 3, 1900.00, 'A novel set during a fictional civil war in which black South Africans have violently overturned the system of apartheid.');


------------AUTHOR TABLE ------------------------

CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    biography TEXT
);


------ author table data-------------------
INSERT INTO author (first_name, last_name, biography) VALUES 
('Chimamanda Ngozi', 'Adichie', 'Nigerian writer whose works range from novels to short stories to nonfiction.'),
('Ngugi wa', 'Thiong''o', 'Kenyan writer and academic who writes primarily in Gikuyu. His work includes novels, plays, short stories, and essays.'),
('Chinua', 'Achebe', 'Nigerian novelist, poet, professor, and critic. Best known for his first novel and magnum opus, Things Fall Apart.'),
('Wole', 'Soyinka', 'Nigerian playwright, novelist, poet, and essayist. First African to be awarded the Nobel Prize in Literature.'),
('Nadine', 'Gordimer', 'South African writer and political activist who received the Nobel Prize in Literature.');



---------------BOOK AUTHOR TABLE ----------------------------------------------------------

CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);



-------------------BOOK AUTHOR TABLE DATA-----------------------------
-- Book-Author relationships
INSERT INTO book_author (book_id, author_id) VALUES 
(1, 1), -- Half of a Yellow Sun - Chimamanda Ngozi Adichie
(2, 2), -- Wizard of the Crow - Ngugi wa Thiong'o
(3, 3), -- Things Fall Apart - Chinua Achebe
(4, 4), -- Death and the King's Horseman - Wole Soyinka
(5, 5); -- July's People - Nadine Gordimer

-----------COUNTRY TABLE ----------------------
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    country_code CHAR(2) NOT NULL
);


--------------COUNTRY TABLE DATA ---------------
INSERT INTO country (country_name, country_code) VALUES 
('Nigeria', 'NG'),
('Kenya', 'KE'),
('South Africa', 'ZA'),
('Ghana', 'GH'),
('Ethiopia', 'ET');


--------- ADDRESS TABLE -----------------------

CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    postal_code VARCHAR(20) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);


----------ADDRESS TABLE DATA ----------------
INSERT INTO address (street, city, state, postal_code, country_id) VALUES 
('15 Awolowo Road', 'Lagos', 'Lagos State', '101233', 1),
('27 Kimathi Street', 'Nairobi', 'Nairobi County', '00100', 2),
('42 Long Street', 'Cape Town', 'Western Cape', '8001', 3),
('8 Independence Avenue', 'Accra', 'Greater Accra', 'GA-059-9246', 4),
('Bole Road, Friendship Building', 'Addis Ababa', NULL, '1000', 5);




----------------- CUSTOMER TABLE----------------------------------
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP
);



-------------------- CUSTOMER TABLE DATA -------------------------------

INSERT INTO customer (first_name, last_name, email, phone) VALUES 
('Oluwaseun', 'Adeyemi', 'oluwaseun.adeyemi@example.com', '+234-801-234-5678'),
('Wanjiku', 'Kamau', 'wanjiku.kamau@example.com', '+254-722-123-456'),
('Thabo', 'Mbeki', 'thabo.mbeki@example.com', '+27-83-765-4321'),
('Kwame', 'Asante', 'kwame.asante@example.com', '+233-24-123-4567'),
('Abebe', 'Bekele', 'abebe.bekele@example.com', '+251-91-123-4567');




-------- ADDRESS STATUS TABLE --------------------------------
CREATE TABLE address_status (
    address_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);



-------- ADDRESS STATUS TABLE DATA ------------------------------

INSERT INTO address_status (status_name) VALUES 
('Current'),
('Previous'),
('Shipping'),
('Billing'),
('Business');



---------------- CUSTOMER  ADDRESS TABLE  ------------

CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    address_status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);


------------ CUSTOMER ADDRESS TABLE DATA -------------
INSERT INTO customer_address (customer_id, address_id, address_status_id) VALUES 
(1, 1, 1), -- Oluwaseun Adeyemi's current address
(2, 2, 1), -- Wanjiku Kamau's current address
(3, 3, 1), -- Thabo Mbeki's current address
(4, 4, 1), -- Kwame Asante's current address
(5, 5, 1); -- Abebe Bekele's current address



-------------- SHIPPING METHOD TABLE -------------
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    estimated_days INT
);


----------- SHIPPING METHOD TABLE DATA -----------------
INSERT INTO shipping_method (method_name, cost, estimated_days) VALUES 
('Standard Local', 500.00, 5),
('Express Local', 1000.00, 2),
('Same Day (Metro Areas)', 1500.00, 1),
('Regional Standard', 2500.00, 14),
('Regional Express', 4000.00, 7);




------------- ORDER STATUS TABLE -----------------------

CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);


---------------- ORDER STATUS TABLE DATA------------------
INSERT INTO order_status (status_name) VALUES 
('Pending'),
('Processing'),
('Shipped'),
('Delivered'),
('Cancelled');




------------------ CUSTOMER ORDER TABLE ------------------------

CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    shipping_method_id INT,
    order_status_id INT,
    shipping_address_id INT,
    order_total DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id),
    FOREIGN KEY (shipping_address_id) REFERENCES address(address_id)
);


--------------------CUSTOMER ORDER TABLE DATA --------------------
INSERT INTO cust_order (customer_id, shipping_method_id, order_status_id, shipping_address_id, order_total) VALUES 
(1, 1, 3, 1, 3000.00), -- Oluwaseun Adeyemi's order
(2, 2, 2, 2, 4200.00), -- Wanjiku Kamau's order
(3, 3, 1, 3, 3300.00), -- Thabo Mbeki's order
(4, 4, 4, 4, 4000.00), -- Kwame Asante's order
(5, 5, 5, 5, 5900.00); -- Abebe Bekele's order





-------------------ORDER LINE TABLE -----------------------
CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);


-------------ORDER TABLE DATA -------------
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES 
(1, 1, 1, 2500.00), -- Oluwaseun ordered Half of a Yellow Sun
(2, 2, 1, 3200.00), -- Wanjiku ordered Wizard of the Crow
(3, 3, 1, 1800.00), -- Thabo ordered Things Fall Apart
(4, 4, 1, 1500.00), -- Kwame ordered Death and the King's Horseman
(5, 5, 1, 1900.00); -- Abebe ordered July's People


---------------ORDER HISTORY TABLE ----------------------------

CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    order_status_id INT NOT NULL,
    status_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);



------------ ORDER HISTORY TABLE DATA -----------------
INSERT INTO order_history (order_id, order_status_id, notes) VALUES 
(1, 1, 'Order placed via mobile app'),
(1, 2, 'Payment confirmed via M-Pesa'),
(1, 3, 'Order shipped via Sendy courier'),
(2, 1, 'Order placed via website'),
(2, 2, 'Processing for shipment'),
(3, 1, 'Awaiting payment confirmation'),
(4, 1, 'Order placed via in-store kiosk'),
(4, 2, 'Payment received'),
(4, 3, 'Order shipped via DHL Africa'),
(4, 4, 'Delivered to recipient'),
(5, 1, 'Order placed via phone'),
(5, 5, 'Cancelled due to stock unavailability');







------- USER MANAGEMENT AND SECURITY --------------------


-- created the database admin and granted the role all the priviledges

CREATE ROLE IF NOT EXISTS 'bookstore_admin';
GRANT ALL PRIVILEGES ON booktoredb.* TO 'bookstore_admin';


-- created sales staff role with table priviledges for  customer and order management


CREATE ROLE IF NOT EXISTS 'bookstore_sales';
GRANT SELECT, INSERT, UPDATE ON booktoredb.customer TO 'bookstore_sales';
GRANT SELECT, INSERT, UPDATE ON booktoredb.customer_address TO 'bookstore_sales';
GRANT SELECT ON booktoredb.address TO 'bookstore_sales';
GRANT SELECT, INSERT, UPDATE ON booktoredb.cust_order TO 'bookstore_sales';
GRANT SELECT, INSERT, UPDATE ON booktoredb.order_line TO 'bookstore_sales';
GRANT SELECT, INSERT, UPDATE ON booktoredb.order_history TO 'bookstore_sales';
GRANT SELECT ON booktoredb.order_status TO 'bookstore_sales';
GRANT SELECT ON booktoredb.shipping_method TO 'bookstore_sales';
GRANT SELECT ON booktoredb.book TO 'bookstore_sales';
GRANT SELECT ON booktoredb.author TO 'bookstore_sales';



-- created an Inventory staff role for book management

CREATE ROLE IF NOT EXISTS 'bookstore_inventory';
GRANT SELECT, INSERT, UPDATE, DELETE ON booktoredb.book TO 'bookstore_inventory';
GRANT SELECT, INSERT, UPDATE, DELETE ON booktoredb.author TO 'bookstore_inventory';
GRANT SELECT, INSERT, UPDATE, DELETE ON booktoredb.book_author TO 'bookstore_inventory';
GRANT SELECT, INSERT, UPDATE, DELETE ON booktoredb.publisher TO 'bookstore_inventory';
GRANT SELECT, INSERT, UPDATE, DELETE ON booktoredb.book_language TO 'bookstore_inventory';



-- Read-only role for reporting
CREATE ROLE IF NOT EXISTS 'bookstore_reporting';
GRANT SELECT ON booktoredb.* TO 'bookstore_reporting';


------ CREATED USERS AND ASSIGNED ROLES -----------------

-- Create application users and assign roles
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'admn12345!';
GRANT 'bookstore_admin' TO 'admin'@'localhost';

CREATE USER IF NOT EXISTS 'sales_user'@'localhost' IDENTIFIED BY 'SalesPass789!';
GRANT 'bookstore_sales' TO 'sales_user'@'localhost';

CREATE USER IF NOT EXISTS 'inventory_user'@'localhost' IDENTIFIED BY 'InvPass789!';
GRANT 'bookstore_inventory' TO 'inventory_user'@'localhost';

CREATE USER IF NOT EXISTS 'report_user'@'localhost' IDENTIFIED BY 'ReportPass321!';
GRANT 'bookstore_reporting' TO 'report_user'@'localhost';
-- Create application users and assign roles
CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY 'admn12345!';
GRANT 'bookstore_admin' TO 'admin'@'localhost';

CREATE USER IF NOT EXISTS 'sales_user'@'localhost' IDENTIFIED BY 'SalesPass789!';
GRANT 'bookstore_sales' TO 'sales_user'@'localhost';

CREATE USER IF NOT EXISTS 'inventory_user'@'localhost' IDENTIFIED BY 'InvPass789!';
GRANT 'bookstore_inventory' TO 'inventory_user'@'localhost';

CREATE USER IF NOT EXISTS 'report_user'@'localhost' IDENTIFIED BY 'ReportPass321!';
GRANT 'bookstore_reporting' TO 'report_user'@'localhost';








------------ SAMPLE QUERY  FOR TESTING-------------------------------------

--  Find all books by a specific author
SELECT b.book_id, b.title, b.isbn, b.price 
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
WHERE a.last_name = "Thiong'o";


-- List all customer orders with order details
SELECT 
    c.first_name, 
    c.last_name, 
    co.order_id, 
    co.order_date, 
    b.title, 
    ol.quantity, 
    ol.price, 
    os.status_name
FROM cust_order co
JOIN customer c ON co.customer_id = c.customer_id
JOIN order_line ol ON co.order_id = ol.order_id
JOIN book b ON ol.book_id = b.book_id
JOIN order_status os ON co.order_status_id = os.order_status_id
ORDER BY co.order_date DESC;



-- Calculate total sales by publisher
SELECT 
    p.publisher_name, 
    SUM(ol.quantity * ol.price) AS total_sales
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY p.publisher_id
ORDER BY total_sales DESC;



-- Find customers who haven't placed an order in the last 90 days

-- For this I used placeholder dates. 
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    c.email,
    MAX(co.order_date) AS last_order_date
FROM customer c
LEFT JOIN cust_order co ON c.customer_id = co.customer_id
GROUP BY c.customer_id
HAVING last_order_date < DATE_SUB(CURRENT_DATE, INTERVAL 90 DAY) OR last_order_date IS NULL;


-- List books that haven't been ordered yet
SELECT b.book_id, b.title, b.isbn
FROM book b
LEFT JOIN order_line ol ON b.book_id = ol.book_id
WHERE ol.order_id IS NULL;


--Find the most popular shipping method
SELECT 
    sm.method_name, 
    COUNT(co.order_id) AS times_used
FROM shipping_method sm
JOIN cust_order co ON sm.shipping_method_id = co.shipping_method_id
GROUP BY sm.shipping_method_id
ORDER BY times_used DESC
LIMIT 1;


-- Get detailed order history for a specific order
SELECT 
    oh.status_date, 
    os.status_name, 
    oh.notes
FROM order_history oh
JOIN order_status os ON oh.order_status_id = os.order_status_id
WHERE oh.order_id = 1
ORDER BY oh.status_date;



-- Calculate average book price by language
SELECT 
    bl.language_name, 
    AVG(b.price) AS average_price
FROM book b
JOIN book_language bl ON b.language_id = bl.language_id
GROUP BY bl.language_id;


-- List customer addresses with status
SELECT 
    c.first_name, 
    c.last_name, 
    a.street, 
    a.city, 
    a.state, 
    a.postal_code, 
    co.country_name, 
    ast.status_name
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN country co ON a.country_id = co.country_id
JOIN address_status ast ON ca.address_status_id = ast.address_status_id;



-- . The most valuable customers by year
SELECT 
    YEAR(co.order_date) AS order_year,
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(ol.quantity * ol.price) AS total_spent,
    COUNT(DISTINCT co.order_id) AS number_of_orders,
    SUM(ol.quantity * ol.price) / COUNT(DISTINCT co.order_id) AS average_order_value
FROM customer c
JOIN cust_order co ON c.customer_id = co.customer_id
JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY order_year, c.customer_id, c.first_name, c.last_name
ORDER BY order_year, total_spent DESC;


-- Books that haven't been sold in the last year
SELECT 
    b.book_id,
    b.title,
    b.publication_date,
    MAX(co.order_date) AS last_ordered_date,
    DATEDIFF(CURRENT_DATE, MAX(co.order_date)) AS days_since_last_order
FROM book b
LEFT JOIN order_line ol ON b.book_id = ol.book_id
LEFT JOIN cust_order co ON ol.order_id = co.order_id
GROUP BY b.book_id, b.title, b.publication_date
HAVING MAX(co.order_date) < DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR) OR MAX(co.order_date) IS NULL
ORDER BY last_ordered_date;



-- Customer registrations by year
SELECT 
    YEAR(creation_date) AS registration_year,
    COUNT(*) AS new_customers,
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM customer), 2) * 100 AS percentage_of_total
FROM customer
GROUP BY registration_year
ORDER BY registration_year;



-- Delivery performance by year (average days from order to delivery)
SELECT 
    YEAR(oh_order.status_date) AS order_year,
    AVG(DATEDIFF(oh_deliver.status_date, oh_order.status_date)) AS avg_delivery_days
FROM order_history oh_order
JOIN order_history oh_deliver ON oh_order.order_id = oh_deliver.order_id
WHERE oh_order.order_status_id = 1 -- Order placed
AND oh_deliver.order_status_id = 4 -- Delivered
GROUP BY order_year
ORDER BY order_year;



-- Year-over-year growth analysis
WITH yearly_sales AS (
    SELECT 
        YEAR(co.order_date) AS year,
        SUM(ol.quantity * ol.price) AS annual_revenue
    FROM cust_order co
    JOIN order_line ol ON co.order_id = ol.order_id
    GROUP BY YEAR(co.order_date)
)
SELECT 
    current.year,
    current.annual_revenue,
    previous.annual_revenue AS previous_year_revenue,
    (current.annual_revenue - previous.annual_revenue) AS absolute_change,
    ROUND(((current.annual_revenue - previous.annual_revenue) / previous.annual_revenue) * 100, 2) AS percentage_growth
FROM yearly_sales current
LEFT JOIN yearly_sales previous ON current.year = previous.year + 1
WHERE previous.year IS NOT NULL
ORDER BY current.year;



-- Customer retention analysis - identifying active customers vs dormant customers
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    MIN(co.order_date) AS first_order_date,
    MAX(co.order_date) AS most_recent_order,
    DATEDIFF(CURRENT_DATE, MAX(co.order_date)) AS days_since_last_order,
    CASE 
        WHEN DATEDIFF(CURRENT_DATE, MAX(co.order_date)) <= 180 THEN 'Active'
        WHEN DATEDIFF(CURRENT_DATE, MAX(co.order_date)) <= 365 THEN 'At Risk'
        ELSE 'Dormant'
    END AS customer_status
FROM customer c
JOIN cust_order co ON c.customer_id = co.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
ORDER BY days_since_last_order;




-- Seasonal bestsellers - which books sell best in different quarters
SELECT 
    YEAR(co.order_date) AS year,
    QUARTER(co.order_date) AS quarter,
    b.title,
    SUM(ol.quantity) AS copies_sold
FROM book b
JOIN order_line ol ON b.book_id = ol.book_id
JOIN cust_order co ON ol.order_id = co.order_id
GROUP BY year, quarter, b.title
ORDER BY year, quarter, copies_sold DESC;




--  Average order processing time over the years (from order to shipment)
SELECT 
    YEAR(oh1.status_date) AS order_year,
    AVG(TIMESTAMPDIFF(HOUR, oh1.status_date, oh2.status_date)) AS avg_processing_hours
FROM order_history oh1
JOIN order_history oh2 ON oh1.order_id = oh2.order_id
WHERE oh1.order_status_id = 1 -- Order placed
AND oh2.order_status_id = 3 -- Shipped
GROUP BY order_year
ORDER BY order_year;




-- Books sold by publication decade
SELECT 
    CONCAT(FLOOR(YEAR(b.publication_date) / 10) * 10, 's') AS decade,
    COUNT(ol.book_id) AS books_sold,
    SUM(ol.quantity * ol.price) AS revenue
FROM book b
JOIN order_line ol ON b.book_id = ol.book_id
JOIN cust_order co ON ol.order_id = co.order_id
GROUP BY decade
ORDER BY decade;



-- Monthly sales analysis for a specific year (2023)
SELECT 
    MONTH(co.order_date) AS order_month,
    MONTHNAME(co.order_date) AS month_name,
    SUM(ol.quantity * ol.price) AS monthly_revenue,
    COUNT(DISTINCT co.order_id) AS order_count
FROM cust_order co
JOIN order_line ol ON co.order_id = ol.order_id
WHERE YEAR(co.order_date) = 2023
GROUP BY order_month, month_name
ORDER BY order_month;




-- Sales trends by year - showing revenue by calendar year
SELECT 
    YEAR(co.order_date) AS order_year,
    SUM(ol.quantity * ol.price) AS total_revenue,
    COUNT(DISTINCT co.order_id) AS number_of_orders
FROM cust_order co
JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY YEAR(co.order_date)
ORDER BY order_year;



