-- BASIC FILTERING TASKS (WHERE CLAUSE)

-- Task 1: Find all maritime sites in Glasgow that were converted after the year 2000
select site_name, year_of_conversion
from maritime_sites
where year_of_conversion > 2000;

-- Task 2: List all creative industry companies that have more than 50 employees and were founded after 2010
select company_name, employees_count, founding_year
from creative_industries
where employees_count > 50 and founding_year > 2010;

-- Task 3: Identify all heritage tourism data for North African countries with trade volumes exceeding 300 million
select*
from market_comparison
where trade_volume > 300000000 and region = 'North Africa' and sector = 'Heritage Tourism';

-- AGGREGATION TASKS (GROUP BY)

-- Task 4: Calculate the total number of employees, average revenue, and number of companies for each industry type
select industry_type, sum(employees_count) , avg(annual_revenue), count(company_name)
from creative_industries
group by industry_type;


-- Task 5: Find the total visitor count and tourism revenue for each site by quarter in 2022
select site_id, quarter, year, sum(visitor_count), sum(tourism_revenue) 
from economic_impact
group by site_id, quarter, year
having year = 2022
;

-- Task 6: Calculate the average trade volume, growth rate, and market share for each region and sector combination
select region, sector, avg(trade_volume), avg(growth_rate), sum(market_share)
from market_comparison
group by region, sector
order by region asc;

-- Task 7: Match all maritime sites with their corresponding creative industries
select maritime_sites.site_id as Site_id, site_name, industry_type
from maritime_sites
join creative_industries
on maritime_sites.site_id = creative_industries.site_id;

-- Task 8: List all maritime sites and any associated economic impact data (include sites without impact data)
select *
from maritime_sites
left join economic_impact
on maritime_sites.site_id = economic_impact.site_id;

-- Task 9: Show all creative industries along with site information, including industries not currently associated with any site
select*
from maritime_sites
right join creative_industries
on maritime_sites.site_id;

-- Task 10: Create a comprehensive view of all possible site and industry combinations, even where no matches exist ( we used full outer join equivalent in MYSQL : Union of left and right joins)
SELECT 
    ms.site_id, 
    ms.site_name, 
    ms.city, 
    ms.country,
    ci.industry_id, 
    ci.company_name, 
    ci.industry_type,
    ci.employees_count
FROM maritime_sites ms
LEFT JOIN creative_industries ci 
ON ms.site_id = ci.site_id

UNION

SELECT 
    ms.site_id, 
    ms.site_name, 
    ms.city, 
    ms.country,
    ci.industry_id, 
    ci.company_name, 
    ci.industry_type,
    ci.employees_count
FROM maritime_sites ms
RIGHT JOIN creative_industries ci 
ON ms.site_id = ci.site_id
WHERE ms.site_id IS NULL;

-- Task 11: Find all creative industries located at sites that have more than 100,000 annual visitors
select distinct industry_type, site_id
from creative_industries
where site_id in
(select site_id
from economic_impact
where visitor_count > 100000)
;

-- Task 12: List the sites that have higher than average tourism revenue
select site_id, sum(tourism_revenue) as sum_revenue, 
(select avg(tourism_revenue)
from economic_impact) as Avg_revenue
from economic_impact
group by site_id
having sum(tourism_revenue) > Avg_revenue;

-- Task 13: Find countries with higher growth rates than the average growth rate for their region (correlated subqueries : to be learned)

-- select country, growth_rate,
-- (select region, avg(growth_rate) as avg_region_growth
-- from market_comparison
-- group by region) 
-- from market_comparison
-- having growth_rate > avg_region_growth;
SELECT 
    country,
    region,
    AVG(growth_rate) AS country_avg_growth_rate,
    (SELECT AVG(growth_rate) 
     FROM market_comparison mc2 
     WHERE mc2.region = mc1.region) AS region_avg_growth_rate
FROM market_comparison mc1
GROUP BY country, region
HAVING country_avg_growth_rate > region_avg_growth_rate;

-- Task 15: For each country, find other countries in the same region with similar market shares (within 2%) - self join to be searched
SELECT 
    a.country AS country1,
    b.country AS country2,
    a.region,
    a.sector,
    ROUND(AVG(a.market_share), 2) AS country1_market_share,
    ROUND(AVG(b.market_share), 2) AS country2_market_share,
    ROUND(ABS(AVG(a.market_share) - AVG(b.market_share)), 2) AS market_share_difference
