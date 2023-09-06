create or replace procedure SUM_SALL (WORK_ OUT VARCHAR2)
is
VAR_SALARY NUMBER;
cursor for_empl
is 
select r.id from employee r; 

procedure auton_proc (P_ID IN NUMBER, P_SUM_SALL IN NUMBER )
  is
pragma autonomous_transaction;   
begin   
  
    update employee set sum_sal = P_SUM_SALL
    where id=P_ID; 
    
commit;
end;


begin
 
update department r
set r.new_colimn = to_char(id)||' '||r.name
where 1=1;

for rec in for_empl 
  loop
    select sum(salary) into VAR_SALARY from salary q where q.employee_id=rec.id; 
    
  auton_proc(rec.id, VAR_SALARY);
      
  end loop;

--commit;
WORK_:='Работа выполнена';
end;
