INCOM.CheckSIMPairStatus  --��������� ��������� ������ ������ ���-���� �� ������ ��������
INCOM.GenContractTmpPwd  --���������, ������� ���������� http-������ �� ������� ������� ��� ��������� ���������� ������
--p_password => 'HEv9@zBFkRvB60CB'

INCOM.VerifyContractTmpPwd  -- ���������, ������� ���������� http-������ �� ������� ������� ��� �������� ���������� ������
INCOM.VerifyFreeChangeSIMTmpPwd  --��������� ��������� ����������� ������������� �� ���������� ������ (��� ���������� ������ SIM-�����)

INCOM.GetCoordinatorType  --������� ���������� ��� ������ ������������

INCOM.VerifyFreeChangeSIMTmpPwd  --��������� ��������� ����������� ������������� �� ���������� ������ (��� ���������� ������ SIM-�����)
select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t;  --ASOID: ������ �������������� ��� � ������� ����������� ��� ��� ���������� (��. 3.4)

select t.*, t.rowid from IVR.IVR_CLIENTS t  --ASOID: ����� �������� ��������� � ������� ���������� ������ ��� ������ (��. 3.3)
where t.clnt_id = '4073832';

valera.get_customer_segment  --�������
select US.Bitwise.GetBitByNumber(6, p.Properties), p.ProblemID  --� ���� valera.problemstable_new.Properties ���������� 6 ��� = 1
from Valera.Problemstable_new p;

