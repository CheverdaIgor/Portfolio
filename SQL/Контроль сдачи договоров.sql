INCOM.InsProblem516_5  --Процедура вставки обращения "Оригинал обращения принят на хранение"
select t.*, t.rowid from INCOM.RECORDID2FOLDER t;

INCOM.CanPrintAgreement  --Определение значения чекбокса "Печать пользовательского соглашения"
INCOM.GetSubscriberInfo  --Процедура возвращает информацию о абонента по его номеру телефона или по номеру лицевого счета
INCOM.GetAgreementRegisterInfo  --Процедура поиска в реестре абонентских соглашений
select t.*, t.rowid from INCOM.SUBSAGREEMENTREGISTER t
order by t.recordid desc;

select t.recordid, t.field59, t.field63, t.big_field1, t.rowid
from VALERA.APPLICATIONSINFOTABLE t
order by t.recordid desc;

INCOM.GetAccountByDopInfo  --Получить ЛС по ОКПО или паспортным данным
  /*--заглушка для внутреннего тестирования*/
  if p_OKPO in ('35363741', '35363742') then
  v_Account := null;
  end if;
  /*--заглушка для внутреннего тестирования*/

