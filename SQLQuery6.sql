CREATE DATABASE fraud;
use fraud;

select * 
from fraud.[dbo].[Fraudulent Transactionscsv];

--- how many transactions occured transaction tyoe

select type, count(*) as num_transaction
from fraud.[dbo].[Fraudulent Transactionscsv]
group by type
order by 2 desc

---which transaction type has the highest type number of fraudulent transations
select top 2 type, count(*) as num_transaction 
from fraud.[dbo].[Fraudulent Transactionscsv]
group by type
order by num_transaction desc 



----average fraudulent transaction amount
select type, round(avg(amount),1) as roundvalue
from fraud.[dbo].[Fraudulent Transactionscsv]
where isFraud =1
group by type;

----what is the maximum fraudulent transaction amount
select max(amount) as maxvalue
from fraud.[dbo].[Fraudulent Transactionscsv]

----what is the maximum fraudulent transaction amount

select min(amount) as minvalue
from fraud.[dbo].[Fraudulent Transactionscsv]

---top 10 customers with highest amount defraudede

select top 10 nameOrig, sum(amount)
from fraud.[dbo].[Fraudulent Transactionscsv]
where isFraud = 1
group by nameOrig
order by 2 desc;

----how effective is the bank on flagging fraudulent transaction

select sum([isFraud]) as fraud, sum([isFlaggedFraud]) as flagged_as_fraud, sum(isFraud)/sum(isFlaggedFraud) as effectiveness
from [dbo].[Fraudulent Transactionscsv];

----top 20 fraudsters

select top 20 nameDest, sum(amount) as total_amount
from fraud.[dbo].[Fraudulent Transactionscsv]
where isFraud = 1
group by nameDest
order by 2 desc;








