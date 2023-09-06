INCOM.GetProblem3282Information  --Процедура возвращает информацию по заявке на включение сертификата юр.лица
INCOM.GetASSCInfo_2  --Запрос информации по объединению 0-го уровня и ГКО
INCOM.GetPersonalAccount  --Получить "Персональный ЛС" созданный по услуге раздельные счета
INCOM.CanCreateProblem3282  --Процедура проверки данных перед открытием для ProblemID=3282
INCOM.GetPacketMobile  --Процедура возвращает данные для наполнения списка пакетов "Пакет SMS"  (форма PID = 3282)
INCOM.GetCoordPermissionRecordID  --Процедура возвращает идентификатор предварительной заявки-разрешения от координатора
select t.*, t.rowid from VALERA.MAINTABLE t  --v_RecordDate_391 > v_RecordDate_172 then заявка-разрешение считается не действительной
where (recordid = 5689575872 and t.problemid = '172')
or (recordid = 5689576821 and t.problemid = '391');

select t.*, t.rowid from VALERA.MEMOSINFOTABLE t  --предварительная заявка-разрешение от координатора
where recordid = 5689576821;

INCOM.GetActions3282  --Процедура возвращает значения для выпадающего списка "Действие":
select t.*, t.rowid from INCOM.SUBS_MOBILE t;  --Asoid, проверяем наличие у абонента ЛС Mobile
select t.*, t.rowid from PHONEPACKETS t;  --Asoid, определяем подключены ли пакеты SMSMobileID = 21865, 21866

--определяем статус услуги «MobileID» на номере:
--if v_MI_Account is null then
select E.*, E.rowid from US.EnumTypeValues E
where E.TyId = 20085 and E.TvValue = '1';
--else
select t.*, t.rowid from INCOM.CLIENTSERVICES t  --Asoid
where serv_id = 1600 or serv_id = 1601;

select                                           --закладка «Представитель юр. лица»
           A.Field41    as RepresentFIO
          ,A.Field42    as RepresentPassport
          ,A.Field28    as RepresentIDPassport
          ,A.Field36    as RepresentValidity
          ,A.Field43    as RepresentIssuedBy
          ,A.Field35    as RepresentPassportDate
          --,to_date((select FieldDisplayValue from Incom.ApplicationsAddition where RecordID = &v_RecordID and FieldName = 'RepresentBirthday' and rownum=1), 'dd.mm.yyyy')    as RepresentBirthday
          ,A.Field53    as RepresentSex
          ,A.Field50    /*as RepresentINN*/  --'XXXXXXXXXX' либо '2222222222'
          ,A.Field30    as RepresentDocument
          ,A.Field51    as POANumber
          --,to_date((select FieldDisplayValue from Incom.ApplicationsAddition where RecordID = &v_RecordID and FieldName = 'POADate' and rownum=1), 'dd.mm.yyyy')              as POADate
          ,A.rowid
from VALERA.APPLICATIONSINFOTABLE A
where A.recordid = 5689579752;

INCOM.GetAdditionalSIMInfo475  --Процедура получения списка ICC-кодов дополнительных SIM карт для PID = 475 (SIM-пара)
INCOM.InsProblem3283  --Процедура вставки обращения «Подключение услуги Mobile ID»
INCOM.GetPassportInfoByMSISDN  --Функция возвращает ФИО, серию и номер пасспорта по номеру абонента
INCOM.GetDebtsAccountsList  --Получить список ЛС с дебиторской задолженостью

select MT.RecordID, MT.RecordDate, nvl2(A.Field1, A.Field1, A.Field2) as Certificate
                  ,dense_rank() over(partition by MT.PhoneNumber order by MT.RecordID desc) as DenseRank
              from VALERA.Maintable MT
             inner join Valera.Applicationsinfotable A on MT.RecordID = A.RecordID
             where MT.PhoneNumber = '989719232'
              and MT.ProblemID = 3283
              and MT.ApplicationStatus not in ('Ошибочно');

select t.*, t.rowid from VALERA.MAINTABLE t
where recordid = 5689550480;
select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where recordid = 5689550480;

INCOM.IsSubscriberFOP  --Функция проверяет является ли номер телефона ФОП
