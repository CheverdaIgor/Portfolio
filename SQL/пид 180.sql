Incom.InsProblem180_6  --Внесение "Заявление на аннулирование договора"
INCOM.CanCommitProblem180  --Процедура проверки данных перед сохранением для ProblemID 180
INCOM.CheckAbilityCloseSubs  --ASOID: Закрытие абонента 989719232 лицевого счета 3985436 не возможно: Некорректная заявка. Абонент не найден.
select t.*, t.rowid from INCOM.BIS_IVR_SUBSCRIBERS t
where msisdn = '989719232';
select t.*, t.rowid from INCOM.BIS_IVR_CLIENT t
where account in ('3985435', '3985436');

INCOM.GetOKPOByAccount  --Функция возвращает ОКПО по номеру лицевого счета
select INCOM.GetOKPOByAccount(3985436) from dual;

INCOM.GetPassportInfoByAccount  --Функция возвращает серию и номер пасспорта по номеру лицевого счета
select incom.getcustomerentity(3985438, null) from dual  --Процедура возвращает тип абонента
select incom.iscustomerpstn(3985436) from dual  --Функция возвращает что абонент относится к ШПД
select incom.iscustomerhomeinet(3985436) from dual  --Функция проверяет подключена ли абоненту услуга ДИ

INCOM.IsCustomerFMC  --Функция проверяет подключена ли абоненту услуга FMC (Fixed Mobile Convergence)
select incom.iscustomerfmc(3985436, 'ACCOUNT') from dual
select t.*, t.rowid from INCOM.BIS_FMC_LINKPHONEBYACCOUNT t  --проверяется, подключена ли к ЛС услуга FMC

INCOM.CheckTransferBalance  --Интерфейс проверки возможности переноса баланса (в рамках PID = 180)
select t.*, t.rowid from BALANCETRANSFERCOST t  --Asoid, баланс для переноса с ЛС на ЛС

select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where recordid in ('5689553945');

--пид 180 - мобильный
--пид 2786 - ПСТН
--пид 1328 - ДИ

INCOM.GetGroupAppTree_2  --Процедура возвращает дерево объединения
INCOM.GetCurrentContextValue  --Получения значение из SYS_CONTEXT по названию/ключу
INCOM.GetAbonentIDByAccount  --Получить список идентификаторов абонентов (для ЛС с типом PSTN)
INCOM.GetAccounts180  --Процедура возвращает список ЛС(действие 'перенести на мій особовий рахунок')

INCOM.CanCreateProblem180  --Процедура проверки данных перед открытием для ProblemID
-- Если абонент "Физическое лицо" и по его ЛС отсутсвует ОКПО, считаем что это "Домашний интернет"
      if INCOM.GetCustomerEntity(p_Number, null) = 1 and INCOM.GetOKPOByAccount(p_Number) is null then
        INCOM.SetCurrentProblemContext('ABONENTTYPE', 2); -- абонент "домашний интернет"
<<< д.б. физ лицо, т.е. без ОКПО(ОКПО пустой)

INCOM.UpdAppStatus_2  --Процедура обновления статуса
INCOM.GetUpdAppStatusText  --Процедура возвращает текст сообщения, выводимый перед обновленим статуса
valera.save_subs  --Процедура save_subs
INCOM.GetRestActions  --Процедура возвращает значения для выпадающего списка "Остаток авансового платежа прошу" (для PID = 180, 1328)
