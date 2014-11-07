-- Allison Neyer
-- Kalventure database queries 
-- 
-- a.) Find the names of all the users who are normal weight. 

SELECT username
FROM User
WHERE userBMI = 'normal weight';

--Results returned:
-- 
--  username
-- ----------------
-- 	aneyer
--	rToal
-- 

-- b) Find the average number of daily logins for Kalventure users.
SELECT avg(User.dailyCounter)  
FROM User;




--
--c) Most common mini game earned in Kalventure 


SELECT MAX(UserEarnsMiniGames.miniGameName)
	FROM UserEarnsMiniGames;


	
-- 	
-- d) Average amount of money spent by females 

Select avg (Avatar.MoneyCredits)
FROM User
INNER JOIN Avatar
ON User.username = Avatar.username
WHERE User.userGender = "F"
;


AND Avatar.MoneyCredits >=
	(SELECT MAX(MoneyCredits)
	FROM Avatar
	);

	

Select avg(A.MoneyCredits) 
FROM User
, Avatar AS A
where User.userGender = "F"
AND Avatar.MoneyCredits >=
	(SELECT MAX(MoneyCredits)
	FROM Avatar
	);

	
	what cheats have each of the users unlcoked?
	
	
	
	SELECT works.company_name
FROM works
GROUP BY works.company_name 
HAVING count(distinct works.employee_name) <=ALL
	(SELECT count(distinct works.employee_name)
		FROM works
		GROUP BY works.company_name
	);
-- e) Which female spent the most money 

Select distinct User.username
FROM User
, Avatar
where User.userGender = "F"
AND Avatar.MoneyCredits >=
	(SELECT MAX(MoneyCredits)
	FROM Avatar
	);

	
	
	
SELECT count() works1.employee_name
FROM works AS works1
WHERE works1.salary >
			(SELECT MAX(works.salary)
			FROM works
			WHERE works.company_name = 'Small Bank Corporation' 
			);
	
	
	-- 4) average amount of money spent
	
	Select avg(Avatar.MoneyCredits) 
	FROM Avatar 

-- 
-- d) Find all employees in the database who live in the same cities as the companies for which they work.

SELECT employee.employee_name
FROM employee 
	,works 
	,company 
where employee.employee_name = works.employee_name
AND works.company_name= company.company_name
AND employee.city = company.city;



-- e) Find all employees in the database who live in the same cities and on the same streets as do their managers.

SELECT employee.employee_name
FROM employee
	,manages
	, employee AS e2
where employee.employee_name = manages.employee_name
AND manages.manager_name = e2.employee_name
AND employee.street = e2.street
AND employee.city = e2.city;
 
-- f) Find all employees in the database who do not work for First Bank Corporation

SELECT works.employee_name
FROM works
where company_name != 'First Bank Corporation';


-- g.) Find all employees in the database who earn more than every employee of Small Bank Corporation.

SELECT works1.employee_name
FROM works AS works1
WHERE works1.salary >
			(SELECT MAX(works.salary)
			FROM works
			WHERE works.company_name = 'Small Bank Corporation' 
			);
			
-- alternative way of solving problem:	
SELECT works1.employee_name
FROM works AS works1
WHERE works1.salary >ALL
			(SELECT works.salary
			FROM works
			WHERE works.company_name = 'Small Bank Corporation' 
			);

-- note: aliases are not necessary so answer could also be
SELECT works.employee_name
FROM works
WHERE works.salary >
			(SELECT MAX(works.salary)
			FROM works
			WHERE works.company_name = 'Small Bank Corporation' 
			);			

-- EMPLOYEE_NAME           SALARY
-- -------------------- ---------
-- August 	150000.00
-- Schmidt 	120000.00


-- h.) Assume that the companies may be located in several cities.  Find all companies located in every city in which Small Bank Corporation is located

SELECT company.company_name
FROM company
	, company AS c2
WHERE c2.company_name = 'Small Bank Corporation'
AND company.city = c2.city;


 -- COMPANY_NAME
-- ----------------------------
-- Small Bank Corporation

-- i.) Find all employees who earn more than the average salary of all employees of their company.


SELECT W2.employee_name 
FROM works as W2
where W2.salary > 
	(SELECT AVG(W3.salary)
	FROM works AS W3 
	WHERE W3.company_name = 
	W2.company_name
	);

-- EMPLOYEE_NAME
-- --------------------
-- Adams
-- August
-- Brooks
-- Ferris
-- Glenn
-- Green
-- Johnson
-- Laikin


--j.) Find the company that has the most employees. Show the company name and number of employees.


SELECT works.company_name
	,count(distinct works.employee_name)
FROM works
GROUP BY works.company_name 
HAVING count(distinct works.employee_name) >=ALL
	(SELECT count(distinct works.employee_name)
		FROM works
		GROUP BY works.company_name
	);
	
	-- having applies predicate to that particular group in same way that where does
	-- group by groups the tables by an attribute 
	-- where takes out rows
	-- >=ALL compares to all elements of the set
	



-- COMPANY_NAME	COUNT(DISTINCT employee_name)
-- ------------------------------   -----------------------------
-- First Bank Corporation 	5


--k.) Find the company that has the smallest payroll.


-- This is the answer if smallest payroll means the payroll with the least number of people. If so the given answer is incorrect and the results should be Cathedral Software and Integrated Data Systems.
SELECT works.company_name
FROM works
GROUP BY works.company_name 
HAVING count(distinct works.employee_name) <=ALL
	(SELECT count(distinct works.employee_name)
		FROM works
		GROUP BY works.company_name
	);
	

-- This is the answer if smallest payroll means the payroll with the least number of people and smallest salary:

SELECT
    w.company_name
FROM works w
GROUP BY w.company_name
ORDER BY SUM(w.salary) ASC
, COUNT(w.employee_name) ASC
LIMIT 1
;





-- SELECT
--    w.company_name
--  , SUM(w.salary) AS total_payroll
-- FROM works w
-- GROUP BY w.company_name
-- ORDER BY total_payroll ASC
-- , COUNT(w.employee_name) ASC
-- LIMIT 1
-- ;
 
 

-- COMPANY_NAME
-- ------------------------------
-- Cathedral Software

-- l.) Find those companies whose employees earn a higher salary, on average, than the average salary at First Bank Corporation.

SELECT distinct W2.company_name 
FROM works as W2
GROUP BY W2.company_name
HAVING AVG(W2.salary) >ALL 
	(SELECT AVG(W3.salary)
	FROM works AS W3 
	WHERE W3.company_name = 
	'First Bank Corporation' 
	);
		

-- COMPANY_NAME
-- ------------------------------
-- IBM
-- Integrated Data Systems
-- Multnomah Software
-- Small Bank Corporation
-- Sneakers
