select *
from INCOM.EMPL_08 t1
where t1.datetime in (select max(t2.datetime)
                     from INCOM.EMPL_08 t2
                     group by t2.department_id)
order by t1.department_id
---
select *
from  INCOM.EMPL_08 t
where (trunc(sysdate + 1, 'DDD') -  trunc(t.datetime, 'DDD') < 4)
---
select t2.t1
from (select sum(salary) as t1
from INCOM.EMPL_08
where datetime >= (select trunc(max(datetime), 'mm') --последний месяц
                   from incom.empl_08)
group by datetime
order by t1 desc) t2
where rownum = 1; --выбор первой записи
---
select max(sum(salary))
from incom.empl_08
where datetime >= (select trunc(max(datetime), 'mm') --последний месяц
                   from incom.empl_08)
group by datetime;
---
select sum(salary)
from INCOM.EMPL_08
group by to_char(datetime,'Mon-yyyy'); --группировка по месяцу
---
select DISTINCT FIRST_VALUE(datetime) OVER (ORDER BY datetime ASC) --сортировка в обратном порядке
from INCOM.EMPL_08;
---
select trunc(max(t.datetime), 'dd')
from INCOM.EMPL_08 t
group by t.department_id
having count (t.department_id) > 1
---
7)  Вывести список сотрудников, не имеющих назначенного руководителя, работающего в том-же
select e2.name, e2.department_id
from incom.empl_08 e2
left join incom.empl_08 e22
on e2.chief_id = e22.id
where e22.id is null and e2.department_id in (select e3.department_id
                                             from incom.empl_08 e3
                                             where e3.chief_id not in (select t3.id from INCOM.EMPL_08 t3)
                                             group by e3.department_id
                                             having count(*) >= 2)
select t2.*
from INCOM.EMPL_08 t1
left join INCOM.EMPL_08 t2
on t1.id = t2.chief_id --сотрудники
---
select t.*, t.rowid from INCOM.EMPL_08 t
where t.datetime between '01.08.2015' and '11.11.2015'
order by id;
--trunc(sysdate)
---
