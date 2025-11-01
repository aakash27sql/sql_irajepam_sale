# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: irajepam  
**Level**: Beginner  
**Database**: `life`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `life`.
- **Table Creation**: A table named `retail_sales` is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
CREATE DATABASE life;

CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```
### 2. While inserting, every column is converted (CAST) into the correct data type, so that the new table contains proper structured values.

      INSERT INTO Sales_Cleaned (
    transactions_id, sale_date, sale_time, customer_id,
    gender, age, category, quantiy,
    price_per_unit, cogs, total_sale
)
SELECT
    CAST(transactions_id AS INT),
    CAST(sale_date AS DATE),
    CAST(sale_time AS TIME),
    CAST(customer_id AS INT),
    CAST(gender AS VARCHAR(20)),
    CAST(age AS INT),
    CAST(category AS VARCHAR(20)),
    CAST(quantiy AS INT),
    CAST(price_per_unit AS FLOAT),
    CAST(cogs AS FLOAT),
    CAST(total_sale AS FLOAT)
FROM [sql1];


### 3. I want to replace my old table name with a new table name .

 -** EXEC sp_rename 'Sales_Cleaned', 'irajepam';

### 4. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql 

select count(*) from irajepam; -----------------------------records count

select COUNT(distinct customer_id) from irajepam;------ -----------count customer_id 

select category,count(*) from irajepam group by category;----------------------------Category Count

SELECT * FROM irajepam 
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantiy IS NULL OR price_per_unit IS NULL OR cogs IS NULL; -------------------------------search the null values

DELETE FROM irajepam
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantiy IS NULL OR price_per_unit IS NULL OR cogs IS NULL; ---------------------delete the null values

```

### 5. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
```sql

select*from irajepam where sale_date='2022-11-05'
```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
```sql 

select*from irajepam where sale_date='2022-11-05' and quantiy <4 and category='Clothing'  -------------------- retrieve all columns for sales made on '2022-11-05: and gategory

```

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
```sql
select category, sum(total_sale) as net_sale , count(*) as new_count from irajepam group by category;-------sum of total sale and count with category 

```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
select round(avg(age),2) as avg_age from irajepam where category='Beauty'----------------------find average age wih category 'beauty'

```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
```sql
select*from irajepam where total_sale > 1000 -----------------greater then total_sale 1000 
```

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
```sql
select gender,category ,count(*) as total_account from irajepam group by gender,category -----------total transaction with gender and category

```

7. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:
```sql
select YEAR(sale_date) as sale_year, MONTH(sale_date) as sale_month 
 , ROUND(AVG(total_sale), 2) AS avg_monthly_sale
from irajepam group by year(sale_date),month(sale_date)
order by sale_year,sale_month-----the average sale for Find out best selling month in each year

```

8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
```sql
select top 5 customer_id,sum(total_sale) as max_sale from irajepam group by customer_id ORDER BY max_sale desc-----the top 5 customers based on the highest total sales

```

9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
```sql
select count( distinct customer_id) as unique_id from irajepam where category='Beauty' ----the number of unique customers who purchased items from each category
```

10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:
```sql
select *,
case  
when DATEPART(hour,sale_time) <12 then 'morning'
when DATEPART(hour,sale_time) between 12 and 17 then 'morning'
else 'evening'
end as shift  
from irajepam;
```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

## Author - Zero Analyst

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!

### Stay Updated and Join the Community

For more content on SQL, data analysis, and other data-related topics, make sure to follow me on social media and join our community:


- **LinkedIn**: [Connect with me professionally](https://www.linkedin.com/in/aakash-nagaraj-42a447292)


Thank you for your support, and I look forward to connecting with you!
