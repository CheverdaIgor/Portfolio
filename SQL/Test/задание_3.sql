--2)  ������� ������������ ������������ �Miratech24�
select *
from INCOM.EMPL_08 t1
where t1.dept_name = 'Miratech24';

--3)	������� ����������� ������� ���������� ����� ������ 200 � ������ 700
select *
from INCOM.EMPL_08 t
where t.salary > 200 and t.salary < 700;

--4)	������� ������ �����������, ���������� ���������� ����� ������� ��� � ����������������� ������������.
select t1.name, t1.salary
from INCOM.EMPL_08 t1
inner join INCOM.EMPL_08 t2
on t1.chief_id = t2.id and t1.salary > t2.salary;

--5)	������� ������ �����������, ���������� ������������ ���������� ����� � ����� ������
select *
from INCOM.EMPL_08 t1
where t1.salary = (select max(t2.salary)
                  from INCOM.EMPL_08 t2
                  where t1.department_id = t2.department_id);

--6)	������� ������ ID �������, ���������� ����������� � ������� �� ��������� 3 �������
select t1.department_id
from INCOM.EMPL_08 t1
group by t1.department_id
having count(*) < 3;

--7)  ������� ������ �����������, �� ������� ������������ ������������, ����������� � ���-��
select t3.*
from INCOM.EMPL_08 t3
where t3.chief_id not in (select t1.chief_id
                         from INCOM.EMPL_08 t1
                         inner join INCOM.EMPL_08 t2
                         on t1.chief_id = t2.id)
and t3.department_id in (select t4.department_id
                        from INCOM.EMPL_08 t4
                        group by t4.department_id
                        having count(*) > 1);

select t3.*
from INCOM.EMPL_08 t3
where t3.chief_id not in (select t2.id
                         from INCOM.EMPL_08 t2)

select t2.*
from INCOM.EMPL_08 t2
left join INCOM.EMPL_08 t3
on t2.chief_id=t3.id
where t3.chief_id is null

select t2.*
from INCOM.EMPL_08 t2
where not exists (select 1/0 from employee t3 where t2.chief_id=t3.id)

--8)  ����� ������ ID ������� � ������������ ��������� ��������� �����������
select t1.department_id, max(t1.salary)
from INCOM.EMPL_08 t1
group by t1.department_id;

WITH cte table AS (
    select o.department_id, 
           sum(o.salary) as max_salary
           RANK() OVER (ORDER BY SUM(o.salary) DESC) rnk
    from INCOM.EMPL_08 o
    group by o.department_id
)
SELECT department_id, max_salary
FROM cte
WHERE rnk = 1;
