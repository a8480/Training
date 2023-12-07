# 1.order by 后面可以是列名(列的别名)，也可以是列的序号
# 2. group by 后面可以使用列的别名，也可以使用列名
# 3. where 后面不能使用列的别名，只能使用列名
# 4. having 后面不能使用列的别名，只能使用列名
# dual 是一个虚拟表，用于测试
# 5.常用函数
# 1.length() 返回字符串的长度
select length('abc');
# 2.concat() 拼接字符串
select concat('abc','def') from dual;
#upper,lower：大写，小写
select upper('abc') from dual;
select lower('ABC') from dual;
# 索引从1开始
select substring('abcd',1,2) from dual;
### 截取单个字符时，应该这么写
select substring('abcd',1,1) from dual;
# instr() 返回子串在字符串中的位置,如果不存在返回0
select instr('abcd','c') from dual;
# trim() 去掉字符串两端的空格
select trim('  abc  ') from dual;
### both 写不写都可以
select trim(both 'a' from 'aaabacaa') from dual;
# lpad() 在字符串左边填充指定的字符
select lpad('abc',5,'*') from dual;
### 如果指定的长度小于字符串的长度，那么返回指定长度下的字符串
select lpad('abc',2,'*') from dual;
# rpad() 在字符串右边填充指定的字符
select rpad('abc',5,'*') from dual;
### 如果指定的长度小于字符串的长度，那么返回指定长度下的字符串
select rpad('abc',2,'*') from dual;
#replace() 替换字符串
select replace('abc','a','A') from dual;
#### 如果被替换的字符串不存在，那么返回原字符串
select replace('abc','d','D') from dual;
# 数学函数
## round() 四舍五入
select round(3.1415926,2) from dual;
## ceil() 向上取整
select ceil(3.1415926) from dual;
## floor() 向下取整
select floor(3.1415926) from dual;
## mod() 取余
select mod(10,3) from dual;
## truncate() 截断,是截断小数点后的位数
select truncate(3.1415926,2) from dual;
## mod() 取余
select mod(10,3) from dual;
## 日期函数
### now() 返回当前日期和时间
select now() from dual;
select  sysdate() from dual;
### curdate() 返回当前日期
select curdate() from dual;
### curdate() 返回当前时间
select curtime() from dual;
### 获取指定的日期
select  year(now()) from dual;
select month(now()) from dual;
select day(now()) from dual;
select hour(now()) from dual;
select minute(now()) from dual;
select second(now()) from dual;
### 转换函数
#### 数值转换为字符串
#### 字符串转换为数值，转换失败返回0
select cast(123 as char) from dual;
select '123'+1 from dual; # 124
select  '123a'+1 from dual; # 124
select 'a123'+1 from dual; # 1
select '1a23'+1 from dual; # 2
### 日期转换为字符串
### 字符串转换为日期
select cast(now() as char) from dual;
select cast('2019-01-01' as date) from dual;
select str_to_date('2019-01-01','%Y-%m-%d') from dual;
#### %Y 代表年份，%m(%c )代表月份，%d 代表天数
select  str_to_date('2019年-01-01','%Y年-%m-%d') from dual;

#流程控制
## if 语句
### if(条件，表达式1，表达式2)
select if(1>2,'a','b') from dual;
## case 语句
select case 1 when 1 then 'a' when 2 then 'b' else 'c' end from dual;
select last_name,salary,
case
when salary>20000 then 'a'
when salary>15000 then 'b'
when salary>10000 then 'c'
else 'd'
end as 等级,department_id
from employees;
## 分组函数
### sum() 求和,avg() 求平均值,max() 求最大值,min() 求最小值,count() 求个数
###、sum、avg一般用于处理数值型, max、min、count可以处理任何类型
### 3、可以和distinct搭配实现去重的运算
### 以上函数都忽略null值
select sum(salary) from employees;
### 一般使用count(*)用作统计行数
select  count(*) ,sum(department_id)
from employees
where 1=0;
### 5、 group by(进行分组)和分组函数一同查询的字段要求是group by后的字段
select department_id,count(*)
from employees
group by department_id;
### order by 不能和分组函数一同使用,在ORDER BY子句中不能使用别名
##分组函数问题
    ###1.参数支持哪些类型  字符串SUM(last_name)，日期SUM(hiredate) 数字COUNT(commission_pct)
    ###2.是否忽略NULL值  忽略NULL值
# 连接

## 内连接：把两个表中满足条件的记录组合在一起

## 外连接：把两个表中满足条件的记录组合在一起，同时把没有匹配的记录也包含进来
###查询所有员工信息
select last_name,department_name
from employees ,departments
where employees.department_id=departments.department_id

##limit:限制查询结果的数量,limit m,n 从第m+1条开始，取n条
select * from employees limit 5,5;
##union:合并查询结果，去重
select last_name from employees
union
select last_name from employees;
##union all:合并查询结果，不去重
select last_name from employees
union all
select last_name from employees;
