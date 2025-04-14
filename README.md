# Bookstore Database Management System

The Bookstore Database Management System is a project created to help learners understand how to manage and structure databases for real-world applications. The system simulates how a bookstore manages books, authors, customers, orders, and shipping.

This project gives learners practical experience in designing and working with relational databases using MySQL.

## Objective

This project helps learners understand and apply key database concepts, including:

- Creating and organizing tables for bookstore data.
- Defining relationships between tables (e.g., books and authors, customers and orders).
- Normalizing data to remove redundancy and improve data integrity.
- Writing SQL queries to retrieve, update, and manage data.

By completing this project, learners will strengthen their skills in database design and SQL, which are essential for software development and data management roles.



## Contributors

1.⁠ ⁠Isaac Karanja
2. George Lecha
3. Stephen Onyango


## Entity-Relationship Diagram (ERD) Concepts##


## For a bookstore database, we need to establish these key relationships##

- Books can have multiple authors (many-to-many)
- Customers can have multiple addresses
- Orders contain multiple books
- Orders have status history



## Relationships

## Book Relationships

- A book is written in one language (book → book_language: Many-to-One)
- A book is published by one publisher (book → publisher: Many-to-One)
- A book can have multiple authors and an author can write multiple books (book ↔ author: Many-to-Many through book_author)


## Customer Relationships##

- A customer can have multiple addresses and an address can be used by multiple customers (customer ↔ address: Many-to-Many through customer_address)
- An address is located in one country (address → country: Many-to-One)
- A customer address has one status (customer_address → address_status: Many-to-One)


## Order Relationships##

- An order belongs to one customer (cust_order → customer: Many-to-One)
- An order uses one shipping method (cust_order → shipping_method: Many-to-One)
- An order has one current status (cust_order → order_status: Many-to-One)
- An order is shipped to one address (cust_order → address: Many-to-One)
- An order can contain multiple books and a book can be in multiple orders (cust_order ↔ book: Many-to-Many through order_line)
- An order has multiple status history entries (order_history → cust_order: Many-to-One)
- Each history entry refers to one status (order_history → order_status: Many-to-One)

