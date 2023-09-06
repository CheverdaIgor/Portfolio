select d.id, d.name from department d
left join employee r 
on d.id=r.department_id
where r.department_id is null;

select d.id, d.name from department d
where id not in (select distinct department_id from employee); 

select d.id, d.name from department d
where not exists (select 1/0 from employee r where d.id=r.department_id );

--------------------------------------------------------------


delete from  empl_14 r
where 1=1
;

delete from  empl_14 r
where r.id = 1 ;


truncate table empl_14;

create table empl_test 
as 
select * from employee
where rownum<26


merge into empl_test t
using employee e
on (t.id=e.id )
WHEN MATCHED THEN UPDATE 
  set t.salary = e.salary, t.name=e.name
  delete where e.salary=0
when not matched then insert
  (id , department_id, chief_id , name , salary , secondname, lastname )
values 
  (e.id, e.department_id,e.CHIEF_ID,e.NAME,e.SALARY,e.SECONDNAME,e.LASTNAME)  
;



create table EMPLOYEE_2
(
  ID            NUMBER not null,
  DEPARTMENT_ID NUMBER not null,
  CHIEF_ID      NUMBER not null,
  NAME          VARCHAR2(100),
  NAME_2        CHAR(100),
  SALARY        NUMBER,
  SECONDNAME    VARCHAR2(50),
  LASTNAME      VARCHAR2(50)
);







    
  












 
