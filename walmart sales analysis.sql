use walmart_db;
select * from walmart_clean_data

select count(*) from walmart_clean_data;

select distinct payment_method from walmart_clean_data


select payment_method,
count(*)
from walmart_clean_data
group by payment_method;

select count(distinct branch) as total_branches
from walmart_clean_data

select max(quantity),
min(quantity)
from walmart_clean_data;

-- Business Problems
/* 1. Analyze Payment Methods and Sales
● Question: What are the different payment methods, and how many transactions and
items were sold with each method?
● Purpose: This helps understand customer preferences for payment methods, aiding in
payment optimization strategies. */

select payment_method, count(*) as total_transactions,
sum(quantity) as no_of_items_sold
from walmart_clean_data
group by payment_method;

/* 2. Identify the Highest-Rated Category in Each Branch
● Question: Which category received the highest average rating in each branch?
● Purpose: This allows Walmart to recognize and promote popular categories in specific
branches, enhancing customer satisfaction and branch-specific marketing.
*/
-- avg rating
with cte as (
	select branch,
	category,
	AVG(rating) as avg_rating,
	rank() over (partition by branch order by avg(rating) desc) as rn
	from walmart_clean_data
	group by branch,category
)
select * from cte
where rn=1
order by branch, avg_rating desc;

/* 3. Determine the Busiest Day for Each Branch
● Question: What is the busiest day of the week for each branch based on transaction
volume?
● Purpose: This insight helps in optimizing staffing and inventory management to
accommodate peak days.
*/
with cte as (
	select branch,DATENAME(WEEKDAY,date) as week_day, count(*) as no_of_transactions,
	rank() over (partition by branch order by count(*) desc) as rn
	from walmart_clean_data
	group by branch, DATENAME(WEEKDAY,date)
	
)
select * from cte
where rn=1

/* 4. Calculate Total Quantity Sold by Payment Method
● Question: How many items were sold through each payment method?
● Purpose: This helps Walmart track sales volume by payment type, providing insights
into customer purchasing habits. */

select payment_method,sum(quantity) as no_of_items
from walmart_clean_data
group by payment_method;

/* 5. Analyze Category Ratings by City
● Question: What are the average, minimum, and maximum ratings for each category in
each city?
● Purpose: This data can guide city-level promotions, allowing Walmart to address
regional preferences and improve customer experiences. */

select city,
category,
AVG(rating) as avg_rating,
min(rating) as min_rating,
max(rating) as max_rating
from walmart_clean_data
group by city,category

/* Q6. Calculate Total Profit by Category
● Question: What is the total profit for each category, ranked from highest to lowest?
● Purpose: Identifying high-profit categories helps focus efforts on expanding these
products or managing pricing strategies effectively. */

select category,
sum(total*profit_margin) as total_profit
from walmart_clean_data
group by category
order by total_profit desc;

/* Q7. Determine the Most Common Payment Method per Branch
● Question: What is the most frequently used payment method in each branch?
● Purpose: This information aids in understanding branch-specific payment preferences,
potentially allowing branches to streamline their payment processing systems.
*/
with cte as (
	select branch,payment_method, 
	count(*) as total_trans,
	RANK() over (partition by branch order by count(*) desc) as rn
	from walmart_clean_data
	group by branch,payment_method
)
select branch,payment_method
from cte
where rn=1;

/* 8. Analyze Sales Shifts Throughout the Day
● Question: How many transactions occur in each shift (Morning, Afternoon, Evening)
across branches?
● Purpose: This insight helps in managing staff shifts and stock replenishment schedules,
especially during high-sales periods. */select branch,case when datepart(hour,time) < 12 then 'Morning' when datepart(hour,time) between 12 and 17 then 'Afternoon' else 'Evening'end as shift_time, count(*) as no_of_transactionsfrom walmart_clean_datagroup by branch, case when datepart(hour,time) < 12 then 'Morning' when datepart(hour,time) between 12 and 17 then 'Afternoon' else 'Evening'endorder by branch,no_of_transactions desc/* 9. Identify Branches with Highest Revenue Decline Year-Over-Year
● Question: Which branches experienced the largest decrease in revenue compared to
the previous year?
● Purpose: Detecting branches with declining revenue is crucial for understanding
possible local issues and creating strategies to boost sales or mitigate losses. */-- rdr == last_rev - cr_rev/ last_rev * 100with cte2022 as (	select 	branch as branch22,	datepart(YEAR,date) as year2022,	sum(total) as last_year_revenue	from walmart_clean_data	where datepart(YEAR,date)=2022	group by branch,datepart(YEAR,date)),cte2023 as 	(select 	branch as branch23, datepart(YEAR,date) as year2023, sum(total) as current_year_revenue	from walmart_clean_data	where datepart(YEAR,date)=2023	group by branch,datepart(YEAR,date))select top 5 t2.branch23,round((last_year_revenue-current_year_revenue)*100.0/last_year_revenue,2) as rev_dec_ratiofrom cte2022 t1 inner join cte2023 t2on t1.branch22=t2.branch23where last_year_revenue>current_year_revenueorder by rev_dec_ratio desc