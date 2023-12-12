1.DB Database
    数据的仓库
2.DBMS Database Managerment System
	 软件系统  -   管理数据库
3.数据库
   Oracle----》大型应用
	 Mysql-----> 中小型的项目
4.实体实体之间的关系
   一对一关系  ----》 数据库表可以直接表示
	 一对多关系  ----》 可以表示
	 多对多关系  ----》 不可以直接表示，使用第三张表表示（一对多的关系表）
5.关系型数据库
    Oracle   mysql
	非关系型数据
	  redis 等

6.安装msyql -----》启动服务  -----》3306

7.SQL-----》标准 
   DQL：select ----最复杂
	 DML：insert  update  delete 
	 DDL: create  alter   drop
	 TCL: commit  rollback
----------------------------------------------------------------	 
基本查询  ----》 控制台输出
1.语法结构
	SELECT
	  字段,..../  *
	FROM
	   表名
		 
 案例：1)查询员工的姓名和工资
   SELECT 
			last_name,salary
	 FROM
	    employees
	   2) 查询所有
	 SELECT 
	    *
		FROM
		  employees
		 3) 输出常量，可以省略from子句
	 SELECT  'hello'
	 
	 SELECT 
	   3+4
	 FROM 
	   dual
		 4) 查询函数
	 SELECT
	   version()
	 FROM
	   dual
		 
2.给列起别名
    as --- 后边别名
		
		 SELECT 
		    version() as vers
		 FROM
		    dual
				
		 SELECT version() vers11 FROM dual
		 如果别名中包含不合法的字符，别名用'' ""
		 SELECT 3+5 'num@sum' FROM dual
		 
		 SELECT 
		   last_name,salary sal,job_id
		 FROM
		   employees
3.去重
    SELECT 
		   DISTINCT department_id
	 FROM
	    employees
			
4.null运算
    SELECT 
		   2-null
	  FROM
		   dual
	 查询员工的应发工资   salary+salary*commission_pct
	  SELECT
		   last_name,salary + salary*IFNULL(commission_pct,0)
	  FROM
	     employees
			     
		
		SELECT 
		  IFNULL(commission_pct,0)
		FROM
		  employees
			 
	 
5.拼接    
  SELECT 
	  CONCAT(first_name,' ',last_name) username
	FROM
	  employees
---------------------------------------------------------------------		
过滤
   where 子句
1.条件运算符
	   >  >=   <  <=   =   !=   <>   
		 <=>
		 
   查询90部门的员工
	 SELECT
	   *
	 FROM
	   employees
	 WHERE
	   department_id <=> 90
	 
		
	 查询工资大于10000的员工的姓名和工资
	 SELECT
		  last_name,salary
	 FROM
	    employees
	 WHERE
		   salary > 10000 
			 
	 
	 查询没有奖金的员工
	 SELECT
	   last_name,commission_pct
	 FROM
      employees	
		WHERE
		  commission_pct <=> null 
	 
  = 作用于非null值的判断，不能用于null的判断
	<=> 既可以作用于非null值的判断，又可以用于null的判断

   查询last_name 的值K_ing
	 SELECT
	   *
	 FROM
	   employees
	 WHERE
	   last_name ='K_ing'
		 
	 查询1992-04-03 入职的员工
	 
   SELECT
	   *
	 FROM
	   employees
	 WHERE
	   hiredate = '1992-04-03'

2.逻辑运算符
   not  and   or
	 查询90号部门，并且工资大于15000的员工信息
	 SELECT
	   *
	 FROM
	   employees
	 WHERE
	   department_id = 90 and salary >17000
		 
	 查询60号部门，或者 入职日期是1998-03-03的员工信息
	 
	 SELECT
	   *
	 FROM
	   employees
	 WHERE
		department_id = 60 or hiredate = '1998-03-03'
		
3.其他运算符
   [not] like   ----  模糊查询
	            %  ---》表示0个或多个字符  last_name like '%A%'
							_  ---> 表示一个占位符     last_name like '__A%'
							 
	 [not] BETWEEN  ..  AND         >=  and  <=
	 [not] in  department_id in (10,20)      department_id = 10 or department_id = 20
	 is null  commission_pct is null      commission_pct<=>null
	 is not null
	 
	 1）查询邮箱中包含字符O的员工信息
	 2）查询last_name中最后一个字符是a的员工信息
	 3）查询工资[8000,10000]的员工信息
	 4）查询不在60号部门，和不在90号部门的员工信息
	 5）查询没有奖金的员工
	 6）查询有奖金的员工信息
	 
	 
	 查询last_name第二个字符是_的员工信息
	 SELECT
	   *
	 FROM 
	   employees
	 WHERE
	   last_Name like '_$_%' ESCAPE '$'
		 
--------------------------------------------------------------------
排序
  order by
	
		 
	 
	 
	 

	 