# 💼 Business Problems Solved

This project focuses on solving practical business problems across **Finance, Sales, and Supply Chain Analytics** using SQL.

### 📊 1. Product-Level Sales Analysis

**Business Problem:**
The business needs to track individual product sales on a monthly basis for key customers.

**Solution:**

* Generated monthly product-level sales reports.
* Analyzed sold quantity by product and variant.
* Calculated gross price per item.
* Calculated total gross sales value.
* Created customer-specific sales reports such as Croma India FY-2021.

---

### 👥 2. Customer & Market Performance

**Business Problem:**
The business needs to understand customer-level and market-level sales performance.

**Solution:**

* Analyzed customer-wise sales.
* Compared performance across markets.
* Identified high-performing customers.
* Analyzed product performance by customer and market.

---

### 🎯 3. Forecast vs Actual Analysis

**Business Problem:**
Forecasted demand may differ significantly from actual customer demand, leading to inventory and supply-chain issues.

**Solution:**

Calculated:

* Forecast Quantity
* Sold Quantity
* Net Error
* Net Error %
* Absolute Error
* Absolute Error %
* Forecast Accuracy

---

### 📈 4. Forecast Accuracy Analysis

**Business Problem:**
The business needs to measure how accurately demand is being forecasted.

**Solution:**

Calculated forecast accuracy using:

```text
Forecast Accuracy = 100% - Absolute Error %
```

Forecast accuracy is capped at **0%** when the absolute error exceeds 100%.

---

### 🔄 5. Year-over-Year Forecast Comparison

**Business Problem:**
The business needs to identify customers whose forecast accuracy has declined compared with the previous fiscal year.

**Solution:**

* Created separate FY-2020 and FY-2021 forecast accuracy datasets.
* Used temporary tables to store the results.
* Joined both years using `customer_code`.
* Compared forecast accuracy year-over-year.
* Identified customers with declining forecast performance.

---

### 🏆 6. Product & Customer Ranking

**Business Problem:**
Business teams need to quickly identify top and bottom-performing products and customers.

**Solution:**

Used SQL window functions including:

* `RANK()`
* `DENSE_RANK()`
* `ROW_NUMBER()`
* `PARTITION BY`

to rank products and customers based on business metrics.

---

### ♻️ 7. Reusable Business Reporting

**Business Problem:**
Complex queries may need to be executed repeatedly for business reporting.

**Solution:**

Used:

* Views
* Stored Procedures
* SQL Functions
* CTEs

to create reusable SQL logic and simplify recurring analysis.

---

### ⏰ 8. Database Automation

**Business Problem:**
Recurring database tasks may require manual execution.

**Solution:**

Used **MySQL Events** to understand and implement scheduled database operations and recurring tasks.

---

### ⚡ 9. Query Performance Optimization

**Business Problem:**
Queries can become slower when working with large datasets.

**Solution:**

Used database indexes to improve query performance, particularly on frequently filtered columns such as fiscal year.

Example:

```sql
CREATE INDEX idx_fyear
ON fact_act_est(fiscal_year);
```

---

### 🔐 10. Database Security & Access Control

**Business Problem:**
Different users require different levels of access to business data.

**Solution:**

Worked with SQL access-control concepts including:

* `CREATE USER`
* `GRANT`
* `REVOKE`
* User privileges
* Database-level permissions
* Table-level permissions

---

# 🔑 SQL Concepts Demonstrated

This project demonstrates practical SQL concepts used for **data analysis, database management, business reporting, performance optimization, automation, and security**.

### 📌 Basic SQL

* `SELECT`
* `DISTINCT`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* `HAVING`
* `LIMIT`
* `BETWEEN`
* `IN`
* `LIKE`
* `IS NULL`
* `IS NOT NULL`
* Comparison Operators
* Logical Operators (`AND`, `OR`, `NOT`)

### 🔗 SQL Joins

* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`
* Joining multiple tables
* Joining tables using multiple conditions
* Handling unmatched records
* Cartesian / Cross Join

### 📊 Aggregate & Analytical Functions

* `SUM()`
* `COUNT()`
* `AVG()`
* `MIN()`
* `MAX()`
* `ROUND()`
* `ABS()`
* `STDDEV()`
* Aggregate calculations
* Percentage calculations

### 🧠 Advanced SQL

* Common Table Expressions (CTEs)
* Subqueries
* Correlated Subqueries
* Temporary Tables
* `CASE` Statements
* Conditional Calculations
* `IF()` Functions
* `UNION`
* `UNION ALL`

### 📈 Window Functions & Ranking

* `RANK()`
* `DENSE_RANK()`
* `ROW_NUMBER()`
* `PARTITION BY`
* Window-based calculations
* Product ranking
* Customer ranking
* Year-over-year analysis

### 👁️ Views

* Creating Views
* Querying Views
* Reusable SQL logic
* Simplifying complex queries
* Reporting-oriented Views

### ⚙️ Stored Procedures

* Creating Stored Procedures
* Input Parameters
* Calling Stored Procedures
* Reusable business logic
* Reporting and data-processing procedures

### 🔧 SQL Functions

* Creating SQL Functions
* Input Parameters
* Returning calculated values
* Reusable calculations
* User-defined functions

### ⏰ Events

* Creating SQL Events
* Scheduled database operations
* Recurring tasks
* Database automation
* Event scheduling

### 🚀 Indexing & Query Performance

* Creating Indexes
* Primary Keys
* Composite Indexes
* Indexing frequently filtered columns
* Query performance optimization
* Understanding database indexing

### 🔐 Database Security & Access Control

* `CREATE USER`
* `GRANT`
* `REVOKE`
* User privileges
* Database-level permissions
* Table-level permissions
* `SELECT` access
* Database access control

### 🗃️ Database & Table Management

* `CREATE DATABASE`
* `CREATE TABLE`
* `CREATE TEMPORARY TABLE`
* `ALTER TABLE`
* `DROP TABLE`
* `TRUNCATE`
* Adding and modifying columns
* Primary Keys
* Foreign Keys
* Constraints
* Data Types

### 🔄 Data Manipulation

* `INSERT`
* `UPDATE`
* `DELETE`
* Conditional Updates
* Data modification using joins

### 📅 Date & Time Analysis

* Date filtering
* Fiscal year analysis
* Monthly aggregation
* Date functions
* Year-over-year comparisons
* Fiscal year-based reporting

### 📐 Finance & Supply Chain Analytics

* Sales Analysis
* Customer Analysis
* Product Analysis
* Market Analysis
* Gross Price Analysis
* Forecast vs Actual Analysis
* Net Error
* Net Error %
* Absolute Error
* Absolute Error %
* Forecast Accuracy
* Year-over-Year Performance
* Customer Performance Analysis
* Product-Level Analysis
* Demand Forecasting Analysis

---

# 🎯 Learning Outcomes

Through this project, I gained hands-on experience in using SQL not only for querying and analyzing data, but also for **database management, performance optimization, automation, security, and business intelligence**.

### Key Skills Developed

* 📊 Analyzing large business datasets using SQL
* 🔗 Combining multiple relational tables using joins
* 🧠 Writing complex queries using CTEs and subqueries
* 📈 Performing ranking and year-over-year analysis
* 🎯 Measuring forecast accuracy and forecast errors
* 🏆 Analyzing customer and product performance
* ⚡ Improving query performance using indexes
* ♻️ Building reusable logic using Views, Functions, and Stored Procedures
* ⏰ Automating recurring database tasks using Events
* 🔐 Managing database users and access permissions
* 🗃️ Creating and managing database objects
* 💼 Translating business requirements into SQL solutions

### 🚀 Overall Learning

This project strengthened my ability to apply SQL to **real-world Finance, Sales, and Supply Chain Analytics problems**, while developing a deeper understanding of both **data analysis and database management**.

The project demonstrates how SQL can be used to transform raw transactional data into **structured reports, performance metrics, and actionable business insights** that support data-driven decision-making.
