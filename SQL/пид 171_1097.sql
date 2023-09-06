INCOM.IsLiveSignActiveFor171  --Возвращает текущее значение параметра "Живая подпись" для лицевого счета или MSISDN
INCOM.GetSubscriberAccountList_5  --Процедура возвращает список, по которому пользователь может выбирать лицевые счета для замены условий доставки
select t.*, t.rowid from INCOM.BIS_IVR_DLV_ADDRESSES t  --Возвращает адрес электронной почты, на который необходимо отправить счет в формате PDF

INCOM.GetAccountAttributes  --Процедура возвращает доп. атрибуты лицевого счета для обращения
select t.*, t.rowid from INCOM.ACCOUNTATTRIBUTES t;

--p_DictID in varchar2:
--43 PDF,
--45 LiveSignActive(Живая подпись),
--65 XML,
--68 TXT,
--66 CancelPrintRifReport(Отмена печати дифференцированного счета),
--32 ACT Score(Счет-акт),
--67 RegTaxBills(Реестр налоговых накладных).
select t.*, t.rowid from DICTIONARY_INFO t  --Asoid, INCOM.IsActiveFor171 - Возвращает текущее значение параметров для лицевого счета или MSISDN
where t.Account = '3985436';

select t.*, t.rowid from INCOM.BIS_IVR_CLIENT t  --INCOM.IsPDFEnabledFor171: BRNC_ID 21 - PDF, pid 170=brnc_id between 1 and 7
where account = '3985436';

INCOM.GetDeliveryModesByProblem_4  --Возвращает данные доставки для проблем ид
INCOM.IsAccountInGroup  --Возвращает входит ли ЛС в группу


INCOM.SearchDocsForProblem1097_4  --Найти документы для повторной печати
select t.*, t.rowid from INCOM.FILEFORPROBLEM1097 t
where t.documentid = '8';  --ASOID, поиск документов
select t.*, t.rowid from INCOM.DOCSFORPROBLEM1097 t  --загруженные документы в сох. обращении
where t.recordid = '5689552387'
order by t.recordid desc;
--update INCOM.FILEFORPROBLEM1097 t set t.recorddate =  '01.01.2016' where t.recorddate =  '23.11.2009'
--update INCOM.FILEFORPROBLEM1097 t set t.account =  '3985436' where t.account =  '5556661'

INCOM.AutoSendingDocsByEmail  --Процедура отправки заказанных документов по email (job)
select t.*, t.rowid from IVR.XML_BILLS_201609 t  --ASOID

INCOM.GetEmailByName  --Процедура получения email по имени
INCOM.InsDocForProblem1097_2  --Сохранить информацию о документе, загруженном в рамках ProblemID 1097
select t.*, t.rowid from INCOM.DOCSFORPROBLEM1097 t  --документы в сох. пид 1097 и статусы его документов, 0-не загружено
where recordid = '5689552268';

select t.*, t.rowid from INCOM.BIS_IVR_DLV_ADDRESSES t;  --e-mail для отправки
select t.*, t.rowid from INCOM.Ordersforproblem1097 t order by t.orderid desc;  --Asoid, проверка статуса документа

select tt.*, tt.rowid from us.enumtypevalues tt  --выпадающий список "Причина"
where tt.tyid = 10282;

INCOM.GetSubscriberAccountList_6  --пид 171, Процедура возвращает список, по которому пользователь может выбирать лицевые счета для замены условий доставки
select t.*, t.rowid from INCOM.BIS_IVR_CLIENT_DICT_VALUES t;  --отображение значений e-mail в таблице ЛС

INCOM.GetDeliveryEmailForECP  --пид 171, Возвращает адрес электронной почты, на который необходимо отправить детализированный счет
select t.CLNT_CLNT_ID, t.Email_ECP, t.rowid from INCOM.BIS_IVR_DLV_ADDRESSES t;

INCOM.isECPCheckFor171  --Возвращает текущее значение ECP  для лицевого счета или MSISDN

