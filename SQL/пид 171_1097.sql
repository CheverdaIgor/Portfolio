INCOM.IsLiveSignActiveFor171  --���������� ������� �������� ��������� "����� �������" ��� �������� ����� ��� MSISDN
INCOM.GetSubscriberAccountList_5  --��������� ���������� ������, �� �������� ������������ ����� �������� ������� ����� ��� ������ ������� ��������
select t.*, t.rowid from INCOM.BIS_IVR_DLV_ADDRESSES t  --���������� ����� ����������� �����, �� ������� ���������� ��������� ���� � ������� PDF

INCOM.GetAccountAttributes  --��������� ���������� ���. �������� �������� ����� ��� ���������
select t.*, t.rowid from INCOM.ACCOUNTATTRIBUTES t;

--p_DictID in varchar2:
--43 PDF,
--45 LiveSignActive(����� �������),
--65 XML,
--68 TXT,
--66 CancelPrintRifReport(������ ������ ������������������� �����),
--32 ACT Score(����-���),
--67 RegTaxBills(������ ��������� ���������).
select t.*, t.rowid from DICTIONARY_INFO t  --Asoid, INCOM.IsActiveFor171 - ���������� ������� �������� ���������� ��� �������� ����� ��� MSISDN
where t.Account = '3985436';

select t.*, t.rowid from INCOM.BIS_IVR_CLIENT t  --INCOM.IsPDFEnabledFor171: BRNC_ID 21 - PDF, pid 170=brnc_id between 1 and 7
where account = '3985436';

INCOM.GetDeliveryModesByProblem_4  --���������� ������ �������� ��� ������� ��
INCOM.IsAccountInGroup  --���������� ������ �� �� � ������


INCOM.SearchDocsForProblem1097_4  --����� ��������� ��� ��������� ������
select t.*, t.rowid from INCOM.FILEFORPROBLEM1097 t
where t.documentid = '8';  --ASOID, ����� ����������
select t.*, t.rowid from INCOM.DOCSFORPROBLEM1097 t  --����������� ��������� � ���. ���������
where t.recordid = '5689552387'
order by t.recordid desc;
--update INCOM.FILEFORPROBLEM1097 t set t.recorddate =  '01.01.2016' where t.recorddate =  '23.11.2009'
--update INCOM.FILEFORPROBLEM1097 t set t.account =  '3985436' where t.account =  '5556661'

INCOM.AutoSendingDocsByEmail  --��������� �������� ���������� ���������� �� email (job)
select t.*, t.rowid from IVR.XML_BILLS_201609 t  --ASOID

INCOM.GetEmailByName  --��������� ��������� email �� �����
INCOM.InsDocForProblem1097_2  --��������� ���������� � ���������, ����������� � ������ ProblemID 1097
select t.*, t.rowid from INCOM.DOCSFORPROBLEM1097 t  --��������� � ���. ��� 1097 � ������� ��� ����������, 0-�� ���������
where recordid = '5689552268';

select t.*, t.rowid from INCOM.BIS_IVR_DLV_ADDRESSES t;  --e-mail ��� ��������
select t.*, t.rowid from INCOM.Ordersforproblem1097 t order by t.orderid desc;  --Asoid, �������� ������� ���������

select tt.*, tt.rowid from us.enumtypevalues tt  --���������� ������ "�������"
where tt.tyid = 10282;

INCOM.GetSubscriberAccountList_6  --��� 171, ��������� ���������� ������, �� �������� ������������ ����� �������� ������� ����� ��� ������ ������� ��������
select t.*, t.rowid from INCOM.BIS_IVR_CLIENT_DICT_VALUES t;  --����������� �������� e-mail � ������� ��

INCOM.GetDeliveryEmailForECP  --��� 171, ���������� ����� ����������� �����, �� ������� ���������� ��������� ���������������� ����
select t.CLNT_CLNT_ID, t.Email_ECP, t.rowid from INCOM.BIS_IVR_DLV_ADDRESSES t;

INCOM.isECPCheckFor171  --���������� ������� �������� ECP  ��� �������� ����� ��� MSISDN

