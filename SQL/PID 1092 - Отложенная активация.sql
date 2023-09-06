--VALERA.GetSegmentByOKPO
Valera.Get_Customer_Segment

INCOM.GetOutletCode --Определение кода торговой точки
INCOM.GetSalePoint ---Возвращает список торговых точек
Incom.Dealers
Incom.SalePoints


INCOM.GetTarifPlansForProblem1092_2 --Процедура выборки доступных тарифных планов
select t.*, t.rowid from INCOM.TARIFPLANSFORPROBLEM1092 t --ТП для пид 1092
--where t.rtplid = '285';
INCOM.GETINDIVIDPACKETS --Интерфейс "Список индивидуальных пакетов, доступных для абонента"
-- Список индивидуальных пакетов и наборов хранится в табличке web.IndividPacks. Наборы отличаются от пакетов полем ispacket:
select t.*, t.rowid from INDIVIDPACKS t  --название наборов, пакетов, ASOID
-- За ОКПО список пакетов и наборов закреплен через табличку web.IndividPacksToOKPO
select t.*, t.rowid from INDIVIDPACKSTOOKPO t  --ASOID, ид индивидуальных наборов и пакетов


--Справочник торговых точек и дилер
select t1.dealerid, t2.delr_id, t1.dealername as Наименование_дилера, t1.dealercode as Код_дилера,
t2.slpt_id as Идентификатор_торговой_точки, t2.slpt_code as Код_торговой_точки, t2.slpt_name as Наименование_торговой_точки
from INCOM.DEALERS t1
inner join incom.salepoints t2
on t1.dealerid=t2.delr_id
where t2.slpt_code = '44-502' or t2.slpt_code = '44-444'
-----
INCOM.GETCOORDINATOR2OKPO1092 --Процедура выборки информации по связке координатор - ОКПО
-----
INCOM.CANSIMACTIVATE --Не найдена сим-карта
--Для тестирования быд доработан эмулятор: 
- Проверка возможности подключить SIM карту (пункт ТЗ 4.1) происходит по табличке web.simcards: SIM карта должна быть в таблице иначе получим ошибку 'Некорректная заявка. Не найдена сим-карта.'
- При онлайн активации SIM-карты (пункт ТЗ 4.2) у карты в поле simcards.connected не должно быть Y, иначе эмулятор возвратит ошибку "Сим-карта уже активирована" 
- Список индивидуальных пакетов и наборов хранится в табличке web.IndividPacks. Наборы отличаются от пакетов полем ispacket
- За ОКПО список пакетов и наборов закреплен через табличку web.IndividPacksToOKPO. Можно добавлять убирать ракеты и наборы для отдельного ОКПО

--Для тестирования мной использовались номера телефонов:
- для юр лиц: 989719231, 989719232, 989719233
- для физлиц: 675505000,675505001,675505002
для тестирования юрлиц вводим ОКПО: 35363738 и жмем "Проверить возможность подключения" 
для физлиц: вводим любой паспорт, вводим ИНН: 2783800993. Просто паспорт ввести нельзя, так как в эмуляторе не реализованы итерфейсы, которые по паспорту находят лиц.счет (сейчас Incom.GetAccountByDopInfo всегда возвращает одно и то же при любых вх.параметрах), а значит не будет по паспорту находиться и ИНН

--да, нашел. просто у них есть ряд процедур, которые называются например так:
GetSubscriberCallsContract и GetSubscriberCallsContract_2
--я смотрел на то что ..._2
--а надо смотреть GetSubscriberCallsContract
--а там как раз условие - не показывать 1092

--Интерфейс "Список SIM-карт, подключенных по схеме «Отложенная активация»"
INCOM.GETDELAYEDACTSIM --Список SIM-карт, подключенных по схеме «Отложенная активация»
select t.*, t.rowid from REMACTSIM t --ASOID


--ЕД, пид 516, при сохранении. если заполнен идентификатор групповой АФ, то вызывается INCOM.GetGroupAppPhoneCount1092
-- если процедура возвратит количество > 0, то будет выдано сообщение "В групповой аппликационной форме указаны %d номеров абонентов. Сформировать по каждому номеру отдельное обращение?" 
-- сообщения о ошибках, которые описаны в п.2 возвращаются из процедуры INCOM.GetGroupAppPhoneCount1092.
select t.*, t.rowid from INCOM.APPLICATIONSADDITION t
where t.RecordID = 4724240376 and t.FieldName = 'CONTRACT_NUM'


--офлайн - это через табличку ivr.srv_applications
select t.*, t.rowid from IVR.SRV_APPLICATIONS t
where t.recordid = '4724240433'
--онлайн - это http запрос к bis
select * from incom.httprequestlog where recordid = '4724240433';

select t.*, t.rowid from VALERA.MAINTABLE t /*VALERA.MAINTABLE*/
where t.recordid = '4724240551'

--Менять ли статус дочерних при изменении статуса главного - за это отвечает 14-й бит в поле properties:
select problemid, US.Bitwise.GetBitByNumber(14,Properties) as CanChangeGroupStatus 
from VALERA.PROBLEMSTABLE where problemid in (1092,2610,2611);
--для 1092 - бит стоит, а значит когда после вставки нового 1092 его статус становится "Принят",
--то меняется все его дочерние. Сейчас именно для 1092 подкручу в клиенте


--INCOM.CreateASSC_2
BEGIN
  -- для тестирования черновиков
  if p_ZIP = 12345 or p_ZIP_D=12345 or p_ZIP = 12506 or p_ZIP_D=12506 or p_PASS_DATE = TO_DATE('13.11.1979', 'dd.mm.yyyy')
    then
    p_Error_Message := 'Динамический кеш не найден';
    p_Error_ID := 60020008;
    return;
  end if;
--INCOM.CreateAccountBis_2
BEGIN
  -- для тестирования черновиков
  if p_ZIP = 12345 or p_ZIP_D=12345 or p_ZIP = 12506 or p_ZIP_D=12506 or p_PASS_DATE = TO_DATE('13.11.1979', 'dd.mm.yyyy')
    then
    p_Error_Message := 'Неизвестная ошибка';
    p_Error_ID := 100;
    return;
  end if;

--пид 172, пере закрепление сим карты
select t.Field25, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where t.recordid = 4724241487

Incom.GETCOORDINATOR2OKPO1092 --Процедура выборки информации по связке координатор - ОКПО
select t.*, t.rowid from VALERA.DIR_COORD2OKPO t
where t.coordinatorid = '372450' and t.okpo  = '1111111111'
---
select t.*, t.rowid from VALERA.DIR_COORDINATORS t
where t.recordid = '372450' and t.msisdn  = '1111111111'
---
select t.*, t.rowid from INCOM.BIS_IVR_JUR_ADDRESSES t
where t.clnt_clnt_id = '6000020' and t.okpo  = '1111111111'
---
select t.*, t.rowid from INCOM.BIS_IVR_SUBSCRIBERS t
where t.clnt_id = '6000020' and t.msisdn = '1111111111'

