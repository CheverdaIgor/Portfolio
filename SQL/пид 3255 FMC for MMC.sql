incom.getactions3255  --��������� ���������� �������� ��� ����������� ������ "��������"
select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t;  --ASOID: ���������� ������ � ����������

INCOM.GetSubscriberInfo3255  --��������� ���������� ���������� �� �������� �� ������������ ��������� �� ���������������
INCOM.VerifyConnectivityFor3255  --��������� ��������� ����������� ����������� ��� PID = 3255, � ������ ������ "������������ ������� FTTB"
-- �������� ������ �� �� FTTB � ������� PrePaid
  select F.*, F.rowid
    from INCOM.BIS_FMC_LinkPhoneByAccount F
   /*where F.Account = '3985436';*/

INCOM.CanCommitProblem3255  --��������� �������� ������ ����� ����������� ��� ProblemID 3255
INCOM.SendEmailFor3255  --��������� �������� email ����������� �� �������� ���������� ���������� �� ����������� �������� �������� �������� � ������� "������ �� ����"
INCOM.ConnectionRequestFTTB_3255  --��������� ������ ������ �� ����������� ������ FMC �� ������������� �������� FTTB � BIS (PID = 3255)

incom.cancommitproblem180  --��������� �������� ������ ����� ����������� ��� ProblemID 180
INCOM.GetAccountFTTB_FMC  --���������� �� FTTB (FMC) (��� ����� PID = 172)
select t.*, t.rowid from BIS2INTF_SCR.HD_FMC_MMC_CLIENT_HISTORY t;  --Asoid, ������ FMC
INCOM.IsReregistrationFTTBEnabled  --��������� ����������� ��������������� FTTB (FMC)

select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t;  --Asoid, ������ FMC, VSERV_ID=265

INCOM.IsAccountFMC  --������� ��������� �������� �� �� - "�� FMC �������� (�2�)"
incom.checkfmcstatus  --������� �������� ������� ������ FTTB �� ������

select t.*, t.rowid from INCOM.VERIFYSIMCHANGE t;  --Asoid, ���. ��� �������� "����������", ��
