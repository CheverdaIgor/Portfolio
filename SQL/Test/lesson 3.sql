select works.department_id, works.name, d.name, chif.department_id, chif.name, d1.name from 
employee works
left join employee chif
on works.chief_id = chif.id
left join department d
on works.department_id = d.id
left join department d1 on  chif.department_id = d1.id
;


select sum(r.salary), r.chief_id 
from employee r
group by chief_id ;

select sum(r.salary), r.chief_id 
from employee r
group by chief_id 
 having sum(r.salary)>500
;



select count(r.name), r.chief_id 
from employee r
group by chief_id ;


select count(*), r.chief_id 
from employee r
group by chief_id ;


select count(distinct r.name), r.chief_id 
from employee r
group by chief_id ;


select 
r.name, r.department_id, sum(r.salary) sum_sal 
from 
employee r
group by rollup ( r.department_id, r.name)
order by  r.name, r.department_id
;


select 
* 
from
(select r.department_id , r.name , r.chief_id  from  employee r where chief_id in (1,15) )
pivot
(
count(name)
for chief_id in ('1' as "FIRST", '15' as "SECOND")
)
;
 




select count(r.name) , r.chief_id ,r.department_id
from employee r
where chief_id in (1,15)
group by chief_id, r.department_id
 



















