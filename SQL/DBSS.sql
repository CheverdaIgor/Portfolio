INCOM.GetCSRToolboxURL_2  --�������� URL ��� ������� � ���� CSRToolbox
valera.is_customer_prepaid_stis  --��������� ��� ����������� ���� �������� � STIS
valera.is_customer_prepaid  --������� ���������� ��� ��������
select t.*, t.rowid from VALERA.PREPAID_NUMBERS_RANGE t;
select t.*, t.rowid from VALERA.CONTRACT_MIGRATION_LIST t;
valera.Get_Customer_Segment

INCOM.IsCustomerDBSS  --������� ��������� �������������� �������� � ���� DBSS
select E.*, E.rowid from US.EnumTypeValues E where E.TyID = 20068;  --������� DBSS
select t.*, t.rowid from VALERA.CUSTOMERINFORMATIONTABLE t;  --���. � �������� �Customer Care �����������

INCOM.GetCustomerInformation_5  --��������� ���������� ���������� �� ��������
INCOM.IsCustomerFMC  --������� ��������� ���������� �� �������� ������ FMC (Fixed Mobile Convergence)
select t.*, t.rowid from IVR.IVR_FTTB_CONTACTS t;
select t.*, t.rowid from INCOM.BIS_FMC_LINKPHONEBYACCOUNT t;  --����� ��� ��������� �������������� �����

INCOM.CanCreateProblem  --��������� ����� �������� ��� ���� ���������
INCOM.SwitchHDTabs  --��������� ������������ ����� ���������� �� ������� ����� HelpDesk
INCOM.GetTroubles348_5  --���������� ������ �� ������ (PID = 348)
select t.*, t.rowid from INCOM.SERVICESTOTROUBLETYPE t  --������ �������
where troubletypeid in (7,8);
select t.*, t.rowid from TURCHIN.TROUBLE_LIST_TABLE t;  --�������
select t.*, t.rowid from US.ENUMTYPEVALUES t  --���������� ������ ���� ��������
where tyid = 1;

INCOM.GetScratchCodeInfo_1  --��������� ��������� ���������� � scratch ����
select t.*, t.rowid from PREPAIDSCRATCHCARD t  --Asoid, �������� �����
where phone_number in ('989719232', '989719234');
VALERA.Change_Status_Of_Prepaid_Sim_3  --��������� �������� � Prepaid ������ �� ������������� ������ FroudLockout

INCOM.VerifyAbonentInfo_2958  --��������� ��������� ���������� �� �������� ��� ��������� ������� (Problem 2958)
INCOM.VerifyAbonentInfo_1119  --��������� ��������� ���������� �� �������� ��� ��������� ������� (Problem 1119)

--���������� ������� � �� ��� ������ ���� �������� DBSS
valera.troll_count
valera.TROLL_COUNT_RESET

HDReporter.GetApplications_5  --��������� ��������� ���������� �� ����������
HDReporter.GetClaims_2  --��������� ��������� ���������� �� ����������
INCOM.DisplayGreeting  --������� ���������� ���������� �� �����������
