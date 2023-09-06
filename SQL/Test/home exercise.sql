---lesson 1:
--1) Посчитать количество букв О в слове МОЛОКОВОЗ
select length('МОЛОКОВОЗ') - length(replace('МОЛОКОВОЗ', 'О')) FROM dual;
--2)  Найти все имена в таблице EMPLOYEE, которые содержат знак % или _
select *
from employee
where name like '%$_%' escape '$' or name like '%$%%' escape '$';
--3) Из фразы «Мой дядя самых честных правил» вырезать слово «дядя»
select replace('Мой дядя самых честных правил','дядя') from dual;

---lesson 2:
--1 – Сделать выборку состоящую из таких полей - имя сотрудника, код его департамента, имя его руководителя,
--код департамента руководителя, название департамента. (не потерять записи у которых нет руководителя)
select e2.name, e2.department_id, e22.name, e22.department_id, d2.name
 from employee e2
  left join (select e3.*
             from employee e3
             where e3.id in (select e33.chief_id
                             from employee e33)) e22
   on e2.chief_id = e22.id
    left join department d2
     on e22.department_id = d2.id;
--or--
select e2.name, e2.department_id, e22.name, e22.department_id, d2.name
from employee e2
left join employee e22
on e2.chief_id = e22.id
left join department d2
on e22.department_id = d2.id;
--2 – Сделать выборку зп текущая и предполагаемая. Расчет предполагаемой зп:
--Если руководителем сотрудника является «David1»  и сотрудник работает во втором департамента – текущая ЗП умножается на 2,
--Если руководителем сотрудника является «David1»  и сотрудник работает в департаменте отличном от второго – текущая ЗП умножается на 1.5
--Если руководитель отличный от «David1» и сотрудник работает в департаменте 2, 3, 4, 5 или 6 – текущая зп умножается на 1.2
--У сотрудника «David1» зп остается без изменений
--Для всех оставшихся записей – текущая зп  умножается на 1.35
select  d2.id as "id департамента", e2.id, e2.name, e2.chief_id, e2.salary as "текущая",
case
   when e2.id in (select e3.id
                  from employee e3
                  where e3.chief_id = (select e33.id
                                       from employee e33
                                       where e33.name = 'David1'))
    and d2.id=2
     then e2.salary * 2
   when e2.id in (select e3.id
                  from employee e3
                  where e3.chief_id = (select e33.id
                                       from employee e33
                                       where e33.name = 'David1'))                                       
    and d2.id<>2
     then e2.salary * 1.5
   when e2.id not in (select e3.id
                      from employee e3
                      where e3.chief_id = (select e33.id
                                           from employee e33
                                           where e33.name = 'David1'))
                                       
    and d2.id in (2,3,4,5,6)
     then e2.salary * 1.2
   when e2.name = 'David1'
     then e2.salary
   else  e2.salary * 1.35
end "предполагаемая"
from employee e2
join department d2
on e2.department_id = d2.id;

---lesson 3:
--Появилась в нашей базе новая таблица salary , кононка employee_id ссылается на колонку id таблицы employee
--Необходимо посчитать сумму зарплат по департаментам 1, 2, 3, 4 и 5 за период с января по апрель 2014 (за каждый месяц,
--по каждому департаменту отдельная сумма) тремя способами
--1 – Применяя обычную группировку: т.е на выходе 3 колонки - DATE_SAL, DEPARTMENT_ID и сумма
select s2.date_sal, e2.department_id, sum(s2.salary) as "сумма"
from salary s2
join employee e2
on s2.employee_id = e2.id
where e2.department_id in (1,2,3,4,5) and s2.date_sal BETWEEN TO_DATE ('01.01.2014','dd.mm.yyyy')
AND TO_DATE ('01.04.2014','dd.mm.yyyy')
group by (s2.date_sal, e2.department_id)
order by e2.department_id;
--2 - С итоговыми суммами по департаментам и по всему периоду
select e2.department_id, sum(s2.salary) as "сумма"
from salary s2
join employee e2
on s2.employee_id = e2.id
group by rollup (e2.department_id)
order by e2.department_id;
--3 – Результат третьего запроса должен выглядеть вот так:
select *
from
(select decode(s2.date_sal,
        TO_DATE ('01.01.2014','dd.mm.yyyy'), 'Январь 2014',
        TO_DATE ('01.02.2014','dd.mm.yyyy'), 'Февраль 2014',
        TO_DATE ('01.03.2014','dd.mm.yyyy'), 'Март 2014',
        TO_DATE ('01.04.2014','dd.mm.yyyy'), 'Апрель 2014') as "месяц", e2.department_id, s2.salary
from salary s2
join employee e2
on s2.employee_id = e2.id
where e2.department_id in (1,2,3,4,5) and s2.date_sal BETWEEN TO_DATE ('01.01.2014','dd.mm.yyyy')
AND TO_DATE ('01.04.2014','dd.mm.yyyy') )
pivot(
sum(salary)
for department_id in ('1' as "Dep1", '2' as "Dep2", '3' as "Dep3", '4' as "Dep4", '5' as "Dep5"))
order by (case "месяц"
when 'Январь 2014'  then 1
when 'Февраль 2014' then 2
when 'Март 2014'    then 3
when 'Апрель 2014'  then 4
end);

