# 2.
## 1. 查询工资大于 12000 的员工姓名和工资
select first_name,last_name,salary
from employees
where salary>12000;
## 2. 查询员工号为 176 的员工的姓名和部门号和年薪
select first_name,last_name,department_id,(salary+ifnull(commission_pct,0))*12
from employees
where employee_id=176;
## 3. 选择工资不在 5000 到 12000 的员工的姓名和工资
select  first_name,last_name,salary
from employees
where salary not between 5000 and 12000;
## 4. 选择在 20 或 50 号部门工作的员工姓名和部门号
    select  first_name,last_name,department_id
    from employees
    where department_id between 20 and 50;
## 5. 选择公司中没有管理者的员工姓名及 job_id
    select  first_name,last_name,job_id
    from employees
    where manager_id is null;
## 6. 选择公司中有奖金的员工姓名，工资和奖金级别
        select  first_name,last_name,salary,case(commission_pct)
    from employees
    where commission_pct is not null;
## 7. 选择员工姓名的第三个字母是 a 的员工姓名
select  last_name
from employees
where last_name like '__a%';
## 8. 选择姓名中有字母 a 和 e 的员工姓名
select last_name
from employees
where last_name like '%a%' and last_name like '%e%';
## 9. 显示出表 employees 表中 first_name 以 'e'结尾的员工信息
select  first_name,last_name
from employees
where first_name like '%e';
## 10. 显示出表 employees 部门编号在 80-100 之间 的姓名、职位
select  first_name,department_id
from employees
where department_id between  80 and 100;
## 11. 显示出表 employees 的 manager_id 是 100,101,110 的员工姓名、职位
select first_name,last_name,department_id
from employees
where manager_id in (100,101,110);
# 3.
## 1. 查询员工的姓名和部门号和年薪，按年薪降序 按姓名升序
select  first_name,last_name,department_id,(salary+ifnull(commission_pct,0))*12
from employees
order by (salary+ifnull(commission_pct,0))*12 desc,first_name asc;
## 2. 选择工资不在 8000 到 17000 的员工的姓名和工资，按工资降序
select first_name,last_name,salary
from employees
where salary not between 8000 and 17000
order by salary desc ;
## 3. 查询邮箱中包含 e 的员工信息，并先按邮箱的字节数降序，再按部门号升序
select  first_name,last_name,email,department_id
from employees
where email like '%e%'
order by length(email) desc,department_id asc;
# 4.
# 1. 显示系统时间(注：日期+时间)
select  now()
# 2. 查询员工号，姓名，工资，以及工资提高百分之 20%后的结果（new salary）
select employee_id,first_name,last_name,salary,salary*1.2
from employees;
# 3. 将员工的姓名按首字母排序，并写出姓名的长度（length）
select  first_name,last_name,length(first_name)
from employees
order by  lpad(first_name,1,1);
# order by substring(first_name,1,1);
# 4. 做一个查询，产生下面的结果
/*<last_name> earns <salary> monthly but wants <salary*3>
                    Dream Salary
            King earns 24000 monthly but wants 72000*/
select concat(last_name,' earns ',salary,' monthly but wants ',salary*3,' Dream Salary')
from employees
where last_name='K_ing';

# 5. 使用 case-when，按照下面的条件：
/*job         grade
AD_PRES   A
ST_MAN   B
IT_PROG   C
SA_REP     D
ST_CLERK  E
产生下面的结果
Last_name Job_id           Grade
king           AD_PRES           A*/

