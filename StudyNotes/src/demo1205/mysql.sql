SELECT employee_id, last_name, salary * 12 "ANNUAL SALARY"
from employees;
# 4.显示表 departments 的结构，并查询其中的全部数据
desc departments;
# 5.显示出表 employees 中的全部 job_id（不能重复）
## 1.distinct
SELECT distinct job_id
from employees;
## 2.group by
select job_id
from employees
group by job_id;
##3. union
SELECT job_id
FROM employees
UNION ALL
SELECT job_id
FROM employees;
# 6.显示出表 employees 的全部列，各个列之间用逗号连接，列头显示成 OUT_PUT
SELECT concat(employee_id, ",", last_name, ",", job_id, ",", salary, ",", department_id) as "OUT_PUT"
from employees;
# 2.
-- 查询工资大于 12000 的员工姓名和工资
select first_name,last_name,(salary+ifnull(commission_pct,0)*salary) as salary
from employees
where (salary+ifnull(commission_pct,0)*salary)>12000;
-- 2.查询员工号为 176 的员工的姓名和部门号和年薪
select first_name,last_name,department_id,(salary+ifnull(commission_pct,0)*salary)*12 as salary
from employees
where employee_id=176;
--  3.选择工资不在 5000 到 12000 的员工的姓名和工资
select first_name,last_name,(salary+ifnull(commission_pct,0)*salary) as salary
from employees
where (salary+ifnull(commission_pct,0)*salary) not between 5000 and 12000;
##where (salary+ifnull(commission_pct,0)*salary) <12000and  (salary+ifnull(commission_pct,0)*salary) >5000;
-- 4. 选择在 20 或 50 号部门工作的员工姓名和部门号
select  first_name,last_name,department_id
from employees
where department_id>20 and department_id<50;
## where department_id in (20,50);

