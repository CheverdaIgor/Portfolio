INCOM.UpdTroubleListTable_5  --Редагує запис про аварію

select t.*, t.rowid from TURCHIN.TROUBLE_LIST_TABLE t;

select * from valera.send_sms_table --отправка SMS
order by sms_id desc;

select t.*, t.rowid from BI4INTF.VIASAT_ACTIVITY t;

select t.isopen, t.NotifyAlreadySent, t.forallsubscribers, t.finish_date, t.rowid
from TURCHIN.TROUBLE_LIST_TABLE t
where problem_name like 'ди_3';

select t.*, t.rowid from INCOM.TVUSERSTROUBLESENTSMS t;
