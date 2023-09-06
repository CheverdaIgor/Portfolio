select t.*, t.rowid from VALERA.PROBLEMSTABLE t
where problemid in (171, 3041, 2379);
select t.*, t.rowid from VALERA.PROBLEMSTABLE_new t
where t.problemid in (171, 3041, 2379);


select t.*, t.rowid from HDREPORTER.APPLICATIONGROUPRELATIONS t  --группа 1 "Заявления долгосрочного хранения"
INCOM.GetAccountByDopInfo  --Получить ЛС по ОКПО или паспортным данным
INCOM.GetBranches  --Процедура выборки филиалов
INCOM.GetASSCInfo_2  --Запрос информации по объединению 0-го уровня и ГКО
INCOM.VerifyConnectivityFor3041  --Процедура проверяет возможность подключения для PID = 3041
INCOM.GetSegments3041  --Процедура возвращает список сегментов для PID = 3041
INCOM.GetTPListFor3041  --Процедура выборки списка тарифных планов для PID=3041
INCOM.CanLoadProblem_5  --Процедура проверки возможности загрузки обращения
INCOM.Activation_MS_Subscriber  --Процедура активации абонента Microsoft
INCOM.UpdAppStatus_2  --Процедура обновления статуса
--Ошибочно
--Выдано на руки
select M.recordid, M.ApplicationStatus, M.ProblemID, M.rowid
  from Valera.MainTable M
  where M.recordid in ('5689550592');

select t.recordid, t.Field32, t.rowid
 from VALERA.APPLICATIONSINFOTABLE t
where t.recordid in ('5689550502', '5689550461') and (sysdate - t.Field32) >= 1/24/60;


INCOM.GetAppStatusLog  --Процедура выборки истории изменений статуса
INCOM.InsProblem3041  --Подключение абонента Microsoft
INCOM.CanCommitProblem3041  --Процедура проверки данных перед сохранением для ProblemID 3041

select t.*, t.rowid from OMS.HD_FEATURE995_MICROSOFT t  --пакеты и макс.количество лицензий

INCOM.GetAccountAttributes  --Процедура возвращает доп. атрибуты лицевого счета для обращения
select t.*, t.rowid from INCOM.ACCOUNTATTRIBUTES t  --таб. для 'Атрибуты лицевого счета'

INCOM.GetCustomerEntity_2  --Процедура возвращает тип абонента


INCOM.InsProblem3070  --Заявление на перерегистрацию (MSO 365)
select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where recordid = 5689552291;

INCOM.ReregistrationSubsMS  --Интерфейс проверки и перерегистрации абонента MS, пид 3070
INCOM.GetProblem3041  --Процедура возвращает данные по PID 3041
INCOM.GetProblem3070  --Процедура возвращает данные по PID 3070
