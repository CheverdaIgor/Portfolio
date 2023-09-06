INCOM.CANCREATEPROBLEM3108  --��������� �������� ������ ����� ��������� ��� ProblemID=3108
incom.VerifyAvailabilityOrder  --�������� ����������� ������ ������ (� PID = 3108)
INCOM.GetAvailableOrderAmount  --��������� ���������� ��������� ����� ������ (��� PID = 3108)
select t.*, t.rowid from INCOM.RESERVEDITEMS t;

INCOM.GetValidServiceNote  --���������� ������� ����������� ��
select t.*, t.rowid from INCOM.SERVICENOTES t;

INCOM.GetClientInfoByOKPO  --��������� ���������� � ������� �������� �� ������� ������ ������ (��� ����������� �� ����������� ������������� � PID = 3108)
INCOM.GetOKPOByCoordinator  --��������� ���������� ������ ���� ���� �� ������� ������������ (��� PID 3108)
INCOM.GetValidServiceNote  --���������� ������� ����������� ��
INCOM.InsProblem3108  --��������� �� ��������� (��������������� �����)
INCOM.InsProblem3111  --��������� �� ��������� (������������� ������)
incom.getdebtsaccountslist  --�������� ������ �� � ����������� �������������
INCOM.InsProblem3108Detail  --��������� ������ �������������� ������� ��� ��������� 3108 � xml-���� � Incom.ApplicationsAddition

incom.GetItems  --��������� ������� �������
select t.*, t.rowid from INCOM.DIR_ITEMS t  --���������� ���������
select t.*, t.rowid from INCOM.ITEMSPROPERTIES t  --�������� ���������
select t.*, t.rowid from INCOM.ERM01030_ASUP_REST_TEL_FOR_B2B t  --�������� �� ������

incom.CheckSerialNumber  --��������� ��������� �������� ������ ���������� (PID = 3111)
select t.*, t.rowid from INCOM.SERIALNUMBERSTEMPTABLE t;

INCOM.GetDeliveryModes3111  --���������� ������ �������� ��� ProblemID = 3111
select t.*, t.rowid from INCOM.DELIVERYMODESFOR3111 t;

INCOM.CanCreateProblem3108  --��������� �������� ������ ����� ��������� ��� ProblemID=3108
INCOM.CanCreateProblem3111  --��������� �������� ������ ����� ��������� ��� ProblemID=3111
INCOM.CANCOMMITPROBLEM3111  --��������� �������� ������ ����� ����������� ��� ProblemID 3111
INCOM.GetRequestsForPreorder3111  --��������� ���������� ������ �� ��������������� �����
INCOM.InitWriteOffItems  --������������� �������� �������� ������
INCOM.checkappstatus3111  --��������� ��������� ����������� ���������� ��������� � ������������ ������� � ����������� �� ������� ��������
INCOM.ContextMenuExecute  --��������� ���������� ����������� ����
INCOM.ContextMenuExecute_3108_3111  --��������� ���������� ����������� ����: '�������� ��� ������' ��� PID = 3108, 3111
                                                                --'�������� ���������� �������� �������' ��� PID = 3111

Incom.GetNewAccount3108  --��������� ����� ��, ����������� � ������ ��������� 3108
INCOM.UpdAppStatus_2  --��������� ���������� �������


select distinct 
                           MT.RecordID, MT.RecordDate     
                       from VALERA.MainTable MT
                      inner join VALERA.ApplicationsInfoTable Ap on MT.RecordID = Ap.RecordID
                      inner join INCOM.ReservedItems R on MT.RecordID = R.RecordID1 and R.Status = 1
                      where MT.ProblemID = 3108
                        and MT.ApplicationStatus in ('�������', '������ �� ����')
                        and Ap.Field1 = '35363738'
                        and Ap.Field30 is null;

select t.recordid, t.field28, t.field30, Field60, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where t.recordid in (5689561867);

select t.*, t.rowid from VALERA.MAINTABLE t
where recordid in (5689561867);

INCOM.CalcSchedulePayments  --��������� ������� ������� ��������
