INCOM.GetSubsInfo4VisitCenterForDLR  --Процедура возвращает HTML-страницу с информацией об абоненте. Посдказки сотрудникам ИСЦ
INCOM.Getsubscrinfo4visitcenter_2  --Процедура возвращает HTML-страницу с информацией об абоненте. Посдказки сотрудникам ИСЦ
INCOM.DelOldFiles4Problem2715  --Удаление устраревших файлов-вложений в обращении 2715 (время создания более 3-х месяцев)

INCOM.UserIsDealer  --Является ли пользователь сотрудником дилера
incom.getaccountinfofromweb_5
--select t.* from SYS.DBA_USERS t --пользователи в базе

INCOM.GetDealers --Процедура выборки списка продавцов
INCOM.GetOutletCode --Определение кода торговой точки
INCOM.GetSalePoint --Возвращает список торговых точек
INCOM.GetDefaultSLPTID --функция-заглушка для вычисления идентификатора приоритетной торговой точки

INCOM.CreateUsersForDealer --Процедура создания диллера
INCOM.CreateSalePoints --Процедура создания торговой точки
INCOM.SynchDataBis --Процедура синхронизации дилеров и торговых точек
--таб. incom.dealers
--таб. INCOM.SALEPOINTS
--таб. VALERA.DEPARTMENTSTABLE

---якщо у полі IsExternalRole міститься 1, то роль - зовнішня, у противному випадку - внутрішня
select t.*, t.rowid from VALERA.PERMISSION_TYPE t
where t.id_permission_type =1 or t.id_permission_type =77 or t.id_permission_type =78;
---дилер---
select t.*, t.rowid from INCOM.DEALERS t
where  t.dealerid in (3484, 3844)
--t.dealercode in ('ALEX09', 'Дилер', '2939', '44-502', '44-444')
--ТТ--
select t.*, t.rowid from INCOM.SALEPOINTS t
where t.delr_id in (3484, 3844)
--or t.slpt_code in ('44-444', '44-502', '44-684', 'ST-1', 'ST-2') or t.department_id = '53'--department_id = 452 или 622 или 65

---Для користувача перевіряється існування ідентифікатора користувача у таблиці incom.salepoints
--Якщо такий існує, то користувач  - зовнішній
select t.*, t.rowid
from VALERA.DEPARTMENTSTABLE t
where t.departmentid = 66;
---
--Внешние роли \ профили (valera.v_idm_permission_types);
--Департаменты дилеров (valera.v_idm_departmenstable);
--Учетные записи сотрудников Дилера ( представления valera.v_idm_hd_users);
---
select t.*, t.rowid from VALERA.PERMISSION_TYPE t
where t.id_permission_type in (77, 78, 79)
--order by t.isexternaluser;
---
select t.*, t.rowid from VALERA.PERMISSION_ACTION t
where t.id_permission_action in (85, 86, 87, 88)
order by t.id_permission_action desc;
---
select t.*, t.rowid from VALERA.PERMISSION_USER_PROFILES t
where --t.userid = '19692' and 
t.id_permission_type in (77, 78, 79)
order by t.id_permission_type;
                                                 ---пользователи---
select userid, username, departmentid, userpost, email, phone, userip, programid, programversion, userlogin, userpassword, dateofaddingrecord, prepaidflag, canuserseeprepaidnumbers, canuseraddsupercomments, cancalctariffplans, cansee, supervisor_id, tariff_plan_calc, canseejockers, t.appcontent.getclobval() appcontent, login_id, user_type_id, realuserlogin, rowid
from VALERA.USERSTABLE t
--order by (userid) desc
--where t.userlogin like '%kyltest%' or t.realuserlogin like '%kyltest%'
where t.userid = '19692' or t.userid = '20160';
---
---основной id_permission_type для пользователя:
select t.*, t.rowid from VALERA.PERMISSION_USER t
where t.user_id = '20160' or t.user_id = '20136';
---
VALERA.PermissionUserProfiles_BEFORE --тригер для вставки в VALERA.PERMISSION_USER_PROFILES
--- --- --- --- --- --- --- --- ---
select t.*, t.rowid from INCOM.PROBLEMID4DEALERS t --Перечень обращений, разрешенных для использования дилерами
--where t.problemid = 1120
--order by t.problemid;
--- --- --- --- --- --- --- --- ---
--таблица с агентами
select t.*, t.rowid from VALERA.AGENTSTABLE t
where t.agentname =  'DL_IGORC_62';
---
-- Пропишем пользователю уровень доступа и номер СЗ на доступ
select t.*, t.rowid from VALERA.PERMISSION_USER t
order by t.user_id desc

