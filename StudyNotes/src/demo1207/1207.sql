# 外连接 案例1
select first_name, last_name, department_name, salary
from employees
         left outer join departments
                         on employees.department_id = departments.department_id;

# 2没有员工的部门信息
select departments.department_id, employee_id
from departments
         left outer join employees
                         on employees.department_id = departments.department_id
where employee_id is null;

# 3. 显示没有部门的城市
select city, department_name
from locations
         left outer join departments
                         on locations.location_id = departments.location_id
where department_id is null;

# 查询 job_id 和 'Chen' 相同,并且 salary <'K_ing' 的工资的员工信息
select first_name, last_name, salary, job_id
from employees
where job_id = (select job_id from employees where last_name = 'Chen')
  and salary < min((select salary from employees where last_name = 'K_ing'));

# 练习2
select last_name, salary
from employees
where salary = (select min(salary) from employees);

#练习3
select last_name, salary
from employees
where salary > (select avg(salary) from employees where department_id = 20);

# 练习4
select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary) from employees where department_id = 50);
# 子查询
#查询 30 高
select last_name, salary
from employees
where salary > any (select distinct salary from employees where department_id = 30);
# 查询每个部门的人数


select department_id, count(*)
from employees
         right join departments on departments.department_id = employees.department_id
group by departments.department_id;

# linit
select employee_id, salary
from employees
order by salary desc
limit 5;
# 查询 60号部门的员工,工资大于8000
select employee_id, last_name
from employees
where department_id = 60
union
select employee_id, last_name
from employees
where salary > 8000;
#
