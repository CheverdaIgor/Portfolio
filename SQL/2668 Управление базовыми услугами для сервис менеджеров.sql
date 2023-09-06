INCOM.IsCoordPassIdentRequired_2668  --Функция определяет необходимость проверки пароля координатора при открытии обращения 2668
INCOM.GetCoordinatorsFor2668  --Процедура для формирования выпадающего списка Координатор для PID = 2668
INCOM.GetSubscribersByCoord  --Процедура возвращает список номеров телефонов, обслуживающихся координтором
INCOM.AutoProcessApp2668  --Процедура автоматической обработки обращения 2668
select t.*, t.rowid from VALERA.MAINTABLE t
order by t.recordid desc;

select t.*, t.rowid from INCOM.VERIFYSERVICEACTIVATE t  --Asoid
where (msisdn = '989719232') and (serviceid = 15);
