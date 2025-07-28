use instant
go

-- Total Customers
select count(*) as Customers
from dbo.shopping_trends

-- Total Sales
select sum(Purchase_Amount_USD) as Total_Sales
from dbo.shopping_trends

-- Average Order Value
select round(sum(Purchase_Amount_USD) / count(*),2) Avg_Order_Value
from dbo.shopping_trends

-- Most Gender Pay 
select Gender , sum(Purchase_Amount_USD)
from dbo.shopping_trends
group by Gender


select Size , sum(Purchase_Amount_USD) as Total_Sales
from dbo.shopping_trends
group by Size
order by Total_Sales desc

select top 15 item_Purchased , sum(Purchase_Amount_USD) as Total_Sales , round(AVG(Review_Rating),2) as Customer_Review
from dbo.shopping_trends
group by item_Purchased
order by Total_Sales desc 

select Category , sum(Purchase_Amount_USD) as Total_Sales , round(AVG(Review_Rating),2) as Customer_Review
from dbo.shopping_trends
group by Category
order by Total_Sales desc 

select top 15 Location , sum(Purchase_Amount_USD) as Total_Sales , round(AVG(Review_Rating),2) as Customer_Review
from dbo.shopping_trends
group by Location
order by Total_Sales desc 

select Season , sum(Purchase_Amount_USD) as Total_Sales , round(AVG(Review_Rating),2) as Customer_Review
from dbo.shopping_trends
group by Season
order by Total_Sales desc

select Shipping_Type , count(*) as Counts , round(AVG(Review_Rating),2) as Customer_Review
from dbo.shopping_trends
group by Shipping_Type
order by Counts desc


select Payment_Method , count(*) as Counts
from dbo.shopping_trends
group by Payment_Method
order by Counts desc


select Subscription_Status , count(*) as Counts
from dbo.shopping_trends
group by Subscription_Status
order by Counts desc

select Discount_Applied , count(*) as Counts
from dbo.shopping_trends
group by Discount_Applied
order by Counts desc


select Promo_Code_Used , count(*) as Counts
from dbo.shopping_trends
group by Promo_Code_Used
order by Counts desc

select Season , Category , sum(Purchase_Amount_USD) as Total_Sales
from dbo.shopping_trends
group by Season , Category
order by Season


select Category , Promo_Code_Used , count(*) as Counts
from dbo.shopping_trends
group by Category , Promo_Code_Used
order by Counts desc

select Gender , Category , count(*) as Counts
from dbo.shopping_trends
group by Gender , Category
order by Gender , Category desc


with Rating as (
select Review_Rating , 
case
	when Review_Rating >= 3 then 'Good'
	else 'Bad'
end as Customer_Rating
from dbo.shopping_trends)

select Customer_Rating , count(*) as Counts 
from Rating
group by Customer_Rating
order by Counts desc

select Frequency_of_Purchases , sum(Purchase_Amount_USD) , count(*) as Counts
from dbo.shopping_trends
group by Frequency_of_Purchases
order by Counts desc


with avg_age as (
    select Category,
        case
            when Age >= 20 AND Age < 40 then '20-39'
            when Age >= 40 AND Age < 60 then '40-59'
            when Age >= 60 AND Age < 80 then '60-79'
            when Age >= 80 then '80+'
            else 'Under 20'
        end as Age_Group
    FROM dbo.shopping_trends 
)

select Category , Age_Group , count(*) Counts
from avg_age
group by Category , Age_Group
order by Category , Counts desc
