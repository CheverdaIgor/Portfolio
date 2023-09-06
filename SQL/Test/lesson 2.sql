select nvl(r.name,'��� ������')nvl_name, name  from employee r;
select coalesce(r.lastname,r.secondname,r.name,'�� ���� ��� �� ���������') COAL_NAME, r.lastname, r.secondname, r.name from employee r
order by 1;

select coalesce(r.lastname,r.secondname,r.name,'�� ���� ��� �� ���������') COAL_NAME, r.lastname, r.secondname, r.name from employee r
order by name nulls first
;
select coalesce(r.lastname,r.secondname,r.name,'�� ���� ��� �� ���������') COAL_NAME, r.lastname, r.secondname, r.name from employee r
order by name nulls last
;
select coalesce(r.lastname,r.secondname,r.name,'�� ���� ��� �� ���������') COAL_NAME, r.lastname, r.secondname, r.name from employee r
order by name desc nulls last
;
select coalesce(r.lastname,r.secondname,r.name,'�� ���� ��� �� ���������') COAL_NAME, r.lastname, r.secondname, r.name from employee r
order by name asc nulls last
;


select nvl2(r.name,'�������� ���� �� ���','�������� ���� ���'  ), name from employee r;





select  r.salary,
case 
   when r.salary<1000 
   then '��������� ��'
   when r.salary>=1000 and r.salary<10000
   then '������� ��'
   when r.salary>= 10000
   then '������� ��' 
   else  '��� ��'       
end "����"
from employee r
;

select  r.salary,
case r.salary
   when 1000 
   then '��������� ��'
   when 10000
   then '������� ��'
   when 100000
   then '������� ��' 
   else  '��� ��'       
end "����"
from employee r
;

select r.salary, 
decode(r.salary, 
       1000 ,'�� = 1000', 
       2000, '�� = 2000',
             '��� ���������' )  
from employee  r

select nullif(name, 'Testovoe 5'), r.name from employee r;


select case mod(r.salary,100)
when 0 
  then '������'
 else '�� ������'
end      
  from employee  r
; 
  
select r.name from employee  r
union 
select d.name from department  d
;

select r.name new_col, r.department_id from employee  r
where r.department_id=30
union all
select d.name, d.id  from department  d
where d.id=30
;

select d.id from department d 
minus
select t.department_id from employee t ;

select d.id from department d 
intersect
select t.department_id from employee t ;


select * 
from employee e,
department d
where e.department_id=d.id
and d.id=21;

select * 
from employee e
inner join 
department d
on e.department_id=d.id
where d.id=21;



select * 
from employee e,
department d
where e.department_id=d.id(+)
;


select * 
from department d
left join 
employee e
on e.department_id=d.id and e.chief_id=1

;
--���������� ��� ������ �� ������� department � �� ������, ������� �������������� �� ������� employee  
select * 
from department d
left join 
(select * from employee where chief_id=1) e
on e.department_id=d.id 
;

--���������� ��� ������ �� ������� employee � �� ������, ������� �������������� �� ������� department
select * 
from department d
right join 
employee e
on e.department_id=d.id and e.chief_id=1
;


select * 
from department d
full outer join 
employee e
on e.department_id=d.id 
;

select distinct t.department_id from employee t

--������ ����������� ������������
select * from department, employee;

--������ ����� ���������� �� �������
begin 
 dbms_stats.gather_table_stats('SCOTT','DEPARTMENT'); 
end;







  
  
