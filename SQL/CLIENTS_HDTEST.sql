/*--заглушено для внутреннего тестирования*/
INCOM.PROBLEMBYCUSTOMERTYPE  --дерево обращений ХД
INCOM.IsSWAP
INCOM.IsBSS  --Функция проверяет наличие признака BSS
INCOM.IsCustomerDBSS  --Функция проверяет принадлежность абонента к типу DBSS(p_PhoneNumber)
incom.IsAccountBSS
VALERA.Is_Customer_Prepaid
INCOM.IsCustomerB2B  --Функция проверяет принадлежность абонента к типу b2b (ю.о. или ф.о.+ корп.)
INCOM.IsAccountFMC  --Функция проверяет является ли ЛС - "ЛС FMC контракт (В2С)"
INCOM.IsSubscriberFMC  --Функция проверяет является ли абонент - "FMC контракт (В2С)"
INCOM.CheckFMCStatus  --Функция проверки статуса услуги FTTB на номере(дополнительно проверяем стутс услуги -- «Персональний интернет»)
INCOM.GetAccountFTTB_FMC  --Возвращает ЛС FTTB (FMC) (для формы PID = 172):
select t.*, t.rowid from INCOM.BIS_FMC_LINKPHONEBYACCOUNT_MMC t;
INCOM.GetFMCLinkPhoneByAccount  --Возвращает номер/ЛС FTTB (FMC)
select t.*, t.rowid from INCOM.BIS_FMC_LINKPHONEBYACCOUNT t;
INCOM.IsCustomerPSTN
INCOM.IsCustomerHomeInet
INCOM.CANCREATEPROBLEM  --Процедура общих проверок для всех заявлений
INCOM.CanCreateProblemUniversal  --Процедура проверки данных перед открытием для ProblemID
INCOM.CanCommitProblem  --Процедура общих проверок для всех обращений перед сохранением
INCOM.GetCustomerEntity_2  --Процедура возвращает тип абонента
INCOM.UpdAppStatus_3  --Процедура обновления статуса
INCOM.CreateASSC_2  --Запрос на создание объединения 0-го уровня и ГКО
INCOM.CREATEACCOUNTBIS_2  --Создание лицевого счета онлайн в BIS (Интерфейс I.GA.BIS.02)
INCOM.InsProblem1092_12
incom.getaccattributesfrombis_1092  --Процедура запрашивает в БИС и возвращает доп. атрибуты лицевого счета для обращения  (для PID = 1092)
Incom.ApplicationsAddition  -- таб. для пид 1092
INCOM.GetLanguageByAccount  --Процедура возвращает язык клиента
incom.getsiminfo  --Процедура получения информации о SIM карте
INCOM.IsEDOavailable  --Функция проверяет доступен ли флаг "ЭДО"

select t.*, t.rowid from VALERA.CONTRACT_MIGRATION_LIST t  --3.1.9  Проверка миграции номера телефона
---incom.getaccountinfofromweb_6---
select t.*, t.rowid from IVR.IVR_CLIENTS_PARTITION t
/*where t.clnt_id = '4378472' or t.clnt_id = '2613030'*/
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834' or t.clnt_id = '7777774'

select t.*, t.rowid from INCOM.BIS_CMB_CLIENTS t
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'

select t.*, t.rowid from INCOM.BIS_CMB_SUBS_SERVICES t /*тарифный план*/
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'

select t.*, t.rowid from IVR.IVR_SUBSCRIBERS t /*тарифный план, пид 1772*/
where msisdn like '98971923%';

select t.*, t.rowid from INCOM.BIS_IVR_CLIENT t /*RGSC_ID=9"ЛС без документов", PID1092, BRNC_ID 21 - PDF, pid 170=brnc_id between 1 and 7, ASSC_ID(объединение)*/
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'
or t.clnt_id = '6000001' or t.clnt_id = '6000002' or t.clnt_id = '6000003' or t.clnt_id = '6000004'
or t.assc_id = '1'  --тут назначается объединение(ASSC_ID)--

select t.*, t.rowid from INCOM.BIS_IVR_ASSOCIATIONS t --ГКО (главный клиент объединения)
where t.assc_id = '1' or t.assc_id = '2'

select t.*, t.rowid from incom.bis_ivr_subscribers t  /*тарифный план*/
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'
or t.clnt_id = '6000001' or t.clnt_id = '6000002' or t.clnt_id = '6000003' or t.clnt_id = '6000004'
or t.clnt_id = '4073834'

