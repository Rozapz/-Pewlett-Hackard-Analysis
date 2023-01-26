
--Deliverable 1

--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
FROM employees
--Retrieve the title, from_date, and to_date columns from the Titles table
SELECT title, from_date, to_date
FROM titles
--Using DISTINCT ON to see the the result
SELECT DISTINCT ON (emp_no) title,from_date, to_date
FROM titles
ORDER BY emp_no, from_date DESC;

--Join both tables on the primary key.
SELECT DISTINCT ON (em.emp_no) em.emp_no, em.first_name, em.last_name,
	ti.title, ti.from_date, ti.to_date
--INTO number_retiring
FROM employees AS em 
JOIN titles AS ti
ON em.emp_no = ti.emp_no
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no, ti.from_date DESC;

--
--Creat a retirement_titles table
--
SELECT  em.emp_no, em.first_name, em.last_name,
	ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees AS em 
JOIN titles AS ti
ON em.emp_no = ti.emp_no
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no, ti.from_date ASC;

--Use the DISTINCT ON statement to retrieve the first occurrence of the employee
--number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, from_date DESC;


--
--Creat a unique_titles table
--
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, from_date DESC;

--retrieve the number of titles from the Unique Titles table
SELECT COUNT(DISTINCT (title))
FROM unique_titles

--retrieve the number of employees by their most recent
--job title who are about to retire
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--Deliverable 2

--Retrieve the emp_no, first_name, last_name, and birth_date
SELECT emp_no, first_name, last_name, birth_date
FROM employees

--Retrieve the from_date and to_date
SELECT from_date, to_date
FROM dept_emp

--Retrieve the title
SELECT title
FROM titles

--Using DISTINCT ON
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, birth_date
FROM employees

--Create a new table as mentorship_eligibilty
SELECT DISTINCT ON (em.emp_no) em.emp_no, em.first_name, em.last_name, em.birth_date,
	de.from_date, de.to_date,  ti.title
INTO mentorship_eligibilty
FROM employees AS em
JOIN dept_emp as de
ON em.emp_no = de.emp_no
JOIN titles AS ti
ON de.emp_no = ti.emp_no
WHERE (de.to_date = '9999-01-01'
	   AND em.birth_date BETWEEN '1965-01-01' AND '1965-12-31' )
ORDER BY em.emp_no ASC;



