select note
from US.EnumTypeValues
where TYID = 20013 and TVValue = &p_ProblemID and rownum = 1;

select INCOM.GetRefundScenarioType_2 from dual;
INCOM.GetRefundApplicationType

select count(*) from valera.PERMISSION_USER_PROFILES
     where UserID = '24345' --заглушка для тестирования
     --SYS_CONTEXT('PROGRAMINFO', 'USERID')
          and ID_PERMISSION_TYPE = 33; --ДП-Підтвердження повернення коштів 1-го рівня для письмових звернень

select count(*) from valera.PERMISSION_USER_PROFILES
       where UserID = '24345' --заглушка для тестирования
       --SYS_CONTEXT('PROGRAMINFO', 'USERID')
            and ID_PERMISSION_TYPE = 57; --ДП-Підтвердження повернення коштів 1-го рівня для усних звернень
   ---ВНИМАНИЕ!! на серверах КС 49 надо поменять на 57!!!!

---
select t.*, t.rowid from VALERA.PERMISSION_USER_PROFILES t
where t.userid = '24345'
order by t.id_permission_type;

select t2.*, t2.rowid from VALERA.PERMISSION_USER_PROFILES t1
inner join VALERA.PERMISSION_TYPE_ACTION t2
on t1.id_permission_type = t2.id_permission_type
where t1.userid = '24345' and 
t2.id_permission_action in (57, 58, 59, 60, 61)
order by t2.id_permission_type;
---
select t.*, t.rowid from VALERA.PERMISSION_TYPE_ACTION t
where t.id_permission_type in (13, 57, 58) and t.id_permission_action in (57, 58, 59, 60, 61);
---
select t.*, t.rowid from VALERA.PERMISSION_USER t
where t.user_id = '24345';

select t2.*, t2.rowid from VALERA.PERMISSION_USER t1
inner join VALERA.PERMISSION_TYPE_ACTION t2
on t1.id_permission_type = t2.id_permission_type
where t1.user_id = '24345' and t2.id_permission_action in (57, 58, 59, 60, 61);


select * --Причина лояльности
from US.EnumTypeValues where TYID = 10257;


select R.*, R.rowid
from INCOM.RefundRegistry R
where R.recordid = '5155091562'
order by R.registryid desc

HDREPORTER.GetRefundAppeals_5


select decode(count(*), 0, 0, 1)
   from VALERA.Permission_User u
   inner join VALERA.Permission_Type_Action a on u.ID_Permission_Type = a.ID_Permission_Type
   where a.ID_Permission_Action = 61
     and u.User_ID = '24345'
     and a.IsAllowed = 1;

select decode(count(*), 0, 0, 1)
     from VALERA.Permission_User_Profiles pu
     inner join VALERA.Permission_Type_Action pa on pu.ID_Permission_Type = pa.ID_Permission_Type
     where pa.ID_Permission_Action = 61
       and pu.UserID = '24345'
       and pa.IsAllowed = 1;
       
