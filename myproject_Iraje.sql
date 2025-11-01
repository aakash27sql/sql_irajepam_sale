use life;---------------------------------------my database name 

USE life;
GO
SELECT name FROM sys.tables;------------------------------it's showing tables


select*from Sales_Cleaned

CREATE TABLE Sales_Cleaned (
    transactions_id INT,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(20),
    age INT,
    category VARCHAR(20),
    quantiy INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
); -------------------------------------------i have created the table 


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



FROM [sql1];------------------------------------ Replace with my old table name

EXEC sp_rename 'Sales_Cleaned', 'irajepam';---------------------------Replace with my old table name 

drop table irajepam;

select*from irajepam -----------------------------------run 





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




select*from irajepam where sale_date='2022-11-05' and quantiy <4 and category='Clothing' -------------------- retrieve all columns for sales made on '2022-11-05: and gategory

select*from irajepam where category='Clothing' and format(sale_date,'YYYY-MM')='2022-11-05' and quantiy <4




select category, sum(total_sale) as net_sale , count(*) as new_count from irajepam group by category;-------sum of total sale and count with category 


select round(avg(age),2) as avg_age from irajepam where category='Beauty'----------------------find average age wih category 'beauty'

select*from irajepam where total_sale > 1000 -----------------greater then total_sale 1000 

select gender,category ,count(*) as total_account from irajepam group by gender,category -----------total transaction with gender and category



select YEAR(sale_date) as sale_year, MONTH(sale_date) as sale_month 
 , ROUND(AVG(total_sale), 2) AS avg_monthly_sale
from irajepam group by year(sale_date),month(sale_date)


order by sale_year,sale_month ---------------------------------the average sale for Find out best selling month in each year

select top 5 customer_id,sum(total_sale) as max_sale from irajepam group by customer_id ORDER BY max_sale desc ------------------the top 5 customers based on the highest total sales

select count( distinct customer_id) as unique_id from irajepam where category='Beauty' ----the number of unique customers who purchased items from each category

select *,
case  
when DATEPART(hour,sale_time) <12 then 'morning'
when DATEPART(hour,sale_time) between 12 and 17 then 'morning'
else 'evening'
end as shift  
from irajepam;
