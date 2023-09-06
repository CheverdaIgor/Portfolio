INCOM.IsEnabledGenAg1092  --доступность и обязательность поля "Номер ГД"
INCOM.VerifyGenAgreement1092  --Проверка номера ГД для PID 1092
INCOM.GETINDIVIDPACKETS_2  --Интерфейс "Список индивидуальных пакетов, доступных для абонента"
INCOM.GETINDIVIDSETS_2  -- Интерфейс "Список индивидуальных наборов, доступных для абонента"
INCOM.CanCommitProblem1092_3  --Процедура проверки данных перед сохранением для ProblemID 1092
INCOM.GetGroupAppTree_2  --Процедура возвращает дерево объединения
INCOM.GetGroupAppDetails_5  --Процедура возвращает список детализации
INCOM.CanEditGroupDetails  --Процедура определяет можено ли редактировать таблицу детализации:
select t.problemid, t.properties, t.rowid from VALERA.PROBLEMSTABLE t
where problemid = 1092 or problemid = 172 --73857

select t.*, t.rowid from INCOM.TARIFFSFORSAVE t  --Доп. в список выводятся не публичные тарифные планы, таблица INCOM.TARIFFSFORSAVE. Пример отбора ТП см. процедура INCOM.GetTariffsForSave
where rtplid = 398;

select t.*, t.rowid from PHYSASSCID t  --перевірки ASSC_ID, ASOID--

-- Список индивидуальных пакетов и наборов хранится в табличке web.IndividPacks. Наборы отличаются от пакетов полем ispacket:
select t.*, t.rowid from INDIVIDPACKS t

select t.*, t.rowid from INDIVIDPACKSTOOKPO t  --набор, пакет, ASOID
where okpo = '35363738' or okpo = '2917155477';

select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where recordid = 4724256620 --пид 172, field5-ЛС, field56-ОКПО
 or recordid = 4724250546 --пид 175, field9-ЛС, field56-ОКПО
 or recordid = 4724256283 --пид 469, field56-ЛС, field40-ОКПО
 or recordid = 4724253326 --пид 1125, field63-ЛС, field62-ОКПО, телефон нужно через VALERA.MAINTABLE
 
INCOM.VerifyICC_2  --Процедура проверки корректности ICC номера
INCOM.GetMSISDNByICC  --Получения номер телефона по коду SIM-карты ICC
Incom.VerifySimByDepartment_2  --Проверка принадлежности SIM-карты к подразделению сотрудника
INCOM.CANSIMACTIVATE  --Интерфейс онлайн проверки возможности активации SIM-карт
INCOM.GETLASTMSISDNFORGROUPAPP  --Предназначена для получения данных по лицевым счетам и номерам телефонов, которые созданы сегодня, для добавления на форму Групповых заявлений

select t.*, t.rowid from UNIONLEVEL0 t  --ASOID, ASSC_ID(физ.лицо)
where clnt_clnt_id = '4073833'

--Incom.GetBASESERVICES  --Процедура возвращает список базовых услуг
select t.*, t.rowid from INCOM.BASESERVICES t

INCOM.GetASSC4Account1092  --Получение информации по объединению физ.лиц для PID 1092
select t.*, t.rowid from ASSC4ACCOUNT t  --ASSCID для физ.лиц

INCOM.DeferredActivation1092_3  --Обработка обращения pid1092 по схеме "Отложенная активация"
select *
      from Incom.ApplicationsAddition
     where RecordID in (5689565789), 5689564068, 5689564070)
       and FieldName in ('RESTORENUMBER', 'ONLINEACTIVATION');

INCOM.CheckAddedPhoneNumber  --Процедура проверок при добавлении номера в таблицу (PID 1092)
select t.*, t.rowid from VALERA.DISCONNECTEDCUSTOMERSTABLE t;  --абонент развязан

/*НЕ ДЛЯ АБОНЕНТА! Номер ЕДРПОУ в черном списке СБ!!! В подключении новых телефонных номеров данному клиенту отказано.
Для ответа клиенту, пожалуйста, используйте рекомендации опубликованные в InfoStar (RS1007).Закрыть сообщение?*/
select t.*, t.rowid from INCOM.FINDSPRFRAUD t;  --ASOID

INCOM.GetAccountByDopInfo  --Получить ЛС по ОКПО или паспортным данным
INCOM.GetDefaultSLPTID  --определение кода приоритетной торговой точки - необходимо добавить код для вычисления
