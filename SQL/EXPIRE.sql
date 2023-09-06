package body valera.Idm_Manage_Users --управление учетной записью
function valera.Get_Customer_Segment  --сегмент

USER: IGOR
PASSWORD: IGOR2

--для тестирования смены экспареного пароля пользуем скрипты:
ALTER USER HD_U_S_ER PASSWORD EXPIRE; -- это только экспарить
ALTER USER DL_HDUSER  IDENTIFIED BY "DL_HDUSER7"; --скрипт для смены пароля
ALTER USER IGOR IDENTIFIED BY "IGOR1" PASSWORD EXPIRE; -- оба действия сразу
Alter user DL_HDUSER account unlock; --разблокировать пользователя
--(ALEX09 можно менять для другого юзверя, равно как и "ALEX09" для другого пароля)

select * from SYS.DBA_USERS t
where t.username like '%TEST%';

select t.*, t.rowid from valera.Permission_User t
where t.user_id in (select userid from valera.userstable where userlogin like '%TEST%');

select t.*, t.rowid from VALERA.AGENTSTABLE t
where t.agentname like '%TEST%'
order by t.agentname desc;

-- Grant/Revoke role privileges 
grant claimeditor to HD_U_S_ER7;
grant expert1 to HD_U_S_ER7;
grant superexpert to HD_U_S_ER7;
--ALTER PROFILE IGOR LIMIT password_life_time UNLIMITED;
-- Grant/Revoke system privileges 
grant alter user to HD_U_S_ER7;
grant create any context to HD_U_S_ER7;
grant create session to HD_U_S_ER7;
grant delete any table to HD_U_S_ER7;
grant execute any procedure to HD_U_S_ER7;
grant execute any type to HD_U_S_ER7;
grant insert any table to HD_U_S_ER7;
grant select any dictionary to HD_U_S_ER7;
grant select any sequence to HD_U_S_ER7;
grant select any table to HD_U_S_ER7;
grant unlimited tablespace to HD_U_S_ER7;
grant update any table to HD_U_S_ER7;


declare
UserID number;
ErrorID number;
ErrorText varchar2(1000);
begin
valera.idm_manage_users.idm_create_user
 (p_login => 'HD_U_S_ER7',
  p_password => 'HD_U_S_ER7',
  p_username => 'HD_U_S_ER7',
  p_email => 'HD_U_S_ER_DL2@softengi.com',
  p_phone => null,
  p_guid => null,
  p_departmentid => '249',
  p_departmentid_ttl => '1',
  p_login_id => null,
  p_role_id => '78',
  p_usercomment => null,
  p_domainnameadm => null,
  p_idrequest => '1000',
  p_domainauthorization => '0',
  p_userid => UserID,
  p_errorid => ErrorID,
  p_errortext => ErrorText);
  if errorid = 1 then
    raise_application_error(-20666,ErrorText);
  end if;                                         
end;
