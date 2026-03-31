CREATE DATABASE fraud_analysis;
USE fraud_analysis;
SELECT * FROM transactions;

-- TOTAL TRANSACTIONS
SElect count(*) AS total_transaction FROM transactions;

-- FRAUD VS NON FRAUD COUNT
SELECT Class, Count(*) AS count FROM transactions GROUP BY Class;

-- FRAUD RATE %
SELECT (SUM(Class)/ count(*))* 100 AS fraud_rate from transactions;

-- AVG TRANSACTION AMOUNT
SELECT AVG(Amount) FROM transactions;

-- FRAUD VS NON FRAUD AVG AMOUNT
select Class, AVG(Amount) AS avg_amount FROM transactions group by class;

-- HIGH VALUE FRAUD TRANSACTIONS
SELECT * FROM transactions WHERE class=1 order by Amount DESC limit 10;

-- RISK SEGMENT
SELECT CASE WHEN Amount < 50 THEN 'Low' WHEN Amount BETWEEN 50 AND 200 THEN 'Medium'
	ELSE 'High'
    END AS amount_category,
    COUNT(*) AS total_transactions,
    SUM(Class) AS fraud_count
FROM transactions
GROUP BY amount_category;

-- TIME BASED ANALYSIS
SELECT FLOOR(Time/3600) AS hour, COUNT(*) AS total,
SUM(Class) AS fraud_count
FROM transactions
GROUP BY hour
ORDER BY hour;