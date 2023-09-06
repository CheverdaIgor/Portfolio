INCOM.CanCreateProblem3108  --Процедура проверки данных перед открытием для ProblemID=3108
INCOM.VerifyAvailableOrderIndividual  --Проверяет возможность принятия обращения PID = 3108 (для контрактных абонентов)
INCOM.GetSubscriberAccountType  --Процедура возвращает тип ЛС (форма 3108)
INCOM.GetStocks_2  --Процедура выборки складов
INCOM.GetServiceNotesByINN  --Процедура возвращает номер служебной записка и доступную сумму заказа по ИНН (PID = 3108)
select t.*, t.rowid from INCOM.SERVICENOTES t;

select t.*, t.rowid from INCOM.RESERVEDITEMS t  --резервирование товара
order by t.reservid desc;

