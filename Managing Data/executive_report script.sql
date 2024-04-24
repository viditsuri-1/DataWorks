
SELECT Region, SUM(Profit) AS '2018 Profit'
FROM superstore__data
WHERE YEAR(OrderDate) = 2018
GROUP BY Region;

-- 2019 Sales
SELECT Region, SUM(Profit) AS '2019 Profit'
FROM superstore__data
WHERE YEAR(OrderDate) = 2019
GROUP BY Region;

-- 2020 Sales
SELECT Region, SUM(Profit) AS '2020 Profit'
FROM superstore__data
WHERE YEAR(OrderDate) = 2020
GROUP BY Region;

-- 2021 Sales
SELECT Region, SUM(Profit) AS '2021 Profit'
FROM superstore__data
WHERE YEAR(OrderDate) = 2021
GROUP BY Region;


SELECT s.Region, 
       s18.`2018 Profit`, 
       s19.`2019 Profit`, 
       (s19.`2019 Profit` - s18.`2018 Profit`) AS '2019 Profit vs 2018 Profit',
       s20.`2020 Profit`, 
       (s20.`2020 Profit` - s19.`2019 Profit`) AS '2020 Profit vs 2019 Profit',
       s21.`2021 Profit`, 
       (s21.`2021 Profit` - s20.`2020 Profit`) AS '2021 Profit vs 2020 Profit'
FROM 
    (SELECT DISTINCT Region FROM superstore__data) s
LEFT JOIN 
    (SELECT Region, SUM(Profit) AS '2018 Profit'
     FROM superstore__data
     WHERE SUBSTRING_INDEX(OrderDate, '-', -1) = '2018'
     GROUP BY Region) s18 
     ON s.Region = s18.Region
LEFT JOIN 
    (SELECT Region, SUM(Profit) AS '2019 Profit'
     FROM superstore__data
     WHERE SUBSTRING_INDEX(OrderDate, '-', -1) = '2019'
     GROUP BY Region) s19 
     ON s.Region = s19.Region
LEFT JOIN 
    (SELECT Region, SUM(Profit) AS '2020 Profit'
     FROM superstore__data
     WHERE SUBSTRING_INDEX(OrderDate, '-', -1) = '2020'
     GROUP BY Region) s20 
     ON s.Region = s20.Region
LEFT JOIN 
    (SELECT Region, SUM(Profit) AS '2021 Profit'
     FROM superstore__data
     WHERE SUBSTRING_INDEX(OrderDate, '-', -1) = '2021'
     GROUP BY Region) s21 
     ON s.Region = s21.Region;
