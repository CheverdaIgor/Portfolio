create table empl_08
(
  ID            numeric not null,
  DEPARTMENT_ID numeric not null,
  CHIEF_ID      numeric not null,
  NAME          char(100),
  NAME_2        CHAR(100),
  SALARY        numeric,
  dept_name     CHAR(100),
  count_emp     numeric
);

insert into empl_08 values (1, 23, 0, 'Igor1', 'Cheverda1', 100, 'Miratech23', 3);
insert into empl_08 values (2, 23, 1, 'Igor2', 'Cheverda2', 200, 'Miratech23', 3);
insert into empl_08 values (3, 22, 1, 'Igor3', 'Cheverda3', 300, 'Miratech22', 1);
insert into empl_08 values (4, 23, 0, 'Igor4', 'Cheverda4', 400, 'Miratech23', 3);
insert into empl_08 values (5, 24, 4, 'Igor5', 'Cheverda5', 500, 'Miratech24', 2);
insert into empl_08 values (6, 24, 4, 'Igor6', 'Cheverda6', 600, 'Miratech24', 2);
insert into empl_08 values (7, 25, 9, 'Igor7', 'Cheverda7', 700, 'Miratech25', 2);
insert into empl_08 values (8, 25, 10, 'Igor8', 'Cheverda8', 700, 'Miratech25', 2);
insert into empl_08 values (11, 26, 10, 'Igor11', 'Cheverda11', 1100, 'Miratech26', 1);
insert into empl_08 values (12, 27, 12, 'Igor12', 'Cheverda12', 1200, 'Miratech27', 1);

select *
from empl_08