select t.*, t.rowid from incom.bis_ivr_jur_addresses t  --групповые по паспорту, значение отсутствует или скрыто маской «ХХХХХХХХХХ»
where t.clnt_clnt_id = '4073831' or t.clnt_clnt_id = '4073832' or t.clnt_clnt_id = '4073833' or t.clnt_clnt_id = '4073834'
or t.clnt_clnt_id = '6000001' or t.clnt_clnt_id = '6000002' or t.clnt_clnt_id = '6000003' or t.clnt_clnt_id = '6000004'
or t.clnt_clnt_id = '4073834'

select t.*, t.rowid from IVR.IVR_SUBSCRIBERS_PARTITION t  /*тарифный план, здесь менять*/
/*where t.msisdn = 675720208*/
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'
or t.msisdn = '670000312' or t.msisdn = '670000341'

select * from INCOM.TARIFPLANS t /*Тарифные планы*/
--where t.hdname like '%НЕОГРАНИЧЕННЫЙ%'
order by (t.hdname)

select t.*, t.rowid from IVR.DIR_RATE_PLANS t  --RTPL_ID клиента должен быть в справочнике

select t.*, t.rowid from incom.siebel_assignment t /*Сегмент ЛС*/
where t.OKPO = '35363738' or t.OKPO = '35363739'

-- курсор из incom.getaccountinfofromweb_6:
select t.*, t.rowid from IVR.IVR_JUR_ADDRESSES_PARTITION t
--where t.INN = '1234567822'
--where t.okpo = '38005157'
where t.clnt_clnt_id = '4073830' or t.clnt_clnt_id = '4073831' or t.clnt_clnt_id = '4073832' or t.clnt_clnt_id = '4073833'
or t.clnt_clnt_id = '4073834';

select * from VALERA.CUSTOMER_SEGMENTS t
where t.msisdn = '989719232';

VALERA.Is_Customer_Prepaid  --Функция определяет тип абонента
select t.*, t.rowid from VALERA.PREPAID_NUMBERS_RANGE t
where t.first_number like '6897%' or t.first_number like '9897%' or t.first_number like '6770%'
--'678000270' BETWEEN first_number and last_number AND rownum=1
--'676711434' BETWEEN first_number and last_number AND rownum=1
--'677280243' BETWEEN first_number and last_number AND rownum=1
select t.*, t.rowid from VALERA.CONTRACT_MIGRATION_LIST t;

select t.*, t.rowid from INCOM.BIS_ACTIVE_PARTITION t

select t.problemid, t.parentid, t.knowledgeaddress, t.rowid
from VALERA.PROBLEMSTABLE_new t /*VALERA.PROBLEMSTABLE_NEW*/
where t.knowledgeaddress not in 'null' and t.parentid = 167
order by t.parentid
--t.problemid = '1009'
--order by t.knowledgeaddress
/*where t.problemnamerus like '%Звонок%'*/

select t.*, t.rowid from VALERA.MAINTABLE t /*сохранение 523 обращения, по номеру: 675720208*/
--where t.problemid in (172, 182, 3102)
--where t.phonenumber = '671141411' and t.problemid = '2774'
--where t.recordid = '5689555016'
order by t.recordid desc
--select * from INCOM.MAINTABLEADDITION t where /*t.maintableaddid = '4724215551' and */t.recordid = '4724260841';
--select t.*, t.rowid from INCOM.APPLICATIONSADDITION t where t.recordid = 4724260841;
select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
order by t.recordid desc
where recordid = 5689555017;

select t.*, t.rowid from VALERA.PROBLEMSTABLE t
/*where t.fullproblemnamerus like '%Временное приостановление%'*/
/*where t.UNIVERSALAPPEALTYPEID = 1*/
where t.problemid = '987' and t.isallowed = '1'

Incom.VerifyProblem365_2  --Проверка статуса прямого номера
select t.*, t.rowid from INCOM.DIRECTNUMBERSLIST t /*прямой номер, пид 365, выбор номера при подключении, поменять статус на 0*/

/*Incom.GetInformationItems_2*/
select t.*, t.rowid from VALERA.PROBLEMSTABLE_new t
where t.problemid in ('516', '1092',/*'1134', '3048' , */'462', '961', '3179'), '3157', '3070', '180', '3014')
or t.problemid = '2818' or t.problemid = '1120' or t.problemid = '330' or t.problemid = '460' or t.problemid = '475'
where t.universalappealtypeid = '3' and t.connectiontype = '1'
and t.isallowed = '1' and t.problemid = '1549' or t.problemid = '1084'
 /*where t.universalappealtypeid = '5' and t.connectiontype = '1'
  and t.problemid = '1540'*/
   /*where t.universalappealtypeid = '4' and t.connectiontype = '1'
    and t.problemid = '1109'*/

