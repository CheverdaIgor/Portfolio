INCOM.GetMNPOrders  --Процедура проверяет возможность регистрации (форма 3224)
------------------------------------------------------------------------------
INCOM.AbonentWasIdentified_3392  --Процедура проверяет прошел ли пользователь идентификацию
INCOM.Get_ICC_By_MSISDN_3392  --Процедура получения номера ICC SIM карты
INCOM.GetMNPTarifPlans  --Процедура выборки тарифных планов (MNP)
INCOM.MNP_ConfirmPortation  --Запрос на портацию номера телефона (MNP)
INCOM.GetMNPDueDate  --Процедура возвращает дату портации (MNP)
INCOM.InsProblem3392  --MNP
INCOM.CanCreateProblem3392  --Процедура проверки данных перед открытием для ProblemID
INCOM.CanCommitProblem3392  --Процедура проверки данных перед сохранением для ProblemID 3392
INCOM.MNP_CancelPortation  --Запрос на отмену заявки на портацию номера телефона (MNP)
INCOM.VerifyConnectivityFor1092  --Процедура проверяет возможность подключения для PID = 1092
INCOM.VerifyProblem3392  --Процедура проверок при нажатии на кнопку Проверить (ProblemID = 3392)
incom.MNP.CheckNumber  --Взаимодействие с HTTP JSON API MNP OM
INCOM.Is_Customer_KS  --Процедура для визначення приналежності абонента до мережі KS
INCOM.CheckContractNumber  --Перевірка номеру для контрактного типу сервісу
INCOM.GetPortingNumberList  --Процедура возвращает список уже портируемых номеров
select t.*, t.rowid from INCOM.APPLICATIONSADDITION t
where fieldname = 'ORDERID' and t.fielddisplayvalue = 'c383d31a-92d0-481d-abfb-5ac9f8f480c3'
order by t.recordid desc;

select t.*, t.rowid from US.ENUMTYPEVALUES t
where tyid = 20100;

delete  --удаление портируемых номеров из списка пид 1092(MNP)
from valera.maintable
where recordid in (select m1.recordid
        from Incom.ApplicationsAddition App
       inner join INCOM.GroupAppParentChild Gr on App.RecordID = Gr.RecordID and App.FieldName='PORTNUMBER'
       inner join valera.maintable m1 on m1.recordid = gr.recordid);

select t.*, t.rowid from INCOM.NKP_RESERVEDNUMBERCACHE t  --Абонентский номер(список)
--where t.msisdn in (982195391)
order by t.msisdn desc;

INCOM.CanCommitProblem1092_4->INCOM.SetReserveMSISDN_2->:  --резервирование на АСОИДе
--WEB.SWAP.ReserveMSISDN  --резерв
--WEB.SWAP.CancelReserveMSISDN  --отмена
--WEB.SELFCARE.ReservNumber  --резерв
--WEB.SELFCARE.UnReservNumber  --отмена
select t.*, t.rowid from WEB.ReservMSISDN_SWAP t
order by t.orderid desc;

