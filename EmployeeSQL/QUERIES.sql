--DATA ANALYSIS
--1. List employee details such as employee number, last name, first name, gender, and salary


SELECT public."Employee".emp_no, public."Employee".last_name, public."Employee".first_name, public."Employee".sex, public."Salaries".salary

FROM public."Employee"
INNER JOIN public."Salaries" ON
public."Employee".emp_no = public."Salaries".emp_no;

--2. List the employees who were hired in 1986: first name, last name, and hire date
SELECT first_name, last_name, hire_date
FROM public."Employee"
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

--3. For each manager list department number, department name, the manager's employee number, last name, first name.
SELECT public."department".dept_no, public."department".dept_name, public."Employee".emp_no, public."Employee".last_name, public."Employee".first_name
FROM public."department"
JOIN public."dept_manager"
ON public."department".dept_no = public."dept_manager".dept_no
JOIN public."Employee"
ON public."dept_manager".emp_no = public."Employee".emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT public."Employee".emp_no, public."Employee".last_name, public."Employee".first_name, public."department".dept_name
FROM public."Employee"
JOIN public."dept_employee"
ON (public."Employee".emp_no = public."dept_employee".emp_no)
JOIN public."department"
ON (public."department".dept_no = public."dept_employee".dept_no);

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM public."Employee"
WHERE first_name = 'Hercules' AND last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT public."Employee".emp_no, public."Employee".last_name, public."Employee".first_name, public."department".dept_name 
FROM public."Employee"
JOIN public."dept_employee"
ON public."Employee".emp_no = public."dept_employee".emp_no
JOIN public."department"
ON public."dept_employee".dept_no = public."department".dept_no
WHERE public."department".dept_name = 'Sales';

--7.  List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT public."Employee".emp_no, public."Employee".last_name, public."Employee".first_name, public."department".dept_name 
FROM public."Employee"
JOIN public."dept_employee"
ON public."Employee".emp_no = public."dept_employee".emp_no
JOIN public."department"
ON public."dept_employee".dept_no = public."department".dept_no
WHERE public."department".dept_name IN ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count (last_name) FROM public."Employee" GROUP BY last_name
ORDER BY count (last_name) DESC;