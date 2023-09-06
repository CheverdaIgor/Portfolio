INCOM.GetCSRToolboxURL_2  --Получить URL для доступа к окну CSRToolbox
valera.is_customer_prepaid_stis  --Процедура для определения типа абонента в STIS
valera.is_customer_prepaid  --Функция определяет тип абонента
select t.*, t.rowid from VALERA.PREPAID_NUMBERS_RANGE t;
select t.*, t.rowid from VALERA.CONTRACT_MIGRATION_LIST t;
valera.Get_Customer_Segment

INCOM.IsCustomerDBSS  --Функция проверяет принадлежность абонента к типу DBSS
select E.*, E.rowid from US.EnumTypeValues E where E.TyID = 20068;  --абонент DBSS
select t.*, t.rowid from VALERA.CUSTOMERINFORMATIONTABLE t;  --инф. с закладки «Customer Care информация»

INCOM.GetCustomerInformation_5  --Процедура возвращает информацию по абоненту
INCOM.IsCustomerFMC  --Функция проверяет подключена ли абоненту услуга FMC (Fixed Mobile Convergence)
select t.*, t.rowid from IVR.IVR_FTTB_CONTACTS t;
select t.*, t.rowid from INCOM.BIS_FMC_LINKPHONEBYACCOUNT t;  --поиск для абонентов предоплаченной формы

INCOM.CanCreateProblem  --Процедура общих проверок для всех заявлений
INCOM.SwitchHDTabs  --Процедура переключения между закладками на главной форме HelpDesk
INCOM.GetTroubles348_5  --Возвращает данные об аварии (PID = 348)
select t.*, t.rowid from INCOM.SERVICESTOTROUBLETYPE t  --услуги события
where troubletypeid in (7,8);
select t.*, t.rowid from TURCHIN.TROUBLE_LIST_TABLE t;  --события
select t.*, t.rowid from US.ENUMTYPEVALUES t  --выпадающий список «Тип абонента»
where tyid = 1;

INCOM.GetScratchCodeInfo_1  --Процедура получения информации о scratch коде
select t.*, t.rowid from PREPAIDSCRATCHCARD t  --Asoid, серийный номер
where phone_number in ('989719232', '989719234');
VALERA.Change_Status_Of_Prepaid_Sim_3  --Процедура передает в Prepaid заявки на разблокировку номера FroudLockout

INCOM.VerifyAbonentInfo_2958  --Процедура проверяет информацию по абоненту при ошибочном платеже (Problem 2958)
INCOM.VerifyAbonentInfo_1119  --Процедура проверяет информацию по абоненту при ошибочном платеже (Problem 1119)

--блокировок троллей в СС для нового типа абонента DBSS
valera.troll_count
valera.TROLL_COUNT_RESET

HDReporter.GetApplications_5  --Процедура получения статистики по заявлениям
HDReporter.GetClaims_2  --Процедура получения статистики по обращениям
INCOM.DisplayGreeting  --Функция определяет отображать ли приветствие
