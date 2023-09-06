create or replace package HOWE_WORK8
is
function insert_employee
  (p_department_id IN NUMBER, p_chief_id in NUMBER, p_name IN VARCHAR2, p_salary  in number)
   return varchar2;

end HOWE_WORK8;
/
create or replace package body HOWE_WORK8
is
procedure insert_dep (dep_id IN NUMBER)
  is
pragma autonomous_transaction;   
begin
  
insert into department 
(id , name )
values 
(dep_id,'Департамент №'||to_char(dep_id));

commit;
end;     
  
function insert_employee
  (p_department_id IN NUMBER, p_chief_id in NUMBER, p_name IN VARCHAR2, p_salary  in number)
   return varchar2
   is
 CNT_DEP PLS_INTEGER;  
 begin
   
 select count(*) into CNT_DEP from department where id=p_department_id;
 
 if CNT_DEP = 0 then 
   insert_dep(p_department_id);
 end if;
 
 insert into employee
 (id, department_id , chief_id  , name , salary  ) 
 values
 ((select max(id)+1 from employee), p_department_id, p_chief_id, p_name, p_salary );
 
 return 'Работа выполнена!!!';
 end;

end HOWE_WORK8;
/
