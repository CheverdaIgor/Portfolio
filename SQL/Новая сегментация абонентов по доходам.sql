INCOM.GetAdditionalSIMInfo475  --Процедура получения списка ICC-кодов дополнительных SIM карт для PID = 475 (SIM-пара)
select t.*, t.rowid from SIMCARDS t  --Asoid, действие "Змінити SIM-картку":
/*where extract(value(d),'//MAIN/text()').getStringVal() = '0'
        and extract(value(d),'//ASTY_ASTY_ID/text()').getStringVal() = '2'
        and extract(value(d),'//MSTP_MSTP_ID/text()').getStringVal() = '1'
        and extract(value(d),'//CONNECTED/text()').getStringVal() = 'Y';*/
where t.msisdn like '%98971923%'
order by t.msisdn;
INCOM.CanFreeConnectSpareSIM_2  --Проверить возможность бесплатного подключения запасной SIM-карты для PID = 475 (SIM-пара)

INCOM.GetAdditionalDATASIMInfo  --Процедура получения информации о дополнительной SIM карте для PID = 1772 (DATA SIM-пара):
/*where extract(value(d),'//MAIN/text()').getStringVal() = '0'
        and extract(value(d),'//ASTY_ASTY_ID/text()').getStringVal() = '2'
        and extract(value(d),'//MSTP_MSTP_ID/text()').getStringVal() = '2'
        and extract(value(d),'//CONNECTED/text()').getStringVal() = 'Y';*/
select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t  --Asoid, проверка подключенной услуги "Запасная SIM", пид 1117 (4-подкл., 3-заблк., 0-не подкл.)
where t.msisdn like '%98971923%';

INCOM.CanFreeServiceForProblem1117_2  --Проверка доступности бесплатной обработки заявления по ProblemID = 1117
INCOM.GetFreeServiceReasonsLookup  --Причины бесплатности (кроме причин бесплатности ReasonID = (19,20) для PID=179 Prepaid)

Valera.Get_Customer_Segment  --function
select t.*, t.rowid from VALERA.CUSTOMER_SEGMENTS t;

INCOM.GetSIMInfo  --Процедура получения информации о SIM карте
INCOM.CanCommitProblem1772  --Процедура проверки данных перед сохранением для ProblemID 1772
INCOM.CanCommitProblem1117  --необходимые проверки/действия в момент сохранения заявления
INCOM.GetActionsForProblem1117_3  --Получить доступные действия по абоненту для Problem1117 (запасная SIM)
select t.*, t.rowid from VALERA.CUSTOMER_SEGMENTS t;
  select t.tvValue, t.rowid
  from US.EnumTypeValues t
  where t.TYID = 10319
    and t.tvName = 'MinPriceValue';

select t.*, t.rowid from INCOM.PP_GET_SERVICES t;  --ASOID, проверка подключенной услуги "Запасная SIM", припейд
select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t;  --ASOID, проверка подключенной услуги "Запасная SIM", контракт

incom.getabonentarpulevel_3  --Процедура возвращает уровень доходности абонента
incom.checkabonentmigrate  --Проверка факта миграции абонента
VALERA.GET_CUSTOMER_PHONE_MODEL  --Проверка смены сегмента (программы лояльности)

select M.RecordDate, M.ProblemID, M.APPLICATIONSTATUS, M.rowid
                   from Valera.Maintable M
                  where M.ProblemID in (469, 489)
                   --and to_char(M.RecordDate, 'MM') = to_char(sysdate, 'MM')
                   and M.PhoneNumber = '989719232';

