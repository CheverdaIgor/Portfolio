create table incom.empl_08
(
  ID            NUMBER not null,
  DEPARTMENT_ID NUMBER not null,
  CHIEF_ID      NUMBER not null,
  NAME          VARCHAR2(100),
  NAME_2        CHAR(100),
  SALARY        NUMBER,
  dept_name     VARCHAR2(100),
  count_emp     NUMBER
);

/*TRUNCATE TABLE Workers;*/
/*Drop Table incom.empl_08;*/

insert all
into incom.empl_08
  (id, department_id, chief_id, name, name_2, salary, dept_name, count_emp)
values
  (1, 23, 0, 'Igor1', 'Cheverda1', 100, 'Miratech23', 3)
into incom.empl_08
values
  (2, 23, 1, 'Igor2', 'Cheverda2', 200, 'Miratech23', 3)
into incom.empl_08
values
  (3, 22, 1, 'Igor3', 'Cheverda3', 300, 'Miratech22', 1)
into incom.empl_08
values
  (4, 23, 0, 'Igor4', 'Cheverda4', 400, 'Miratech23', 3)
into incom.empl_08
values
  (5, 24, 4, 'Igor5', 'Cheverda5', 500, 'Miratech24', 2)
into incom.empl_08
values
  (6, 24, 4, 'Igor6', 'Cheverda6', 600, 'Miratech24', 2)
into incom.empl_08
values
  (7, 25, 9, 'Igor7', 'Cheverda7', 700, 'Miratech25', 2)
into incom.empl_08
values
  (8, 25, 10, 'Igor8', 'Cheverda8', 700, 'Miratech25', 2)
into incom.empl_08
values
  (11, 26, 10, 'Igor11', 'Cheverda11', 1100, 'Miratech26', 1)
into incom.empl_08
values
  (12, 27, 12, 'Igor12', 'Cheverda12', 1200, 'Miratech27', 1)
select * from dual;

---
select t.*, t.rowid from INCOM.EMPL_08 t;
---

1)	������� ������������ ���������� ����� �� ����� �����������
select max(salary)
FROM employee

2)	������� ������������ ������������ �IT Department�
select employee.name
FROM department INNER JOIN employee
 ON department.id = employee.department_id
where department.name like 'IT Department'
3)	������� ����������� ������� ���������� ����� ������ 20 � ������ 100
select employee.name
FROM employee
where employee.salary > '20' and employee.salary < '100'
4)	������� ������ �����������, ���������� ���������� ����� ������� ��� � ����������������� ������������.
5)	������� ������ �����������, ���������� ������������ ���������� ����� � ����� ������
select *
 from employee e
  where e.salary =
   (select max(salary)
     from employee e1
      where e.department_id=e1.department_id)
6)	������� ������ ID �������, ���������� ����������� � ������� �� ��������� 3 �������
7)	������� ������ �����������, �� ������� ������������ ������������, ����������� � ���-��
8)	����� ������ ID ������� � ������������ ��������� ��������� �����������

