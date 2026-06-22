-- =====================================================
-- Project: Nykaa Marketing Campaign ROI Analysis
-- Tools: SQL, Excel, Tableau
-- Dataset: Nykaa Marketing Campaign Dataset
-- Objective:
-- Analyze campaign revenue, profit, ROI, funnel conversion,
-- customer segments, and budget optimization opportunities.
-- =====================================================

-- Database and Table Creation --

CREATE DATABASE nykaa_marketing_analysis;
USE nykaa_marketing_analysis;
CREATE TABLE nykaa_campaigns_raw (
campaign_id VARCHAR(20),
campaign_type VARCHAR (50),
target_audience VARCHAR (100),
duration INT,
 channel_used VARCHAR(255),
    impressions BIGINT,
    clicks BIGINT,
    leads BIGINT,
    conversions BIGINT,
    revenue DECIMAL(15,2),
    acquisition_cost DECIMAL(12,2),
    roi DECIMAL(10,2),
    language VARCHAR(50),
    engagement_score DECIMAL(10,2),
    customer_segment VARCHAR(100),
    campaign_date_text VARCHAR(20)
);

-- Creating a cleaner version of the table and adding more KPI which are essential for analysis--
 
 CREATE TABLE nykaa_campaigns_clean AS 
 SELECT 
campaign_id,
    campaign_type,
    target_audience,
    duration,
    channel_used,
    impressions,
    clicks,
    leads,
    conversions,
    revenue,
    acquisition_cost,
    roi,
    language,
    engagement_score,
    customer_segment,
    STR_TO_DATE(campaign_date_text, '%d-%m-%Y') AS campaign_date,
    acquisition_cost * conversions AS estimated_spend,
    clicks / NULLIF(impressions,0) AS CTR,
    leads/ NULLIF(clicks,0) AS lead_rate,
    conversions / NULLIF(leads,0) AS conversion_rate,
    revenue/ NULLIF(conversions, 0) AS revenue_per_conversion,
    revenue -( acquisition_cost * conversions) AS profit,
   (revenue - (acquisition_cost * conversions)) / NULLIF(revenue, 0) AS profit_margin,
    YEAR( STR_TO_DATE(campaign_date_text, '%d-%m-%Y')) AS campaign_year,
     MONTH( STR_TO_DATE(campaign_date_text, '%d-%m-%Y')) AS campaign_month,
     DATE_FORMAT( STR_TO_DATE(campaign_date_text, '%d-%m-%Y'), '%Y-%m') AS yearmonth,
     CASE 
     WHEN roi<=0 THEN 'Loss Making'
     WHEN  roi>= 5 THEN 'High ROI'
     ELSE 'Normal' END AS performance_category
     FROM nykaa_campaigns_raw;
     
     
    -- to check whether the changes are successful or not--
  
  SELECT * FROM nykaa_campaigns_clean;
     
     -- checking for duplicates--
     
 SELECT campaign_id, COUNT(*) AS count_records
FROM nykaa_campaigns_clean
GROUP BY campaign_id
HAVING COUNT(*) > 1;

-- its 0 telling us that there are no duplicates --

-- checking the performance category-- 

SELECT
performance_category,
COUNT(*) AS Campaign_count
FROM nykaa_campaigns_clean
GROUP BY performance_category;


-- calculating overall numbers revenue. profits,total conversions, ROI, loss making % --

SELECT 
ROUND(SUM(revenue)/10000000, 2) AS total_revenue_cr,
ROUND(SUM(profit)/10000000, 2 ) AS total_profit_cr,
ROUND(AVG(ROI),2) AS average_ROI,
SUM(conversions) AS total_conversions,
ROUND(SUM(CASE WHEN performance_category='Loss Making' THEN 1 ELSE 0 END) * 100 / COUNT(*), 1) AS loss_making_percent
FROM nykaa_campaigns_clean; 


-- this query tells us which campaign type performs best--

SELECT campaign_type,
ROUND(SUM(revenue)/10000000, 2) AS total_revenue_cr,
ROUND(SUM(profit)/10000000, 2 ) AS total_profit_cr,
SUM(conversions) AS total_conversions,
ROUND(AVG(ROI),2) AS average_ROI
FROM nykaa_campaigns_clean
GROUP BY campaign_type
ORDER BY total_profit_cr DESC;

-- This is conversion share which campaign contributed the most the least --
SELECT campaign_type,
ROUND(SUM(profit)/10000000, 2 ) AS total_profit_cr,
SUM(CONVERSIONS)*100 / (SELECT SUM(CONVERSIONS) FROM nykaa_campaigns_clean) AS CONVERSIONS_RATE
FROM Nykaa_campaigns_clean
GROUP BY campaign_type
ORDER BY total_profit_cr DESC;

