--2)  Вывести соотрудников департамента «Miratech24»
select *
from empl_08
order by DEPARTMENT_ID;

--3)	Вывести сотрудников имеющих заработную плату больше 200 и меньше 700
select *
from empl_08
where salary between 200 and 700;

--4)	Вывести список сотрудников, получающих заработную плату большую чем у непосредственного руководителя
select e.name, e.salary, boss.name, boss.salary
from empl_08 e
         join empl_08 boss on e.chief_id = boss.id
where e.salary > boss.salary;

--5)	Вывести список сотрудников, получающих максимальную заработную плату в своем отделе
select name
from empl_08
where salary in (select max(empl_08.salary) from empl_08 group by empl_08.department_id);

--6)	Вывести список ID отделов, количество сотрудников в которых не превышает 3 человек
select DEPARTMENT_ID, count_emp
from empl_08
where count_emp < 3;

--7)  Вывести список сотрудников, не имеющих назначенного руководителя, работающего в том-же отделе
select e.name, b.name
from empl_08 e
         join empl_08 b on e.chief_id = b.id
where e.department_id != b.department_id;

--8)  Найти список ID отделов с максимальной суммарной зарплатой сотрудников
select DEPARTMENT_ID, max(SALARY) * count_emp
from empl_08
group by DEPARTMENT_ID, count_emp;