#练习5 分组函数
# 1. 查询各 job_id 的员工工资的最大值，最小值，平均值，总和，并按 job_id 升序
select job_id,max(salary) "最大值",min(salary) "最小值",avg(salary)"平均值",sum(salary) "总和"
from employees
group by job_id
order by job_id asc;
# 2. 查询员工最高工资和最低工资的差距（DIFFERENCE）
select max(salary)-min(salary) "差距"
from employees;
# 3. 查询各个管理者手下员工的最低工资，其中最低工资不能低于 6000， 没有管理者的员 工不计算在内
select  manager_id,min(salary)
from employees
where salary>6000 and manager_id is not null
group by  manager_id;
# 4. 查询所有部门的编号，员工数量和工资平均值,并按平均工资降序
select  department_id,count(employee_id) "员工数量",avg(salary) "平均工资"
from employees
group by department_id
order by avg(salary) desc;
# 5. 选择具有各个 job_id 的员工人数
select  job_id,count(employee_id)
from employees
where job_id is not null
group by job_id;
#测 试6 分组查询
# 1. 查询公司员工工资的最大值，最小值，平均值，总和
select department_id,max(salary) "最大值",min(salary) "最小值",avg(salary) "平均值",sum(salary) "总和"
from employees
group by  department_id
having department_id is not null;
# 2. 查询员工表中的最大入职时间和最小入职时间的相差天数 （DIFFRENCE）
select  max(hiredate)-min(hiredate)
from employees;
# 3. 查询部门编号为 90 的员工个数
select  count(employee_id)
from employees
where department_id=90;
# 测 试
# 一、查询编号>3 的女神的男朋友信息，如果有则列出详细，如果没有，用 null 填充
select  *
from boys right outer join beauty
on beauty.boyfriend_id=boys.id
where beauty.id>3;
# 二、查询哪个城市没有部门
 select  city
 from locations left outer join departments
 on  locations.location_id=departments.location_id
    where departments.location_id is null;
select   city
from locations
where location_id not in (select location_id from departments);
# 三、查询部门名为 SAL 或 IT 的员工信息
    select  last_name,department_name
    from departments right outer join employees
    on departments.department_id=employees.department_id
    where department_name in ('IT','SALES');
select last_name,department_name
from employees
where department_id in (select department_id from departments where department_name in ('IT','SALES'));
# 语法连接测试测 试
# 1. 显示所有员工的姓名，部门号和部门名称。
select  last_name,employees.department_id,department_name
from employees left join departments
on employees.department_id=departments.department_id;
# 2. 查询 90 号部门员工的 job_id 和 90 号部门的 location_id
    select first_name,last_name,departments.department_id, job_id,location_id
    from departments right join employees
    on departments.department_id=employees.department_id
    where departments.department_id=90;
#选择所有有奖金的员工的 last_name , department_name , location_id , city
    select commission_pct,last_name,department_name,departments.location_id,city
    from employees left join departments
    on  employees.department_id=departments.department_id
    left join locations
    on departments.location_id=locations.location_id
    where commission_pct is not null;
# 4. 选择city在Toronto工作的员工的
# last_name , job_id , department_id , department_name
select last_name,department_name,city
from employees left join departments
                         on  employees.department_id=departments.department_id
               left join locations
                         on departments.location_id=locations.location_id
where city='Toronto';

# 5.查询每个工种、每个部门的部门名、工种名和最低工资
# TDOD
select  job_id,job_title,department_name,min(salary)

# 6.查询每个国家下的部门个数大于 2 的国家编号
# 7、选择指定员工的姓名，员工号，以及他的管理者的姓名和员工号，结果类似于下面的格
# 式
# employees Emp# manager Mgr#
# kochhar 101 king 100
# 测 试
# 1. 查询和 Zlotkey 相同部门的员工姓名和工资
select last_name,salary,department_id
from employees
where department_id in (select  department_id from employees where last_name='Zlotkey')
and last_name!='Zlotkey';
# 2. 查询工资比公司平均工资高的员工的员工号，姓名和工资。
select last_name,employee_id,salary,avg(salary)
# 3. 查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资
# 4. 查询和姓名中包含字母 u 的员工在相同部门的员工的员工号和姓名
# 5. 查询在部门的 location_id 为 1700 的部门工作的员工的员工号
# 6. 查询管理者是 King 的员工姓名和工资
# 7. 查询工资最高的员工的姓名，要求 first_name 和 last_name 显示为一列，列名为 姓.名
