with table_in_memory as 
(
select e.id, e.department_id, e.name name_emp, e.salary,
e.secondname, d.name name_dep, d.new_colimn
from 
employee e,
department d
where e.department_id=d.id
),
table_2 as 
(select 
* from salary 
)
select * from 
table_in_memory w,
table_2 r
where w.id=r.employee_id  ;



with table_in_memory as 
(
select e.id, e.department_id, e.name name_emp, e.salary sal_emp,
e.secondname, d.name name_dep, d.new_colimn
from 
employee e,
department d
where e.department_id=d.id
),
table_2 as 
(select 
* from table_in_memory ,
salary 
where 
table_in_memory.id = salary.employee_id 
)
select * from 
table_2 r
;


CREATE OR REPLACE VIEW SELECT_WITH_ROLLUP AS
select
r.name, r.department_id, sum(r.salary) sum_sal
from
scott.employee r
group by rollup ( r.department_id, r.name)
order by  r.department_id, r.name;


alter table department
add 
(CNT_EMPL number(3)
)
;
/


declare
v_CNT_EMPLOYEE pls_integer; 
begin

for rec in (select * from department ) loop
  
   select count(*) into v_CNT_EMPLOYEE from employee r
   where r.department_id = rec.id;   
   
   update department 
   set cnt_empl = v_CNT_EMPLOYEE 
   where id = rec.id;
   
   
end loop;
  
commit;

end;
/


declare
VAR1 NUMBER;
VAR2 NUMBER; 
begin 
--VAR1:= 104;
var2:= 151;


case 
  when VAR1=10 
    then dbms_output.put_line('Первая ветка case '); 
    dbms_output.put_line('Первая ветка case вторая серия');
  when VAR2=15
    then  dbms_output.put_line('Вторая ветка case ');   
  else 
     dbms_output.put_line('ветка else '); 
end case;     
   


if VAR1=101 then 
  dbms_output.put_line('Первая ветка if  '); 
else 
  dbms_output.put_line('Первая ветка if else  ');   
end if;  

if VAR1=101 then 
  dbms_output.put_line('Первая ветка if  '); 
elsif  VAR1<>101 then
  dbms_output.put_line('Первая ветка if elsif  ');
else  
 dbms_output.put_line('Первая ветка if else  ');       
end if;  






end;
/


declare 
p_first_ pls_integer := 58;
p_second_ pls_integer := 70;
p_var3_ pls_integer;
p_var4_ VARCHAR2(50) := 'текстовая переменная';
begin
  -- Call the procedure
  first_proc_group3(p_first => p_first_,
                    p_second => p_second_,
                    p_var3 => p_var3_,
                    p_var4 => p_var4_);
                    
 dbms_output.put_line(p_var3_);
 dbms_output.put_line(p_var4_);                  
end;
/





