select t.*, t.rowid from VALERA.CONTRACT_MIGRATION_LIST t  --3.1.9 Проверка миграции номера телефона: определение по текущему месяцу

select t.*, t.rowid from VALERA.MAINTABLE t  --«Абонент не мигрировал с предоплатой формы в текущем месяце...»
where t.problemid = '469'
order by t.recordid desc

INCOM.CanCreateProblem3002  --Процедура проверки данных перед открытием для ProblemID=3002
INCOM.CommitProblem3002
select t.*, t.rowid from IVR.IVR_CLIENTS t  --ASOID
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '3'

select t.*, t.rowid from VALERA.PERMISSION_USER_PROFILES t
where t.userid in ('19692', '292') and t.id_permission_type = '84'  --«ДП – Зміна індивідуальних умов минулою датою»

INCOM.GetSubscriberInfo3002 --Процедура возвращает информацию об абоненте (для вставки в результирующую таблицу PID = 3002)
select t.*, t.rowid from IVR.DIR_RATE_PLANS t;  --справочник ТП
------------------------------------------------
select t.*, t.rowid from IVR.IVR_SUBSCRIBERS t  --ТП номера
where msisdn in ('989719230', '989719231', '989719232','989719233','989719234')
------------------------------------------------
select t.*, t.rowid from SELFCARE.SC_RATE_PLAN t  --по Billing_Name получаем RP_ID
where t.Billing_Name = to_char(116) or t.Billing_Name = to_char(351) or t.Billing_Name = to_char(383);
select t.*, t.rowid from Incom.TarifPlans t  --по RP_ID получаем имя ТП из справочника
where RTPLID in (96, 285, 310, 304);

INCOM.GetTPList_4  --Получение списка ТП
INCOM.GetASSC4Account3002  --Получение информации по объединению физ.лиц для PID 3002
INCOM.GetASSC4Account  --Получение данных объединения физ.лиц по ЛС
-------------------------------ASOID------------------------------------------
select t.*, t.rowid from web.ASSC4ACCOUNT t  --автоматическая подстановка Номер ГД
select t.*, t.rowid from web.PHYSASSCID t  --перевірки ASSC_ID(по названию), ASOID
select t.*, t.rowid from web.INDIVIDPACKSTOOKPO t  --ид наборов, пакетов, ASOID
select t.*, t.rowid from web.INDIVIDPACKS t  --название наборов, пакетов, ASOID
------------------------------------------------------------------------------

INCOM.GETGROUPAPPDETAILS3002_BY_LIST  --выделение номеров на форме 'Групповое заявление'
INCOM.GetSubsCurIndSet  --Получение индивидуального набора подключенного по номеру абонента
select  --общий запрос
        S.MSISDN
        ,P.Set_ID      as  Set_ID
        ,P.Set_Name    as  Set_Name
        ,P.Subs_ID
        ,P.rowid
      from INCOM.HD_Subs_CurIndSet P
     inner join INCOM.BIS_Ivr_Subscribers S on P.Subs_ID = S.Subs_ID
     --where S.MSISDN in (989719230, 989719231, 989719232, 989719233, 989719234);
select t.*, t.rowid from incom.bis_ivr_subscribers t  --SUBS_ID Инд.набора in (10010, 10020, 10030, 10040)
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833'  or t.clnt_id = '4073834';
select t.*, t.rowid from INCOM.HD_SUBS_CURINDSET t;  --список Инд.набор

INCOM.GetSubsCurPack  --Получение списка подключенных по номеру абонента пакетов и индивидуальных пакетов, не входящие в инд.набор
select t.*, t.rowid from INCOM.HD_SUBS_CURPACK t;  --инд.пакеты и пакеты

INCOM.CanChangeConditions    --Процедура проверки возможности создания заявки на смену условий (PID 3002)
INCOM.CanChangeConditions_2  --Процедура проверки возможности создания заявки на смену условий (PID 3002)
INCOM.InsProblem3002_2       --Внесение информации по обращению "Управление индивидуальными условиями" (PID = 3002)
select t.*, t.rowid from CHANGESUBSCONDITIONS t  --ASOID, стоимость смены условий по номеру
select t.*, t.rowid from PACKSCLOSE4RTPL t  --ASOID, список названий несовместимых с новыми условиями пакетов


--INCOM.GetStartDateValue возвращает ControlsMask - маска доступа к полям
--ControlsMask биты:
  0  - «Новый тарифный план»      -- группа элементов "Подключить" 
  1  - «Бесплатная смена ТП»      -- группа элементов "Подключить" 
  2  - «Индивидуальный набор»     -- группа элементов "Подключить" 
  3  - «Индивидуальные пакеты»    -- группа элементов "Подключить" 
  4  - «Индивидуальный набор»     -- группа элементов "Отключить" 
  5  - «Индивидуальные пакеты»    -- группа элементов "Отключить" 
  6  - «Пакеты»                   -- группа элементов "Отключить"

INCOM.VerifySubsCurConditions_2  --Процедура проверки текущих условий при добавлении абонента в результирующую таблицу (PID 3002)
INCOM.VerifyGroupNumbers_2  --Вызов проверки по групповым для ProblemID
INCOM.CanChangeConditions  --Процедура проверки возможности создания заявки на смену условий (PID 3002)

select S.Subs_ID  --получение Subs_ID
      from INCOM.Bis_Ivr_Subscribers S
     where S.MSISDN = '989719232'
       and S.Part = (select part from incom.Bis_Active_Partition);

select  --ASOID, список названий несовместимых с новыми условиями пакетов
                r.subs_id  as "SUBS_ID"                         
               ,r.rtpl_id  as "NEW_RTPL_ID"
               ,r.pack_id  as "PACK_ID"
               ,p.packname as "PACK_NAME"
               ,r.ind_pack as "IND_PACK"
  from web.PacksClose4RtPl r
  inner join web.IndividPacks p on p.packid = r.pack_id
  where r.subs_id = '10010'
  and r.rtpl_id = '285';

INCOM.GetGroupAppTree_2  --Процедура возвращает дерево "Объединения"
INCOM.CheckAbonentReregistration  --Процедура проверяет факт "Перерегистрации"
INCOM.GetProblem172Information  --Процедура выборки информации по обращению "Заявление на перерегистрацию"
--определение поведения элементов управления в зависимости от типа клиента:
select t.recordid, t.field2/*Старое название клиента*/, t.field3/*OldAccount*/, t.field14/*NewCustomerName*/, t.Field15/*NewAccount*/, t.field17/*Тип клиента*/, t.Field56/*NewOKPO*/, t.Field18/*GeneralAgreement->'111111'*/, t.Field21, t.Field22, t.rowid
from VALERA.APPLICATIONSINFOTABLE t
where t.recordid in ('5689566763');

INCOM.CheckAbonentReconnection  --Проверка факта повторного подключения после после развязывания
INCOM.IsGeneralAgreementAvailable  --проверка доступности поля Номера ГД и кнопки Проверить на форме 3002

