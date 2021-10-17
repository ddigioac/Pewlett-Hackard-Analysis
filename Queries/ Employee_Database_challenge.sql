-- DELIVERABLE 1
-- Create Retirement Titles Table
SELECT employees.emp_no, 
	employees.first_name, 
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
	
SELECT * FROM retirement_titles


-- Create Unique Titles Table 
SELECT DISTINCT ON (retirement_titles.emp_no) 
	retirement_titles.emp_no,
	retirement_titles.first_name,
	retirement_titles.last_name,
	retirement_titles.title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- Create Retiring Titles Table
SELECT COUNT(unique_titles.title),
	unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY count DESC;
	
SELECT * FROM retiring_titles;

--DELIVERABLE 2: Mentorship Eligibility
	
SELECT DISTINCT ON (employees.emp_no)
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.birth_date,
	dept_emp.from_date,
	dept_emp.to_date,
	titles.title
INTO mentorship_eligibility
FROM dept_emp
	INNER JOIN employees
		ON (dept_emp.emp_no = employees.emp_no)
	INNER JOIN titles
		ON employees.emp_no = titles.emp_no
			WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	 		AND (dept_emp.to_date = '9999-01-01')
ORDER BY emp_no ASC;

SELECT * FROM mentorship_eligibility
