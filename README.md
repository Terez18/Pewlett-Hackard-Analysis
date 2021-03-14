# Pewlett-Hackard-Analysis
SQL_PostgreSQL11_pgAdmin

---

## Overview of the analysis: 

The purpose of this analysis is to help Bobby prepare for the large changes about to happen at his company. Thousands of employees are going to retire and for this specific assignment Bobby would like to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. 

---

## Link to Complete Code
![Employee_Database_challenge.sql](Queries/Employee_Database_challenge.sql)

---

## Results: 

The results of this analysis include the following:

1. table 1: retirement_titles 
The first step was to create a table with retiring employees, including their employee number, name, title and from and to dates. In order to have all of this information, two tables were merged: the employees table and the titles table. The data was filtered to include only employees born in the years 1952 to 1955 assuming these are the employees that are close to retirement age. 
When this table was created it was also ordered by employee number which made it easy to see that the list included the same employee more than once in many cases. This was likely because some employees titles changed due to promotions or other reasons. Therefore, a second table was created to eliminate the duplicates. 

#### Image of table 1
![table_1.png](Queries/table_1.png)


2. table 2: unique_titles
This table was created in order to elimintae duplicates, so each employee appears only once in the table, so the counting of employees is accurate. In my code the name of this table is recent_emp_title. Then when I exported it I saved it as unique_titles. 
DISTINCT ON was used to choose each employee only once. Aliases were used here and also in the previous table to create cleaner code. For example, rt was used instead of retirement_titles. This table was also organized by employee number as well as by to_date. 

#### Image of table 2
![table_2.png](Queries/table_2.png)


3. table 3: retiring_titles
The number of retiring employees by title:
Finally, the number of employees by title was counted in the third table. The data was organized by titles using GROUP BY ut.title. and then the number of employees holding each specific title were counted using SELECT COUNT(ut.emp_no). 

#### Image of table 3
![table_3.png](Queries/table_3.png)


4. table 4: mentorship_eligibility
The next table was created in order to show the current employees who were born between January 1, 1965 and December 31, 1965. In order to include the needed data for this table, 3 tables were merged: the employees table, the department employees table and the titles table. The data was filtered to include only employees that are still working at the company using WHERE de.to_date = '9999-01-01' and another filter was to include only employees born in 1965. This table was also organized by emp_no.  

#### Image of table 4
![table_4.png](Queries/table_4.png)


## Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."

Bobby is preparing for major changes in human resources in the company. He will need to replace more than 90,000 employees in the coming years due to many employees retiring. In order to find out what roles will need to be filled and how many, a table was created to provide the number of retiring employees by title. This will help Bobby plan for filling these positions with the appropriate new employees. 
Training new employees will help Bobby with a smooth transition. The number of employees that are eligible for mentorship is 1549. These are the employees born in 1965 so it is quite likely that this is only a part of the picture and there may be more employees eligible for mentorship than those counted here. Bobby will need to have a more complete understanding of the numbers in order to make sound decisions. 
Answers to the following qestions: 

1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?

SELECT SUM(count) FROM retiring_titles 
90,398 employees is the total  number of employees that will need to be replaced. Or in other words this is the total number of roles that will need to be filled. 

2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

The number of employees that are eligible for mentorship at Pewlett Hackard is 1549. Since there are 90,398 employees that are about to retire, there is a very big mismatch that will need to be addressed. I'm assuming that the employees born in 1965 are supposed to be the mentors? if that is the case, then there are very few mentors for very many vacancies. It would be good to check if there are potential employees that could fill this gap from other years not only 1965. Unless there is a specific reason for shoosing this year only. The way to do that would be with the following code:
(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') instead of 1965 insert a larger range of years. Another thing that would be helpful to know is which departments the employees that are eligible for mentorship are in and what titles they hold. filtering the data by age and by department could help with that. using WHERE to filter by department name or by title. 



