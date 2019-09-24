# sql-challenge

## Dependencies/Tools
* ERD sketch tool, such as [QuickDatabaseDiagrams](http://www.quickdatabasediagrams.com/)
* SQL database (PostgreSQL used here)
* SQL client (used pgAdmin)
* Docker container (used for hosting SQL database + client). YAML file for Postgres + pgAdmin found [here](https://github.com/khezen/compose-postgres)
* (**BONUS**) pandas + sqlalchemy modules in Python

## Overview
I have been tasked by the fictional Pewlett-Hackard company to discover some insights on their employee data from the 1980s and 1990s. Using the provided data, I create a data model including an ERD diagram and table schema that includes specific data types, primary keys, foreign keys, and other constraints. Data collected from CSVs is then loaded to the SQL database and the following analysis questions are answered using SQL queries:

1. List the following details of each employee: employee number, last name, first name, gender, and salary.

2. List employees who were hired in 1986.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List all employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

As a BONUS, it is suspected that the given data is fake. To prove it, a Jupyter Notebook has been provided to create a bar chart of average salary by title to show that not all is well in the data.

## Directory Structure
* **/raw_data** - contains given CSV files for employee and department related data
* **/EmployeeSQL** - contains bonus analysis in Jupyter notebook and in-depth description of data engineering steps
    * **/data_model** - contains ERD sketch, schema DDL, and SQL queries to answer the above questions