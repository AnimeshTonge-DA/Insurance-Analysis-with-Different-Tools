# All 6 KPI's --------------

SELECT
    CONCAT(ROUND(
        (SELECT SUM(Amount) FROM brokerage WHERE income_class = 'New') /
        (SELECT SUM(New_Budget) FROM individual_budget) * 100, 2), '%') 
    AS New_Placed_Achievement_Pct,

    CONCAT(ROUND(
        (SELECT SUM(Amount) FROM Invoice WHERE income_class = 'New') /
        (SELECT SUM(New_Budget) FROM individual_budget) * 100, 2), '%') 
    AS New_Invoice_Achievement_Pct,

    CONCAT(ROUND(
        (SELECT SUM(Amount) FROM brokerage WHERE income_class = 'Cross_Sell') /
        (SELECT SUM(Cross_sell_bugdet) FROM individual_budget) * 100, 2), '%') 
    AS Cross_Sell_Placed_Achievement_Pct,

    CONCAT(ROUND(
        (SELECT SUM(Amount) FROM Invoice WHERE income_class = 'Cross_Sell') /
        (SELECT SUM(Cross_sell_bugdet) FROM individual_budget) * 100, 2), '%') 
    AS Cross_Sell_Invoice_Achievement_Pct,

    CONCAT(ROUND(
        (SELECT SUM(Amount) FROM brokerage WHERE income_class = 'Renewal') /
        (SELECT SUM(Renewal_Budget) FROM individual_budget) * 100, 2), '%') 
    AS Renewal_Placed_Achievement_Pct,

    CONCAT(ROUND(
        (SELECT SUM(Amount) FROM Invoice WHERE income_class = 'Renewal') /
        (SELECT SUM(Renewal_Budget) FROM individual_budget) * 100, 2), '%') 
    AS Renewal_Invoice_Achievement_Pct;
    
 ##-------------- All New, cross sell, Renewal -------   
SELECT
    -- NEW
    CONCAT(ROUND((SELECT SUM(New_Budget) FROM individual_budget) / 1000000, 2), 'M')
        AS New_Target,
    CONCAT(ROUND((SELECT SUM(Amount) FROM brokerage WHERE income_class = 'New') / 1000000, 2), 'M')
        AS New_Achieved_Revenue,
    CONCAT(ROUND((SELECT SUM(Amount) FROM Invoice WHERE income_class = 'New') / 1000000, 2), 'M')
        AS New_Invoice,

    -- CROSS SELL
    CONCAT(ROUND((SELECT SUM(Cross_sell_bugdet) FROM individual_budget) / 1000000, 2), 'M')
        AS Cross_Sell_Target,
    CONCAT(ROUND((SELECT SUM(Amount) FROM brokerage WHERE income_class = 'Cross_Sell') / 1000000, 2), 'M')
        AS Cross_Sell_Achieved_Revenue,
    CONCAT(ROUND((SELECT SUM(Amount) FROM Invoice WHERE income_class = 'Cross_Sell') / 1000000, 2), 'M')
        AS Cross_Sell_Invoice,

    -- RENEWAL
    CONCAT(ROUND((SELECT SUM(Renewal_Budget) FROM individual_budget) / 1000000, 2), 'M')
        AS Renewal_Target,
    CONCAT(ROUND((SELECT SUM(Amount) FROM brokerage WHERE income_class = 'Renewal') / 1000000, 2), 'M')
        AS Renewal_Achieved_Revenue,
    CONCAT(ROUND((SELECT SUM(Amount) FROM Invoice WHERE income_class = 'Renewal') / 1000000, 2), 'M')
        AS Renewal_Invoice;
        
#---- Total Opportunity KPI
SELECT 
  COUNT(*) AS Total_Opportunity,
  SUM(CASE WHEN stage IN ('Qualify_Opportunity', 'Propose_Solution') THEN 1 ELSE 0 END) 
    AS Total_Open_Opportunity
FROM opportunity;

#----- opportunity Product Group distribution #-------
SELECT 
  product_group,
  COUNT(*) AS Count
FROM opportunity
GROUP BY product_group
ORDER BY Count DESC;

#-------------- Top 4 opportunities --------------#
SELECT 
  opportunity_name,
  CONCAT(ROUND(revenue_amount / 1000, 0), 'K') AS Revenue
FROM opportunity
ORDER BY revenue_amount DESC
LIMIT 4;

#----------- no. of invoices by account executives #------------
SELECT 
  Account_Executive,
  SUM(CASE WHEN income_class = 'Renewal'   THEN 1 ELSE 0 END) AS Invoice_Count_Renewal,
  SUM(CASE WHEN income_class = 'Cross_Sell' THEN 1 ELSE 0 END) AS Invoice_Count_Cross_Sell,
  SUM(CASE WHEN income_class = 'New'        THEN 1 ELSE 0 END) AS Invoice_Count_New
FROM invoice
GROUP BY Account_Executive
ORDER BY (Invoice_Count_Renewal + Invoice_Count_Cross_Sell + Invoice_Count_New) DESC;

#----------- no. of meetings by account executives #------------
SELECT 
  Account_Executive,
  COUNT(*) AS Meeting_Count
FROM meeting
GROUP BY Account_Executive
ORDER BY Meeting_Count DESC;

#---------- yearly meeting count #---------------
SELECT 
  SUM(CASE WHEN YEAR(meeting_date) = 2020 THEN 1 ELSE 0 END) AS Meeting_Count_2020,
  SUM(CASE WHEN YEAR(meeting_date) = 2019 THEN 1 ELSE 0 END) AS Meeting_Count_2019
FROM meeting;

#----- Stage funnel by revenue 
SELECT
    SUM(CASE WHEN stage = 'Qualify_Opportunity' THEN 1 ELSE 0 END) AS Qualify_Opportunity,
    SUM(CASE WHEN stage = 'Propose_Solution'    THEN 1 ELSE 0 END) AS Propose_Solution,
    SUM(CASE WHEN stage = 'Negotiate'           THEN 1 ELSE 0 END) AS Negotiate
FROM opportunity;
