INCOM.CanCreateProblem3108  --��������� �������� ������ ����� ��������� ��� ProblemID=3108
INCOM.VerifyAvailableOrderIndividual  --��������� ����������� �������� ��������� PID = 3108 (��� ����������� ���������)
INCOM.GetSubscriberAccountType  --��������� ���������� ��� �� (����� 3108)
INCOM.GetStocks_2  --��������� ������� �������
INCOM.GetServiceNotesByINN  --��������� ���������� ����� ��������� ������� � ��������� ����� ������ �� ��� (PID = 3108)
select t.*, t.rowid from INCOM.SERVICENOTES t;

select t.*, t.rowid from INCOM.RESERVEDITEMS t  --�������������� ������
order by t.reservid desc;

