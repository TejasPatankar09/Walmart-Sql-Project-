Drop Schema  SalesDataWalmart;
uSE SALESDATAWALMART;
Drop database Walmart1;
Drop Database Walmart;
Create Schema SalesDataWalmart;
Create Database Walmart;
Use WALMART;


Create Table if not exists Sales (
invoice_id  varchar(30) NOT NULL primary key ,
Branch varchar (5) not null,
City varchar (30) not null,
Customer_type varchar (30) not null,
gender varchar (10),
product_line varchar (100) not null,
unit_price Decimal (10,2) not null,
quantity int not null,
Tax5 Float(6,4) not null,
Total Decimal(12,4) not null,
date datetime not null,
time Time not null,
Payment varchar (15) not null,
cogs decimal (10,2) not null,
gross_margin_percentage FLOAT(11, 9) not null,
gross_income decimal (12,2) not null,
rating float (2,1)
);
Select * From Sales;
SELECT 
    time,
    CASE
        WHEN CAST(time AS TIME) BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN CAST(time AS TIME) BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_date #Adding Time of date column .
    from Sales;
    
    alter table sales
Add column time_of_Day varchar(20);
Update sales
Set time_of_day = (
CASE
        WHEN CAST(time AS TIME) BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN CAST(time AS TIME) BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END 
    );
    Select date ,
    dayname(date) as Day_Name
    from Sales; #Adding days to the column.	
    alter table sales 
Add column Day_name varchar(20);
update sales
Set day_name = dayname(date) ;
Select* from sales;
select date,
monthname(date)
from sales;
alter table sales
Add column Monthname varchar(20);
update sales
Set month_name = monthname(date) ;
Select * from sales;
ALTER TABLE Sales
DROP COLUMN Monthname;
select * from Sales; 

Select *from Sales;
Select
date ,
monthname(date)
from Sales;
Alter table Sales add column month_name varchar(20);
update sales
set month_name =monthname(date);
#----------------------------------------------------------#
#how many cities does the data have ?
select
      Distinct City 
      From sales;
      #So the answer is 3 cities
# how many Branches does the data have ?
Select	
      Distinct Branch 
      from Sales;
      #There are 3 branches .
      
Select	
      Distinct City ,
      Branch 
      from Sales;
     -- ------------------------------------------- 
     #How many product lines does the data have ?
     Select 
         Distinct Product_Line
         From Sales;
         Select 
         Count( Payment)
         From Sales;
         
         #What is the most selling product Line 
  Select 
	PRODUCT_lINE ,
    count(Product_Line) as cnt 
    From Sales 
    Group By Product_Line 
    Order by  cnt Desc ;
    
   # What is the Total Revenue by Month?
   Select 
        month_name as Month ,
        SUM(TOTAL) AS Total_Revenue
        From Sales
        group by Month_name
        Order by  total_revenue;
     
     #Which Month had the largest Cogs
     Select
     month_name as month ,
     Sum(COGS) AS COGS
     fROM SALES
     group by month_name
     Order BY cOGS dESC;
     #Which Product Line had the largest revenue?
     Select
     Product_Line as Product_Line,
     Sum(Total) as Total_Revenue 
 fROM sales
 gROUP BY PRODUCT_lINE 
 oRDER BY TOTAL_rEVENUE DESC;
 #wHICH cITY HAS LARGEST REVENUE 
 select
 Branch,
 City ,
 sUM(TOTAL) AS Total_Revenue
 from sales
 Group by City ,branch
 Order By Total_Revenue desc;
 
# Which Product line has largest Vat 
 Select
     Product_Line as Product_Line,
     avg(Tax5) as average_Tax
 fROM sales
 gROUP BY PRODUCT_lINE 
 oRDER BY Average_Tax DESC;
 
 #Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
 select
 branch,
 sum(Quantity) as Qty
 From sALES
 Group by branch 
 having Sum(quantity) > (select avg (Quantity) from Sales);


     

     
	
       
      Select *from Sales;  