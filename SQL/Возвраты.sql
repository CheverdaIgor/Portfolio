INCOM.GetRefundScenarioType_2
INCOM.GetRefundApplicationType:
select *
from incom.UniversalApplicationType
---
select t.*, t.rowid  --Причина лояльности, справочник со значениями
 from US.EnumTypeValues t where t.TYID = 10257;
select t.*, t.rowid from INCOM.LOYALTYREASONS t  --Причина лояльности, настройки значений для конкретного пид
where t.problemid in '2958'
---
select t.*, t.rowid from INCOM.ProblemTaxValue t where t.problemid in ('2958')  --значение налога, настройки значений для конкретного пид


incom.insrefundregistry_4:  --Внесение записи в реестр возвратов средств
select t.*, t.rowid from INCOM.MONEYREFUNDPARAMS t
---
incom.getrefundstatus --Получение статуса текущего возврата
---
select t.*, t.rowid from US.ENUMTYPEVALUES t
where t.TYID = '10257'
---
select ANSWERTEXT, rowid from Incom.UniversalClaimAdditionInfo where recordid = '4724228081' and QID = 6560;
      if v_Answer in ('Возврат по технической жалобе', 'Возврат по сервисной жалобе')
--- --- ---INCOM.RefundRegistry--- --- ---
select R.*, R.rowid from INCOM.RefundRegistry R
order by R.registryid desc
--- --- --- --- --- --- --- --- --- --- ---
select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
order by t.recordid desc
--- --- --- --- --- --- --- --- --- --- ---
--TURCHIN.TICKETINGTABLE.NOTE
select t.recordid, t.action, t.variant, t.problemstatus, t.externalid, t.uniq_id, t.rowid
from TURCHIN.TICKETINGTABLE t
--where t.recordid = 4724231285
order by t.uniq_id desc
--- --- --- --- --- --- --- --- --- --- ---
--  TicketStatusCC = 0; // принято
--  TicketStatusOrdinal = 1; // обрабатывается
--  TicketStatusClosed = 2; // закрыто
--  TicketStatusDefferedProcess = 3; // отложенная обработка
--  TicketStatusApproveWaiting = 4; // ожидание подверждения
--- --- --- --- --- --- --- --- --- --- ---
INCOM.GetRefundExpert_5
INCOM.IncludePIDInRefund

--возвращаемый параметр  p_Final (1- сумма окончательная, 0 - предварительная)
INCOM.GetRefundSum_2 --Процедура расчета суммы возврата за указанный период
INCOM.CanCommitProblem348_2
INCOM.VerifyRefundSum_2
INCOM.InsProblem348_8

INCOM.GlobalTroubleMonitoring_2
INCOM.GlobalTroubleFinalCalc

INCOM.InsProblem1020_2:
select BIG_FIELD1 from Valera.MemosInfoTable where RecordID = '4724227747'
---

INCOM.GetRefundCalcEnabled  --автоматический расчет суммы возврата для ДИ
INCOM.IsClaimRefundAvailable_2  --доступность возврата
select t.*, t.rowid  ----------Перечень PID для возврата, выпадаючий список----------
 from US.EnumTypeValues t
  where t.TYID = 20013 and t.TVValue = &p_ProblemID and rownum = 1;
-------------------------------------------------------------------------------------
---
INCOM.Confirmation4LevelInfo: --Процедура информирования о наличии заявок 4-го уровня подтверждения
select userid, username, departmentid, userpost, email, phone, userip, programid, programversion, userlogin, userpassword, dateofaddingrecord, prepaidflag, canuserseeprepaidnumbers, canuseraddsupercomments, cancalctariffplans, cansee, supervisor_id, tariff_plan_calc, canseejockers, t.appcontent.getclobval() appcontent, login_id, user_type_id, realuserlogin, rowid from VALERA.USERSTABLE t
where userid = '323'
---
select t.*, t.rowid from INCOM.REFUNDREGISTRY t
where t.recordid = '4724211645' and t.registryid = '4268370'
---
select t.*, t.rowid from INCOM.USERPROFILEBYAPPEALTYPE t  --раздача прав для возврата
INCOM.IsPermissionEnabled --доступность в выпадающем списке значения 'Возврат средств'
INCOM.GetProfileByGroupID --Функция возвращает идентификатор профиля для определенных StepID, ScenarioType
---
incom.email

--Процедура расчета календаря проблемных дней (PID = 348 для FTTB):
INCOM.CalcTroubleDays
--Процедура возврата данных для построения календаря проблемных дней и расчет суммы начислений (PID = 348 для FTTB):
INCOM.GetCalcTroubleDays_3 --основная процедура расчета корректировки в пид 348
--Процедура проверки возможности перехода в режим корректировки (PID = 348 для FTTB):
INCOM.VerifyCorrectionMode
--Получить список идентификаторов абонентов (для ЛС с типом PSTN):
INCOM.GetAbonentIDByAccount


INCOM.IsCustomerPSTN
INCOM.IsCustomerHomeInet

VALERA.Is_Customer_Prepaid
Incom.Getabonentidbyaccount


select FIRST_VALUE(ID_PERMISSION_TYPE) OVER (ORDER BY ID_PERMISSION_TYPE ASC)
     from valera.PERMISSION_USER_PROFILES
     where UserID = '292' and ID_PERMISSION_TYPE in (33, --ДП-Підтвердження повернення коштів 1-го рівня для письмових звернень
                                     49)

--- эти 3 по УЖ:
INCOM.GetSumLimitVKKKResidue
INCOM.GetSumLimitExceptionsResidue
INCOM.GetSumLimitCTOResidue

--- репортер:
HDREPORTER.GetRefundAppeals_5
INCOM.UpdRefundRegistry_3
---
INCOM.GetStorageFilesList
HDREPORTER.GetProblems1020_2

update 
incom.refundregistry 
set status = 1
where 
REGISTRYID in (
 4269544
,4269542
,4269538
,4269537
,4269536
,4269531
,4269530);
Commit;

select t.*, t.rowid
from INCOM.REFUNDREGISTRY t
where --t.CUSTOMERTYPE = 5 and t.Status = 1 and t.ScenarioType = 1
--order by t.registryid desc
--and
 t.REGISTRYID in (
4269544
,4269543
,4269542
,4269538
,4269537
,4269536
,4269531
,4269530
,4269525 --закладка 4-уровня, статус 10
,4269581 --закладка 4-уровня, статус 10
) order by t.status

--- ---
  if v_Account is null then
    if VALERA.Is_Customer_Prepaid(v_MSISDN) = 0 then
      v_CustomerType := 0;
    else
      v_CustomerType := 1;
    end if;
  else
    if INCOM.IsCustomerPSTN(v_Account) = 0 then
      v_CustomerType := 7;
    elsif INCOM.IsCustomerHomeInet(v_Account) = 1 then
      v_CustomerType := 5;
    else
      v_CustomerType := 6;
    end if;
  end if;
--- ---

select t.*, t.rowid from TURCHIN.TROUBLE_LIST_TABLE t
where t.trouble_id = '487315' --событие для тестирования пид 348

--экшены для возвратов, связка:
--33 ДП-Підтвердження повернення коштів 1 рівня для письмових звернень 57 Підтвердження повернення коштів 1 рівня для письмових звернень
--34 ДП-Підтвердження повернення коштів 2 рівня для письмових звернень 58 Підтвердження повернення коштів 2 рівня для письмових звернень
--35 ДП-Підтвердження повернення коштів 3 рівня для письмових звернень 59 Підтвердження повернення коштів 3 рівня для письмових звернень
--57 ДП-Підтвердження повернення коштів 1 рівня для усних звернень 60 Подтверждение возврата средств 1-го уровня по устным обращениям
--58 ДП-Підтвердження повернення коштів 2 рівня для усних звернень 61 Подтверждение возврата средств 2-го уровня по устным обращениям
--76 ДП-Підтвердження повернення коштів 4 рівня для письмових звернень 78 Підтвердження повернення коштів 4 рівня для письмових звернень
select t.*, t.rowid from VALERA.PERMISSION_TYPE_ACTION t
where --t.id_permission_type = '76' or
t.id_permission_action in (57, 58, 59, 60, 61, 78)
order by t.id_permission_action;

--статус обработки обращения:
0-ожидание первого подтверждения;
1-прошло первое подтверждение;
2-отклонено первое подтверждение;
3-прошло второе подтверждение;
4-отклонено второе подтверждение;
5-Передано на авторизацию (PID = 348);
6-Авторизована (PID = 348);
7-Отклонена (PID = 348);
8-Ожидает закрытия ГА (PID = 348);
9-ожидает перерасчета (PID=348);
10-ожидает дополнительного подтверждения

