-------------สรุปภาพรวมยอดขายทั้งหมด--------------
SELECT 
    COUNT(*) AS orders,
    SUM(Quantity_Sold) AS units_sold,
    SUM(Total_Sales_USD) AS total_sales,
    ROUND(AVG(Total_Sales_USD), 2) AS avg_sales_per_order
FROM product_sales_dataset;

-------------จน.ยอดขายแยกตามหมวดหมู่--------------
SELECT 
    Category,
    COUNT(*) AS orders,
    SUM(Quantity_Sold) AS units_sold,
    SUM(Total_Sales_USD) AS total_sales,
    ROUND(AVG(Total_Sales_USD), 2) AS avg_sales_per_order,
    ROUND(100.0 * SUM(Total_Sales_USD) / (SELECT SUM(Total_Sales_USD) FROM product_sales_dataset), 2) AS sales_pct
FROM product_sales_dataset
GROUP BY Category
ORDER BY total_sales DESC;

--------------ยอดขายแต่ละเมือง------------------
SELECT 
    Customer_City,
    COUNT(*) AS orders,
    SUM(Quantity_Sold) AS units_sold,
    SUM(Total_Sales_USD) AS total_sales,
    ROUND(AVG(Total_Sales_USD), 2) AS avg_order_sales,
    ROUND(100.0 * SUM(Total_Sales_USD) / (SELECT SUM(Total_Sales_USD) FROM product_sales_dataset), 2) AS sales_share_pct
FROM product_sales_dataset
GROUP BY Customer_City
ORDER BY total_sales DESC;

--------------ยอดขายรายเดือน-----------------------
SELECT 
    strftime('%Y', Order_Date) AS order_year,
    strftime('%m', Order_Date) AS order_month,
    COUNT(*) AS orders,
    SUM(Quantity_Sold) AS units_sold,
    SUM(Total_Sales_USD) AS total_sales
FROM product_sales_dataset
GROUP BY order_year, order_month
ORDER BY order_year ASC, order_month ASC;

------------ยอดขายรายไตรมาส---------------------
SELECT 
    strftime('%Y', Order_Date) AS order_year,
    CASE 
        WHEN strftime('%m', Order_Date) IN ('01', '02', '03') THEN 'Q1'
        WHEN strftime('%m', Order_Date) IN ('04', '05', '06') THEN 'Q2'
        WHEN strftime('%m', Order_Date) IN ('07', '08', '09') THEN 'Q3'
        ELSE 'Q4'
    END AS Q,
    COUNT(*) AS orders,
    SUM(Quantity_Sold) AS units_sold,
    SUM(Total_Sales_USD) AS total_sales
FROM product_sales_dataset
GROUP BY order_year, Q
ORDER BY order_year ASC, Q ASC;
