INCOM.GetTroubles348_5  --���������� ������ �� ������ (PID = 348)
INCOM.Getcalctroubledays_3  --��������� �������� ������ ��� ���������� ��������� ���������� ���� � ������ ����� ���������� (PID = 348 ��� FTTB)
INCOM.GetCalcTroubleDays_4  --��������� �������� ������ ��� ���������� ��������� ���������� ���� � ������ ����� ���������� (PID = 348 ��� FTTB)
INCOM.CalcTroubleDays_2  --��������� ������� ��������� ���������� ���� (PID = 348 ��� FTTB)
INCOM.GetFinancialLossesTrouble  --������� ���������� ����������� �������� "���������� ������"


select * from valera.send_sms_table --�������� SMS
order by sms_id desc;

select t.*, t.rowid from TURCHIN.TROUBLE_LIST_TABLE t --�������
where t.trouble_id in (3525019);
incom.GetSubscriberCount  --���������� ��������� ��
select t.*, t.rowid from INCOM.VIASAT_ACTIVITY t;  --�� ��������
select t.*, t.rowid from INCOM.SMSTEMPLATESFORTROUBLEFTTB t;  --������� ��������� �� ���������

select t.*, t.rowid from INCOM.REFUNDREGISTRY t --������
where t.registryid = '4268272';

INCOM.GlobalTroubleMonitoring_2 --��������� ����������� ����� � �������� �������������� � ������� "������� �������� ��"
select
 TD.TroubleDay as TroubleDay
 ,TD.Percent as Percent
 ,TD.DayType as DayType
 from table(INCOM.CalcTroubleDays('3985436', '01.12.2016', '20.12.2016', '487316;')) TD
order by to_date(TD.TroubleDay,'dd.mm.yyyy');

select t.*, t.rowid from TURCHIN.POPUP_MESSAGE_TABLE t  --��������� � ��������
where t.message_text like '(*Trouble%' and t.userlogin = 'HDUSER'

