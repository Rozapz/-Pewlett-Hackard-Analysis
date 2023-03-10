# Pewlett-Hackard-Analysis

## Overview of the analysis

This report analyzes the number of retiring employees in Pewlett Hackard company. There is a “silver tsunami” as many of the current employees are reaching retirement age. The purpose of this work is to determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program. 

## Results:
The data for this analysis is available in several places and the first step to start analyzing it is to make Entity Relationship Diagram (ERD).

![ERD](/Resources/EmployeeDB.png)
  - To start the analysis, the employees are filtered by their date of birth. Only employees born between 1952 and 1955 are saved in retirement_titles.csv.
  - To further advance the analysis, it is important to find employees latest job title. To do so, by using DISTINCT ON and ORDER commands in SQL, we found the latest title of each employee. These data are saved in unique_titles.csv. 
  - Analysis is showing that the most of the retiring employee has the senior title as shown in the table below and is saved into retiring_titles.csv .
  
 ![number of retiring employee and their titles](/Resources/count.PNG)

  - Candidates that can become mentors are saved into the mentorship_eligibilty.csv file for the managers.
  
## Summary:
How many roles will need to be filled as the "silver tsunami" begins to make an impact?
72,458 employees are close to be retired.

Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
There are 1549 employees that can mentor the next generation of Pewlett Hackard employees.

Additional Queries/Tables
The first additional query I think would benefit managers are retiring employees in each department. Mentorship in some departments are more important compared to other departments.
The second useful query would be finding gender in each department, this could be a useful information for the HR department to make sure that there is a gender equality in the company.
