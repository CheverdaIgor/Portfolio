INCOM.CanCreateProblem2818  --Процедура проверки данных перед открытием для ProblemID=2818

incom.getpreliminaryapps --Процедура возвращает список предварительных заявок
--AddMessage(0, 'По указанному номеру телефона нет предварительно поданной заявки');
select t.*, t.rowid from VALERA.MAINTABLE t
where t.problemid in ('2774');
  select t.*, t.rowid from VALERA.MEMOSINFOTABLE t
  where t.recordid in ('4724249219', '4724249220');

INCOM.GetASSCInfo_2 --Запрос информации по объединению 0-го уровня и ГКО
WEB.HAS.GetUnionLevel0 --Asoid
select * from unionlevel0 where OKPO = '35363738'; --Asoid

--AddMessage(0, 'Заявление разрешено принимать только по лицевым счетам абонентов услуги Домашний интернет');
select incom.iscustomerhomeinet('3985435') from dual;
  select t.*, t.rowid from INCOM.BIS_IVR_CLIENT t
  where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834' or t.clnt_id = '6000001';

--AddMessage(0, 'У абонента установлена финансовая блокировка, миграция не может быть выполнена');
select t.*, t.rowid from INCOM.CLIENTSERVICES t --Asoid
where t.msisdn like '%98971923%' or t.serv_id = '4070';

--Невидимо в дереве обращений для сотрудников СС и дилеров.
select incom.isusercoa(19692) from dual;
  select count(*)
  from VALERA.Permission_User pu
  where pu.User_ID = '19692' and pu.ID_Permission_Type = 20;

INCOM.GetDeliveryModesByProblem_4 --Возвращает данные доставки для проблем ид
INCOM.GetPreliminaryApps --Процедура возвращает список предварительных заявок
INCOM.GetUnivProblemListParam --Возврат справочников универсального заявления
INCOM.GetXMLInfoFor2818 --Процедура возвращает данные из предварительно поданой заявки для PID = 2818

select * from selfcare.sc_rate_plan t where t.billing_name = '1186';  --выпадаюший список ТП
select t.*, t.rowid from SELFCARE.SC_FEATURE_PARAM t where t.Action_ID ='52230003' and t.rp_id=669 and t.param_id=1;  --выпадаюший список ТП

INCOM.GetDeliveryModesByProblem --Возвращает данные доставки для проблем ид
