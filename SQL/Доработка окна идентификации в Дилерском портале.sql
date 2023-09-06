INCOM.GetAICheckTypesRestrict  --Процедура возвращает сводную таблицу типов проверок и ограничений для абонента

INCOM.GetAccountInfoFromWeb_5
INCOM.GetUnbindingInfo  --Процедура возвращает данные развязывания по номеру
select t.*, t.rowid from VALERA.DISCONNECTEDCUSTOMERSTABLE t;  --абонент развязан
select t.*, t.rowid from INCOM.BIS_IVR_CLIENT t  --incom.getsubscriberaccount НЕ возвращает значение, то это отключаемый абонент
where t.clnt_id in ('4073831','40738311');
select t.clnt_clnt_id, t.INN, t.rowid from incom.bis_ivr_jur_addresses t  --значение отсутствует или скрыто маской «ХХХХХХХХХХ»
where t.clnt_clnt_id in ('4073831', '4073832', '4073833');


INCOM.GenTmpPwd  --заглушка, которая будет отправлять http-запрос во внешнюю систему для генерации временного пароля
INCOM.VerifyTmpPwd  --заглушка, которая будет отправлять http-запрос во внешнюю систему для проверки временного пароля

INCOM.VERIFYINN  --Процедура проверяет ИНН корпоративного абонента
INCOM.GetAICheckTypes_2  --Процедура возвращает  все все типы проверок абонента
    select UC.CHECKTPID, CT.CHECKTYPENAME, UC.SUBSCRIBERTYPE, 1 as needallcheck
           from incom.AIUSERTYPETOCHECKTYPES UC, incom.AICHECKTYPES/*справочника с типами идентификаций дилеров*/ CT
    where  CT.CHECKTPID = UC.CHECKTPID
           order by UC.UTCTID;
select t.*, t.rowid from INCOM.AIUSERTYPETOCHECKTYPES t;  --назначение SUBSCRIBERTYPE-у тип проверки
INCOM.GetCoordinatorType  --Функция определяет тип номера координатора
select t.*, t.rowid from VALERA.CONTRACT_MIGRATION_LIST t;  --10; // координатор Припейд без регистрации
select t.*, t.rowid from INCOM.AICHECKTYPESTORESTRICTIONS t;  --сообщения на окне "Идентификация абонента"

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
  ctForeign                 = 21; // "Чужой" абонент
  ctBSSpostpaid             = 22; // абонент BSS Postpaid
