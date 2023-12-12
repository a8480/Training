
#进阶5：分组查询


#分组函数

功能：用作统计使用，又称为聚合函数或统计函数或组函数

分类：
sum 求和、avg 平均值、max 最大值 、min 最小值 、count 计算个数

特点：
1、sum、avg一般用于处理数值型
   max、min、count可以处理任何类型
2、以上分组函数都忽略null值

3、可以和distinct搭配实现去重的运算

4、count函数的单独介绍
一般使用count(*)用作统计行数

5、和分组函数一同查询的字段要求是group by后的字段




#1、简单 的使用


#2、参数支持哪些类型  字符串SUM(last_name)，日期SUM(hiredate) 数字COUNT(commission_pct)


#3、是否忽略null



二、group by子句

语法：

select 查询列表
from 表
【where 筛选条件】
group by 分组的字段
【order by 排序的字段】;

特点：
1、和分组函数一同查询的字段必须是group by后出现的字段
2、筛选分为两类：分组前筛选和分组后筛选
		针对的表			位置		连接的关键字
分组前筛选	原始表				group by前	where

分组后筛选	group by后的结果集    		group by后	having

问题1：分组函数做筛选能不能放在where后面
答：不能

问题2：where——group by——having

一般来讲，能用分组前筛选的，尽量使用分组前筛选，提高效率

3、分组可以按单个字段也可以按多个字段
4、可以搭配着排序使用


#引入：查询每个部门的员工个数
select department_id,count(*)
from employees
group by department_id;

#1.简单的分组

#案例1：查询每个职位的员工平均工资
select job_id,avg(salary)
from employees
group by job_id;

#案例2：查询每个位置的部门个数
select location_id,count(*)
from departments
group by location_id;
#2、可以实现分组前的筛选

#案例1：查询邮箱中包含a字符的 每个部门的最高工资
select department_id, max(salary)
from employees
where email like '%a%'
group by department_id;



#案例2：查询有奖金的每个领导手下员工的平均工资
select manager_id,avg(salary)
from employees
where employees.commission_pct is not null
group by manager_id;


#3、分组后筛选

#案例：查询哪个部门的员工个数>5
select  department_id,count(*)
from employees
group by  department_id
having count(*)>5;


#案例2：每个职位有奖金(commission_pct)的员工的最高工资>12000的工种编号和最高工资
select job_id,max((salary+ifnull(commission_pct,0)*salary)) as max_salary
from employees
where commission_pct is not null
group by job_id
having max((salary+ifnull(commission_pct,0)*salary))>12000;



#案例3：领导编号>102的每个领导手下的最低工资大于5000的领导编号和最低工资
select manager_id,min((salary+ifnull(commission_pct,0)*salary))
from employees
where manager_id>102
group by manager_id
having min((salary+ifnull(commission_pct,0)*salary))>5000;


#4.添加排序

#案例：每个工种有奖金的员工的最高工资>6000的工种编号和最高工资,按最高工资升序
select  employees.job_id, max((salary+ifnull(commission_pct,0)*salary)) as max_salary
from employees,jobs
where employees.job_id=jobs.job_id and commission_pct is not null
group by employees.job_id
having max((salary+ifnull(commission_pct,0)*salary))>6000;






#5.按多个字段分组

#案例：查询每个工种每个部门的最低工资,并按最低工资降序
select job_id,department_id,min((salary+ifnull(commission_pct,0)*salary)) as  min_salary
from employees
group by job_id,department_id
order by  min_salary desc;


