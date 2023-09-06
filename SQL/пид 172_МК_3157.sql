INCOM.InsProblem3157  --Внесение данных по обращению "Перерегистрация с юридического на физическое лицо"
INCOM.InsProblem172_10  --Внесение данных по обращению "Заявление на перерегистрацию"
INCOM.AvailabilityProblem3157  --Процедура проверяет наличие и возвращает идентификатор обращения "Перерегистрация с юридического на физическое лицо"
INCOM.GetProblem3157  --Процедура возвращает данные по PID 3157
select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where recordid in ('1212121212', '5689566475');

INCOM.GetControlsForProblem172  --Процедура возвращает флаги доступности полей на форме 172
select t.*, t.rowid from INCOM.CONTROLSFORPROBLEM172 t;

select t.*, t.rowid from VALERA.MAINTABLE t
where recordid in ('1212121212', '5689566475', '5689568018');

INCOM.SendEmailFor3157  --Процедура отправки email уведомлений о зарегистрированных за последние сутки заявлениях на «Перерегистрацию с юридического лица на физическое лицо»в статусе «Принято»
INCOM.AutoChangeStatusApp3157  --Процедура отслеживает и автоматически переводит обращение PID=3157 в статус «Ошибочно»

