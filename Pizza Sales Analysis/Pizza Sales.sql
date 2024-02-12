Use [Pizza Sales ]
Select * From [Pizza Sales]

---Total Revenue---
Select Sum (total_price) AS Total_Revenue From [Pizza Sales]

---Average Order Value
Select Sum(total_price)/Count(Distinct order_id) as Avg_Order_Value From [Pizza Sales]

---Total Pizza Sold---
Select Sum(quantity) As Total_Pizza_Sold From [Pizza Sales]

---Total Orders Placed---
Select Count(Distinct order_id) As Total_Order_Placed from [Pizza Sales]

---Average Pizzas Per Order---
Select ROUND(Sum(quantity)/Count(Distinct order_id),2) As Average_Pizzas_Per_orders from [Pizza Sales]

---Daily Trend For Total Orders---
Select DATENAME(DW,order_date) As order_day,Count(Distinct order_id) As Total_orders
from [Pizza Sales]
Group By DATENAME(DW,order_date)
Order By Total_orders Desc

---Monthly Trend For Total Orders---
Select DATENAME(MONTH ,order_date) As Month_Name,Count(Distinct order_id) As Total_orders
from [Pizza Sales]
Group By DATENAME(MONTH,order_date)
Order By Total_orders Desc


---Percentage Of Sales By Pizza Category---
Select pizza_category, Sum(total_price) as Total_Sales, Round(Sum(total_price)*100 / (Select Sum(total_price) From [Pizza Sales]),2) As PCT
From [Pizza Sales]
Group By pizza_category
Order BY PCT Desc

---Percentage Of Sales By Pizza Size---
Select pizza_size, Sum(total_price) as Total_Sales, Round(Sum(total_price)*100 / (Select Sum(total_price) From [Pizza Sales]),2) As PCT
From [Pizza Sales]
Group By pizza_size
Order By PCT Desc

---Total Pizza Sold By Pizza Category---
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM [Pizza Sales]
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

---Total Pizza Sold By Pizza Size---
SELECT pizza_size, SUM(quantity) as Total_Quantity_Sold
FROM [Pizza Sales]
GROUP BY pizza_size
ORDER BY Total_Quantity_Sold DESC


---Top 5 By Revenue---
Select Top 5 pizza_name, Sum(total_price) As Total_Revenue From [Pizza Sales]
Group By pizza_name
Order By Total_Revenue Desc


---Bottom 5 By Revenue---
Select Top 5 pizza_name, Sum(total_price) As Total_Revenue From [Pizza Sales]
Group By pizza_name
Order By Total_Revenue Asc


---Top 5 Pizza By Quantity---
Select Top 5 pizza_name, Sum(quantity) As Total_Quantity From [Pizza Sales]
Group By pizza_name
Order By Total_Quantity Desc

---Bottom 5 Pizza By Quantity---
Select Top 5 pizza_name, Sum(quantity) As Total_Quantity From [Pizza Sales]
Group By pizza_name
Order By Total_Quantity Asc

---Top 5 Pizzas By Total Orders---
Select Top 5 pizza_name, Count (Distinct order_id) As Total_Orders From [Pizza Sales]
Group By pizza_name
Order By Total_Orders Desc

---Bottom 5 Pizzas By Total Orders---
Select Top 5 pizza_name, Count (Distinct order_id) As Total_Orders From [Pizza Sales]
Group By pizza_name
Order By Total_Orders Asc
