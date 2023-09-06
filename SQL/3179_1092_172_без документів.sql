INCOM.CheckConnectivity  --��������� �������� ��� ������� �� ������ "�������� ����������� �����������" (PID = 3179)
INCOM.IsAccountWithoutDocs  --������� ��������� �������� �� �� - "�� ��� ����������"
select t.RGSC_ID, t.clnt_id, t.rowid from INCOM.BIS_IVR_CLIENT t /*9-� ������� ���� ���������*/
where t.clnt_id in ('4073831', '4073832', '4073833', '4073834');

INCOM.GetTypeApplicationForms  --��������� ���������� ��� �������������� �����
INCOM.GetPhoneNumberList1462  --��������� ��������� ������ ���� ����������� ������� � ��������� �� ����� ����������
INCOM.CanCreateProblem1462  --��������� �������� ������ ����� ��������� ��� ProblemID=1462
INCOM.InsProblem1462_4  --�������� ������ �� ��������� "��������� �� ����� ����������"
INCOM.CanCommitProblem1462  --��������� �������� ������ ����� ����������� ��� "��������� ����������" (PID 1462)
select /*+index (m IX_MAINTABLE_PHONENUMBER_ACC)*/ max(M.RecordDate)  --'�� 91-� ���� ������ �� ����� ���������� �� �� ���� ���������� �� �����������'
          from VALERA.Maintable M
          inner join Valera.Applicationsinfotable A on M.RecordID = A.RecordID and A.Field22 = 3
         where M.ProblemID = 1092
           and M.Account = 3985436
           and M.ApplicationStatus <> '��������';

select t.*, t.rowid from VALERA.MAINTABLE t
where recordid in (5689577870, 5689577868);

INCOM.IsLegalAccountWithoutDocs  --������� ��������� �������� �� �� - "�� ��� ����������" ��� ��.���
INCOM.AutoProcessApp172  --��������� �������������� ��������� ��������� 172
INCOM.SendEmailFor1092  --��������� �������� email ����������� �� ������� �� ����������� ��� ����������

