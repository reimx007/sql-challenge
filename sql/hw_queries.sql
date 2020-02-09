-------------------------------------------------------------------------------------------------------------
-- #1 List the following details of each employee: employee number, last name, first name, gender, and salary.
-------------------------------------------------------------------------------------------------------------
SELECT "e"."emp_no", "e"."last_Name", "e"."first_Name", "e"."gender", "s"."salary"
FROM "employees" "e"
JOIN "salaries" "s"
ON ("e"."emp_no" = "s"."emp_no")
;

-------------------------------------------------------------------------------------------------------------
-- #2 List employees who were hired in 1986.
-------------------------------------------------------------------------------------------------------------
select "e"."emp_no", "e"."last_Name", "e"."first_Name","e"."hire_date"
FROM "employees" "e"
WHERE "e"."hire_date" BETWEEN '1984-12-31' and '1986-01-01' ;

-------------------------------------------------------------------------------------------------------------
-- #3 List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.
-------------------------------------------------------------------------------------------------------------
Select d."dept_no", d."dept_name", dm."emp_no", e."last_Name", e."first_Name",
e."hire_date", dm."to_date"
From departments d
Inner Join dept_managers dm on d.dept_no = dm.dept_no
Inner Join employees e on e.emp_no = dm.emp_no
;

-------------------------------------------------------------------------------------------------------------
-- #4 List the department of each employee with the following 
-- information: employee number, last name, first name, and department name.
-------------------------------------------------------------------------------------------------------------
SELECT employees."emp_no",
  employees."last_Name",
  employees."first_Name",
  --dept_emp."dept_no",
  departments."dept_name"
FROM employees --;
INNER JOIN dept_emp ON employees."emp_no" = dept_emp."emp_no"
INNER JOIN departments ON dept_emp."dept_no" = departments."dept_no";

-------------------------------------------------------------------------------------------------------------
-- #5 List all employees whose first name is "Hercules" 
-- and last names begin with "B."
-------------------------------------------------------------------------------------------------------------
select * from employees;
select "emp_no", "first_Name",  "last_Name"
from employees
where "first_Name" = 'Hercules' and "last_Name" like 'B%';

-------------------------------------------------------------------------------------------------------------
-- #6 List all employees in the Sales department, including 
-- their employee number, last name, first name, and department name.
-------------------------------------------------------------------------------------------------------------
select --dept_emp."dept_no",
	employees."emp_no", 
	employees."last_Name", 
	employees."first_Name",
	departments."dept_name"
from employees
INNER JOIN dept_emp ON employees."emp_no" = dept_emp."emp_no" 
INNER JOIN departments ON dept_emp."dept_no" = departments."dept_no" 
where dept_emp."dept_no" = 'd007';

-------------------------------------------------------------------------------------------------------------
-- #7 List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.
-------------------------------------------------------------------------------------------------------------
select --dept_emp."dept_no",
	employees."emp_no", 
	employees."last_Name", 
	employees."first_Name",
	departments."dept_name"
from employees
INNER JOIN dept_emp ON employees."emp_no" = dept_emp."emp_no" 
INNER JOIN departments ON dept_emp."dept_no" = departments."dept_no" 
where dept_emp."dept_no" in ( 'd005','d007');

-------------------------------------------------------------------------------------------------------------
-- #8 In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
-------------------------------------------------------------------------------------------------------------
select "last_Name",
count("last_Name") as count
from employees
group by "last_Name"
order by count DESC;






