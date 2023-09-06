/*declare
result clob;
begin
result := web.liteclient.ClntBills
 (p_msisdn => '989719232',
  p_account => null,
  p_startperiod => '03.06.2015',
  p_endperiod => '03.08.2015');
  dbms_output.put_line(result);
  end;*/

declare
UserID number;
ErrorID number;
ErrorText varchar2(1000);
begin
valera.idm_manage_users.idm_create_user
 (p_login => 'DL_IGORC_60_4',
  p_password => 'DL_IGORC_60_4',
  p_username => 'DL_IGORC_60_4',
  p_email => 'DL_IGORC_60_4@i.ua',
  p_phone => '+380989719232',
  p_guid => '1000',
  p_departmentid => '65',
  p_departmentid_ttl => '65',
  p_login_id => null,
  p_role_id => '1',
  p_usercomment => null,
  p_domainnameadm => null,
  p_idrequest => '1011',
  p_domainauthorization => '0',
  p_userid => UserID,
  p_errorid => ErrorID,
  p_errortext => ErrorText);
  if errorid = 1 then
    raise_application_error(-20666,ErrorText);
  end if;
end;
