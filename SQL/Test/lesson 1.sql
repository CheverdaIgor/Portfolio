/*select * 
from
where 
rownum <=20
group by
having  
order by 
;*/
--- склеивание строк
select 'first '||'222 '||'second' from dual;
select concat('first ','second') from dual; 

--- вырезание в строке
select substr('Ну очень длинная строка', 10,5) from dual;
select substr('Ну очень длинная строка', 10) from dual;
select substr('Ну очень длинная строка', -10) from dual;

--- подсчет символов
select length('Ну очень длинная строка') from dual;
select lengthb ('First') from dual;

--- определение месторасположения символа
select instr('молоковоз','о',1,2) from dual;

--- виртуальное добавление каких-то символов
select lpad('tree',50) from dual;
select rpad('tree',50,'_') from dual;

--- вырез пробелов, символ
select trim('      true       ') h from dual;
select ltrim('      true       ') h from dual;
select rtrim('      true       ') h from dual;
select ltrim('3803805651783','380') from dual;
select rtrim('3803805651783','380') from dual;

--- подмена или вырезании каких-то символов
select replace('молоковоз','о') from dual;
select replace('молоковоз','о','F') from dual;

--- регистр
select upper('молоковоз') from dual;
select lower('МОЛОКОВОЗ') from dual;
select initcap('каждое слово с большой буквы ') from dual;

--- округление
select round(1115.569,-2) from dual;
select round(1115.569,2) from dual;
select trunc(1115.569,2) from dual;
select mod(56588,100 ) from dual;

--- перевод числа в дату
select 
trunc ( to_date('15.06.2014 23:56:47','dd.mm.yyyy hh24:mi:ss') , 'MM'  )  
from dual ;
---
select 
round ( to_date('16.06.2014 23:56:47','dd.mm.yyyy hh24:mi:ss') , 'mi'  )  
from dual ;
---
select 
round ( to_date('15.02.2016 23:56:47','dd.mm.yyyy hh24:mi:ss') , 'MM'  )  
from dual;
---
select to_date('01.06.14 23:56:47','dd.mm.rr hh24:mi:ss')  from dual;
---
select sysdate from dual;
---
select systimestamp from dual;
---
select 
 to_date('15.02.2016 23:56:47','dd.mm.yyyy hh24:mi:ss') - to_date('10.02.2016 23:46:47','dd.mm.yyyy hh24:mi:ss')
from dual;
---
select 
 to_date('15.02.2016 23:56:47','dd.mm.yyyy hh24:mi:ss') + 1/1440
from dual;

--- не равно
<>
!=
~=
^=
;

--- под запрос
select * from 
employee r
where r.name in 
(select name from employee t where t.department_id=20);
=
--in 
select * from 
employee r
where r.name = null or r.name = 'Testovoe 20' or r.name = 'You';
--not in
select * from 
employee r
where r.name != null and r.name = 'Testovoe 20' and r.name = 'You';

--- вывод в диапазоне
select 
months_between(to_date('11.05.2016','dd.mm.yyyy'), to_date('15.02.2016 23:56:47','dd.mm.yyyy hh24:mi:ss') )
from dual;
---
select 
add_months(to_date('28.02.2015','dd.mm.yyyy'),-2)
from dual;
---
select last_day(to_date('05.02.2015','dd.mm.yyyy')) from dual;
---
select next_day(to_date('06.02.2015','dd.mm.yyyy'),'5') from dual;