---lesson 4:
--1)	Добавить 4 записи в свою таблицу
insert all
into empl_08
  (id, department_id, chief_id, name, salary, dept_name, count_emp)
values
  ((select max(id)+1 from empl_08), 23, 15, 'IgorC', 22222, 'Miratech', '33333')
into empl_08
values
  ((select max(id)+2 from empl_08), 23, 15, 'IgorC', 22222, 'Miratech', '33333')
into empl_08
values
  ((select max(id)+3 from empl_08), 23, 15, 'IgorC', 22222, 'Miratech', '33333')
into empl_08
values
  ((select max(id)+4 from empl_08), 23, 15, 'IgorC', 22222, 'Miratech', '33333')
select * from dual;
--2)	Изменить ЗП – для всех сотрудников увеличив текущую на 500
update empl_08 e2
set e2.salary = e2.salary + 500
where 1=1;
--3)	Запросить данные из своей таблицы по состоянию на 5 утра текущего дня
--SELECT
SELECT TRUNC (SYSDATE) + 5/24 FROM dual;
SELECT to_DATE(TRUNC (SYSDATE)) + 5/24 FROM dual;
SELECT to_timestamp(TRUNC (SYSDATE)) + 5/24 FROM dual;
--timestamp
select *
from empl_08
as of timestamp (to_timestamp(TRUNC (SYSDATE)) + 5/24);
--
select *
from empl_08
as of timestamp (TRUNC (SYSDATE) + 5/24);
--
select *
from empl_08
as of timestamp (to_timestamp('08/04/2014 05:00:00','DD.MM.YYYY HH24:MI:SS'));

---lesson 5:
--1) Свою таблицу дополнить недостающими записями из таблицы employee, а так же привести в соответствии имена
merge into empl_08 t
using employee e
on (t.id=e.id )
WHEN MATCHED THEN UPDATE 
  set t.name=e.name
when not matched then insert
  (id, department_id, chief_id , name, salary)
values 
  (e.id, e.department_id, e.CHIEF_ID, e.NAME, e.SALARY);
--2) Выбрать всех сотрудников у которых не указан руководитель, или указана несуществующая ссылка. (тремя способами)
--1
select e2.id as id_works, e2.name as works, e2.chief_id as id_chief, e3.name as chief
from employee e2
left join employee e3
on e2.chief_id=e3.id
where e3.chief_id is null
order by id_works;
--2
select e2.id as id_works, e2.name as works, e2.chief_id as id_chief
from employee e2
where e2.chief_id not in (select id from employee)
order by id_works;
--3
select e2.id as id_works, e2.name as works, e2.chief_id as id_chief
from employee e2
where not exists (select 1/0 from employee e3 where e2.chief_id=e3.id)
order by id_works;

---lesson 7:
--1) В свою таблицу добавить новое поле, которое бы хранило суммарную ЗП за 4 месяца по сотруднику
ALTER TABLE empl_08 add summ number;
/*ALTER TABLE empl_08 DROP COLUMN summ;*/
---
merge into empl_08 em1
using (select sum(s.salary) summ, e.id
       from salary s, empl_08 e
       where s.employee_id = e.id
       group by (e.id)) us
