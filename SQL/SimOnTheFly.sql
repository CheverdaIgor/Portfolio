INCOM.CanCreateProblem3524  --��������� �������� ������ ����� ��������� ��� ProblemID=3524
INCOM.SendSMS2  --������� �������� SMS
INCOM.CanSentToMobileOperator  --�������� �������������� ������ �������� ���������� ��������� � ������ �����������
INCOM.MCPSReservNumbers  --��������� ���������� ������ ����� MCPS
INCOM.VerifyPhoneNumber3524  --��������� �������� ������ ��� ���������� � ������� (PID 3524)
INCOM.GetNumbersFromCache  --������� ����������������� ������� �� ���� (PID 3524)
web.soap.SubmitOrder  -- ���������� ���� ������� ��� 3524:
select t.*, t.rowid from INCOM.RESERVEDNUMBERCACHE t
where dealerlogin = 'HDUSER'
order by t.msisdn;

--�������� ������ �� ���� � ������ �������:
INCOM.Get_NKP_NumbersFromCache  --������� ����������������� ������� �� ���� ��� ���(PID 1092, 3179)
--����� ��� ��� ���������� �����, ��������� ���� �� � ���� ��� ����� 20 �������, ���� ���� ����������, ���� �� �������,
--�������� INCOM.GetMSISDNListFromBISSWAP  - ����������� ���:
INCOM.GetMSISDNListFromBISSWAP  --��������� ��������� ������ �������
--��� ���������� ������ � ������� �� �����, �������� � ����, ��� �� �����������:
INCOM.Check_NKP_ReservedNumbers  --��������� �������� ������ ��� ������ �� ���� �������
--��� 1092 ������ ����� ���:
select t.*, t.rowid from INCOM.NKP_RESERVEDNUMBERCACHE t
order by t.enabled desc;

INCOM.GetTarifPlansForPrePaid  --������� �������� ������ PrePaid (PID 3524)
select t.*, t.rowid from INCOM.TARIFPLANSFORPREPAID t;  --������� �������� ������ PrePaid
select t.*, t.rowid from INCOM.REGIONTARIFPLANSFORPREPAID t;  --������� ������������ �������� ������ PrePaid
select t.*, t.rowid from INCOM.REGIONTPAREABORDER t;  --������� ��������

--DL_HDUSER->TOWNID=123393
--HDUSER->TOWNID=150710

--�� ������: web.soap.GetStatusOrder   ���������� �����
INCOM.GetStatusOrder  --��������� ��������� ������� ������
