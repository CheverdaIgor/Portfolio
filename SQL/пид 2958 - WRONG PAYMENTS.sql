INCOM.GetInformFieldsAnswer_2958  --Процедура возвращает результат проверок по абонентам, необходимых для возврата ошибочного платежа
incom.verifyabonentinfo_2958  --Процедура проверяет информацию по абоненту при ошибочном платеже (Problem 2958)

select t.*, t.rowid from ACTIVITYHISTORY t  --v_EndPeriod := p_PaymentDate/* + c_NumberHours/24*/;
select 
                                            t.recordnum            as "RecordNum"
                                           ,decode(t.activitytype, '91', '0091', t.activitytype)          as "ActivityType"
                                           ,t.activitydetail        as "ActivityDetail"                                            
                                           ,t.activityamount           as "ActivityAmount"
                                           ,t.balancechangeamount           as "CoreBalanceChangeAmount"
                                           ,nvl('01.09.2016 14:00:00', '01.01.2020')        as "EndPeriod"
                                           ,t.activitydate  
  from web.activityhistory t
  where t.msisdn = '989719233'
  and t.activitydate > to_date('02.08.2016 14:00:00', 'dd/mm/yyyy hh24:mi:ss');
