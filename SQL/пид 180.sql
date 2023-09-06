Incom.InsProblem180_6  --�������� "��������� �� ������������� ��������"
INCOM.CanCommitProblem180  --��������� �������� ������ ����� ����������� ��� ProblemID 180
INCOM.CheckAbilityCloseSubs  --ASOID: �������� �������� 989719232 �������� ����� 3985436 �� ��������: ������������ ������. ������� �� ������.
select t.*, t.rowid from INCOM.BIS_IVR_SUBSCRIBERS t
where msisdn = '989719232';
select t.*, t.rowid from INCOM.BIS_IVR_CLIENT t
where account in ('3985435', '3985436');

INCOM.GetOKPOByAccount  --������� ���������� ���� �� ������ �������� �����
select INCOM.GetOKPOByAccount(3985436) from dual;

INCOM.GetPassportInfoByAccount  --������� ���������� ����� � ����� ��������� �� ������ �������� �����
select incom.getcustomerentity(3985438, null) from dual  --��������� ���������� ��� ��������
select incom.iscustomerpstn(3985436) from dual  --������� ���������� ��� ������� ��������� � ���
select incom.iscustomerhomeinet(3985436) from dual  --������� ��������� ���������� �� �������� ������ ��

INCOM.IsCustomerFMC  --������� ��������� ���������� �� �������� ������ FMC (Fixed Mobile Convergence)
select incom.iscustomerfmc(3985436, 'ACCOUNT') from dual
select t.*, t.rowid from INCOM.BIS_FMC_LINKPHONEBYACCOUNT t  --�����������, ���������� �� � �� ������ FMC

INCOM.CheckTransferBalance  --��������� �������� ����������� �������� ������� (� ������ PID = 180)
select t.*, t.rowid from BALANCETRANSFERCOST t  --Asoid, ������ ��� �������� � �� �� ��

select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where recordid in ('5689553945');

--��� 180 - ���������
--��� 2786 - ����
--��� 1328 - ��

INCOM.GetGroupAppTree_2  --��������� ���������� ������ �����������
INCOM.GetCurrentContextValue  --��������� �������� �� SYS_CONTEXT �� ��������/�����
INCOM.GetAbonentIDByAccount  --�������� ������ ��������������� ��������� (��� �� � ����� PSTN)
INCOM.GetAccounts180  --��������� ���������� ������ ��(�������� '��������� �� �� �������� �������')

INCOM.CanCreateProblem180  --��������� �������� ������ ����� ��������� ��� ProblemID
-- ���� ������� "���������� ����" � �� ��� �� ���������� ����, ������� ��� ��� "�������� ��������"
      if INCOM.GetCustomerEntity(p_Number, null) = 1 and INCOM.GetOKPOByAccount(p_Number) is null then
        INCOM.SetCurrentProblemContext('ABONENTTYPE', 2); -- ������� "�������� ��������"
<<< �.�. ��� ����, �.�. ��� ����(���� ������)

INCOM.UpdAppStatus_2  --��������� ���������� �������
INCOM.GetUpdAppStatusText  --��������� ���������� ����� ���������, ��������� ����� ���������� �������
valera.save_subs  --��������� save_subs
INCOM.GetRestActions  --��������� ���������� �������� ��� ����������� ������ "������� ���������� ������� �����" (��� PID = 180, 1328)
