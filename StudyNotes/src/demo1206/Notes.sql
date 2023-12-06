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
