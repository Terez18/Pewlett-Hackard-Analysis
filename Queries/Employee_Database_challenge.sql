SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date
-- INTO retirement_titles 
FROM employees AS e 
LEFT JOIN titles AS ti 
ON(e.emp_no=ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

DROP TABLE recent_emp_title

-- Use Dictinct with Orderby to remove duplicate rows. Creating the Unique_titles table with the data below. 
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name, 
	rt.last_name, 
	rt.title
-- INTO recent_emp_title
FROM retirement_titles AS rt
ORDER BY rt.emp_no ASC, rt.to_date DESC;


SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM recent_emp_title as ut
GROUP BY ut.title 
ORDER BY COUNT(ut.emp_no) DESC;


SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp as de
ON (e.emp_no=de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no=ti.emp_no)	
WHERE de.to_date = '9999-01-01'
AND(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no 

	

SELECT SUM(count) FROM retiring_titles



SELECT COUNT(emp_no) FROM mentorship_eligibility