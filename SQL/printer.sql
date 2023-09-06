incom.IsNeedPrintersVerify  --Функция возвращает признак необходимости проверки принтров
INCOM.SaveToPrintersLog  --Функция анализирует параметры принтеров в системе и записывает в лог

select t.*, t.rowid from VALERA.LOG_ERR_ARCH t
order by t.create_date desc;

/*select * from INCOM.ERRORLOG t \*лог ошибок*\
--where t.errortext like '%vtVerifyCanCreateProblem%' and t.errordate >= '26.11.2013'
order by t.errorid desc;*/
