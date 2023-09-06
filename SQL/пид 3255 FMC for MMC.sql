incom.getactions3255  --Процедура возвращает значения для выпадающего списка "Действие"
select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t;  --ASOID: выпадающий список с действиями

INCOM.GetSubscriberInfo3255  --Процедура возвращает информацию об абоненте по сохраненному заявлению на перерегистрацию
INCOM.VerifyConnectivityFor3255  --Процедура проверяет возможность подключения для PID = 3255, в случае выбора "Существующий абонент FTTB"
-- проверим связан ли ЛС FTTB с номером PrePaid
  select F.*, F.rowid
    from INCOM.BIS_FMC_LinkPhoneByAccount F
   /*where F.Account = '3985436';*/

INCOM.CanCommitProblem3255  --Процедура проверки данных перед сохранением для ProblemID 3255
INCOM.SendEmailFor3255  --Процедура отправки email уведомлений по принятым обращениям «Заявление на подключение Домашний интернет контракт» в статусе "Выдано на руки"
INCOM.ConnectionRequestFTTB_3255  --Инициация подачи заявки на подключение услуги FMC по существующему абоненту FTTB в BIS (PID = 3255)

incom.cancommitproblem180  --Процедура проверки данных перед сохранением для ProblemID 180
INCOM.GetAccountFTTB_FMC  --Возвращает ЛС FTTB (FMC) (для формы PID = 172)
select t.*, t.rowid from BIS2INTF_SCR.HD_FMC_MMC_CLIENT_HISTORY t;  --Asoid, услуга FMC
INCOM.IsReregistrationFTTBEnabled  --Проверяет возможность перерегистрации FTTB (FMC)

select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t;  --Asoid, услуга FMC, VSERV_ID=265

INCOM.IsAccountFMC  --Функция проверяет является ли ЛС - "ЛС FMC контракт (В2С)"
incom.checkfmcstatus  --Функция проверки статуса услуги FTTB на номере

select t.*, t.rowid from INCOM.VERIFYSIMCHANGE t;  --Asoid, сох. для действия "Отключение", ТП
