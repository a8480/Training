复习：
1.DB和DBMS
  DB---->存数据的仓库
	DBMS----->软件

2.实体实体的关系 数据库中
  一对一关系      直接表示  主键同时有作为外键  外键唯一性
	一对多关系      直接表示   外键
	多对多关系      不能直接表示   通过第三个表（一对多关系）

3.SQL -----> 操作数据库的标准
   DQL----select
	 DML----insert  update   delete
	 DDL----create  alter   drop
	 TCL----commit  ROLLBACK
4.select基本语法
   1) SELECT
				 字段,..../   *
		  FROM -----> 可有可无
          表名  dual

   2）SELECT
	       salary
			 FROM
			    employees

			 SELECT  * from employees
			 SELECT 3
			 SELECT 3+4 FROM dual
			 SELECT version()
	 3) 给字段起别名
	     as
			 select salary as sal .....
			 select salary sal .....
			 select salary as 'new sal'  ......
   4) 去重
	     distinct
			 SELECT DISTINCT salary .......
	 5) 算术运算 +   -   *  /
	     如果null参与的运算  运算结果 null
			 IFNULL(expr1,expr2)

	 6) CONCAT(str1,str2,...)
	 7) 显示表结构
	     desc 表名
5.where子句
   	select
		  ...
		from
		  ...
		where
		  条件语句

		1）比较运算符  > >=  <  <=  =  !=  <>   <=>
		   =  <=>
			 = 比较字符串  日期  数值，不能与null
			 <=> 所有类型的数据都可以 包括null
	  2）逻辑运算符
		    not   and   or
		3) 其他运算符
		   [not] like
				    %
						_
			 [not] between ..  and
			 [not] in   in(10,20)
				is null
				is not null
----------------------------------------------------
order by --- 排序
1.语法：
   select
		  ...
		from
		  ...
		where
		  条件语句
		order by
		   排序的字段 排序规则

	 排序的字段
	    字段，表中字段的序号，列别名,函数

	 排序规则：
	    asc ----> 表示升序（默认的排序规则）
			desc ----> 表示降序

2.案例
   1）查询所有员工信息，按工资升序排列
	SELECT
	   *
	FROM
	   employees
	ORDER BY
	   salary

	2）查询所有员工信息，按工资升序排列
	SELECT
	   last_name,salary sal
	FROM
	   employees
	ORDER BY
	   sal

  SELECT
	   last_name,salary sal,LENGTH(last_name)
	FROM
	   employees
	ORDER BY
	   LENGTH(last_name)  desc


  SELECT
	   last_name,salary sal,LENGTH(last_name)
	FROM
	   employees
	ORDER BY
     sal ,LENGTH(last_name)

-----------------------------------------------
函数
  分类：
	   单行函数：length(first_name)
	   多行函数: sum(salary)
单行函数：
  1）字符串函数
	2）数学函数
	3）日期函数
	4）转换函数
	5）其他函数
	6）case语句

一、字符函数

1.length 获取参数值的字节个数
   SELECT LENGTH('abc中国')

2.concat 拼接字符串
   SELECT
	   CONCAT('abc','123','$','hello')
	 FROM
	   dual

3.upper、lower
  SELECT UPPER('hello'),lower('HeLLO')

示例：将姓变大写，名变小写，然后拼接(_)
      STEVEN_k_ing
      SELECT
			   CONCAT(UPPER(first_name),'_',LOWER(last_name))
		  FROM
			   employees


#4.substr、substring
注意：索引从1开始
截取从指定索引处后面所有字符
  SELECT
	  substring('hello',2)

截取从指定索引处指定字符长度的字符
   SELECT
	  substr('hello',2,3)

案例：姓名中首字符小写，用_拼接，显示出来
      s_k
   SELECT
	  CONCAT(LOWER(SUBSTR(first_name,1,1)),'_',LOWER(SUBSTR(last_name,1,1)))
   FROM
	   employees

5.instr 返回子串第一次出现的索引，如果找不到返回0
    SELECT
		   instr('hello','ll')

6.trim
    SELECT
		  trim('    d  d   d     ')
		SELECT
		  TRIM('a' from 'aaahelloaaaaa')

7.lpad 用指定的字符实现左填充指定长度
    SELECT
		  LPAD('hello',10,'*')

8.rpad 用指定的字符实现右填充指定长度
    SELECT
		  rPAD('hello',10,'*')


9.replace 替换
   SELECT
	    REPLACE('helle','el','o')


二、数学函数

round 四舍五入
   SELECT
	   ROUND(-123.51)


ceil 向上取整,返回>=该参数的最小整数



floor 向下取整，返回<=该参数的最大整数


truncate 截断
  SELECT
	  TRUNCATE(123.656,1)



mod取余
  SELECT 5%3
	SELECT mod(5,3)



三、日期函数
now 返回当前系统日期+时间
  SELECT NOW()
  SELECT SYSDATE()

curdate 返回当前系统日期，不包含时间
  SELECT CURDATE()

curtime 返回当前时间，不包含日期
  SELECT CURTIME()

可以获取指定的部分，年、月、日、小时、分钟、秒
  SELECT YEAR(NOW())

转换函数
   数值  <----->  字符串

	 SELECT '123a'+1    124
	 SELECT 'a123'+1     1
	 SELECT 'abc'+1      1

	 日期  <----->  字符串
   STR_TO_DATE  ---- 字符串转日期
	 DATE_FORMAT  ----  日期转字符串

	 账号：————————
	 姓名：________

	 日期：10月21日 2024年    10-21-2024

	  提交


		java   "10-21-2024"

	                    STR_TO_DATE('10-21-2024','%c-%d-%Y')



str_to_date 将字符通过指定的格式转换成日期  %c   %m  表示月份

SELECT STR_TO_DATE('1998年-3-2','%Y年-%c-%d') AS out_put;

#查询入职日期为1992-4-3的员工信息

SELECT * FROM employees WHERE hiredate = '1992-4-3';

SELECT * FROM employees WHERE hiredate = STR_TO_DATE('4-3 1992','%c-%d %Y');



#date_format 将日期转换成字符


  1000   2023-10-10


	订单号                    日期
	1000                      2023年10月10日


SELECT DATE_FORMAT(NOW(),'%Y年%m月%d日 %H:%i:%s') AS out_put;

#查询有奖金的员工名和入职日期(xx月/xx日 xx年)







#四、其他函数

SELECT VERSION();
SELECT DATABASE();
SELECT USER();


#五、流程控制函数
#1.if函数： if else 的效果
SELECT
   IF(3>5,3,5)

#案例：如果员工没有奖金，显示“没奖金，呵呵”；如果有奖金，显示“有奖金，嘻嘻”
SELECT
   commission_pct,if(commission_pct is null,'没奖金，呵呵','有奖金，嘻嘻')

FROM
   employees

#2.case函数的使用一： switch case 的效果

/*
java中
switch(变量或表达式){
	case 常量1：语句1;break;
	...
	default:语句n;break;


}

mysql中

case 要判断的字段或表达式
when 常量1 then 要显示的值1或语句1;
when 常量2 then 要显示的值2或语句2;
...
else 要显示的值n或语句n;
end
*/

/*案例：查询员工的工资，要求

部门号=30，显示的工资为1.1倍
部门号=40，显示的工资为1.2倍
部门号=50，显示的工资为1.3倍
其他部门，显示的工资为原工资

*/
select
  last_name,salary,commission_pct,department_id,
	case department_id
	when 30 then salary*1.1
	when 40 then salary*1.2
	when 50 then salary*1.3
	else salary
	end 奖金
FROM
  employees






#3.case 函数的使用二：类似于 多重if
/*
java中：
if(条件1){
	语句1；
}else if(条件2){
	语句2；
}
...
else{
	语句n;
}

mysql中：

case
when 条件1 then 要显示的值1或语句1
when 条件2 then 要显示的值2或语句2
。。。
else 要显示的值n或语句n
end
*/

#案例：查询员工的工资的情况
如果工资>20000,显示A级别
如果工资>15000,显示B级别
如果工资>10000，显示C级别
否则，显示D级别
SELECT
   last_name,salary,
	 case
	 when salary>20000 then 'A'
	 when salary>15000 then 'B'
	 when salary>10000 then 'C'
	 else 'D'
	 end 等级,department_id
FROM
  employees

-------------------------------------------------------------
分组函数（多行函数，统计函数，聚合函数）

   select
	    ....
	 FROM
	   ....
	 WHERE   ---- 筛选    不能有分组函数
	   ....
	 GROUP BY  ---- 分组
	   ....
	 having   ---- 筛选    分组函数
	   ....
	 order by
	   ....

1.5个
  sum()  avg()  max()   min()   count()

	select
	  sum(salary),avg(salary),max(salary),min(salary),count(*)
	FROM
	  employees

