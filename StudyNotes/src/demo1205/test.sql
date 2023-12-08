# 1. 查询工资大于 12000 的员工姓名和工资
select first_name,last_name,salary
from employees
where salary>12000;
# 2. 查询员工号为 176 的员工的姓名和部门号和年薪
select first_name,last_name,department_id,(salary+ifnull(commission_pct,0))*12
from employees
where employee_id=176;
#3. 选择工资不在 5000 到 12000 的员工的姓名和工资
select  first_name,last_name,salary
from employees
where salary not between 5000 and 12000;
# 4. 选择在 20 或 50 号部门工作的员工姓名和部门号
    select  first_name,last_name,department_id
    from employees
    where department_id between 20 and 50;
# 5. 选择公司中没有管理者的员工姓名及 job_id
    select  first_name,last_name,job_id
    from employees
    where manager_id is null;
# 6. 选择公司中有奖金的员工姓名，工资和奖金级别
    select  first_name,last_name,salary,case(commission_pct)
    from employees
    where commission_pct is not null;

# 7. 选择员工姓名的第三个字母是 a 的员工姓名

# 8. 选择姓名中有字母 a 和 e 的员工姓名
# 9. 显示出表 employees 表中 first_name 以 'e'结尾的员工信息
# 10. 显示出表 employees 部门编号在 80-100 之间 的姓名、职位
# 11. 显示出表 employees 的 manager_id 是 100,101,110 的员工姓名、职位
