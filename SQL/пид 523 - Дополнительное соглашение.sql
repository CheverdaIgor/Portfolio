--function valera.Get_Customer_Segment  --�������
select valera.get_customer_segment('989719232', 0) from dual;

select t.*, t.rowid from INCOM.ADDITIONALAGREEMENTATTRIBUTES t
where t.agreementtype = 6 and t.isallowed = 1;

INCOM.IsAbonentNewFor523  --�������� ������ �������:::
select incom.isabonentnewfor523(989719232) from dual;

INCOM.GetSubscriberInfo  --������ � BIS � ������� ����� ��������
INCOM.GetContractDateByPhoneNumber  --���� ����������� ��������

select t.*, t.rowid from VALERA.CONTRACT_MIGRATION_LIST t  --������������ �������, �������� ��������� � prepaid, ���� ��� ����� ������������ � �������

INCOM.CanCreateProblem523
INCOM.GetActions523_2  --�������� ����������� �������� ��� ��������
INCOM.GetPhoneListByAccount  --�������� ������ ������� ��������� �� �������� �����("�������������� �����")
INCOM.VerifyFixedAdditionalAgreement  --�������� ������� ������������ ��������������� ����������
INCOM.GetAgreementTypes_2  --���� �������������� ���������� ��������� ��������
INCOM.GetAgreementAttributes_4  --��������� ���������� �������� ��������������� ���������� ��� ���������� ��

INCOM.GetAgreementCancelAttributes_4  --��������� ���������� �������� ��������������� ���������� ��� ��������� ����������� �������� ��
select t.*, t.rowid from STARCLUB.STCDISCOUNT t  --�������� � ������� ��������
select t.*, t.rowid from INCOM.SUBSPENALTY t  --��� ����������� ��, �������� "��������� �����������" ����������*/
where t.msisdn = '989719231';

INCOM.GetGroupAppDetails_5  --��������� ���������� ������ �����������
INCOM.VerifySMEChannel431  --��������� �������� �������� �� ������� ������������ � ������� �� � �����
