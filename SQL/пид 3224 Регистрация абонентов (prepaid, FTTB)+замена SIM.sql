INCOM.InsPrepaidInformationTable  --����������/��������� ���������� �� ������������������� �������� ���� "���������� ����"
INCOM.InsProblem3224  --��������� �� ����������� ��������� �������������� �����
incom.GetActionsForProblem3224  --��������� ���������� ������ ����� ��� Problem 3224
INCOM.GetSubscriberInfo3224  --��������� ���������� ������ �� ������������������� ��������
select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t;  --������ �� ������������������� ��������
select t.*, t.rowid from VALERA.FTTB_INFORMATIONTABLE t;  --������ �� ��
select t.*, t.rowid from VALERA.CUSTOMERINFORMATIONTABLE t;  --���. �� ��������
select t.*, t.rowid  --���������� ������� ��
  from incom.bis_fttb_cont_phone t
  where t.account = '3985436';
----------------------------------------------------------------------------------------------------

INCOM.CheckBalance  --��������� �������� ������� �������� �� ��������� ���� � ������������ ���������
select t.*, t.rowid from IVR.IVR_BALANCES t
where clnt_id = 4073833;

incom.checkcalls  --��������� �������� ������� ������� (� ������ ����-�������)
select t.*, t.rowid from CALLHISTORY t
where msisdn = '989719233';

INCOM.SendEmailFor179  --�������� Email-����������� � �������� ���������� ���������� �� ������ SIM-���� � �������� ��������������
select t.*, t.rowid from VALERA.MAINTABLE t
where recorddate >= to_date('01.02.2018', 'dd.mm.yyyy') and (t.problemid = '179' or t.problemid = '3224')
and t.phonenumber = '989719233';

INCOM.SendSMSFor3224  --��������� �������� SMS-��������� � ����������� ��������
INCOM.CanCommitProblem3224  --��������� �������� ������ ����� ����������� ��� ProblemID 3224
VALERA.OnDeleteCustomerPrep  --Inserting an information about deleted phonenumbers

INCOM.DelCustomerInfoTableFor3224  --�������� ���������� �� ������������������� ��������

select t.*, t.rowid from INCOM.CONTROLSFORPROBLEM179 t;  --��������� (����������� ��� ��������������) � �������������� ��� ����������, ������������ �� ������ �� � ����������� �� ���� ��������

