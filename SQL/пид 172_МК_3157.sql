INCOM.InsProblem3157  --�������� ������ �� ��������� "��������������� � ������������ �� ���������� ����"
INCOM.InsProblem172_10  --�������� ������ �� ��������� "��������� �� ���������������"
INCOM.AvailabilityProblem3157  --��������� ��������� ������� � ���������� ������������� ��������� "��������������� � ������������ �� ���������� ����"
INCOM.GetProblem3157  --��������� ���������� ������ �� PID 3157
select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where recordid in ('1212121212', '5689566475');

INCOM.GetControlsForProblem172  --��������� ���������� ����� ����������� ����� �� ����� 172
select t.*, t.rowid from INCOM.CONTROLSFORPROBLEM172 t;

select t.*, t.rowid from VALERA.MAINTABLE t
where recordid in ('1212121212', '5689566475', '5689568018');

INCOM.SendEmailFor3157  --��������� �������� email ����������� � ������������������ �� ��������� ����� ���������� �� ���������������� � ������������ ���� �� ���������� ����� ������� ��������
INCOM.AutoChangeStatusApp3157  --��������� ����������� � ������������� ��������� ��������� PID=3157 � ������ ���������

