#
select concat(upper(first_name),'_',lower(last_name))
from employees;
#
select last_name,salary,
case
when salary>20000 then 'a'
when salary>15000 then 'b'
when salary>10000 then 'c'
else 'd'
end as 等级,department_id
from employees;
