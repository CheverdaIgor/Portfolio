--npm run start
INCOM.GetavAvailableEventsXRM  --��������� ����������� ����������� ������ "XRM"
INCOM.Getnumbertypebycall  --��������� ���������� � ������ (MSISDN,ACCOUNT,NUMBERTYPE) �� ������ ������, ���������� � �� �� ���������
INCOM.NeedShowActiveOffer_2  --���� �� ���������� ������ ������� ��� �� (�������� �����������)
OCS.GetContactByANI  --��������� ���������� ���������� � �������� �� ANI � ������� ��� HD
select t.*, t.rowid from OCS.OCSCALLS t;

incom.getcustomerinformation_4  --��������� ���������� ���������� �� ��������
select t.*, t.rowid from VALERA.CUSTOMERINFORMATIONTABLE t;

TURCHIN.HD_GREETING  --TURCHIN.Hd_Greeting
INCOM.DisplayGreeting  --������� ���������� ���������� �� �����������
INCOM.InsMainTable2IVR_3  --�������� ����� ����� ������� IVR � ����������� ����������
select t.*, t.rowid from INCOM.MAINTABLE2IVR t
where t.recorddate like to_date('24.06.2020','dd.mm.yyyy')
order by t.recorddate desc;

select t.actionname, t.actiontype, t.jsondate, t.rowid
from INCOM.XRMLOG t
where t.jsondate is not null
order by t.jsondate desc;

select t.* from VALERA.V_MAINTABLE_FOR_XRM t;

INCOM.GetCSRToolboxURL_3  --�������� URL ��� ������� � ���� CSRToolbox
