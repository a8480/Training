-- 1.查询
SELECT last_name
FROM employees;
-- 2.虚表
SELECT 3+4
FROM DUAL;
-- 3. 获取版本
SELECT VERSION()
FROM dual;
-- 4. 给列起别名
SELECT 3+5 AS sum;
SELECT 3+5 AS "sum num";
-- 5. 去重(升序)
SELECT distinct department_id
FROM employees;
-- 6. 查询员工应发工资
SELECT last_name,salary+salary*commission_pct
FROM employees;
-- if(a,b) a!=0:a,b;
SELECT IFNULL(1,0);

SELECT last_name,salary+salary*IFNULL(commission_pct,0)
FROM employees;
-- 7.拼接
SELECT CONCAT(first_name," ",last_name) username
FROM employees;

--  <=> 安全等于
-- 8 查询90的部门员工
SELECT *
FROM employees
WHERE department_id <> 90;

-- 9. 查询邮箱中包含
--
SELECT first_name,last_name,email
FROM employees
WHERE email like'%0%';

SELECT first_name,last_name
FROM employees
WHERE last_name like'%a';


















