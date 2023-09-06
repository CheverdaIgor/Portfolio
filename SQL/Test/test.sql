/*CREATE OR REPLACE PROCEDURE IgorC_Cursor(v_cur out Sys_RefCursor)
is
begin
open v_cur for select * from employee;
end IgorC_Cursor;*/
---
/
create or replace package Fin_Test_IgorC
is
--1 – Найти все департаменты, в которых нет сотрудников. (Отпечатать на экран):
function fin_func_1 return varchar2;
--2 – Для каждого руководителя подсчитать количество подчиненных.
--Вывести его имя, департамент и количество сотрудников. (Отпечатать на экран):
function fin_func_2 return varchar2;
end Fin_Test_IgorC;
---
/
create or replace package body Fin_Test_IgorC
is
--1 – Найти все департаменты, в которых нет сотрудников. (Отпечатать на экран):
function fin_func_1 return varchar2
is
 TYPE DEP_ROWS IS TABLE OF department%ROWTYPE;
 v_dep_emp DEP_ROWS;
begin
 SELECT d.* BULK COLLECT
  INTO v_dep_emp
  from department d
  where not exists (select null from empl_08 where d.id = department_id)
  order by d.id;
   FOR i IN v_dep_emp.FIRST..v_dep_emp.LAST
    LOOP
    DBMS_OUTPUT.PUT_LINE((i)||': id:'||v_dep_emp(i).id||'  name:'||v_dep_emp(i).name);
   END LOOP;
return '1 – Найдены все департаменты, в которых нет сотрудников. (Отпечатано на экран)';
EXCEPTION
  WHEN NO_DATA_FOUND THEN return 'No records found!';
end fin_func_1;

--2 – Для каждого руководителя подсчитать количество подчиненных.
--Вывести его имя, департамент и количество сотрудников. (Отпечатать на экран):
function fin_func_2 return varchar2
is
v_name varchar2(150);
v_department_id number;
begin
  for rec in (select count(e2.chief_id) count_emp, e2.chief_id
              from empl_08 e1
              join empl_08 e2
              on e1.id = e2.chief_id
              group by e2.chief_id
              order by e2.chief_id) loop select e3.name, e3.department_id
                                         into v_name, v_department_id
                                         from empl_08 e3
                                         where e3.id = rec.chief_id;
   dbms_output.put_line('name:'||v_name||' department_id:'||v_department_id||' количество:'||rec.count_emp);
  end loop;
dbms_output.put_line('Конец');
return '2 – Для каждого руководителя подсчитано количество подчиненных. (Отпечатано на экран)';
EXCEPTION
  WHEN NO_DATA_FOUND THEN return 'No records found!';
end fin_func_2;
end Fin_Test_IgorC;
---
/