FROM market_comparison a
JOIN market_comparison b ON a.region = b.region 
                       AND a.sector = b.sector
                       AND a.country < b.country  -- Avoid duplicate pairs and self-matches
WHERE ABS(a.market_share - b.market_share) <= 2.0
GROUP BY a.country, b.country, a.region, a.sector
ORDER BY a.region, a.sector, market_share_difference;

-- Task 16: Use a CTE to rank countries within each region based on their trade volumes, then select the top 2 from each region
with cte_rank as
(select region, country, sum(trade_volume) as total_trade_volume,
rank() over (partition by region order by sum(trade_volume) desc) as ranking
from market_comparison
group by region, country)
select region,country, total_trade_volume, ranking
from cte_rank
where ranking <= 2
order by region, country
 ;
 
-- Task 17: Use multiple CTEs to analyze the relationship between site area, number of creative industries, and visitor counts

WITH SiteAreas AS (
    -- CTE 1: Calculate site areas and normalize them
    SELECT 
        site_id,
        site_name,
        area_sqm,
        area_sqm / AVG(area_sqm) OVER () AS relative_size
    FROM maritime_sites
),
IndustryCounts AS (
    -- CTE 2: Count the creative industries per site
    SELECT 
        site_id,
        COUNT(*) AS industry_count,
        SUM(employees_count) AS total_employees
    FROM creative_industries
    GROUP BY site_id
),
VisitorData AS (
    -- CTE 3: Aggregate visitor data for 2022
    SELECT 
        site_id,
        SUM(visitor_count) AS annual_visitors,
        SUM(tourism_revenue) AS annual_revenue
    FROM economic_impact
    WHERE year = 2022
    GROUP BY site_id
)
-- Final query joining all CTEs together
SELECT 
    sa.site_name,
    sa.area_sqm,
    sa.relative_size,
    COALESCE(ic.industry_count, 0) AS number_of_industries,
    COALESCE(ic.total_employees, 0) AS total_employees,
    COALESCE(vd.annual_visitors, 0) AS annual_visitors,
    COALESCE(vd.annual_revenue, 0) AS annual_revenue,
    CASE 
        WHEN sa.area_sqm > 0 THEN COALESCE(vd.annual_visitors, 0) / sa.area_sqm 
        ELSE 0 
    END AS visitors_per_sqm,
    CASE 
        WHEN COALESCE(ic.industry_count, 0) > 0 THEN COALESCE(vd.annual_visitors, 0) / COALESCE(ic.industry_count, 1) 
        ELSE 0 
    END AS visitors_per_industry
FROM SiteAreas sa
LEFT JOIN IndustryCounts ic ON sa.site_id = ic.site_id
LEFT JOIN VisitorData vd ON sa.site_id = vd.site_id
ORDER BY visitors_per_sqm DESC;

-- TEMPORARY TABLE TASKS

-- Task 19: Create a temporary table of site performance metrics, then query it to find correlations between metrics
CREATE TEMPORARY TABLE site_performance AS
SELECT 
    ms.site_id,
    ms.site_name,
    ms.area_sqm,
    ms.year_of_conversion,
    COUNT(DISTINCT ci.industry_id) AS industry_count,
    SUM(ci.employees_count) AS total_employees,
    AVG(ci.annual_revenue) AS avg_industry_revenue,
    SUM(ei.visitor_count) AS annual_visitors,
    SUM(ei.tourism_revenue) AS tourism_revenue,
    AVG(ei.local_business_growth) AS avg_business_growth
FROM maritime_sites ms
LEFT JOIN creative_industries ci ON ms.site_id = ci.site_id
LEFT JOIN economic_impact ei ON ms.site_id = ei.site_id AND ei.year = 2022
GROUP BY ms.site_id, ms.site_name, ms.area_sqm, ms.year_of_conversion;

-- Now query the temporary table for correlations
SELECT 
    site_name,
    CASE 
        WHEN area_sqm > 30000 THEN 'Large'
        WHEN area_sqm > 10000 THEN 'Medium'
        ELSE 'Small'
    END AS size_category,
    tourism_revenue / NULLIF(annual_visitors, 0) AS revenue_per_visitor,
    total_employees / NULLIF(industry_count, 0) AS avg_company_size,
    annual_visitors / NULLIF(area_sqm, 0) AS visitors_per_sqm,
    total_employees / NULLIF(area_sqm, 0) AS employment_density,
    2022 - year_of_conversion AS years_since_conversion
FROM site_performance
ORDER BY revenue_per_visitor DESC;

-- Task 20: Create a temporary table of regional averages, then join it with the original data to find countries that exceed their regional averages
CREATE TEMPORARY TABLE regional_averages AS
SELECT 
    region,
    sector,
    AVG(trade_volume) AS avg_trade_volume,
    AVG(growth_rate) AS avg_growth_rate,
    AVG(market_share) AS avg_market_share
FROM market_comparison
WHERE year = 2022 AND quarter = 3
GROUP BY region, sector;

-- Find countries exceeding their regional averages
SELECT 
    mc.country,
    mc.region,
    mc.sector,
    mc.trade_volume,
    ra.avg_trade_volume AS regional_avg_volume,
    (mc.trade_volume - ra.avg_trade_volume) AS volume_difference,
    mc.trade_volume / ra.avg_trade_volume AS volume_ratio,
    mc.growth_rate,
    ra.avg_growth_rate AS regional_avg_growth,
    (mc.growth_rate - ra.avg_growth_rate) AS growth_difference
FROM market_comparison mc
JOIN regional_averages ra ON mc.region = ra.region AND mc.sector = ra.sector
WHERE mc.year = 2022 AND mc.quarter = 3
AND mc.trade_volume > ra.avg_trade_volume
ORDER BY volume_ratio DESC;

-- Task 21: Use a temporary table to store quarterly performance data, then analyze seasonal patterns and year-over-year growth
CREATE TEMPORARY TABLE quarterly_performance AS
SELECT 
    ms.site_id,
    ms.site_name,
    ei.year,
    ei.quarter,
    SUM(ei.visitor_count) AS visitors,
    SUM(ei.tourism_revenue) AS revenue,
    SUM(ei.cultural_events_count) AS events
FROM maritime_sites ms
JOIN economic_impact ei ON ms.site_id = ei.site_id
GROUP BY ms.site_id, ms.site_name, ei.year, ei.quarter;

-- Analyze seasonal patterns
SELECT 
    site_name,
    quarter,
    AVG(visitors) AS avg_visitors,
    MAX(visitors) AS max_visitors,
    MIN(visitors) AS min_visitors,
    AVG(revenue) AS avg_revenue,
    AVG(events) AS avg_events,
    AVG(revenue) / NULLIF(AVG(visitors), 0) AS avg_revenue_per_visitor
FROM quarterly_performance
GROUP BY site_name, quarter
ORDER BY site_name, quarter;

-- ADVANCED COMBINED TECHNIQUE TASKS

-- Task 22: Use a combination of CTEs, JOINs and aggregation to create a comprehensive performance dashboard for each maritime site
WITH VisitorTrends AS (
    SELECT 
        site_id,
        year,
        quarter,
        visitor_count,
        LAG(visitor_count) OVER (PARTITION BY site_id ORDER BY year, quarter) AS prev_quarter_visitors,
        AVG(visitor_count) OVER (PARTITION BY site_id) AS avg_visitors
    FROM economic_impact
),
IndustryMetrics AS (
    SELECT
        ms.site_id,
        ms.site_name,
        COUNT(DISTINCT ci.industry_id) AS industry_count,
        COUNT(DISTINCT ci.industry_type) AS industry_diversity,
        SUM(ci.employees_count) AS total_employees,
        AVG(ci.local_employment_percentage) AS avg_local_employment
    FROM maritime_sites ms
    LEFT JOIN creative_industries ci ON ms.site_id = ci.site_id
    GROUP BY ms.site_id, ms.site_name
),
RevenueMetrics AS (
    SELECT
        site_id,
        SUM(tourism_revenue) AS total_revenue,
        SUM(tourism_revenue) / SUM(visitor_count) AS revenue_per_visitor
    FROM economic_impact
    WHERE year = 2022
    GROUP BY site_id
)

SELECT
    im.site_name,
    ms.heritage_status,
    ms.current_use,
    2022 - ms.year_of_conversion AS years_since_conversion,
    im.industry_count,
    im.industry_diversity,
    im.total_employees,
    im.avg_local_employment,
    ROUND(rm.total_revenue, 0) AS revenue_2022,
    ROUND(rm.revenue_per_visitor, 2) AS revenue_per_visitor,
    COALESCE(SUM(vt.visitor_count), 0) AS total_visitors_all_time,
    COALESCE(AVG(vt.visitor_count), 0) AS avg_quarterly_visitors,
    COALESCE(MAX(vt.visitor_count) - MIN(vt.visitor_count), 0) AS visitor_range,
    COALESCE(AVG(CASE WHEN vt.visitor_count > vt.prev_quarter_visitors THEN 1 ELSE 0 END), 0) AS growth_consistency
