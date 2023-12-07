-- 案例
# 查询所有员工,按工资排序
select *
from employees
order by salary desc;

#  2. 查询所有员工,按工资排序
select *
from employees
order by 7;

#
select  concat(lower(substring(first_name,1,1)),'_',upper(substring(first_name,2))) as name
from employees;

-- 课堂练习
#  1.查询每个部门的员工的平均工资
select department_id,avg(salary)
from employees
group by department_id;
# 2.查询每个位置(location_id) 的部门数量
select location_id,count(*)
from departments
group by location_id;
# 3.-
select  max(salary)
from employees
where email like '%A%';










# 练习2
## 1.查询员工名和对应的部门名
select first_name,last_name,department_name
from employees,departments
where employees.department_id=departments.department_id;
## 2.查询员工名、工种号、工种名
select  first_name,last_name,employees.job_id,jobs.job_title
from employees ,jobs
where employees.job_id=jobs.job_id;
## 3. 查询有奖金的员工名、部门名
select  first_name,last_name,department_name,commission_pct
from employees,departments
where employees.department_id=departments.department_id and employees.commission_pct is not null;
## 4.查询城市名中第二个字符为o的部门名和城市名
select department_name,city
from departments,locations
where department_id



