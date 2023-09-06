INCOM.CANCREATEPROBLEM3108  --Процедура проверки данных перед открытием для ProblemID=3108
incom.VerifyAvailabilityOrder  --Проверка возможности нового заказа (в PID = 3108)
INCOM.GetAvailableOrderAmount  --Процедура возвращает доступную сумму заказа (для PID = 3108)
select t.*, t.rowid from INCOM.RESERVEDITEMS t;

INCOM.GetValidServiceNote  --Определяет наличие действующей СЗ
select t.*, t.rowid from INCOM.SERVICENOTES t;

INCOM.GetClientInfoByOKPO  --Получение информации о текущих балансах на лицевых счетах ЕГРПОУ (для определения не дебиторской задолженности в PID = 3108)
INCOM.GetOKPOByCoordinator  --Процедура возвращает список всех ОКПО по данному координатору (для PID 3108)
INCOM.GetValidServiceNote  --Определяет наличие действующей СЗ
INCOM.InsProblem3108  --Заявление на рассрочку (предварительный заказ)
INCOM.InsProblem3111  --Заявление на рассрочку (подтверждение заказа)
incom.getdebtsaccountslist  --Получить список ЛС с дебиторской задолженостью
INCOM.InsProblem3108Detail  --Сохраняет запись Результирующей таблицы для обращения 3108 в xml-виде в Incom.ApplicationsAddition

incom.GetItems  --Процедура выборки товаров
select t.*, t.rowid from INCOM.DIR_ITEMS t  --количество телефонов
select t.*, t.rowid from INCOM.ITEMSPROPERTIES t  --названия телефонов
select t.*, t.rowid from INCOM.ERM01030_ASUP_REST_TEL_FOR_B2B t  --телефоны на складе

incom.CheckSerialNumber  --Процедура проверяет серийные номера устройства (PID = 3111)
select t.*, t.rowid from INCOM.SERIALNUMBERSTEMPTABLE t;

INCOM.GetDeliveryModes3111  --Возвращает данные доставки для ProblemID = 3111
select t.*, t.rowid from INCOM.DELIVERYMODESFOR3111 t;

INCOM.CanCreateProblem3108  --Процедура проверки данных перед открытием для ProblemID=3108
INCOM.CanCreateProblem3111  --Процедура проверки данных перед открытием для ProblemID=3111
INCOM.CANCOMMITPROBLEM3111  --Процедура проверки данных перед сохранением для ProblemID 3111
INCOM.GetRequestsForPreorder3111  --Процедура возвращает заявки на предварительный заказ
INCOM.InitWriteOffItems  --Инициализация процесса списания товара
INCOM.checkappstatus3111  --Процедура проверяет возможность сохранения обращения в определенном статусе в зависимости от способа доставки
INCOM.ContextMenuExecute  --Процедура вызывается контекстным меню
INCOM.ContextMenuExecute_3108_3111  --Процедура вызывается контекстным меню: 'Отменить всю заявку' для PID = 3108, 3111
                                                                --'Отменить резервацию серийных номеров' для PID = 3111

Incom.GetNewAccount3108  --Получения новый ЛС, сохраненный в рамках заявления 3108
INCOM.UpdAppStatus_2  --Процедура обновления статуса


select distinct 
                           MT.RecordID, MT.RecordDate     
                       from VALERA.MainTable MT
                      inner join VALERA.ApplicationsInfoTable Ap on MT.RecordID = Ap.RecordID
                      inner join INCOM.ReservedItems R on MT.RecordID = R.RecordID1 and R.Status = 1
                      where MT.ProblemID = 3108
                        and MT.ApplicationStatus in ('Принято', 'Выдано на руки')
                        and Ap.Field1 = '35363738'
                        and Ap.Field30 is null;

select t.recordid, t.field28, t.field30, Field60, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where t.recordid in (5689561867);

select t.*, t.rowid from VALERA.MAINTABLE t
where recordid in (5689561867);

INCOM.CalcSchedulePayments  --Процедура расчета графика платежей