select * from INCOM.MAINTABLEADDITION t /*id сохраненного группового обращения*/
where t.maintableaddid = '4724205049'

select t.*, t.rowid from VALERA.MAINTABLE t /*VALERA.MAINTABLE*/
where t.recordid = '5689605714' or t.recordid = '4724250326' or t.recordid = '4724250323'
 or t.recordid = '4724240536' or t.recordid = '4724240542'or t.recordid = '4724240543'

/*\*переливка данных*\
insert into incom.bis_ivr_jur_addresses
select * from ivr.ivr_jur_addresses_partition where clnt_clnt_id = '4073833'*/

INCOM.GetAccountInfoFromWeb_3
Incom.IsCustomerPSTN
INCOM.IsCustomerHomeInet

select * from INCOM.ERRORLOG t /*лог ошибок*/
--where t.errortext like '%vtVerifyCanCreateProblem%' and t.errordate >= '26.11.2013'
order by t.errorid desc

--INCOM.GETUNIVCLAIMCALLHISTORY --Получить данные для импорта в элемент "Таблица" универсальной жалобы из "Истории вызовов" легкого клиента
update incom.univclaimcallhistory set recorddate = sysdate+5; /*обновление данных таблицы*/
select t.*, t.rowid from INCOM.UNIVCLAIMCALLHISTORY t
where t.phonenumber in ('670000364', '670000341', '670000342', '670000343', 670000344, 670000345, '670000359', '989719232')
and t.userlogin = 'ALEX09'

--администратор м2м:
--INCOM.RegisterM2MAdmin
--INCOM.CheckM2MAdmin

--FUNCTION INCOM.IsContractPhoneActive
--Возвращает статус абонентов контрактной формы обслуживания(активен/нет)

--КС экспресс, ответ:
--INCOM.GlobalTroubleAuthorization_2
--INCOM.FeatureStatus4Answer
select t.*, t.rowid from US.ENUMTYPEVALUES t
where t.tyid = -140 and t.tvvalue = '9581' or t.tvvalue = '9582'
order by (t.tvid) desc

Incom.RegisterM2MAdmin --регистрация администратора м2м
incom.checkm2madmin --проверка администратора м2м

INCOM.GetASSCContract --запрос данных единого договора

INCOM.GetAddrType --Получение типа адреса. Возвращает: 1 - абон. ящик, 2 - с, 3 - обычный

INCOM.GetAccountInfoFromWeb_5 --Процедура возвращает информацию об абоненте по ЛС
INCOM.GetSubscriberInfoByWeb_4 --Процедура возвращает информацию об абонента по его номеру через ЛК

select t.*, t.rowid from VALERA.DIR_COORDINATORS t --координатор
where t.msisdn = '989719231' or t.msisdn = '989719232' or t.msisdn = '989719234'
select t.*, t.rowid from VALERA.DIR_COORD2OKPO t
select t.*, t.rowid from INCOM.COORDINATORACCESSLIST t

select t.*, t.rowid from INCOM.ADDRESSINFO t --сохраненная адресная инф.
order by(t.recordid) desc

INCOM.GetAddressTypeByPID --Процедура выборки списка доступных типов адресов для определенного PID
select t.*, t.rowid from INCOM.ADDRESSTYPEBYPID t --доступность типа адреса в зависимости от PID

--список обращений на базе УЗ:
select t.*, t.rowid from VALERA.PROBLEMSTABLE_NEW t
where coid = 10531

incom.getanymsisdnbyokpo --определение номера телефона, по знач. ОКПО

----------------------------------------------------------------------------------
select * from INCOM.ERRORLOG t
--where t.errortext like
--'%The number of items cannot be greater than 64, if the EditValueFormat is cvfInteger%'
--'%vtCaptionForm: Не удаётся выполнить эту операцию для закрытого набора данных (dataset)%'
--'%Причина: cdsData: Набор данных (Dataset) не в режиме редактирования или вставки%'
order by t.errordate desc;
----------------------------------------------------------------------------------
select * from valera.send_sms_table --отправка смс
order by sms_id desc
---
---выпадающий список "Сопровождение обращения"(активация закладки "Реакция компании")
select RP.PROBLEMID, RP.Resultid, RT.Resultname, RP.REACTIONID, R.REACTIONNAME, RP.rowid
        from Incom.ReactionByProblem RP
        inner join Incom.Reactions R on R.ReactionID = RP.ReactionID
        inner join INCOM.TalkResults RT on RT.Resultid = RP.Resultid
        where RP.ProblemID = '2562';
---
select t.*, t.rowid from TURCHIN.TROUBLE_LIST_TABLE t --событие
order by t.trouble_id desc

