select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t --статуса услуги FTTB на номере(дополнительно проверяем стутс услуги -- «Персональний интернет»)
where msisdn like '%98971923%' or msisdn = '678000270'
order by t.msisdn

select t.*, t.rowid from DICTIONARY_INFO t  --Атрибуты ЛС
where account = 3985436;

select t.*, t.rowid from UNIONLEVEL0 t  --v_Error_Message := 'клієнт не знайдений'
select * from WEB.SUBS4PASS t  --количество лицензий
---номера ДИ:
select t.*, t.rowid from WEB.CLIENTS_ADD_INFO t  --CLNTCLASSID = 51->FTTB FMC
order by t.clnt_id desc;

select t.*, t.rowid from WEB.PHONESERVICESBYACCOUNT t;
---

select t.*, t.rowid from IVR.IVR_CLIENTS t
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '3'

select t.*, t.rowid from IVR.IVR_SUBSCRIBERS t
where  t.clnt_id = '4073831' or  t.clnt_id = '4073832' or t.clnt_id = '4073833'  or t.msisdn = '670000312'

select t.*, t.rowid from INCOM.SUBSADDDETAIL t /*сервисы тарифных планов*/
where t.friend_for = '989719232'

select t.*, t.rowid from IVR.IVR_JUR_ADDRESSES t
where t.clnt_clnt_id = '4073831' or t.clnt_clnt_id = '4073832' or t.clnt_clnt_id = '4073833'

select t.*, t.rowid from incom.prepaidclientinfodop t /*INCOM.GetTarifPlanByPhone - Возвращает информацию о тарифном плане по номеру абонента ...19233*/
where t.MSISDN = '989719232' or t.MSISDN = '989719233'

select t.*, t.rowid from IVR.IVR_BALANCES t /*сотсутствии денег и наличии задолженности*/
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'
or t.clnt_id = '6000001' or t.clnt_id = '6000002' or t.clnt_id = '6000003' or t.clnt_id = '6000004'
or t.clnt_id = '6000005'

select t.*, t.rowid from WEB.PHONESERVICESBYACCOUNT t
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833'

select t.*, t.rowid from WEB.SUBSCRIBERS t  --эмулятор для valera.is_customer_prepaid

select t.*, t.rowid from WEB.SIMCARDS t  --ICC
where t.msisdn = '989719232' or t.msisdn = '989719231' or t.msisdn = '989719230' or t.msisdn = '989719233' or t.msisdn = '678000270'
or t.msisdn = '671412233' or t.msisdn = '675720208' or t.msisdn = '989719234'

select t.*, t.rowid from INCOM.IDENT_PASSWORD t /*проверяет приватный пароль*/

select t.*, t.rowid from INCOM.PREPAIDCLIENTINFODOP t /*Не удалось произвести проверку баланса абонента, операция замены SIM-карты возможна...*/
where t.msisdn = '989719231' or t.msisdn = '989719232' or t.msisdn = '989719233'

select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t
where t.msisdn = '989719232'

select t.*, t.rowid from INCOM.CLIENTSERVICES t /*подключение услуг: SIM-пара, Раздельные счета**/
where t.msisdn = '989719231' or t.msisdn = '989719232'

select t.*, t.rowid from INCOM.DEBTACCOUNTS t /*Лицевые счета с дебиторской задолженностью*/
where t.OKPO = '35363738' or t.OKPO = '35363739' or t.OKPO = '2800000000'

select t.*, t.rowid from INCOM.FINDSPRFRAUD t /*Клиент занесен в черный список»*/
where t.OKPO = '35363738' or t.OKPO = '35363739'

select t.*, t.rowid from INCOM.SUBSPENALTY t /*Нет действующих ДС, действие "Досрочное прекращение" недоступно*/
where t.msisdn = '989719231';

select c.*, c.rowid                         /*Найти документы для повторной печати 1097*/
 from INCOM.fileforproblem1097 c
 where (c.account = &p_Account or c.msisdn = &p_msisdn)
    and c.recorddate >= '19.01.2013 00:00:01'
    and c.recorddate < '21.01.2013 23:59:59'
    and c.DOCUMENTTYPEID in (1,2,3,4)