on (em1.id = us.id)
WHEN MATCHED THEN UPDATE
  set em1.summ=us.summ;
---
select e.*
from empl_08 e
order by e.id;
--2) Создать процедуру, которая заполнит новое поле, и вернет значение «Работа выполнена»
declare
v_summa number;
v_id number;
v_count_emp number;
begin
for rec in (select * from empl_08) loop
                                   select sum(s.salary)
                                   into v_summa
                                   from salary s
                                   where s.employee_id = rec.id;                                                                      
update empl_08 e1
set e1.count_emp = v_summa
where e1.id = rec.id;

select e2.id, e2.count_emp
into v_id, v_count_emp
from empl_08 e2
where e2.id = rec.id;

dbms_output.put_line('id:'||v_id||' сумма:'||v_count_emp||' -> Работа выполнена');
end loop;
dbms_output.put_line('Конец');
end;
---
/*select e2.*
from empl_08 e2
order by id;*/

---lesson 8:
--Создать свой пакет.
--В пакете функция в качестве параметров принимает все поля своей(empl_08) таблицы кроме ID (id находим как максимальный плюс 1)
--Функция проверяет наличие департамента с таким кодом (из входных параметров) в таблице department и в случае,
--если департамента с таким department_id нет вставляет запись. Вставка записи должна быть оформлена в виде процедуры с автономной транзакцией.
--После чего вставляет запись в свою таблицу.
create or replace package IgorC_Test
is
function func_IgorC (p_department_id in number, p_chief_id in number, p_name in varchar2, p_salary in number)
return varchar2;
end IgorC_Test;
/
create or replace package body IgorC_Test
is
function func_IgorC (p_department_id in number, p_chief_id in number, p_name in varchar2, p_salary in number)
--входные параметры
return varchar2
is
v_department_id number;
insert_null_into_notnull EXCEPTION;
PRAGMA EXCEPTION_INIT(insert_null_into_notnull, -1400);
---
procedure auton_proc (dep_id IN NUMBER) --вставка записи из процедуры с автономной транзакцией
 is pragma autonomous_transaction;
 insert_null_into_notnull EXCEPTION;
 PRAGMA EXCEPTION_INIT(insert_null_into_notnull, -1400);
  begin
    insert into department (id, name)
    values (dep_id, 'Департамент №'||to_char(dep_id));
  commit;
EXCEPTION
WHEN insert_null_into_notnull
  THEN dbms_output.put_line('параметр p_department_id не заполнен, вставка в таб. department не выполнилась!');
end;
---
begin
 select count(d.id) into v_department_id from department d where d.id = p_department_id;
 --проверяет наличие департамента с таким кодом (из входных параметров)
   if v_department_id = 0 --в случае, если департамента с таким department_id есть
     then auton_proc(p_department_id); --вызов процедуры с автономной транзакцией
       insert into empl_08 (id, department_id, chief_id, name, salary)
       -- после чего вставляет запись в свою таблицу
       values ((select max(id)+1 from empl_08), p_department_id, p_chief_id, p_name, p_salary);
       --id находим как максимальный плюс 1
     else return 'такая запись уже есть!';
     --в случае, если департамента с таким department_id нету
   end if;
  return 'работа выполнена';
 EXCEPTION
 WHEN NO_DATA_FOUND THEN return 'No records found!';
 WHEN insert_null_into_notnull
   THEN dbms_output.put_line('параметр p_department_id не заполнен, вставка в таб. empl_08 не выполнилась!');
   return 'параметр p_department_id не заполнен, работа не выполнена';
 WHEN OTHERS THEN return 'работа не выполнена';
end func_IgorC;
end IgorC_Test;
/
---

---lesson 10:
--1 При помощи динамического SQL добавить поле в свою таблицу. Заполнить поле – количеством сотрудников у роководителей.
declare
v_count number;
SQL_TXT VARCHAR2(150):= 'update empl_08 set count_emp = :1 where id = :2';
begin
 execute immediate 'ALTER TABLE empl_08 add (count_emp number)';
 ---в такой последовательности: вставка и цыкал не совместимы(результат: ошибка), наоборот отрабатывает
  for rec in (select * from empl_08) loop
                                         select count(e2.id)
                                         into v_count
                                         from empl_08 e2
                                         where e2.chief_id = rec.id;
   execute immediate SQL_TXT using v_count, rec.id;
   dbms_output.put_line('id:'||rec.id||' количество:'||v_count);
  end loop;
