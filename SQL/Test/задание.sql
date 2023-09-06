select t.*, t.rowid from INCOM.EMPL_08 t;


1)  Вывести максимальную заработную плату по всему предприятию
select max (salary)
from incom.empl_08;
---
2)  Вывести соотрудников департамента «Miratech23»
select *
from incom.empl_08
where dept_name like '%Miratech23%';
---
3)  Вывести сотрудников имеющих заработную плату больше 100 и меньше 1100
select *
from incom.empl_08
where salary >100 and salary <1100;
---
4)  Вывести список сотрудников, получающих заработную плату большую чем у непосредственного руководителя.
select *
from incom.empl_08 t1
where t1.chief_id in( select t2.id from incom.empl_08 t2 where t2.salary < t1.salary);
---
select *
from incom.empl_08 t1
inner join incom.empl_08 t2
on t1.chief_id = t2.id
where t2.salary < t1.salary;
---
5)  Вывести список сотрудников, получающих максимальную заработную плату в своем отделе
select *
from incom.empl_08 t1
where t1.salary in (select max(t2.salary) from incom.empl_08 t2 where t2.department_id = t1.department_id);
---
6)  Вывести список ID отделов, количество сотрудников в которых не превышает 2 человека
SELECT t1.department_id, COUNT(t1.department_id)
 FROM incom.empl_08 t1
  GROUP BY t1.department_id
   HAVING COUNT(t1.department_id) <= 2;
---
7)  Вывести список сотрудников, не имеющих назначенного руководителя, работающего в том-же
select *
 from incom.empl_08 t11
  where t11.chief_id not in (select t22.id from incom.empl_08 t22 where t11.chief_id = t22.id)
   and t11.department_id in
       (select t1.department_id
        from incom.empl_08 t1
        where t1.chief_id not in (select t2.id from incom.empl_08 t2 where t1.chief_id = t2.id)
        GROUP BY (t1.department_id)
        having count(t1.department_id) > 1)
order by id;
---
select e2.name, e2.department_id, e22.name, e22.department_id
from incom.empl_08 e2
left join incom.empl_08 e22
on e2.chief_id = e22.id
---
8)  Найти список ID отделов с максимальной суммарной зарплатой сотрудников
select distinct t1.department_id, t1.salary
 from incom.empl_08 t1
  where t1.salary in (select max(t2.salary) from incom.empl_08 t2 where t1.department_id = t2.department_id)
  order by t1.department_id;
