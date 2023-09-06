INCOM.GetAICheckTypes_3  --Процедура возвращает  все все типы проверок абонента
INCOM.GetIsAbonentIdetificated  --Процедура проверяет идентифицирован ли абонент
INCOM.GetIsCoordinatorIdetificated  --Процедура проверяет идентифицирован ли координатор
incom.DiiaGetResponses  --Процедура отримання списку попередніх результатів ідентифікації Дія, або старту нового сеансу

INCOM.DiiaRequestShare  --Процедура відправляє запит в ДІЯ з кодом, введеним на формі
INCOM.DiiaCheckResponse  --Процедура викликається клієнтським застосунком на періодичній основі під час відображення користувачу вікна
select t.*, t.rowid from INCOM.DIIAABONENTINFO t
order by t.requestid desc;

--координатор:
INCOM.DiiaCheckCoordFIO  --Процедура перевіряє П.І.Б. координатора
INCOM.VerifyCoordPassport  --Процедура проверяет номер паспорт координатора
--физ.лицо:
INCOM.VERIFYPasportCorpSubscr  --Процедура проверяет паспорт корпоративного абонента
INCOM.VERIFYFIOCorpSubscr  --Процедура проверяет ФИО корпоративного абонента
INCOM.VERIFYINN  --Процедура проверяет ИНН корпоративного абонента

declare
  id varchar2(50);
  result number;
  message varchar(250);
begin
  select to_char(max(requestId)) into id from INCOM.DIIAABONENTINFO;
  INCOM.SaveDiiaDataFromApiLayer(
    p_RequestId => id,
    p_Type => 'internalPassport',  --«ID-карта»
    --p_Type => 'foreignPassport',  --«Заграничный паспорт»
    --p_Type => 'driveLicense',  --«Водительское удостоверение»
    p_LastNameUA => 'COORDINATOR - клон_2',  --телефон=989719232: UserType = 8 - координатор
    --p_LastNameUA => 'Клиент 3985435 - ПРИВАТНЕ ПІДПРИЄМСТВО "MIRATECH" ЧЕВЕРДА ИГОРЬ - 33',  --телефон=989719231: UserType = 3 - физ.лицо
    --p_LastNameUA => 'Клиент 35363738 - ПРИВАТНЕ ПІДПРИЄМСТВО "MIRATECH" ЧЕВЕРДА ИГОРЬ',  --телефон=989719234: UserType = 9 - физ.лицо
    --p_LastNameUA => 'COORDINATOR - клон',  --телефон=989719234: UserType = 9 - координатор
    --p_FirstNameUA => 'ЧЕВЕРДА',
    --p_MiddleNameUA => 'ИГОРЬ',
    p_Birthday => '29.08.1976',  --«Заграничный паспорт»/«Водительское удостоверение»
    p_TaxpayerNumber => '2800000000',
    p_DocNumber => '111111111',
    p_Result => result,
    p_MessageText => message
  );
  if (result = 0) then
    DBMS_OUTPUT.PUT_LINE(message);
  end if;
end;

/*Add comments to the columns 
comment on column INCOM.AIUSERTYPETOCHECKTYPES.SUBSCRIBERTYPE
//типы абонентов
  ctNone = 0;             // не определён
  ctPrepaid = 1;          // обычный припейд
  ctPrepaidWithReg = 2;   //  припейд с регитрацией
  ctContractFiz = 3;      // контракт физ лицо без коорд
  ctContractUR = 4;       // контрактник ЮР лицо без координатора
  csContractURCoord = 5;  //контракт с юр. лицо с коорд.
  csCoord = 6;            //Kоординатор.
  csHomeInet = 7;         //Домашний инет;
  csCoordContractUR = 8;  // координатор контракт юр.
  csCoordContractFIZ = 9; // координатор контракт физ.
  csCoordPrepaid = 10;    // координатор Припейд без регистрации
  csCoordPrepaidWithReg     = 11; //координатор Припейд с регистрацией
  csCoordOutOperator        = 12; //координатор номер из другого оператора (не КС)
  ctContractFizUnbinded     = 13; // контракт физ лицо без коорд - до развязывания
  ctContractURUnbinded      = 14; // контрактник ЮР лицо без координатора - до развязывания
  ctContractURCoordUnbinded = 15; // контракт с юр. лицо с коорд. - до развязывания
  csFMCContract             = 16; // FMC контракт (В2С)
  csWithoutDocs             = 17; // Тип подключения - без документов
  ctDBSS                    = 18; // абонент DBSS(incom.iscustomerdbss, VALERA.Is_Customer_Prepaid = 10)
  ctPrepaidWithReginDMP     = 19; // припейд с регистрацией в DMP
  ctUndocument              = 20; // Юр. лицо без документов
  ctForeign                 = 21; // "Чужой" абонент*/

declare
  id varchar2(50);
  result number;
  message varchar(250);
begin
  select to_char(max(requestId)) into id from INCOM.DIIAABONENTINFO;
  INCOM.SaveDiiaDataFromApiLayer(
    p_RequestId => id,
    p_Type => 'internalPassport',  --«ID-карта»
    --p_Type => 'foreignPassport',  --«Заграничный паспорт»
    --p_Type => 'driveLicense',  --«Водительское удостоверение»
    --p_SerialNumber => '111111112', -- Серійний номер (посвідчення водія)
    --p_SerialNumber => 'FF123456', -- Серійний номер (посвідчення водія)
    p_DocNumber => '111111111',
    p_DepartmentUA  => 'Ким видано документ (укр.)',
    p_ExpirationDate  => '01.01.2027',
    --p_IssueDate  => '01.01.2020',  --на форме разные поля: «ID-карта» либо «Заграничный паспорт»
    --p_CreationDate  => '02.02.2020',  --«Водительское удостоверение»
    p_GenderUA  => 'М',
    p_ResidenceUA  => '12505, Житомирська область, Коростишів, Коростишівський, ДІЯ, 118-А, 11',
    p_LastNameUA => 'ФІЗИЧНА ОСОБА-ПІДПРИЄМЕЦЬ ЧЕВЕРДА',  --телефон=989719231: UserType = 3 - физ.лицо
    --p_LastNameUA => 'driveLicense',
    p_FirstNameUA => 'ИГОРЬ',
    p_MiddleNameUA => 'АНАТОЛЬЕВИЧ',
    p_Birthday => '29.08.1976',
    p_TaxpayerNumber => '2800000000',
    p_Result => result,
    p_MessageText => message
  );
  if (result = 0) then
    DBMS_OUTPUT.PUT_LINE(message);
  end if;
end;
