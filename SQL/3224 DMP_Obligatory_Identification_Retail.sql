select t.*, t.rowid from VALERA.CUSTOMERINFORMATIONTABLE t;  --������ � ����������� �� ������� ������ ��������
select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t;  --������ � ����������� �� ������ ��������
select t.*, t.rowid from VALERA.FTTB_INFORMATIONTABLE t;  --������ � ����������� �� �������� ����� ��

incom.DMP  ---package body

INCOM.SendSMS2  --������� �������� SMS
select t.*, t.rowid from VALERA.SEND_SMS_TABLE t
order by t.sms_id desc;

INCOM.CheckIdentification  --��������� ��������� ������ ����������� �� ������ �������� ��� ��
INCOM.DMP_CheckIdentification  --��������� ��������� ������ ����������� �� ������ �������� ��� �� � ������� DMP
  --�������� ��� ����������� ������������--
  if p_Number in ('989719230', '989719232', '989719233', '3985436') then
    v_dmp_respon�e := '{"success":false,"statusCode":404,"error":{"description":"Notfound."}}';
  else
    v_dmp_respon�e := '{"success":true,"statusCode":200,"data":{"msisdn":380975555157,"sysId":"sourceSystemId","name":"string","surname":"string","patronymic":"string","docType":"string","docSeries":"string","docNumber":0,"personalTaxId":"string","birthday":"1996-11-11","sex":"string","email":"string","country":"string","region":"string","area":"string","city":"string","street":"string","building":"string","apartment":"string","organisationName":"string","edrpou":0,"reasonId":"string","bank":"string","orderId":"string","comments":"string","startDateTime":"2018-10-1019:54:00"}}';
  end if;
  --�������� ��� ����������� ������������--
INCOM.GetFMCLinkPhoneByAccount  --���������� �����/�� FTTB (FMC)
select t.*, t.rowid from INCOM.BIS_FMC_LINKPHONEBYACCOUNT t;  --�� �������� FTTB(' || p_AccFTTB || ') ���������� ������ FMC (PrePaid)

INCOM.CheckFMCStatus_2  --������� �������� ������� ������ FMC �� ������
select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t  --Asoid
where t.Msisdn like '%98971923%';
incom.fmc  --����� ��� ������ � ����������� �� "������� ��������" (������ FMC)
INCOM.VerifyAvailableRegistration  --��������� ��������� ����������� ����������� (����� 3224)
INCOM.GetPhonesFromMultiAccount  --��������� ���������� ������ ���������, �������� � ��� �� �������������, ��� � ����� ��������/��
INCOM.GroupDeletingRegistrationData  --��������� ��� �������� ������� ����������� ��� ��������� �������� ��������������� ������(����� 3224)
incom.getproblem3224  --��������� ���������� ������ �� ������������ ��������� 3224
incom.getsubscriberinfo3224  --��������� ���������� ������ �� ������������������� ��������
INCOM.GetClientInfoFromDMP  --��������� ���������� ���������� �� �������� �� ������� DMP
INCOM.DMP_GetClientInfo_test  --��������� ���������� ������ � �������� ��������� ��� INCOM.GetClientInfoFromDMP (��� ����������� �������������)
INCOM.GetAICheckInfoPrepaid  --��������� ���������� ���������� ��� ����� ������������� ��� ������������������ prepaid ���������

INCOM.GetAbonentDocument  --��������� ���������� ��� ��������� �� ������ �������� (��� ������������� �� ���� ���������)
INCOM.ConfirmRegistration3224  --��������� ������������� ����������� �������� (PID = 3224)
INCOM.GetChecksList  --��������� ������������ ����������� ������ "��� ��������" (PID = 3224)
INCOM.AbonentWasIdentified  --��������� ��������� ������ �� ������������ �������������
incom.IsSubscriberRegistered  --������� ����������� ������������������� ��������
INCOM.Get_MAC_Addresses  --��������� ���������� ������ MAC-������� (��� PID = 3224)
select t.*, t.rowid from INCOM.SUBS_FTTB_CALLS t;  --Asoid, ������ MAC-�������

INCOM.SendEmailDetailReport173  --��������� �������� ����������������� ������ �� email
INCOM.CanCreateProblem180  --��������� �������� ������ ����� ��������� ��� ProblemID
INCOM.CanCreateProblem3353  --��������� �������� ������ ����� ��������� ��� ProblemID
INCOM.GetUnnamedRegistrationInfo  --��������� ���������� ���������� �� ��������� ������������ ������������� ��������
INCOM.GetChecksList  --��������� ������������ ����������� ������ "��� ��������" (PID = 3224)
INCOM.IsAccountFMC  --������� ��������� �������� �� �� - "�� FMC �������� (�2�)"