select t.*, t.rowid from CLNTREALPAYMENTS t /*последние платежи абонента по его ЛС через ЛК*/

select t.*, t.rowid from INCOM.CLIENTSERVICES t /*должны быть данные с serv_id = 1, PID 988*/
where t.msisdn = '989719231' or t.msisdn = '989719232' or t.msisdn = '989719233'

select t.*, t.rowid from UNIONLEVEL0 t      
where t.okpo = '35363738' or t.okpo = '353637388' or t.okpo = '35363739' or t.okpo = '10000002'

select t.*, t.rowid from UNIFIEDCONTRACT t      
where t.okpo = '35363738' or t.okpo = '35363739' or t.okpo = '10000002'

select t.*, t.rowid from ADDR_ADDITIONS t
-- FUNCTION INCOM.GetAddrType
-- 989719231 - абонентский ящик
-- 989719234 - гео-объект
-- 989719232 - стандартный адрес

select t.*, t.rowid from PPS_ADM.SIM_CARDS t --PUK коды для физ.лица, пид 461

-- возвраты
select S.*, S.rowid  --Домашний интернет, пид 348
  from WEB.FTTB_SUM_FEE S
  where (S.MSISDN in (989719230, 989719232)) and rownum = 1
  and S.START_DATE <= '01.07.2015' and S.END_DATE >= '31.07.2015';

select t.* , t.rowid  --Расчет начислений по лицевым счетам абонентов GSM и FIX (новый)
from web.ACCOUNTSUMCHARGE t

select t.*, t.rowid  -- контракт
from web.SUBSSUMCHARGE t

select H.*, H.rowid --PID 179, по телефону 989719233, проверка 3-х последних номеров на которые звонил абонент(web.has.IDENT_CHECK_CALLS)
from WEB.CallHistory H
  where H.MSISDN = substr(989719233,-9)
--пример даты:
select c.*, c.rowid       
  from INCOM.fileforproblem1097 c
  where (c.account = '3985436' or c.msisdn = '989719232')
    and c.recorddate >= to_char(add_months(trunc(sysdate,'mm'), -3), 'dd.mm.yyyy')  --'03.06.2015'--p_startperiod
    and c.recorddate < to_char(sysdate, 'dd.mm.yyyy') --'04.08.2015' --p_endperiod
    and c.DOCUMENTTYPEID in (1,2)

select card.*, card.rowid --0, null, connected  --case '56840001': #Интерфейс онлайн проверки возможности активации SIM-карт
from simcards card
inner join IVR.ivr_subscribers@helpdeskdb s ON s.msisdn = card.msisdn
inner join IVR.ivr_clients@helpdeskdb cli ON s.clnt_id = cli.clnt_id
where --account =  '3985436' and
icc in ('1111111111111111122', '1111111111111111113');

select t.*, t.rowid from WEB.DIRECTNUMBER t;  --пид 365, старый функционал
select t.*, t.rowid from INCOM.CLIENTSERVICES t  --пид 365(прямой номер), подключен, новый функционал
where msisdn = '989719232';
--- Выбранный прямой номер уже зарезервирован (HD)! Выберите другой номер ---
select t.*, t.rowid from DIRECTNUMBERGT t  --пид 365
--- ---

select t.*, t.rowid from INCOM.SUBSADDDETAIL t  --Проверка наличия запасной SIM-карты с неистекшим сроком активации, пид 1117
where t.ms like '%98971923%';
or
select t.*, t.rowid from INCOM.PP_GET_SERVICES_DETAILS t
where t.msisdn like '%98971923%';

select t.*, t.rowid from SUBS4PASS t;  --проверка количества подключений по паспорту

select t.*, t.rowid from INCOM.VERIFYSIMCHANGE t  --для интерфейса INCOM.CheckPossibilityExecFor172
where t.action = 41070401;

select t.*, t.rowid from PHYSASSCID t;  --номера ГД для PID 1092

