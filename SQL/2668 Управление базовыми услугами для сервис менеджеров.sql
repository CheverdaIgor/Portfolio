INCOM.IsCoordPassIdentRequired_2668  --������� ���������� ������������� �������� ������ ������������ ��� �������� ��������� 2668
INCOM.GetCoordinatorsFor2668  --��������� ��� ������������ ����������� ������ ����������� ��� PID = 2668
INCOM.GetSubscribersByCoord  --��������� ���������� ������ ������� ���������, ��������������� ������������
INCOM.AutoProcessApp2668  --��������� �������������� ��������� ��������� 2668
select t.*, t.rowid from VALERA.MAINTABLE t
order by t.recordid desc;

select t.*, t.rowid from INCOM.VERIFYSERVICEACTIVATE t  --Asoid
where (msisdn = '989719232') and (serviceid = 15);