select t.*, t.rowid from VALERA.PERMISSION_USER_PROFILES t
where t.userid = '20160' or t.userid = '20136'  --дилер1 or дилер2
--and (t.id_permission_type in (20, 47, 67, 33, 49)
order by t.id_permission_type

select t.*, t.rowid from VALERA.PERMISSION_TYPE_ACTION t
--where t.id_permission_type in (1,77,78)
where t.id_permission_action in (90, 91);
------------------------------
--3.	Необходимо исключить из интерфейсных представлений для IDM:
--3.1.	Внешние роли \ профили (valera.v_idm_permission_types);
select * from VALERA.V_IDM_PERMISSION_TYPES t
where t.ID_PERMISSION_TYPE in (77,78,79)
--3.2.	Департаменты дилеров (valera.v_idm_departmenstable);
select * from VALERA.V_IDM_DEPARTMENSTABLE t
where t.departmentid in (452, 622)
--3.3.	Учетные записи сотрудников Дилера ( представления valera.v_idm_hd_users);
select * from VALERA.V_IDM_HD_USERS t
where t.userid = 20118
order by t.userid desc
------------------------------
INCOM.IsCustomerPSTN
INCOM.IsCustomerHomeInet
------------------------------------------------------------------
--- идентификация абонентов: ---
--INCOM.IsNeedAbonentIdetification --Процедура проверяет нужна ли идентификация абонента
--INCOM.GetIsAbonentIdetificated --Процедура проверяет идентифицирован ли абонент
--- --- --- --- --- ---
incom.IsCustomerIdentFor_1092 --Процедура идентификации абонента для формы 1092
incom.VerifyAccountFor1092 --Процедура процедура проверки ЛС для формы 1092
------------------------------------------------------------------
select t.*, t.rowid from VALERA.MAINTABLE t
where t.recordid = '4724228155';
--
select t.*, t.rowid from VALERA.MEMOSINFOTABLE t
where t.recordid = '4724228155';
---
--INCOM.GetIdentCount --Процедура проверяет количество попыток идентифицировать абонента
select t.*, t.rowid from INCOM.LOGABONENTVALIDATE t
where t.subscriber like '%989719232%' and t.RECORD_DATE >= trunc(sysdate,'MM') --справочник
--INCOM.IsAbonentIdentInProgress --Процедура проверяет были ли по абоненту обращения "Без идентификации"
--INCOM.GetAICheckTypes --Процедура возвращает все типы проверок абонента
--INCOM.GetAICheckVariants: --Процедура возвращает сводную таблицу типов и проверок абонента
select t.*, t.rowid from INCOM.LOGABONENTVALIDATE t
where t.subscriber = '989719232'
--INCOM.GetCustomerEntity --Процедура возвращает тип абонента(Сараев А.В.)
--INCOM.IsCoordinatorByOKPO --Функция проверяент наличие координатора по ОКПО и паролю координатора
--INCOM.GetAccountInfoFromWeb_5 --Процедура возвращает информацию об абоненте по ЛС
---   ---   ---
select *  --6 бит--
 from valera.problemstable_new PR
 where PR.ISALLOWED = 1 and (pr.problemid = 1120 or pr.problemid = 1092)
 and US.Bitwise.GetBitByNumber(6, PR.Properties) = 0
 order by PR.PROBLEMID
---   ---   ---


---проверки идентификации:---
--INCOM.CHECKPASSPORTREGPRD --Процедура проверяет паспорт зарегистрированного припейда valera.PREPAIDINFORMATIONTABLE
select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t --справочник
---
--INCOM.CHECKAGREMENTDATE --Процедура проверяет дату подписания договора
select cl.contract_date, cl.rowid --справочник
  from INCOM.BIS_CMB_CLIENTS cl
  where cl.ACCOUNT = '3985436'
--INCOM.GETFIOREGPRD --Процедура возвращает ФИО зарегистрированного припейда valera.PREPAIDINFORMATIONTABLE
---2.	По зарегистрированному номеру телефона предоплаченной формы обслуживания (номер телефона есть в таблице VALERA.PREPAIDINFORMATIONTABLE)
select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t
--INCOM.CheckPersonalPassword --проверяет приватный пароль
--INCOM.CheckICC--Процедура проверки соответствия ICC и MSISDN
select t.*, t.rowid from WEB.SIMCARDS t --SIM (карта связанная с номером) или Оригинал носителя PIN, PUK
where t.msisdn like '%98971923%'
--Проверка «Номера, на которые абонент совершал звонки»
select t.*, t.rowid from WEB.CALLHISTORY t
where t.msisdn like '%98971923%'
--Проверка «Остаток средств»
select t.*, t.rowid from IVR.IVR_BALANCES t
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'

--INCOM.InforNotSuccessValidate: --Процедура информирования о наличии более 50 неуспешных попыток проверки абонента, отправка писем
select t.subscriber, count(t.subscriber) --неуспешных попыток
from INCOM.LOGABONENTVALIDATE t
where trunc(t.record_date) = trunc(sysdate) and t.result = 0
group by t.subscriber

select t.subscriber, count(t.subscriber) --Всего попыток
from INCOM.LOGABONENTVALIDATE t
where trunc(t.record_date) = trunc(sysdate) 
group by t.subscriber

--INCOM.VERIFYLASTCORPORDER --Процедура проверяет последний корпоративный счёт
--INCOM.CHECKAGREEMENTDATE --Процедура проверяет дату подписания договора
--INCOM.VERIFYFIOCorpSubscr --Процедура проверяет ФИО корпоративного абонента
--INCOM.VERIFYOKPO --Процедура проверяет ОКПО корпоративного абонента
--INCOM.CheckBalance --Процедура проверки баланса абонента на указанную дату с определенной точностью
--INCOM.VERIFYCOORDPASS --Процедура проверяет пароль координатора

--- 3.8.	Доработка универсальных обращений ---
select t.*, t.rowid from VALERA.PROBLEMSTABLE_new t where t.universalappealtypeid = '3' and t.connectiontype = '1'
and t.isallowed = '1' and t.problemid = '1549'

select t.*, t.rowid from VALERA.PROBLEMSTABLE_new t where t.universalappealtypeid = '4' and t.connectiontype = '1'
and t.isallowed = '1' and t.problemid = '1109'

select t.*, t.rowid from VALERA.PROBLEMSTABLE_new t where t.universalappealtypeid = '5' and t.connectiontype = '1'
and t.isallowed = '1' and t.problemid = '1540'
---VALERA.MAINTABLE
select t.recordid, t.recorddate, t.problemid, t.phonenumber, t.account, t.applicationstatus, t.username, t.rowid
from VALERA.MAINTABLE t
where t.recordid in (4724244199, 4724244200, 4724244201)
order by t.recordid desc
---incom.memorandumsaddition сохранение для универсальных типов: 3,4,5
select t.*, t.rowid from incom.memorandumsaddition t
where t.recordid in (4724244207, 4724244209, 4724244210)

---Список индивидуальных пакетов и наборов---
INCOM.GetTarifPlansForProblem1092_2 --Процедура выборки доступных тарифных планов
select t.*, t.rowid from INCOM.TARIFPLANSFORPROBLEM1092 t --ТП для пид 1092
--where t.rtplid = '285';
INCOM.GETINDIVIDPACKETS --Интерфейс "Список индивидуальных пакетов, доступных для абонента"
-- Список индивидуальных пакетов и наборов хранится в табличке web.IndividPacks. Наборы отличаются от пакетов полем ispacket:
select t.*, t.rowid from INDIVIDPACKS t
-- За ОКПО список пакетов и наборов закреплен через табличку web.IndividPacksToOKPO
select t.*, t.rowid from INDIVIDPACKSTOOKPO t --ASOID, индивидуальные наборы и пакеты
---

Incom.GETCOORDINATOR2OKPO1092: --координатор для пид 1092
select t.*, t.rowid from VALERA.DIR_COORD2OKPO t
where t.okpo = '2917155477'
---
select t.*, t.rowid from INCOM.BIS_IVR_JUR_ADDRESSES t

INCOM.VerifySegment469 --Процедура проверки соответствия сегмента для клиента для сотрудников Дилера

INCOM.VerifySimByDepartment --Проверка принадлежности SIM-карты к подразделению сотрудника
Incom.UserIsDealer --Является ли пользователь сотрудником дилера
select incom.userisdealer(&p_userid) from dual;

select t.recordid, t.recorddate, t.problemid, t.phonenumber, t.account, t.applicationstatus, t.username, t.rowid
from VALERA.MAINTABLE t
order by t.recordid desc

select t.recordid, t.field26, t.rowid
from VALERA.MEMOSINFOTABLE t
order by t.recordid desc

INCOM.GetSegments1092 --Процедура возвращает список сегментов для PID = 1092

INCOM.SendNoactiveDealersReport --Процедура отправки e-mail всем сотрудникам дилерам, у которых не было ни одной активной сессии

INCOM.SynchDataBis: --Процедура синхронизации дилеров и торговых точек
select t.*,t.rowid from incom.salepoints_test t order by t.slpt_id;
select t.*,t.rowid from bis.sale_point_histories t order by t.slpt_slpt_id;
select t.*,t.rowid from bis.sale_points t order by t.slpt_id;
select t.*,t.rowid from INCOM.DEPARTMENTSTABLE_TEST t;
INCOM.LockAccountUserDealers --Процедура блокирования всех сотрудников дилера спустя трое суток после закрытия дилера

--таб. логирования---
select t.*, t.rowid from INCOM.LOGCHANGESDEALERSPR t
order by t.record_id desc

--новое окна «История сообщений»:
select t.*, t.rowid from TURCHIN.POPUP_MESSAGE_TABLE t
where t.record_id in (82111660,82111661,82111662,82111663,82111664,82111665,82111666,82111667,82111668,82111669,82111670)
--t.validity_date > to_date('29.10.2015', 'dd.mm.yyyy') and t.validity_date < to_date('31.10.2015', 'dd.mm.yyyy')
and t.userlogin = 'DL_IGORC_62';

insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111661', 'DL_IGORC_62', '(*Trouble 487328 *)', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111662', 'DL_IGORC_62', '(*Trouble 487329 *)', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111663', 'DL_IGORC_62', '(*Trouble 487330 *)', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111664', 'DL_IGORC_62', '(*Trouble 487331 *)', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111665', 'DL_IGORC_62', '(*Trouble 487332 *)', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111660', 'DL_IGORC_62', '(*Trouble 487333 *)', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111666', 'DL_IGORC_62', '(*Message*)ФІЗИЧНА ОСОБА-ПІДПРИЄМЕЦЬ ЧЕВЕРДА ИГОРЬ АНАТОЛЬЕВИЧ {A2597456} С уважением, Дилер', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111667', 'DL_IGORC_62', '(*Message*)ФІЗИЧНА ОСОБА-ПІДПРИЄМЕЦЬ С уважением, Дилер2', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111668', 'DL_IGORC_62', '(*Message*)ОСОБА-ПІДПРИЄМЕЦЬ С уважением, Дилер3', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111669', 'DL_IGORC_62', '(*Message*)ЧЕВЕРДА ИГОРЬ АНАТОЛЬЕВИЧ {A2597456} С уважением, Дилер4', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111670', 'DL_IGORC_62', '(*Message*)С уважением, ALEX09', (sysdate+1));

update TURCHIN.POPUP_MESSAGE_TABLE t set t.validity_date = (sysdate+1)--t.userlogin = 'DL_IGORC_62'
where t.record_id in (82111660,82111661,82111662,82111663,82111664,82111665,82111666,82111667,82111668,82111669,82111670)
--t.validity_date > to_date('20.04.2015', 'dd.mm.yyyy') and t.validity_date < to_date('22.04.2015', 'dd.mm.yyyy');

INCOM.GetAccountByDopInfo --Получить ЛС по ОКПО или паспортным данным

INCOM.MovingSlptToNewDealer  --Процедура пере закрепления ТТ за новым дилером
