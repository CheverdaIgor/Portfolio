select t.*, t.rowid from VALERA.PROBLEMSTABLE t
where problemid in (171, 3041, 2379);
select t.*, t.rowid from VALERA.PROBLEMSTABLE_new t
where t.problemid in (171, 3041, 2379);


select t.*, t.rowid from HDREPORTER.APPLICATIONGROUPRELATIONS t  --������ 1 "��������� ������������� ��������"
INCOM.GetAccountByDopInfo  --�������� �� �� ���� ��� ���������� ������
INCOM.GetBranches  --��������� ������� ��������
INCOM.GetASSCInfo_2  --������ ���������� �� ����������� 0-�� ������ � ���
INCOM.VerifyConnectivityFor3041  --��������� ��������� ����������� ����������� ��� PID = 3041
INCOM.GetSegments3041  --��������� ���������� ������ ��������� ��� PID = 3041
INCOM.GetTPListFor3041  --��������� ������� ������ �������� ������ ��� PID=3041
INCOM.CanLoadProblem_5  --��������� �������� ����������� �������� ���������
INCOM.Activation_MS_Subscriber  --��������� ��������� �������� Microsoft
INCOM.UpdAppStatus_2  --��������� ���������� �������
--��������
--������ �� ����
select M.recordid, M.ApplicationStatus, M.ProblemID, M.rowid
  from Valera.MainTable M
  where M.recordid in ('5689550592');

select t.recordid, t.Field32, t.rowid
 from VALERA.APPLICATIONSINFOTABLE t
where t.recordid in ('5689550502', '5689550461') and (sysdate - t.Field32) >= 1/24/60;


INCOM.GetAppStatusLog  --��������� ������� ������� ��������� �������
INCOM.InsProblem3041  --����������� �������� Microsoft
INCOM.CanCommitProblem3041  --��������� �������� ������ ����� ����������� ��� ProblemID 3041

select t.*, t.rowid from OMS.HD_FEATURE995_MICROSOFT t  --������ � ����.���������� ��������

INCOM.GetAccountAttributes  --��������� ���������� ���. �������� �������� ����� ��� ���������
select t.*, t.rowid from INCOM.ACCOUNTATTRIBUTES t  --���. ��� '�������� �������� �����'

INCOM.GetCustomerEntity_2  --��������� ���������� ��� ��������


INCOM.InsProblem3070  --��������� �� ��������������� (MSO 365)
select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where recordid = 5689552291;

INCOM.ReregistrationSubsMS  --��������� �������� � ��������������� �������� MS, ��� 3070
INCOM.GetProblem3041  --��������� ���������� ������ �� PID 3041
INCOM.GetProblem3070  --��������� ���������� ������ �� PID 3070
