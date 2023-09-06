INCOM.CanCreateProblem3524  --Процедура проверки данных перед открытием для ProblemID=3524
INCOM.SendSMS2  --Функция отправки SMS
INCOM.CanSentToMobileOperator  --Проверка принадлежности номера телефона мобильного оператора к списку разрешенных
INCOM.MCPSReservNumbers  --Процедура резервации номера через MCPS
INCOM.VerifyPhoneNumber3524  --Процедура проверки номера при добавлении в таблицу (PID 3524)
INCOM.GetNumbersFromCache  --выборка зарезирвированных номеров их кэша (PID 3524)
web.soap.SubmitOrder  -- резервация пула номеров для 3524:
select t.*, t.rowid from INCOM.RESERVEDNUMBERCACHE t
where dealerlogin = 'HDUSER'
order by t.msisdn;

--получаем номера из кэша в список номеров:
INCOM.Get_NKP_NumbersFromCache  --выборка зарезирвированных номеров из кэша для НКП(PID 1092, 3179)
--перед тем как подбросить номер, проверяем есть ли в пуле для юзера 20 номеров, если есть вычитываем, если не хватает,
--вызываем INCOM.GetMSISDNListFromBISSWAP  - подкачиваем кэш:
INCOM.GetMSISDNListFromBISSWAP  --Процедура получения списка номеров
--при добавлении номера в таблицу на форме, помечаем в базе, что он использован:
INCOM.Check_NKP_ReservedNumbers  --Процедура проверки номера при выборе из пула номеров
--для 1092 создан новый кэш:
select t.*, t.rowid from INCOM.NKP_RESERVEDNUMBERCACHE t
order by t.enabled desc;

INCOM.GetTarifPlansForPrePaid  --выборка тарифных планов PrePaid (PID 3524)
select t.*, t.rowid from INCOM.TARIFPLANSFORPREPAID t;  --Таблица тарифных планов PrePaid
select t.*, t.rowid from INCOM.REGIONTARIFPLANSFORPREPAID t;  --Таблица региональных тарифных планов PrePaid
select t.*, t.rowid from INCOM.REGIONTPAREABORDER t;  --границы действия

--DL_HDUSER->TOWNID=123393
--HDUSER->TOWNID=150710

--на асоиде: web.soap.GetStatusOrder   возвращает ответ
INCOM.GetStatusOrder  --Процедура получения статуса заказа
