--function valera.Get_Customer_Segment  --сегмент
select valera.get_customer_segment('989719232', 0) from dual;

select t.*, t.rowid from INCOM.ADDITIONALAGREEMENTATTRIBUTES t
where t.agreementtype = 6 and t.isallowed = 1;

INCOM.IsAbonentNewFor523  --Проверка «Новый абонент»:::
select incom.isabonentnewfor523(989719232) from dual;

INCOM.GetSubscriberInfo  --данные в BIS о лицевом счете абонента
INCOM.GetContractDateByPhoneNumber  --дата подключение абонента

select t.*, t.rowid from VALERA.CONTRACT_MIGRATION_LIST t  --Существующий абонент, является мигрантом с prepaid, если его номер присутствует в таблице

INCOM.CanCreateProblem523
INCOM.GetActions523_2  --Проверка доступности действий для абонента
INCOM.GetPhoneListByAccount  --Получить список номеров телефонов по лицевому счету("Дополнительный номер")
INCOM.VerifyFixedAdditionalAgreement  --Проверка наличия действующего дополнительного соглашения
INCOM.GetAgreementTypes_2  --Типы дополнительных соглашений доступные абоненту
INCOM.GetAgreementAttributes_4  --Процедура возвращает атрибуты дополнительного соглашения при заключении ДС

INCOM.GetAgreementCancelAttributes_4  --Процедура возвращает атрибуты дополнительного соглашения при досрочном прекращении действия ДС
select t.*, t.rowid from STARCLUB.STCDISCOUNT t  --проверка в системе СТАРКЛУБ
select t.*, t.rowid from INCOM.SUBSPENALTY t  --Нет действующих ДС, действие "Досрочное прекращение" недоступно*/
where t.msisdn = '989719231';

INCOM.GetGroupAppDetails_5  --Процедура возвращает список детализации
INCOM.VerifySMEChannel431  --Процедура проводит проверку по наличию задолжености и наличию ДС с типом
