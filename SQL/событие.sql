INCOM.GetTroubles348_5  --Возвращает данные об аварии (PID = 348)
INCOM.Getcalctroubledays_3  --Процедура возврата данных для построения календаря проблемных дней и расчет суммы начислений (PID = 348 для FTTB)
INCOM.GetCalcTroubleDays_4  --Процедура возврата данных для построения календаря проблемных дней и расчет суммы начислений (PID = 348 для FTTB)
INCOM.CalcTroubleDays_2  --Процедура расчета календаря проблемных дней (PID = 348 для FTTB)
INCOM.GetFinancialLossesTrouble  --Функция возвращает доступность признака "Финансовые потери"


select * from valera.send_sms_table --отправка SMS
order by sms_id desc;

select t.*, t.rowid from TURCHIN.TROUBLE_LIST_TABLE t --событие
where t.trouble_id in (3525019);
incom.GetSubscriberCount  --количество абонентов ТВ
select t.*, t.rowid from INCOM.VIASAT_ACTIVITY t;  --ТВ абоненты
select t.*, t.rowid from INCOM.SMSTEMPLATESFORTROUBLEFTTB t;  --шаблоны сообщений ТВ абонентам

select t.*, t.rowid from INCOM.REFUNDREGISTRY t --жалоба
where t.registryid = '4268272';

INCOM.GlobalTroubleMonitoring_2 --Процедура мониторинга жалоб с активной корректировкой в статусе "Ожидает закрытия ГА"
select
 TD.TroubleDay as TroubleDay
 ,TD.Percent as Percent
 ,TD.DayType as DayType
 from table(INCOM.CalcTroubleDays('3985436', '01.12.2016', '20.12.2016', '487316;')) TD
order by to_date(TD.TroubleDay,'dd.mm.yyyy');

select t.*, t.rowid from TURCHIN.POPUP_MESSAGE_TABLE t  --сообщения о событиях
where t.message_text like '(*Trouble%' and t.userlogin = 'HDUSER'

