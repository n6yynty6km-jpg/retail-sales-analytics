--Создание таблицы
CREATE TABLE sales (
    "InvoiceNo" VARCHAR(20),
    "StockCode" VARCHAR(20),
    "Description" TEXT,
    "Quantity" INT,
    "InvoiceDate" TIMESTAMP,
    "UnitPrice" NUMERIC,
    "CustomerID" NUMERIC,
    "Country" VARCHAR(50),
    "Revenue" NUMERIC,
    "month" VARCHAR(20)
);

--сумма выручки
SELECT SUM("Revenue") FROM sales;

--Топ 10 стран
select "Country", sum("Revenue") as "Revenue"
from sales
group by "Country" 
order by "Revenue" DESC
limit 10;

--Топ 10 по месяцам
select "month", sum("Revenue") as "Revenue"
from sales
group by "month" 
order by "Revenue" desc 
limit 10;

--топ 10 по товарам
select "StockCode", sum("Revenue") as "Revenue"
from sales
where "StockCode" != 'DOT' and "StockCode" != 'POST' and "StockCode" != 'M'
group by "StockCode"
order by "Revenue" desc
limit 10;

--топ 10 по кол-ву
select "StockCode", sum("Quantity") as "Сумма"
from sales
where "StockCode" != 'DOT' and "StockCode" != 'POST' and "StockCode" != 'M'
group by "StockCode"
order by "Сумма" desc 
limit 10;

--топ 10 по покупателям
select "CustomerID", Sum("Revenue") as "Revenue"
from sales
where "CustomerID" is not null
group by "CustomerID"
order by "Revenue" DESC
limit 10;
