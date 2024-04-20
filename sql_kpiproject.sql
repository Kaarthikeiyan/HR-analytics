select* from hr_1_csv;
select*from hr_2;
use project_excelr;
--------------------------------------------------------------------------------------------
#KPIs-1
#Average Attrition rate for all Departments
SELECT Department,AVG(CASE WHEN 
Attrition = 'Yes' THEN 1 ELSE 0 END)
AS Average_Attrition FROM hr_1_csv
GROUP BY Department;
--------------------------------------------------------------------------------------------
#KPIs-2
#Average Hourly rate of Male Research Scientist
select avg(HourlyRate) from hr_1_csv
where Gender = "Male" and jobRole= "Research Scientist";
--------------------------------------------------------------------------------------------
#KPIs-3
#Attrition rate Vs Monthly income stats
 select * from hr_1_csv;
 select * from hr_2;
 select Attrition,sum(MonthlyIncome)
 from hr_1_csv left join hr_2 
 on hr_1_csv.EmployeeNumber=hr_2 .EmployeeID
 group by Attrition;
-----------------------------------------------------------------------------------------------
#KPIs-4
#Average working years for each Department
select hr_1_csv.department,avg(hr_2. totalworkingyears) 
as Averageworkingyear from hr_2
join hr_1_csv on hr_2.EmployeeID =hr_1_csv.employeenumber
group by department;

-----------------------------------------------------------------------------------------------
#KPIs-5
#Job Role Vs Work life balance
select hr_1_csv.Jobrole,avg(hr_2.worklifebalance) 
as Avg_worklifebalance from hr_2
join hr_1_csv on hr_2.EmployeeID =hr_1_csv.employeenumber 
group by jobrole;
-----------------------------------------------------------------------------------------------
#KPIs-6
# Attrition rate Vs Year since last promotion relation
SELECT CASE 
        WHEN hr_2.yearssincelastpromotion BETWEEN 1 AND 10 THEN '1-10'
        WHEN hr_2.yearssincelastpromotion BETWEEN 11 AND 20 THEN '11-20'
        WHEN hr_2.yearssincelastpromotion BETWEEN 21 AND 30 THEN '21-30'
        WHEN hr_2.yearssincelastpromotion >= 40 THEN '40 Plus'
    END AS Year_Group, count(hr_1_csv.attrition) AS Attrition_Rate FROM hr_1_csv
Right JOIN hr_2 ON hr_2.employeeId= hr_1_csv.employeenumber GROUP BY CASE 
        WHEN hr_2.yearssincelastpromotion BETWEEN 1 AND 10 THEN '1-10'
        WHEN hr_2.yearssincelastpromotion BETWEEN 11 AND 20 THEN '11-20'
        WHEN hr_2.yearssincelastpromotion BETWEEN 21 AND 30 THEN '21-30'
        WHEN hr_2.yearssincelastpromotion >= 40 THEN '40 Plus'
    END ;
-------------------------------------------------------------------------------------------------------------