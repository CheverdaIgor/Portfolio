select userid, username, departmentid, userpost, email, phone, userip, programid, programversion, userlogin, userpassword, dateofaddingrecord, prepaidflag, canuserseeprepaidnumbers, canuseraddsupercomments, cancalctariffplans, cansee, supervisor_id, tariff_plan_calc, canseejockers, t.appcontent.getclobval() appcontent, login_id, user_type_id, realuserlogin, rowid
from VALERA.USERSTABLE t
--where t.departmentid = '249'
--order by (userid) desc
--where t.userlogin like '%kyltest%' or t.realuserlogin like '%KYLTEST%'
where t.userid = '19692' or t.userid = '20160' or t.userid = '20136'
or t.userid = '19731' or t.userid = '3032';

INCOM.GetPidsCoordVerify  --��������� ���������� ������ ��� �������� ��������� �� �������������� ������� ������������
select t.*, t.rowid from INCOM.PIDSFORCOORDVERIFY t

select t.*, t.rowid
from VALERA.DEPARTMENTSTABLE t
where t.departmentid = '452' or t.departmentid = '622' or t.departmentid = '249'
or t.departmentid = '53' or t.departmentid = '65';

select t.*, t.rowid from VALERA.DEPARTMENT_TYPE t;

select t.*, t.rowid from VALERA.PERMISSION_USER t
--order by t.user_id desc
--where t.id_permission_type = '20'
where t.user_id = 19692;

select t.*, t.rowid from VALERA.PERMISSION_TYPE t
where --t.id_permission_type = '76'
t.id_permission_type in (33, 34, 35, 57, 58, 76) --�������� [HDD-579]
--t.id_permission_type in (68, 69, 20, 68, 1, 47);

select t.*, t.rowid from VALERA.PERMISSION_TYPE_ACTION t
where --t.id_permission_type = '76'
t.id_permission_action in (57, 58, 59, 60, 61) --�������� [HDD-579]
--t.id_permission_action in (70, 71)
--t.id_permission_action in (47, 20)
or 
t.id_permission_type = '1'
order by t.id_permission_action;

select t.*, t.rowid from VALERA.PERMISSION_ACTION t
where --t.id_permission_action = '78' 
--t.permission_action like '%��%'
t.id_permission_action in (50, 57, 58, 59, 60, 61)
--t.id_permission_action in (70, 71) or
--t.id_permission_action = '47';

select t.*, t.rowid from VALERA.PERMISSION_USER_PROFILES t
where t.userid = '19692' or t.userid = '20160'
--and (t.id_permission_type in (20, 47, 67, 33, 49)
order by t.id_permission_type