FROM IndustryMetrics im
JOIN maritime_sites ms ON im.site_id = ms.site_id
LEFT JOIN RevenueMetrics rm ON im.site_id = rm.site_id
LEFT JOIN VisitorTrends vt ON im.site_id = vt.site_id
GROUP BY im.site_name, ms.heritage_status, ms.current_use, ms.year_of_conversion, im.industry_count, 
         im.industry_diversity, im.total_employees, im.avg_local_employment, rm.total_revenue, rm.revenue_per_visitor
ORDER BY revenue_2022 DESC;

-- Task 23: Analyze the relationship between heritage status, site area, creative industry diversity, and economic impact using subqueries and joins
select heritage_status,
    COUNT(DISTINCT ms.site_id) AS site_count,
    AVG(ms.area_sqm) AS avg_area,
    AVG((SELECT COUNT(DISTINCT industry_type) FROM creative_industries ci WHERE ci.site_id = ms.site_id)) AS avg_industry_diversity,
    AVG((SELECT SUM(visitor_count) FROM economic_impact ei WHERE ei.site_id = ms.site_id AND year = 2022)) AS avg_annual_visitors,
    AVG((SELECT SUM(tourism_revenue) FROM economic_impact ei WHERE ei.site_id = ms.site_id AND year = 2022)) AS avg_annual_revenue,
    SUM((SELECT SUM(employees_count) FROM creative_industries ci WHERE ci.site_id = ms.site_id)) AS total_employment,
    AVG((SELECT AVG(local_business_growth) FROM economic_impact ei WHERE ei.site_id = ms.site_id AND year = 2022)) AS avg_business_growth,
    (SELECT MAX(ci.founding_year) 
     FROM creative_industries ci 
     JOIN maritime_sites ms2 ON ci.site_id = ms2.site_id 
     WHERE ms2.heritage_status = ms.heritage_status) AS most_recent_company_founding
FROM maritime_sites ms
GROUP BY heritage_status
ORDER BY avg_annual_revenue DESC;

-- Task 24: Compare European and North African market trends over time using window functions, CTEs and aggregation
WITH QuarterlyRegionMetrics AS (
    SELECT
        year,
        quarter,
        region,
        sector,
        AVG(trade_volume) AS avg_trade_volume,
        AVG(growth_rate) AS avg_growth_rate,
        AVG(market_share) AS avg_market_share,
        COUNT(DISTINCT country) AS country_count
    FROM market_comparison
    GROUP BY year, quarter, region, sector
),
RegionTrends AS (
    SELECT
        year,
        quarter,
        region,
        sector,
        avg_trade_volume,
        avg_growth_rate,
        LAG(avg_trade_volume) OVER (PARTITION BY region, sector ORDER BY year, quarter) AS prev_volume,
        LEAD(avg_trade_volume) OVER (PARTITION BY region, sector ORDER BY year, quarter) AS next_volume,
        AVG(avg_trade_volume) OVER (PARTITION BY region, sector) AS overall_avg_volume,
        MAX(avg_trade_volume) OVER (PARTITION BY region, sector) AS max_volume,
        RANK() OVER (PARTITION BY region, sector ORDER BY avg_growth_rate DESC) AS growth_rank
    FROM QuarterlyRegionMetrics
)

SELECT
    CONCAT(year, ' Q', quarter) AS time_period,
    region,
    sector,
    avg_trade_volume,
    CASE 
        WHEN prev_volume IS NOT NULL THEN (avg_trade_volume - prev_volume) / prev_volume * 100 
        ELSE NULL 
    END AS quarter_over_quarter_change,
    avg_growth_rate,
    (avg_trade_volume / overall_avg_volume * 100) - 100 AS percent_from_average,
    CASE 
        WHEN growth_rank = 1 THEN 'Highest Growth Quarter' 
        ELSE '' 
    END AS growth_rank_label,
    CASE
        WHEN next_volume IS NOT NULL AND avg_trade_volume < prev_volume AND avg_trade_volume < next_volume THEN 'Valley'
        WHEN next_volume IS NOT NULL AND avg_trade_volume > prev_volume AND avg_trade_volume > next_volume THEN 'Peak'
        WHEN prev_volume IS NULL THEN 'Starting Point'
        WHEN next_volume IS NULL THEN 'End Point'
        WHEN avg_trade_volume > prev_volume THEN 'Rising'
        ELSE 'Falling'
    END AS trend_position
FROM RegionTrends
ORDER BY region, sector, year, quarter;