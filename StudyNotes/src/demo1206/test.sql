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