2. 5个分组函数都是忽略null
   SELECT
	    count(*),count(department_id)
	 FROM
	    employees

	 SELECT
	    avg(commission_pct)
	 FROM
	    employees
	WHERE
	    employee_id BETWEEN 142 and  147

			0.4  0.3  0.3

	 SELECT
	   count(*),sum(department_id)
	 FROM
	    employees
		WHERE
		  1=0

3.查询每个部门的平均工资
   SELECT
	    department_id,avg(salary)
	 FROM
	    employees
	 where
	   salary>5000
	 GROUP BY
	    department_id
	 HAVING
	    avg(salary)>7000


	 SELECT
	    department_id,job_id,avg(salary)
	 FROM
	    employees
	 GROUP BY
	    department_id,job_id

4.having

  SELECT
	    department_id,avg(salary)
	 FROM
	    employees
	 where
	   salary>5000
	 GROUP BY
	    department_id
	 HAVING
	    avg(salary)>7000


练习：

#案例1：查询每个工种的员工平均工资
#案例2：查询每个位置的部门个数
#案例3：查询邮箱中包含a字符的 每个部门的最高工资
#案例4：查询有奖金的每个领导手下员工的平均工资
SELECT
   manager_id,avg(salary)
FROM
   employees
WHERE
   commission_pct is not null
GROUP BY
   manager_id

#案例5：查询哪个部门的员工个数>5
#案例6：每个工种有奖金的员工的最高工资>12000的工种编号和最高工资
#案例7：领导编号>102的每个领导手下的最低工资大于5000的领导编号和最低工资
#案例8：每个工种有奖金的员工的最高工资>6000的工种编号和最高工资,按最高工资升序
#案例9：查询每个工种每个部门的最低工资,并按最低工资降序

--------------------------------------------------------------------
多表连接查询
  姓名    工资   部门名
	employees     departments

	语法：
	  1992   内连接查询      +
		1999

	功能：
	  内连接查询
		外连接查询

1.1992语法规则
   笛卡尔集 m*n
	 a                            b
	 1 zhangsan                   电脑
	 2 lisi                       键盘

	 1  zhangsan 电脑
	 1  zhangsan 键盘
	 2 lisi      电脑
	 2 lisi      键盘

2. 语法：
    SELECT
	   。。。。
	  FROM
		  表名,...
    WHERE
		  链接条件  至少 n-1

 表中的字段名相同时，可以使用表名，也可以使用表别名
		SELECT
		   last_name,department_name,employees.department_id
	  FROM
		   employees,departments
    WHERE
		   employees.department_id = departments.department_id and salary >6000

	 SELECT
		   last_name,department_name,emp.department_id
	  FROM
		   employees emp,departments  dept
    WHERE
		   emp.department_id = dept.department_id and salary >6000

3.内连接查询：
    把满足条件的数据查出来

  外连接查询
	   把满足条件的数据查出来，不满足条件的数据查出来

4.1999
   交叉链接查询 ----》 笛卡尔集
   内连接查询：
	    等值连接查询    =
			非等值链接查询
			子链接查询
	 外链接查询：
	    左外链接查询
			右外连接查询
			满外链接查询（全外链接查询）

	1)等值链接查询

		姓名    工资   部门名

		SELECT
		   last_name,salary,department_name
	  FROM
		   employees INNER JOIN departments
	  on
		   employees.department_id = departments.department_id
	  WHERE
		   salary>6000

	2）非等值链接
    last_name   salary   grade_level
		SELECT
		   last_name,salary,grade_level
	  FROM
		   employees JOIN salary_grades
	  on
		   salary BETWEEN lowest_sal and highest_sal


	  last_name   salary   grade_level
		SELECT
		   last_name,salary,grade_level
	  FROM
		   employees ,salary_grades
	  WHERE
		   salary BETWEEN lowest_sal and highest_sal


	练习
	#案例1：查询员工名和对应的部门名
  #案例2：查询员工名、工种号、工种名
  #案例3：查询有奖金的员工名、部门名
select first_name,last_name,department_name
from employees e ,departments d
where commission_pct>0 and e.department_id = d.department_id
  #案例4：查询城市名中第二个字符为o的部门名和城市名
  #案例5：查询每个城市的部门个数
  #案例6：查询每个工种的工种名和员工的个数，并且按员工个数降序
  #案例7：查询员工名、部门名和所在的城市名
select first_name,last_name,city
from employees,locations
where employees.department_id = locations.location_id