/*execute immediate 'ALTER TABLE empl_08 add (count_emp1 number)';*/
--последовательность наоборот: для update считаем, что поле уже существует,
--делаем добавление нового поля, но по задаче такой вариант не подходит
dbms_output.put_line('Конец');
end;

--ошибка:
--ORA-00932: inconsistent datatypes: expected - got -
--ORA-06512: at line 6
--как ее обойти?

--ALTER TABLE empl_08 DROP COLUMN count_emp;
--select t.*, t.rowid from EMPL_08 t;
--2 Создать все три типа коллекций по 7 элементов, заполнить данными – цвета радуги,
--организовать цикл по каждой коллекции и отпечатать элементы на экран
--NESTED TABLE
declare
TYPE NES_TABLE is table of VARCHAR2(150);
V_NES_TABLE NES_TABLE :=NES_TABLE();
l_row pls_integer;
begin
  V_NES_TABLE.extend(7);
  V_NES_TABLE(1) := 'Красный';
  V_NES_TABLE(2) := 'Оранжевый';
  V_NES_TABLE(3) := 'Желтый';
  V_NES_TABLE(4) := 'Зеленый';
  V_NES_TABLE(5) := 'Голубой';
  V_NES_TABLE(6) := 'Синий';
  V_NES_TABLE(7) := 'Фиолетовый';
   l_row:=V_NES_TABLE.first;
   while l_row is not null
    loop
      dbms_output.put_line(V_NES_TABLE(l_row));
      l_row:= V_NES_TABLE.next(l_row);
    end loop;
dbms_output.put_line('количество: '||V_NES_TABLE.count);
end;
/
--ASSOSIATE ARRAY
declare
type list_of_names_t is table of varchar2(30) index by varchar2(20);
v_rainbow list_of_names_t;
l_row varchar2(20);
begin
  v_rainbow('a') := 'Красный';
  v_rainbow('c') := 'Желтый';
  v_rainbow('b') := 'Оранжевый';
  v_rainbow('f') := 'Голубой';
  v_rainbow('d') := 'Зеленый';
  v_rainbow('k') := 'Фиолетовый';
  v_rainbow('g') := 'Синий';
   l_row:= v_rainbow.FIRST;
   while l_row is not null
    loop
      dbms_output.put_line(v_rainbow(l_row)||' '|| to_char(l_row));
      l_row:= v_rainbow.next(l_row);
    end loop;
dbms_output.put_line('количество: '||v_rainbow.count);
end;
/
--VARRAY
declare
type type_VARRAYS is varray(7) of varchar2(100);
V_ARR type_VARRAYS:=type_VARRAYS();
begin
  V_ARR.extend(7);
  V_ARR(1) := 'Красный';
  V_ARR(2) := 'Оранжевый';
  V_ARR(3) := 'Желтый';
  V_ARR(4) := 'Зеленый';
  V_ARR(5) := 'Голубой';
  V_ARR(6) := 'Синий';
  V_ARR(7) := 'Фиолетовый';
   for i in V_ARR.first..V_ARR.last loop
    dbms_output.put_line(V_ARR(i)||' '|| to_char(i));
   end loop;
dbms_output.put_line('количество: '||V_ARR.count);
end;
/
--коллекция
declare
 TYPE Employee_ROWS IS TABLE OF empl_08%ROWTYPE;
  underpaid Employee_ROWS;
begin
 SELECT distinct e2.* BULK COLLECT
  INTO underpaid
  FROM empl_08 e1
  join empl_08 e2
  on e2.id = e1.chief_id;
  FOR i IN underpaid.FIRST..underpaid.LAST
   LOOP
   DBMS_OUTPUT.PUT_LINE('id:'||underpaid(i).id||'  руководитель:'||underpaid(i).name);
  END LOOP;
end;
--
/*CREATE OR REPLACE PROCEDURE IgorC_Cursor(v_cur out Sys_RefCursor)
is
begin
open v_cur for select * from employee;
end IgorC_Cursor;*/
---
