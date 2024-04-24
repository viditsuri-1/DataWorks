SELECT 
    Region,
    State,
    Category,
    SUM(Quantity) AS Total_Quantity,
    AVG(Discount) AS Average_Discount,
    SUM(Sales) AS Gross_Sales,
    SUM(Profit) AS Profit

FROM 
    superstore__data
GROUP BY 
    Region, State, Category
ORDER BY
    Region, State, Category;


