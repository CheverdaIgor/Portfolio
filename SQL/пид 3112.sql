INCOM.CanCreateProblem3112  --��������� �������� ������ ����� ��������� ��� ProblemID=3112
INCOM.IsActiveFor171  --���������� ������� �������� ����������  ��� �������� ����� ��� MSISDN
INCOM.GetAccDICTVALUE  --���������� ������� �������� ����������  ��� �������� ����� ��� MSISDN
INCOM.GetCustomerEntity

INCOM.GetStartFrom  --���������� �������� ��� ���� "������� �" ��� ���

incom.getdeliveryemailforecp  --���������� ����� ����������� �����, �� ������� ���������� ��������� ���������������� ����
incom.getaccdictvalue  --���������� ������� �������� ���������� ��� �������� ����� ��� MSISDN

INCOM.GetDictionaryInfo  --��������� ������� ������ ����������� ���. ��������� ��� ���
select t.*, t.rowid from INCOM.DICTIONARYINFO t;
select t.*, t.rowid from INCOM.PID2DICTID t;  --��������� ���������� �� DICTORDER

INCOM.CanSentToMobileOperator  --�������� �������������� ������ �������� ���������� ��������� � ������ �����������
select decode(count(*),0,0,1)
  from INCOM.MobileOperatorsCodes
  where CodeValue = SUBSTR('989719292',1,2);


select t.*, t.rowid from US.REPOSITORY t
where coid = 120351;  --��������� ��� ������������ ��� 3112

