--VALERA.GetSegmentByOKPO
Valera.Get_Customer_Segment

INCOM.GetOutletCode --����������� ���� �������� �����
INCOM.GetSalePoint ---���������� ������ �������� �����
Incom.Dealers
Incom.SalePoints


INCOM.GetTarifPlansForProblem1092_2 --��������� ������� ��������� �������� ������
select t.*, t.rowid from INCOM.TARIFPLANSFORPROBLEM1092 t --�� ��� ��� 1092
--where t.rtplid = '285';
INCOM.GETINDIVIDPACKETS --��������� "������ �������������� �������, ��������� ��� ��������"
-- ������ �������������� ������� � ������� �������� � �������� web.IndividPacks. ������ ���������� �� ������� ����� ispacket:
select t.*, t.rowid from INDIVIDPACKS t  --�������� �������, �������, ASOID
-- �� ���� ������ ������� � ������� ��������� ����� �������� web.IndividPacksToOKPO
select t.*, t.rowid from INDIVIDPACKSTOOKPO t  --ASOID, �� �������������� ������� � �������


--���������� �������� ����� � �����
select t1.dealerid, t2.delr_id, t1.dealername as ������������_������, t1.dealercode as ���_������,
t2.slpt_id as �������������_��������_�����, t2.slpt_code as ���_��������_�����, t2.slpt_name as ������������_��������_�����
from INCOM.DEALERS t1
inner join incom.salepoints t2
on t1.dealerid=t2.delr_id
where t2.slpt_code = '44-502' or t2.slpt_code = '44-444'
-----
INCOM.GETCOORDINATOR2OKPO1092 --��������� ������� ���������� �� ������ ����������� - ����
-----
INCOM.CANSIMACTIVATE --�� ������� ���-�����
--��� ������������ ��� ��������� ��������: 
- �������� ����������� ���������� SIM ����� (����� �� 4.1) ���������� �� �������� web.simcards: SIM ����� ������ ���� � ������� ����� ������� ������ '������������ ������. �� ������� ���-�����.'
- ��� ������ ��������� SIM-����� (����� �� 4.2) � ����� � ���� simcards.connected �� ������ ���� Y, ����� �������� ��������� ������ "���-����� ��� ������������" 
- ������ �������������� ������� � ������� �������� � �������� web.IndividPacks. ������ ���������� �� ������� ����� ispacket
- �� ���� ������ ������� � ������� ��������� ����� �������� web.IndividPacksToOKPO. ����� ��������� ������� ������ � ������ ��� ���������� ����

--��� ������������ ���� �������������� ������ ���������:
- ��� �� ���: 989719231, 989719232, 989719233
- ��� ������: 675505000,675505001,675505002
��� ������������ ����� ������ ����: 35363738 � ���� "��������� ����������� �����������" 
��� ������: ������ ����� �������, ������ ���: 2783800993. ������ ������� ������ ������, ��� ��� � ��������� �� ����������� ���������, ������� �� �������� ������� ���.���� (������ Incom.GetAccountByDopInfo ������ ���������� ���� � �� �� ��� ����� ��.����������), � ������ �� ����� �� �������� ���������� � ���

--��, �����. ������ � ��� ���� ��� ��������, ������� ���������� �������� ���:
GetSubscriberCallsContract � GetSubscriberCallsContract_2
--� ������� �� �� ��� ..._2
--� ���� �������� GetSubscriberCallsContract
--� ��� ��� ��� ������� - �� ���������� 1092

--��������� "������ SIM-����, ������������ �� ����� ����������� ����������"
INCOM.GETDELAYEDACTSIM --������ SIM-����, ������������ �� ����� ����������� ����������
select t.*, t.rowid from REMACTSIM t --ASOID


--��, ��� 516, ��� ����������. ���� �������� ������������� ��������� ��, �� ���������� INCOM.GetGroupAppPhoneCount1092
-- ���� ��������� ��������� ���������� > 0, �� ����� ������ ��������� "� ��������� �������������� ����� ������� %d ������� ���������. ������������ �� ������� ������ ��������� ���������?" 
-- ��������� � �������, ������� ������� � �.2 ������������ �� ��������� INCOM.GetGroupAppPhoneCount1092.
select t.*, t.rowid from INCOM.APPLICATIONSADDITION t
where t.RecordID = 4724240376 and t.FieldName = 'CONTRACT_NUM'


--������ - ��� ����� �������� ivr.srv_applications
select t.*, t.rowid from IVR.SRV_APPLICATIONS t
where t.recordid = '4724240433'
--������ - ��� http ������ � bis
select * from incom.httprequestlog where recordid = '4724240433';

select t.*, t.rowid from VALERA.MAINTABLE t /*VALERA.MAINTABLE*/
where t.recordid = '4724240551'

--������ �� ������ �������� ��� ��������� ������� �������� - �� ��� �������� 14-� ��� � ���� properties:
select problemid, US.Bitwise.GetBitByNumber(14,Properties) as CanChangeGroupStatus 
from VALERA.PROBLEMSTABLE where problemid in (1092,2610,2611);
--��� 1092 - ��� �����, � ������ ����� ����� ������� ������ 1092 ��� ������ ���������� "������",
--�� �������� ��� ��� ��������. ������ ������ ��� 1092 �������� � �������


--INCOM.CreateASSC_2
BEGIN
  -- ��� ������������ ����������
  if p_ZIP = 12345 or p_ZIP_D=12345 or p_ZIP = 12506 or p_ZIP_D=12506 or p_PASS_DATE = TO_DATE('13.11.1979', 'dd.mm.yyyy')
    then
    p_Error_Message := '������������ ��� �� ������';
    p_Error_ID := 60020008;
    return;
  end if;
--INCOM.CreateAccountBis_2
BEGIN
  -- ��� ������������ ����������
  if p_ZIP = 12345 or p_ZIP_D=12345 or p_ZIP = 12506 or p_ZIP_D=12506 or p_PASS_DATE = TO_DATE('13.11.1979', 'dd.mm.yyyy')
    then
    p_Error_Message := '����������� ������';
    p_Error_ID := 100;
    return;
  end if;

--��� 172, ���� ����������� ��� �����
select t.Field25, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where t.recordid = 4724241487

Incom.GETCOORDINATOR2OKPO1092 --��������� ������� ���������� �� ������ ����������� - ����
select t.*, t.rowid from VALERA.DIR_COORD2OKPO t
where t.coordinatorid = '372450' and t.okpo  = '1111111111'
---
select t.*, t.rowid from VALERA.DIR_COORDINATORS t
where t.recordid = '372450' and t.msisdn  = '1111111111'
---
select t.*, t.rowid from INCOM.BIS_IVR_JUR_ADDRESSES t
where t.clnt_clnt_id = '6000020' and t.okpo  = '1111111111'
---
select t.*, t.rowid from INCOM.BIS_IVR_SUBSCRIBERS t
where t.clnt_id = '6000020' and t.msisdn = '1111111111'

