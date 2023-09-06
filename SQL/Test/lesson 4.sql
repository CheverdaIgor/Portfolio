select * from employee as of timestamp (to_timestamp('08/04/2014 08:30:00','DD.MM.YYYY HH24:MI:SS' ))
;

update employee r
set r.name= r.name||' new'
where 1=1;


select scn_to_timestamp(ora_rowscn), r.* from employee r;

select scn_to_timestamp(ora_rowscn),ora_rowscn, r.* from salary r;


select * from employee 
;

insert into employee 
()

;
insert into employee
  (id, department_id, chief_id, name, salary, secondname, lastname)
values
  ((select max(id)+1 from employee), 23, 15, 'New name', 22222, 'New second name', 'new las name');

commit; 


insert into employee
select r.id+2000, department_id,CHIEF_ID, r.name,r.salary, r.secondname, r.lastname from employee r
where rownum<10
;




insert all
into employee 
values
  ((select max(id)+1 from employee), 23, 15, 'New name', 22222, 'New second name', 'new las name')
into employee  
values
  ((select max(id)+2 from employee), 23, 15, 'New name 2', 22223, 'New second name3', 'new las nam4e')
into department
values
((select max(id)+1 from department) 'DEP #','jjj','uuu' )
select * from dual ;

;

update employee f
   set name = (select t.name from department t where f.department_id=t.id ),
       lastname = 'LAST_NAME_DEP'
 where id = 5055;
 
 


delete from employee 
where id = 5055
;





select rownum, rowid,  r.* from employee r 

  ;




