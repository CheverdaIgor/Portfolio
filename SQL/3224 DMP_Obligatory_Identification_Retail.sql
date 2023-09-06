select t.*, t.rowid from VALERA.CUSTOMERINFORMATIONTABLE t;  --запись с информацией по каждому номеру телефона
select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t;  --запись с информацией по номеру телефона
select t.*, t.rowid from VALERA.FTTB_INFORMATIONTABLE t;  --запись с информацией по лицевому счету ДИ

incom.DMP  ---package body

INCOM.SendSMS2  --Функция отправки SMS
select t.*, t.rowid from VALERA.SEND_SMS_TABLE t
order by t.sms_id desc;

INCOM.CheckIdentification  --Процедура проверяет статус регистрации по номеру телефона или ЛС
INCOM.DMP_CheckIdentification  --Процедура проверяет статус регистрации по номеру телефона или ЛС в системе DMP
  --заглушка для внутреннего тестирования--
  if p_Number in ('989719230', '989719232', '989719233', '3985436') then
    v_dmp_responсe := '{"success":false,"statusCode":404,"error":{"description":"Notfound."}}';
  else
    v_dmp_responсe := '{"success":true,"statusCode":200,"data":{"msisdn":380975555157,"sysId":"sourceSystemId","name":"string","surname":"string","patronymic":"string","docType":"string","docSeries":"string","docNumber":0,"personalTaxId":"string","birthday":"1996-11-11","sex":"string","email":"string","country":"string","region":"string","area":"string","city":"string","street":"string","building":"string","apartment":"string","organisationName":"string","edrpou":0,"reasonId":"string","bank":"string","orderId":"string","comments":"string","startDateTime":"2018-10-1019:54:00"}}';
  end if;
  --заглушка для внутреннего тестирования--
INCOM.GetFMCLinkPhoneByAccount  --Возвращает номер/ЛС FTTB (FMC)
select t.*, t.rowid from INCOM.BIS_FMC_LINKPHONEBYACCOUNT t;  --По абоненту FTTB(' || p_AccFTTB || ') подключена услуга FMC (PrePaid)

INCOM.CheckFMCStatus_2  --Функция проверки статуса услуги FMC на номере
select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t  --Asoid
where t.Msisdn like '%98971923%';
incom.fmc  --Пакет для работы с интерфейсом ЛК "Профиль абонента" (проект FMC)
INCOM.VerifyAvailableRegistration  --Процедура проверяет возможность регистрации (форма 3224)
INCOM.GetPhonesFromMultiAccount  --Процедура возвращает список телефонов, входящих в тот же мультиаккаунт, что и номер телефона/ЛС
INCOM.GroupDeletingRegistrationData  --Процедура для загрузки номеров мультисчета при групповом удалении регистрационных данных(форма 3224)
incom.getproblem3224  --Процедура возвращает данные из сохраненного обращения 3224
incom.getsubscriberinfo3224  --Процедура возвращает данные по зарегистрированному абоненту
INCOM.GetClientInfoFromDMP  --Процедура возвращает информацию по абоненту из системы DMP
INCOM.DMP_GetClientInfo_test  --Процедура возвращает данные в качестве эмулятора для INCOM.GetClientInfoFromDMP (для внутреннего использования)
INCOM.GetAICheckInfoPrepaid  --Процедура возвращает информацию для формы идентификации для зарегистрированных prepaid абонентов

INCOM.GetAbonentDocument  --Процедура возвращает тип документа по номеру телефона (для идентификации по типу документа)
INCOM.ConfirmRegistration3224  --Процедура подтверждения регистрации абонента (PID = 3224)
INCOM.GetChecksList  --Процедура формирования выпадающего списка "Тип проверки" (PID = 3224)
INCOM.AbonentWasIdentified  --Процедура проверяет прошел ли пользователь идентификацию
incom.IsSubscriberRegistered  --Функция определения зарегистрированного абонента
INCOM.Get_MAC_Addresses  --Процедура возвращает список MAC-адресов (для PID = 3224)
select t.*, t.rowid from INCOM.SUBS_FTTB_CALLS t;  --Asoid, список MAC-адресов

INCOM.SendEmailDetailReport173  --Процедура отправки Детализированного отчета на email
INCOM.CanCreateProblem180  --Процедура проверки данных перед открытием для ProblemID
INCOM.CanCreateProblem3353  --Процедура проверки данных перед открытием для ProblemID
INCOM.GetUnnamedRegistrationInfo  --Процедура возвращает информацию по обращению «Регистрация обезличенного абонента»
INCOM.GetChecksList  --Процедура формирования выпадающего списка "Тип проверки" (PID = 3224)
INCOM.IsAccountFMC  --Функция проверяет является ли ЛС - "ЛС FMC контракт (В2С)"
