
create table salary(
emp_no int,
salary int,
from_date date,
to_date date
);

select * from salary;

create table Titiles(
emp_no int,
title VARCHAR(30),
from_date date,
to_date date);

create table dept_department(
dept_no VARCHAR(30),
dept_name VARCHAR(30));

create table dept_emp(
emp_no int,
dept_no VARCHAR(30),
from_date date,
to_date date);

create table manage(
dept_no VARCHAR(30),
emp_no int,
from_date date,
to_date date);

create table employees(
emp_no int,
birth_day VARCHAR(30),
first_name VARCHAR(30),
last_name VARCHAR(30),
gender VARCHAR(30),
hire_date date);
alter table employees
add primary key(emp_no);

alter table dept_department
add primary key (dept_no);

ALTER TABLE dept_emp
add FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp
ADD foreign key (dept_no)
REFERENCES dept_department (dept_no);

ALTER TABLE manage
ADD FOREIGN KEY(dept_no)
REFERENCES dept_department (dept_no);

ALTER TABLE manage 
ADD FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salary 
ADD FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE Titiles
ADD FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);
--1.list all employees
select emp.emp_no,emp.last_name,emp.first_name,emp.gender,s.salary
from employees as emp
join salary as s
on emp.emp_no=s.emp_no;

--2.list employees hired in 1986
select first_name,last_name,hire_date
from employees 
where hire_date<('1987-1-1')and hire_date>('1985-12-31')

--3.list managers
select man.dept_no,dep.dept_name,man.emp_no,emp.last_name,emp.first_name,man.from_date,man.to_date
from manage as man
join dept_department as dep
on man.dept_no=dep.dept_no
join employees as emp
on man.emp_no=emp.emp_no

--4.list department of ench employee
select emp.emp_no,emp.last_name,emp.first_name,dep.dept_name
from employees as emp
join manage as man
on emp.emp_no=man.emp_no
join dept_department as dep
on man.dept_no=dep.dept_no

--5.list employees with certain name
select first_name, last_name
from employees
where first_name='Hercules'
and last_name like 'B%'

--6.list employees in the Sales department
select emp.emp_no,emp.last_name,emp.first_name,dep.dept_name
from employees as emp
join manage as man
on emp.emp_no=man.emp_no
join dept_department as dep
on man.dept_no=dep.dept_no
where dept_name='Sales'

--7.list employees in the Sales and Development department
select emp.emp_no,emp.last_name,emp.first_name,dep.dept_name
from employees as emp
join manage as man
on emp.emp_no=man.emp_no
join dept_department as dep
on man.dept_no=dep.dept_no
where dept_name='Sales'
or dept_name='Development'

--8.list frequence of last name
select last_name,count(last_name) 
from employees
group by last_name
order by count(last_name) desc


