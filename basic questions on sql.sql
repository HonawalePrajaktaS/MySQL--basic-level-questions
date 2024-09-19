/*Write a query to select the name and age of all employees who are older than 30 years.*/
select name,age from employees where age>30;
select count(*) from employees where age>30;

/*Write a query to select all columns from the employees table and order the results by salary in descending order.*/
select * from employees order by salary desc;

/* Write a query to count the number of employees in each department.*/
select department_id,count(*) from employees group by department_id;

/*Write a query to count the number of employees in 
each department but only include departments with more
 than 5 employees.*/
 select department_id, count(*) as no_of_emp 
 from employees group by department_id
 having no_of_emp>=5;
 
 /*Write a query to select the employee_id,
 employee_name, and department_name from the 
 employees and departments tables where the
 department_id matches.*/
 
 select e.employee_id, e.name, d.department_name 
 from employees e join departments d 
 on d.department_id=e.department_id ;
 
 /* Write a query to select all employees and
 their corresponding department names.
 Include employees even if they are not assigned 
 to any department.*/
 select e.employee_id, e.name, d.department_name from 
 employees e left join departments d
 on e.department_id=d.department_id
 ;
 /*Write a query to select all departments and 
 their corresponding employees. Include departments 
 even if they have no employees assigned*/
 
 select d.department_name , e.name from employees e
 right join  departments d on d.department_id=e.department_id
 ; 
 
 /*Write a query to list all employees and all 
 departments, showing which employee belongs to
 which department, including those without matches*/
 
 select e.name, d.department_name from employees e 
 full join departments d;
 
 /*Write a query to produce a Cartesian product of the
 employees and departments tables*/
 select e.name, d.department_name from employees e 
 cross join departments d;
 
 /*Write a query to combine the results of two queries: 
 one that selects all employees from the New York branch 
 and another that selects all employees from the Los Angeles branch*/
 
 
 select branch,name from employees where branch="New York"
 union
 select branch , name from employees where branch = "Los Angeles";
 
 
 /*Write a query to select all unique job titles from
 the employees table*/
 select distinct job_title from employees;


/*Write a query to select the first 10 employees after 
skipping the first 5 employees in the employees table*/
select name from employees limit 5,10;
 
 /*Write a query to find the total salary, 
 average salary, minimum salary, and maximum salary 
 of all employees*/
 select sum(salary) as total_salary, avg(salary) as avg_salary, 
 min(salary) as min_salary, max(salary) as max_salary
 from employees;
 
/*Write a query to select all employees whose age is
 between 25 and 35 and whose department is either Sales 
 or Marketing*/
 select e.name, d.department_name from employees e 
 join departments d on e.department_id=d.department_id
 where e.age between 25 and 35 and
 d.department_name in ("HR","Finance");

/*Write a query to select all employees whose names start with
 'A' and end with 'e'*/ 
 select name from employees where name like "A%" and name like "%e";
 select name from employees where name like "A%e";
 select name from employees;
 
 /*Write a query to select the names of employees whose salary 
 is higher than the average salary of their department*/
 select name,salary from employees 
 where salary>(select avg(salary) from employees);
 
 /*Write a query to classify employees as High salary, 
 Medium salary, or Low salary based on their salary values*/
 select name,salary,
 case
	when salary>90000 then "High salary"
    when salary between 60000 and 90000 then "medium salary"
	else "low salary"
end as salary_catagory
from employees; 
 
 /*Write a query to select all departments 
 that have more than 5 employees*/
select department_id,count(*) as cnt from employees group by department_id having cnt>=5;
select d.department_name as cnt from departments d
where exists
(select 100 from employees e
where e.department_id=d.department_id
group by e.department_id
having count(e.employee_id)>=3);
 
 /*Write a query to find all employees who report to the same manager*/
 SELECT e1.name AS employee_name,e2.name AS coworker_name,e1.manager_id
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.manager_id
WHERE e1.employee_id <> e2.employee_id
ORDER BY e1.manager_id, e1.name, e2.name;

select manager_id, name from employees group by manager_id;
select * from employees;
 
 
 /*Write SQL statements to create a projects table with columns 
 project_id, project_name, start_date, end_date, 
 and then insert a few sample records into this table*/
 
 create table project(project_id int, project_name varchar(10), 
 start_date date ,end_date date);
 select * from project;
 insert into project (project_id,project_name,start_date,end_date)
 values (101,"mission-1","2002-02-02","2002-03-03");
 
 
 
 
 
 
 