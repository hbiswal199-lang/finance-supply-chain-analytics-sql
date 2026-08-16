/*As a product owner, I want to generate a report of individual product sales (aggregated on a monthly basis at the product code level) for Croma India customer for FY-2021 so that I can track individual product sales and run further product analytics on it in Excel.

The report should contain these fields:

Month
Product Name
Variant
Sold Quantity
Gross Price Per Item
Gross Price Total*/

SELECT 
    s.date AS month,
    p.product AS product_name,
    p.variant,
    SUM(s.sold_quantity) AS sold_quantity,
    g.gross_price AS gross_price_per_item,
    ROUND(SUM(s.sold_quantity * g.gross_price), 2) AS gross_price_total
FROM fact_sales_monthly s
JOIN dim_product p
    ON s.product_code = p.product_code
JOIN dim_customer c
    ON s.customer_code = c.customer_code
JOIN fact_gross_price g
    ON g.fiscal_year = s.fiscal_year
    AND g.product_code = s.product_code
WHERE c.customer = 'Croma'
  AND s.fiscal_year = 2021
GROUP BY
    s.date,
    p.product,
    p.variant,
    g.gross_price
ORDER BY s.date;
 ------------------------------------------------------
 # get_monthly_gross_sales_for_customer
    SELECT 
   s.date,
   sum(round(s.sold_quantity * g.gross_price,2)) as monthly_sales
FROM gdb0041.fact_sales_monthly s
join fact_gross_price g
on g.product_code = s.product_code and
g.fiscal_year = get_fiscal_year(s.date)
where 
   find_in_set(s.customer_code,in_customer_codes)>0
group by s.date
order by s.date asc;

--------------------------------------------------------------------------------
/* Create a stored proc that can determine the market badge based on the following logic,
if total sold quantity > 5 million that market is considered gold else it is silver
my input will be ,
1.market
.fiscal year
output
1.market badge*/

SELECT 
    SUM(s.sold_quantity) into qty
   FROM fact_sales_monthly s
JOIN dim_customer c
    ON s.customer_code = c.customer_code
 WHERE get_fiscal_year(s.date) = in_fiscal_year
  and c.market = in_market;
  
#determine market badge
 if qty > 5000000 then
    set out_badge = "Gold";
 else
   set out_badge = "silver";
 end if;
 
 #get_top_n_markets_by_net_sales
 
 SELECT 
   market,
   round(sum(net_sales)/1000000,2) as net_sales_mln
 FROM gdb0041.net_sales
 where fiscal_year = in_fiscal_year
 group by market
 order by net_sales_mln desc
 limit in_top_n;
 
#topn product by net_sales

SELECT 
   product,
   round(sum(net_sales)/1000000,2) as net_sales_mln
 FROM gdb0041.net_sales N
 where fiscal_year = in_fiscal_year 
 group by product
 order by net_sales_mln desc
 limit in_top_n;
 
 #get_topn_customer_netsales
 SELECT 
   c. customer,
   round(sum(net_sales)/1000000,2) as net_sales_mln
 FROM gdb0041.net_sales N
 join dim_customer c
 on
    n.customer_code=c.customer_code
 where fiscal_year = in_fiscal_year and N.market=in_market
 group by c.customer
 order by net_sales_mln desc
 limit in_top_n;
 
 #Net sales % share Global
 #as a product owner i want to see a bar chart report for fy=2021 for top 10 markets by net sales 
WITH cte1 AS (
    SELECT
        c.customer,
        ROUND(SUM(s.net_sales) / 1000000, 2) AS net_sales_mln
    FROM net_sales s
    JOIN dim_customer c
        ON s.customer_code = c.customer_code
    WHERE s.fiscal_year = 2021
    GROUP BY c.customer
)
SELECT
    *,
    net_sales_mln*100/sum(net_sales_mln) over() as pct
FROM cte1
order by net_sales_mln desc;

#get_topn_products_per_division_by_qty_sold
WITH cte1 AS (
    SELECT
        p.division,
        p.product,
        SUM(s.sold_quantity) AS total_qty
    FROM fact_sales_monthly s
    JOIN dim_product p
        ON p.product_code = s.product_code
    WHERE s.fiscal_year = in_fiscal_year
    GROUP BY p.division, p.product
),
 cte2 as (
SELECT
    *,
    DENSE_RANK() OVER (
        PARTITION BY division
        ORDER BY total_qty 
    ) AS drnk
FROM cte1)
select * from cte2 where drnk <= in_top_n;

# Net sales by per region
with cte2 as(
  SELECT
        c.customer,
        c.region,
        ROUND(SUM(s.net_sales) / 1000000, 2) AS net_sales_mln
    FROM net_sales s
    JOIN dim_customer c
        ON s.customer_code = c.customer_code
    WHERE s.fiscal_year = 2021
    GROUP BY c.customer,c.region)
SELECT
    *,
    round(net_sales_mln*100/sum(net_sales_mln) over(partition by region),2) as pct_by_region
FROM cte2
order by region,net_sales_mln desc;

# Used cased of Dense Rank
with cte1 as (
select 
	c.market,
    c.region,
    round(sum(sold_quantity*gross_price/1000000),2) as gross_price_mln
    from fact_sales_monthly s
    join fact_gross_price g
    on 
    s.product_code = g. product_code and
    s.fiscal_year = g.fiscal_year
    join  dim_customer c
    on 
    c.customer_code = s.customer_code
	group by c.market,c.region
    order by gross_price_mln desc),
    
cte2 as (select 
      * ,
      dense_rank() over(partition by region order by gross_price_mln desc) as drnk 
 from cte1)
 
 select *from cte2
 where drnk <= 2
 
 



    