--ID Bis по ID HD для элементов адреса
select INCOM.GetAddrParamBISID('district', 4088) from dual  --4647003
select INCOM.GetAddrParamBISID('region', 2682) from dual  --6
select INCOM.GetAddrParamBISID('city', 124556) from dual  --727
select INCOM.GetAddrParamBISID('street', 584629) from dual  --18096296
select INCOM.GetAddrParamBISID('zip', 19059) from dual  --17404

---Возвраты---
select --доступность корректировки для пид 348
      cast(case when (substr(TLT.PROBLEM_NAME,1,35) = 'Отсутствует связь с оборудованием (' or instr(tlt.problem_name,'is not reachable')> 0) and decode(TLT.ServiceList, '311;', 1, 0) =1 then 1 else 0 end   as number)         as AutoTrouble
      ,cast(decode(TLT.ServiceList, '311;', 1, 0) as number) as NetworkTrouble -- 1 - сетевая авария
 from TURCHIN.Trouble_List_Table TLT
where TLT.Trouble_Id = '487303'

select t.*, t.rowid from TURCHIN.TROUBLE_LIST_TABLE t --событие
where t.trouble_id = '487303'
order by t.trouble_id desc

select ANSWERTEXT, rowid --if v_Answer in ('Возврат по технической жалобе', 'Возврат по сервисной жалобе')
 from Incom.UniversalClaimAdditionInfo
  where recordid = '4724228081' and QID = 6560;

select t.*, t.rowid from INCOM.REFUNDREGISTRY t --сох.возврат
order by t.registryid desc

--Для определения сегмента - VALERA.Get_Customer_Segment
select VALERA.Get_Customer_Segment('989719234',0) from dual --для телеф.
select VALERA.Get_Customer_Segment('3985438',1) from dual --для ЛС.

select t.*, t.rowid from STARCLUB.STCDISCOUNT t  --проверка в системе СТАРКЛУБ

select t.*, t.rowid from INCOM.DIRECTNUMBERSLIST t --для подключения статус должен быть равен 0
where t.msisdn like '%98971923%'

Valera.Get_Customer_Segment --определение сегмента
INCOM.GetControlsForProblem179: --Процедура возвращает флагт доступности полей идентификации абонента
select t.*, t.rowid from INCOM.AICHECKTYPES t
select t.*, t.rowid from INCOM.CONTROLSFORPROBLEM179_NEW t
Incom.GetIdentificationType  --Процедура процедура возращает тип проверки пройденый по номеру

update INCOM.VIRTUALMSISDN t set t.apprecordid = null --для сохранения пид 1142
where t.msisdn = '989719232';
select t.*, t.rowid from INCOM.VIRTUALMSISDN t; --просмотр

INCOM.GetInformFieldsAnswer  --Процедура возвращает ответ для информационного поля
incom.getinformfieldsanswer_1252  --Процедура возвращает результат проверки покрытия сети
select t.*, t.rowid from INCOM.ALARMS_TEST t  --РЕЗУЛЬТАТ ПРОВЕРКИ НАЛИЧИЯ ПРОБЛЕМ СЕТИ 3G

--INCOM.IsCustomerFMC  --Функция проверяет подключена ли абоненту услуга FMC (Fixed Mobile Convergence)
select t.*, t.rowid from INCOM.BIS_FMC_LINKPHONEBYACCOUNT t;
--if (upper(v_ClntType) = 'PSTN' and v_RegistrCat in (5, 6)) and  v_ClntClassID = 51 then
--return 1;

select t.*, t.rowid from INCOM.PROBLEMBYCUSTOMERTYPE t  --используется при построении дерева в ХД

select Incom.GetCustomerEntity(null, 989719232)  --1 'Физическое лицо', 2 'Юридическое лицо'
from dual;

-- DEBUG
  if SYS_CONTEXT ('USERENV', 'SESSION_USER') = 'SYS' then
    INCOM.SETCONTEXTFORUSER('DL_HDUSER');
  end if;
-- END DEBUG

--insert into INCOM.BIS_IVR_SUBSCRIBERS(
select '50' || trunc(DBMS_RANDOM.VALUE(1000000, 9999999)) msisdn,
          t.subs_id,
          t.clnt_id,
          t.rtpl_id,
          t.sbst_id,
          t.sdate,
          t.pers_clnt_id,
          t.activation_date,
          t.stnd_id,
          t.status_date,
          (select part from incom.bis_active_partition) part,
          t.ncls_ncls_id,
          t.def
     from INCOM.BIS_IVR_SUBSCRIBERS t
     join INCOM.BIS_IVR_SUBSCRIBERS s
       on 1 = 1
    where t.msisdn = '989719234'
      and rownum < 501--)

