declare 
MY_FIRST_VAR NUMBER;
SECOND_VAR   PLS_INTEGER;
SYS_TIME DATE := SYSDATE;
SYS_TIME2 DATE := to_date('01.01.2014','dd.mm.yyyy') ;
FIRST_CONST Constant PLS_INTEGER := 255;
string1 VARCHAR2(150):= 'znach';
CHAR1 CHAR(50) := 'tree';
i PLS_INTEGER:=200;

cursor CURSOR_NAME  (dep_id PLS_INTEGER )
is
select * from department d
where d.id = dep_id
;
begin
  
--dbms_output.put_line('Переменная типа varchar2 '||string1||'!');

--dbms_output.put_line('Переменная типа CHAR '||CHAR1||'!');

dbms_output.put_line('До цикла '||i);

For i in 1..20 loop
  dbms_output.put_line(i);
end loop;


dbms_output.put_line('После цикла '||i);


select count(*) 
into SECOND_VAR
 from department; 
 
dbms_output.put_line(SECOND_VAR);

select name, id
into string1, MY_FIRST_VAR
 from department
 where id=15;
 
for rec in (select * from employee) loop
dbms_output.put_line(rec.name);
dbms_output.put_line(rec.department_id);
if rec.name='David1' then 
  exit;
end if;  
end loop; 
 
 for rec in CURSOR_NAME(23)  loop
dbms_output.put_line(rec.name);
dbms_output.put_line(rec.id);
if rec.name='David1' then 
  exit;
end if;  
end loop;
 
--exception  
end; 
