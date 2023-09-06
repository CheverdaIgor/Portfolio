declare 
SQL_TXT VARCHAR2(150) := 'select name, :1 from employee where id= :2';
V_NAME VARCHAR2(50);
p_dep_id number;
begin
 --execute immediate 'truncate table department_empl_25';
execute immediate SQL_TXT into V_NAME, p_dep_id using 5039 , 5;
--select name, 5039 from employee where id= 5
dbms_output.put_line(V_NAME);
dbms_output.put_line(p_dep_id);


execute immediate SQL_TXT into V_NAME, p_dep_id using 5039 , 5;

dbms_output.put_line(V_NAME);
dbms_output.put_line(p_dep_id);


--select t.name, t.department_id into V_NAME,p_dep_id  from employee t where id=5039;

end;
