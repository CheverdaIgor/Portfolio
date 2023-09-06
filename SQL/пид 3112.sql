INCOM.CanCreateProblem3112  --Процедура проверки данных перед открытием для ProblemID=3112
INCOM.IsActiveFor171  --Возвращает текущее значение параметров  для лицевого счета или MSISDN
INCOM.GetAccDICTVALUE  --Возвращает текущее значение параметров  для лицевого счета или MSISDN
INCOM.GetCustomerEntity

INCOM.GetStartFrom  --Возвращает значение для поля "Начиная с" для ПИД

incom.getdeliveryemailforecp  --Возвращает адрес электронной почты, на который необходимо отправить детализированный счет
incom.getaccdictvalue  --Возвращает текущее значение параметров для лицевого счета или MSISDN

INCOM.GetDictionaryInfo  --Процедура выборки списка справочника доп. атрибутов для ПИД
select t.*, t.rowid from INCOM.DICTIONARYINFO t;
select t.*, t.rowid from INCOM.PID2DICTID t;  --настройка сортировки по DICTORDER

INCOM.CanSentToMobileOperator  --Проверка принадлежности номера телефона мобильного оператора к списку разрешенных
select decode(count(*),0,0,1)
  from INCOM.MobileOperatorsCodes
  where CodeValue = SUBSTR('989719292',1,2);


select t.*, t.rowid from US.REPOSITORY t
where coid = 120351;  --настройки для дублирования пид 3112