-- this os conversions rate that shows how many leads converted into conversions with the campaign --

SELECT
    campaign_type,
    ROUND(SUM(profit) / 10000000, 2) AS total_profit_cr,
    ROUND(SUM(conversions) * 100.0 / SUM(leads), 2) AS conversion_rate_percent
FROM nykaa_campaigns_clean
GROUP BY campaign_type
ORDER BY total_profit_cr DESC;


-- this tells which customer segment gives the best business return? --

SELECT  customer_segment,
ROUND(SUM(revenue)/10000000, 2) AS total_revenue_cr,
ROUND(SUM(profit)/10000000, 2 ) AS total_profit_cr,
SUM(conversions) AS total_conversions,
ROUND(AVG(ROI),2) AS average_ROI
FROM Nykaa_campaigns_clean
GROUP BY customer_segment
ORDER BY  average_ROI DESC;


-- How did campaign performance change over time? --

SELECT
    yearmonth,
    COUNT(*) AS campaign_count,
    ROUND(SUM(revenue) / 10000000, 2) AS revenue_cr,
    ROUND(SUM(profit) / 10000000, 2) AS profit_cr,
    ROUND(AVG(roi), 2) AS avg_roi,
    ROUND(SUM(conversions) / 100000, 2) AS conversions_lakhs
FROM nykaa_campaigns_clean
WHERE yearmonth <> '2025-06'
GROUP BY yearmonth
ORDER BY yearmonth;


-- Which campaign type has the strongest final funnel conversion from leads to conversions? --

SELECT campaign_type,
ROUND(SUM(impressions) / 10000000 ,2 )AS total_impressions,
ROUND(SUM(clicks) / 10000000 ,2)  AS total_clicks,
ROUND(SUM(leads) / 10000000 ,2)  AS total_leads,
ROUND(SUM(conversions)/10000000,2) AS total_conversions,
ROUND(SUM(clicks) / NULLIF(SUM(impressions),0) *100 ,2) as overall_ctr_percentage,
ROUND(SUM(leads) / NULLIF(SUM(clicks), 0) * 100, 2) AS click_to_lead_percentage,
ROUND(SUM(conversions) / NULLIF(SUM(leads), 0) * 100, 2) AS lead_to_conversion_percentage
FROM nykaa_campaigns_clean
GROUP BY  campaign_type
ORDER BY lead_to_conversion_percentage DESC;


-- Which individual campaigns generated the highest profit? --

SELECT
    campaign_id,
    campaign_type,
    channel_used,
    customer_segment,
    language,
    ROUND(revenue / 100000, 2) AS revenue_lakhs,
    ROUND(profit / 100000, 2) AS profit_lakhs,
    ROUND(roi, 2) AS roi,
    ROUND(conversions / 100000, 2) AS conversions_lakhs
FROM nykaa_campaigns_clean
ORDER BY profit DESC
LIMIT 10;


-- Bottom 10 Campaigns by ROI --

SELECT
    campaign_id,
    campaign_type,
    channel_used,
    customer_segment,
    language,
    ROUND(revenue / 100000, 2) AS revenue_lakhs,
    ROUND(profit / 100000, 2) AS profit_lakhs,
    ROUND(roi, 2) AS roi,
    performance_category
FROM nykaa_campaigns_clean
ORDER BY roi ASC
LIMIT 10;



-- What percentage of campaigns are High ROI, Normal, or Loss Making? --

SELECT
    performance_category,
    COUNT(*) AS campaign_count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM nykaa_campaigns_clean), 1) AS percentage_of_campaigns,
    ROUND(SUM(revenue) / 10000000, 2) AS revenue_cr,
    ROUND(SUM(profit) / 10000000, 2) AS profit_cr,
    ROUND(AVG(roi), 2) AS avg_roi
FROM nykaa_campaigns_clean
GROUP BY performance_category
ORDER BY campaign_count DESC;

-- Which campaign language performs best? --


SELECT
    language,
    COUNT(*) AS campaign_count,
    ROUND(SUM(revenue) / 10000000, 2) AS revenue_cr,
    ROUND(SUM(profit) / 10000000, 2) AS profit_cr,
    ROUND(AVG(roi), 2) AS avg_roi,
    ROUND(SUM(conversions) / 100000, 2) AS conversions_lakhs,
    ROUND(SUM(clicks) / NULLIF(SUM(impressions), 0) * 100, 2) AS ctr_percentage,
    ROUND(SUM(conversions) / NULLIF(SUM(leads), 0) * 100, 2) AS lead_to_conversion_percentage
FROM nykaa_campaigns_clean
GROUP BY language
ORDER BY avg_roi DESC;



-- Which channel or channel combination performs best? -- 

