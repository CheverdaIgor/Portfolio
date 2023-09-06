--черновык:
--INCOM.CreateASSC_2
--INCOM.CreateAccountBis_2

INCOM.GetDebtsAccountsList  --Получить список ЛС с дебиторской задолженостью
select  --Asoid
                    D.ACCOUNT
                   ,D.DEF
                   ,D.SUM_DOLG
                   ,D.OKPO
                   ,D.CustomerPassport
                   ,D.rowid
  from incom.DebtAccounts D
  where /*OKPO = '35363738' or */CustomerPassport = 'BH-444444' or CustomerPassport = '222222222';

--ALTER TABLE incom.DebtAccounts add OKPO VARCHAR2(50);

INCOM.IsCoordIDPassport  --Функция определяет тип паспорта координатора
INCOM.VerifyCoordPassport  --Процедура проверяет номер паспорт координатора
select t.*, t.rowid from VALERA.DIR_COORDINATORS t
where t.Msisdn like '%98971923%' or t.Msisdn like '%675720208%' or t.Msisdn like '%111111111%';

INCOM.VERIFYPasportCorpSubscr  --Процедура проверяет паспорт корпоративного абонента
-- курсор из incom.getaccountinfofromweb_5:
select t.*, t.rowid from IVR.IVR_JUR_ADDRESSES_PARTITION t
where t.clnt_clnt_id = '4073831' or t.clnt_clnt_id = '4073832' or t.clnt_clnt_id = '4073833';

INCOM.IsIDPassportRegPrd  --Функция определяет тип паспорта зарегистрированного припейда valera.PREPAIDINFORMATIONTABLE
INCOM.CHECKPASSPORTREGPRD  --Процедура проверяет паспорт зарегистрированного припейда valera.PREPAIDINFORMATIONTABLE
select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t;

INCOM.GetSegments1092  --Процедура возвращает список сегментов для PID = 1092
incom.getpassportinfobyaccount  --Функция возвращает серию и номер пасспорта по номеру лицевого счета
incom.getaccountbydopinfo  --Получить ЛС по ОКПО или паспортным данным
INCOM.GetGroupAppTree_2  --Процедура возвращает дерево объединения

select t.pass_ser, t.pass_num, t.rowid from IVR.IVR_JUR_ADDRESSES_PARTITION t --паспортные данные
where t.clnt_clnt_id = '4073833';

Incom.Insproblem172_8  --Внесение данных по обращению "Заявление на перерегистрацию"
INCOM.Cancommitproblem172_3  --Процедура проверки данных перед сохранением для ProblemID 172

incom.getaccountinfofromweb_6  --заглушка для списка 'Действует до'

