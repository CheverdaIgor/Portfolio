-- база HIVTest
select t.*
from empl_08 t
order by t.CHIEF_ID, ID;

--2)  Вывести соотрудников департамента «Miratech24»
select t.*
from empl_08 t
where t.dept_name like '%Miratech24%';

--3)	Вывести сотрудников имеющих заработную плату больше 200 и меньше 700
select t.*
from empl_08 t
where t.SALARY > 200 and t.SALARY < 700;

--4)	Вывести список сотрудников, получающих заработную плату большую чем у непосредственного руководителя.
select t2.*
from empl_08 t1
inner join empl_08 t2
on t1.ID = t2.CHIEF_ID and t1.SALARY < t2.SALARY;

--5)	Вывести список сотрудников, получающих максимальную заработную плату в своем отделе
select t1.*
from empl_08 t1
where t1.SALARY = (select max(t2.SALARY)
				   from empl_08 t2
				   where t2.department_id = t1.department_id);

--6)	Вывести список ID отделов, количество сотрудников в которых не превышает 3 человек
select t.DEPARTMENT_ID
from empl_08 t
group by t.DEPARTMENT_ID
having count(*) < 3;

--7)  Вывести список сотрудников, не имеющих назначенного руководителя, работающего в том-же
select t1.*
from empl_08 t1
where t1.chief_id not in (select t2.id
                          from empl_08 t2)
--and t1.department_id in (select t3.department_id
--                         from empl_08 t3
--                         group by t3.department_id
--                         having count(*) > 1);

select t1.*
from empl_08 t1
where t1.chief_id not in (select t2.chief_id
						  from empl_08 t2
						  inner join empl_08 t3
						  on t2.chief_id = t3.id)
--and t1.department_id in (select t4.department_id
--                         from empl_08 t4
--                         group by t4.department_id
--                         having count(*) > 1);

select t2.*
from empl_08 t2
where not exists (select 1/0 from empl_08 t3 where t2.chief_id=t3.id)
--and t2.department_id in (select t3.department_id
--                         from empl_08 t3
--                         group by t3.department_id
--                         having count(*) > 1);

select t2.*
from empl_08 t2
left join empl_08 t3
on t2.chief_id=t3.id
where t3.chief_id is null
--and t2.department_id in (select t3.department_id
--                         from empl_08 t3
--                         group by t3.department_id
--                         having count(*) > 1);

--8)  Найти список ID отделов с максимальной суммарной зарплатой сотрудников
select TOP (1) t.DEPARTMENT_ID, sum(t.SALARY) as SALARY
from empl_08 t
group by t.DEPARTMENT_ID
order by SALARY desc;