SELECT
    channel_used,
    COUNT(*) AS campaign_count,
    ROUND(SUM(revenue) / 10000000, 2) AS revenue_cr,
    ROUND(SUM(profit) / 10000000, 2) AS profit_cr,
    ROUND(AVG(roi), 2) AS avg_roi,
    ROUND(SUM(conversions) / 100000, 2) AS conversions_lakhs,
    ROUND(SUM(clicks) / NULLIF(SUM(impressions), 0) * 100, 2) AS ctr_percentage,
    ROUND(SUM(conversions) / NULLIF(SUM(leads), 0) * 100, 2) AS lead_to_conversion_percentage
FROM nykaa_campaigns_clean
GROUP BY channel_used
ORDER BY profit_cr DESC
LIMIT 15;


-- Which campaigns are consuming meaningful budget but giving weak returns? --


SELECT
    campaign_id,
    campaign_type,
    channel_used,
    customer_segment,
    language,
    ROUND(estimated_spend / 100000, 2) AS estimated_spend_lakhs,
    ROUND(revenue / 100000, 2) AS revenue_lakhs,
    ROUND(profit / 100000, 2) AS profit_lakhs,
    ROUND(roi, 2) AS roi,
    performance_category
FROM nykaa_campaigns_clean
WHERE roi < 0
ORDER BY estimated_spend DESC
LIMIT 10;



-- Do highly engaging campaigns also generate strong ROI? --


SELECT
    CASE
        WHEN engagement_score < 10 THEN 'Low Engagement'
        WHEN engagement_score BETWEEN 10 AND 20 THEN 'Medium Engagement'
        ELSE 'High Engagement'
    END AS engagement_group,
    COUNT(*) AS campaign_count,
    ROUND(AVG(engagement_score), 2) AS avg_engagement_score,
    ROUND(AVG(roi), 2) AS avg_roi,
    ROUND(SUM(revenue) / 10000000, 2) AS revenue_cr,
    ROUND(SUM(profit) / 10000000, 2) AS profit_cr,
    ROUND(SUM(conversions) / 100000, 2) AS conversions_lakhs
FROM nykaa_campaigns_clean
GROUP BY
    CASE
        WHEN engagement_score < 10 THEN 'Low Engagement'
        WHEN engagement_score BETWEEN 10 AND 20 THEN 'Medium Engagement'
        ELSE 'High Engagement'
    END
ORDER BY avg_roi DESC;




-- Do shorter or longer campaigns perform better? --


SELECT
    CASE
        WHEN duration <= 10 THEN 'Short Campaign'
        WHEN duration BETWEEN 11 AND 20 THEN 'Medium Campaign'
        ELSE 'Long Campaign'
    END AS duration_group,
    COUNT(*) AS campaign_count,
    ROUND(AVG(duration), 1) AS avg_duration_days,
    ROUND(SUM(revenue) / 10000000, 2) AS revenue_cr,
    ROUND(SUM(profit) / 10000000, 2) AS profit_cr,
    ROUND(AVG(roi), 2) AS avg_roi,
    ROUND(SUM(conversions) / 100000, 2) AS conversions_lakhs,
    ROUND(SUM(conversions) / NULLIF(SUM(leads), 0) * 100, 2) AS lead_to_conversion_percentage
FROM nykaa_campaigns_clean
GROUP BY
    CASE
        WHEN duration <= 10 THEN 'Short Campaign'
        WHEN duration BETWEEN 11 AND 20 THEN 'Medium Campaign'
        ELSE 'Long Campaign'
    END
ORDER BY avg_roi DESC;


-- Based on ROI and profit, which campaigns should be scaled, monitored, reviewed, or paused?

SELECT
    recommended_action,
    COUNT(*) AS campaign_count,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM nykaa_campaigns_clean), 1) AS percentage_of_campaigns,
    ROUND(SUM(revenue) / 10000000, 2) AS revenue_cr,
    ROUND(SUM(profit) / 10000000, 2) AS profit_cr,
    ROUND(AVG(roi), 2) AS avg_roi
FROM (
    SELECT
        campaign_id,
        revenue,
        profit,
        roi,
        CASE
            WHEN roi >= 5 AND profit > 0 THEN 'Scale'
            WHEN roi < 0 AND profit < 0 THEN 'Pause / Redesign'
            WHEN roi BETWEEN 0 AND 2 THEN 'Review'
            ELSE 'Monitor'
        END AS recommended_action
    FROM nykaa_campaigns_clean
) action_summary
GROUP BY recommended_action
ORDER BY
    CASE recommended_action
        WHEN 'Scale' THEN 1
        WHEN 'Monitor' THEN 2
        WHEN 'Review' THEN 3
        WHEN 'Pause / Redesign' THEN 4
        ELSE 5
    END;
