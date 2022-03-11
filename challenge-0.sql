/*List the following details of each employee: employee number, last name, first name, gender, and salary.*/
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
    from employees e 
        join salaries s
            on e.emp_no=s.emp_no;

/*List employees who were hired in 1986.*/
select *
    from employees e
        where EXTRACT(YEAR FROM e.hire_date)=1986;

/*List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.*/
select d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name, d_m.from_date,d_m.to_date
    from employees e, departments d, dept_manager d_m
        where e.emp_no=d_m.emp_no
            and d_m.dept_no=d.dept_no;

/*List the department of each employee with the following information: employee number, last name, first name, and department name.*/
select e.emp_no, e.first_name, e.last_name, d.dept_name
    from employees e, departments d, dept_emp d_e
        where e.emp_no=d_e.emp_no
            and d_e.dept_no=d.dept_no;

select e.emp_no, e.first_name, e.last_name, d.dept_name
    from employees e
        inner join dept_emp d_e 
            on e.emp_no=d_e.emp_no
        inner join departments d
            on d_e.dept_no=d.dept_no;


/*List all employees whose first name is "Hercules" and last names begin with "B."*/
select e.emp_no, e.first_name, e.last_name
    from employees e
        where e.first_name='Hercules'
            and e.last_name like 'B%';


/*List all employees in the Sales department, including their employee number, last name, first name, and department name.*/
select e.emp_no, e.first_name, e.last_name, d.dept_name
    from employees e, departments d, dept_emp d_e
        where e.emp_no=d_e.emp_no
            and d_e.dept_no=d.dept_no
            and d.dept_name='Sales';

/*List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.*/
select e.emp_no, e.last_name, e.first_name, d.dept_name
    from employees e, departments d, dept_emp d_e
        where e.emp_no=d_e.emp_no
            and d_e.dept_no=d.dept_no
            and (
                    d.dept_name='Sales'
                    or
                    d.dept_name='Development'
            );

/*In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/
select e.last_name, count(*) fq
    from employees e
    group by e.last_name
    order by fq desc;
