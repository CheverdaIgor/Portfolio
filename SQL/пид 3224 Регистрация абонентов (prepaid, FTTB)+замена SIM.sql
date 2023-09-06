INCOM.InsPrepaidInformationTable  --Добавление/Изменения информации по зарегистрированному абоненту типа "физическое лицо"
INCOM.InsProblem3224  --Заявление на регистрацию абонентов предоплаченной связи
incom.GetActionsForProblem3224  --Процедура возвращает список опций для Problem 3224
INCOM.GetSubscriberInfo3224  --Процедура возвращает данные по зарегистрированному абоненту
select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t;  --данные по зарегистрированному абоненту
select t.*, t.rowid from VALERA.FTTB_INFORMATIONTABLE t;  --данные по ДИ
select t.*, t.rowid from VALERA.CUSTOMERINFORMATIONTABLE t;  --инф. по телефону
select t.*, t.rowid  --контактный телефон ДИ
  from incom.bis_fttb_cont_phone t
  where t.account = '3985436';
----------------------------------------------------------------------------------------------------

INCOM.CheckBalance  --Процедура проверки баланса абонента на указанную дату с определенной точностью
select t.*, t.rowid from IVR.IVR_BALANCES t
where clnt_id = 4073833;

incom.checkcalls  --Процедура проверки наличия звонков (с учетом Люкс-номеров)
select t.*, t.rowid from CALLHISTORY t
where msisdn = '989719233';

INCOM.SendEmailFor179  --Рассылка Email-уведомления о принятых обращениях «Заявление на замену SIM-карт» с неполной идентификацией
select t.*, t.rowid from VALERA.MAINTABLE t
where recorddate >= to_date('01.02.2018', 'dd.mm.yyyy') and (t.problemid = '179' or t.problemid = '3224')
and t.phonenumber = '989719233';

INCOM.SendSMSFor3224  --Процедура отправки SMS-сообщения о регистрации абонента
INCOM.CanCommitProblem3224  --Процедура проверки данных перед сохранением для ProblemID 3224
VALERA.OnDeleteCustomerPrep  --Inserting an information about deleted phonenumbers

INCOM.DelCustomerInfoTableFor3224  --Удаление информации по зарегистрированному абоненту

select t.*, t.rowid from INCOM.CONTROLSFORPROBLEM179 t;  --Видимость (доступность для редактирования) и обязательность для заполнения, регулируется на уровне БД в зависимости от типа проверки

