INCOM.UpdTroubleListTable_5  --������ ����� ��� �����

select t.*, t.rowid from TURCHIN.TROUBLE_LIST_TABLE t;

select * from valera.send_sms_table --�������� SMS
order by sms_id desc;

select t.*, t.rowid from BI4INTF.VIASAT_ACTIVITY t;

select t.isopen, t.NotifyAlreadySent, t.forallsubscribers, t.finish_date, t.rowid
from TURCHIN.TROUBLE_LIST_TABLE t
where problem_name like '��_3';

select t.*, t.rowid from INCOM.TVUSERSTROUBLESENTSMS t;
