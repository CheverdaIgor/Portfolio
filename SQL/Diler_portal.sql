INCOM.GetSubsInfo4VisitCenterForDLR  --��������� ���������� HTML-�������� � ����������� �� ��������. ��������� ����������� ���
INCOM.Getsubscrinfo4visitcenter_2  --��������� ���������� HTML-�������� � ����������� �� ��������. ��������� ����������� ���
INCOM.DelOldFiles4Problem2715  --�������� ����������� ������-�������� � ��������� 2715 (����� �������� ����� 3-� �������)

INCOM.UserIsDealer  --�������� �� ������������ ����������� ������
incom.getaccountinfofromweb_5
--select t.* from SYS.DBA_USERS t --������������ � ����

INCOM.GetDealers --��������� ������� ������ ���������
INCOM.GetOutletCode --����������� ���� �������� �����
INCOM.GetSalePoint --���������� ������ �������� �����
INCOM.GetDefaultSLPTID --�������-�������� ��� ���������� �������������� ������������ �������� �����

INCOM.CreateUsersForDealer --��������� �������� �������
INCOM.CreateSalePoints --��������� �������� �������� �����
INCOM.SynchDataBis --��������� ������������� ������� � �������� �����
--���. incom.dealers
--���. INCOM.SALEPOINTS
--���. VALERA.DEPARTMENTSTABLE

---���� � ��� IsExternalRole �������� 1, �� ���� - �������, � ���������� ������� - ��������
select t.*, t.rowid from VALERA.PERMISSION_TYPE t
where t.id_permission_type =1 or t.id_permission_type =77 or t.id_permission_type =78;
---�����---
select t.*, t.rowid from INCOM.DEALERS t
where  t.dealerid in (3484, 3844)
--t.dealercode in ('ALEX09', '�����', '2939', '44-502', '44-444')
--��--
select t.*, t.rowid from INCOM.SALEPOINTS t
where t.delr_id in (3484, 3844)
--or t.slpt_code in ('44-444', '44-502', '44-684', 'ST-1', 'ST-2') or t.department_id = '53'--department_id = 452 ��� 622 ��� 65

---��� ����������� ������������ ��������� �������������� ����������� � ������� incom.salepoints
--���� ����� ����, �� ����������  - �������
select t.*, t.rowid
from VALERA.DEPARTMENTSTABLE t
where t.departmentid = 66;
---
--������� ���� \ ������� (valera.v_idm_permission_types);
--������������ ������� (valera.v_idm_departmenstable);
--������� ������ ����������� ������ ( ������������� valera.v_idm_hd_users);
---
select t.*, t.rowid from VALERA.PERMISSION_TYPE t
where t.id_permission_type in (77, 78, 79)
--order by t.isexternaluser;
---
select t.*, t.rowid from VALERA.PERMISSION_ACTION t
where t.id_permission_action in (85, 86, 87, 88)
order by t.id_permission_action desc;
---
select t.*, t.rowid from VALERA.PERMISSION_USER_PROFILES t
where --t.userid = '19692' and 
t.id_permission_type in (77, 78, 79)
order by t.id_permission_type;
                                                 ---������������---
select userid, username, departmentid, userpost, email, phone, userip, programid, programversion, userlogin, userpassword, dateofaddingrecord, prepaidflag, canuserseeprepaidnumbers, canuseraddsupercomments, cancalctariffplans, cansee, supervisor_id, tariff_plan_calc, canseejockers, t.appcontent.getclobval() appcontent, login_id, user_type_id, realuserlogin, rowid
from VALERA.USERSTABLE t
--order by (userid) desc
--where t.userlogin like '%kyltest%' or t.realuserlogin like '%kyltest%'
where t.userid = '19692' or t.userid = '20160';
---
---�������� id_permission_type ��� ������������:
select t.*, t.rowid from VALERA.PERMISSION_USER t
where t.user_id = '20160' or t.user_id = '20136';
---
VALERA.PermissionUserProfiles_BEFORE --������ ��� ������� � VALERA.PERMISSION_USER_PROFILES
--- --- --- --- --- --- --- --- ---
select t.*, t.rowid from INCOM.PROBLEMID4DEALERS t --�������� ���������, ����������� ��� ������������� ��������
--where t.problemid = 1120
--order by t.problemid;
--- --- --- --- --- --- --- --- ---
--������� � ��������
select t.*, t.rowid from VALERA.AGENTSTABLE t
where t.agentname =  'DL_IGORC_62';
---
-- �������� ������������ ������� ������� � ����� �� �� ������
select t.*, t.rowid from VALERA.PERMISSION_USER t
order by t.user_id desc

select t.*, t.rowid from VALERA.PERMISSION_USER_PROFILES t
where t.userid = '20160' or t.userid = '20136'  --�����1 or �����2
--and (t.id_permission_type in (20, 47, 67, 33, 49)
order by t.id_permission_type

select t.*, t.rowid from VALERA.PERMISSION_TYPE_ACTION t
--where t.id_permission_type in (1,77,78)
where t.id_permission_action in (90, 91);
------------------------------
--3.	���������� ��������� �� ������������ ������������� ��� IDM:
--3.1.	������� ���� \ ������� (valera.v_idm_permission_types);
select * from VALERA.V_IDM_PERMISSION_TYPES t
where t.ID_PERMISSION_TYPE in (77,78,79)
--3.2.	������������ ������� (valera.v_idm_departmenstable);
select * from VALERA.V_IDM_DEPARTMENSTABLE t
where t.departmentid in (452, 622)
--3.3.	������� ������ ����������� ������ ( ������������� valera.v_idm_hd_users);
select * from VALERA.V_IDM_HD_USERS t
where t.userid = 20118
order by t.userid desc
------------------------------
INCOM.IsCustomerPSTN
INCOM.IsCustomerHomeInet
------------------------------------------------------------------
--- ������������� ���������: ---
--INCOM.IsNeedAbonentIdetification --��������� ��������� ����� �� ������������� ��������
--INCOM.GetIsAbonentIdetificated --��������� ��������� ��������������� �� �������
--- --- --- --- --- ---
incom.IsCustomerIdentFor_1092 --��������� ������������� �������� ��� ����� 1092
incom.VerifyAccountFor1092 --��������� ��������� �������� �� ��� ����� 1092
------------------------------------------------------------------
select t.*, t.rowid from VALERA.MAINTABLE t
where t.recordid = '4724228155';
--
select t.*, t.rowid from VALERA.MEMOSINFOTABLE t
where t.recordid = '4724228155';
---
--INCOM.GetIdentCount --��������� ��������� ���������� ������� ���������������� ��������
select t.*, t.rowid from INCOM.LOGABONENTVALIDATE t
where t.subscriber like '%989719232%' and t.RECORD_DATE >= trunc(sysdate,'MM') --����������
--INCOM.IsAbonentIdentInProgress --��������� ��������� ���� �� �� �������� ��������� "��� �������������"
--INCOM.GetAICheckTypes --��������� ���������� ��� ���� �������� ��������
--INCOM.GetAICheckVariants: --��������� ���������� ������� ������� ����� � �������� ��������
select t.*, t.rowid from INCOM.LOGABONENTVALIDATE t
where t.subscriber = '989719232'
--INCOM.GetCustomerEntity --��������� ���������� ��� ��������(������ �.�.)
--INCOM.IsCoordinatorByOKPO --������� ���������� ������� ������������ �� ���� � ������ ������������
--INCOM.GetAccountInfoFromWeb_5 --��������� ���������� ���������� �� �������� �� ��
---   ---   ---
select *  --6 ���--
 from valera.problemstable_new PR
 where PR.ISALLOWED = 1 and (pr.problemid = 1120 or pr.problemid = 1092)
 and US.Bitwise.GetBitByNumber(6, PR.Properties) = 0
 order by PR.PROBLEMID
---   ---   ---


---�������� �������������:---
--INCOM.CHECKPASSPORTREGPRD --��������� ��������� ������� ������������������� �������� valera.PREPAIDINFORMATIONTABLE
select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t --����������
---
--INCOM.CHECKAGREMENTDATE --��������� ��������� ���� ���������� ��������
select cl.contract_date, cl.rowid --����������
  from INCOM.BIS_CMB_CLIENTS cl
  where cl.ACCOUNT = '3985436'
--INCOM.GETFIOREGPRD --��������� ���������� ��� ������������������� �������� valera.PREPAIDINFORMATIONTABLE
---2.	�� ������������������� ������ �������� �������������� ����� ������������ (����� �������� ���� � ������� VALERA.PREPAIDINFORMATIONTABLE)
select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t
--INCOM.CheckPersonalPassword --��������� ��������� ������
--INCOM.CheckICC--��������� �������� ������������ ICC � MSISDN
select t.*, t.rowid from WEB.SIMCARDS t --SIM (����� ��������� � �������) ��� �������� �������� PIN, PUK
where t.msisdn like '%98971923%'
--�������� �������, �� ������� ������� �������� ������
select t.*, t.rowid from WEB.CALLHISTORY t
where t.msisdn like '%98971923%'
--�������� �������� �������
select t.*, t.rowid from IVR.IVR_BALANCES t
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'

--INCOM.InforNotSuccessValidate: --��������� �������������� � ������� ����� 50 ���������� ������� �������� ��������, �������� �����
select t.subscriber, count(t.subscriber) --���������� �������
from INCOM.LOGABONENTVALIDATE t
where trunc(t.record_date) = trunc(sysdate) and t.result = 0
group by t.subscriber

select t.subscriber, count(t.subscriber) --����� �������
from INCOM.LOGABONENTVALIDATE t
where trunc(t.record_date) = trunc(sysdate) 
group by t.subscriber

--INCOM.VERIFYLASTCORPORDER --��������� ��������� ��������� ������������� ����
--INCOM.CHECKAGREEMENTDATE --��������� ��������� ���� ���������� ��������
--INCOM.VERIFYFIOCorpSubscr --��������� ��������� ��� �������������� ��������
--INCOM.VERIFYOKPO --��������� ��������� ���� �������������� ��������
--INCOM.CheckBalance --��������� �������� ������� �������� �� ��������� ���� � ������������ ���������
--INCOM.VERIFYCOORDPASS --��������� ��������� ������ ������������

--- 3.8.	��������� ������������� ��������� ---
select t.*, t.rowid from VALERA.PROBLEMSTABLE_new t where t.universalappealtypeid = '3' and t.connectiontype = '1'
and t.isallowed = '1' and t.problemid = '1549'

select t.*, t.rowid from VALERA.PROBLEMSTABLE_new t where t.universalappealtypeid = '4' and t.connectiontype = '1'
and t.isallowed = '1' and t.problemid = '1109'

select t.*, t.rowid from VALERA.PROBLEMSTABLE_new t where t.universalappealtypeid = '5' and t.connectiontype = '1'
and t.isallowed = '1' and t.problemid = '1540'
---VALERA.MAINTABLE
select t.recordid, t.recorddate, t.problemid, t.phonenumber, t.account, t.applicationstatus, t.username, t.rowid
from VALERA.MAINTABLE t
where t.recordid in (4724244199, 4724244200, 4724244201)
order by t.recordid desc
---incom.memorandumsaddition ���������� ��� ������������� �����: 3,4,5
select t.*, t.rowid from incom.memorandumsaddition t
where t.recordid in (4724244207, 4724244209, 4724244210)

---������ �������������� ������� � �������---
INCOM.GetTarifPlansForProblem1092_2 --��������� ������� ��������� �������� ������
select t.*, t.rowid from INCOM.TARIFPLANSFORPROBLEM1092 t --�� ��� ��� 1092
--where t.rtplid = '285';
INCOM.GETINDIVIDPACKETS --��������� "������ �������������� �������, ��������� ��� ��������"
-- ������ �������������� ������� � ������� �������� � �������� web.IndividPacks. ������ ���������� �� ������� ����� ispacket:
select t.*, t.rowid from INDIVIDPACKS t
-- �� ���� ������ ������� � ������� ��������� ����� �������� web.IndividPacksToOKPO
select t.*, t.rowid from INDIVIDPACKSTOOKPO t --ASOID, �������������� ������ � ������
---

Incom.GETCOORDINATOR2OKPO1092: --����������� ��� ��� 1092
select t.*, t.rowid from VALERA.DIR_COORD2OKPO t
where t.okpo = '2917155477'
---
select t.*, t.rowid from INCOM.BIS_IVR_JUR_ADDRESSES t

INCOM.VerifySegment469 --��������� �������� ������������ �������� ��� ������� ��� ����������� ������

INCOM.VerifySimByDepartment --�������� �������������� SIM-����� � ������������� ����������
Incom.UserIsDealer --�������� �� ������������ ����������� ������
select incom.userisdealer(&p_userid) from dual;

select t.recordid, t.recorddate, t.problemid, t.phonenumber, t.account, t.applicationstatus, t.username, t.rowid
from VALERA.MAINTABLE t
order by t.recordid desc

select t.recordid, t.field26, t.rowid
from VALERA.MEMOSINFOTABLE t
order by t.recordid desc

INCOM.GetSegments1092 --��������� ���������� ������ ��������� ��� PID = 1092

INCOM.SendNoactiveDealersReport --��������� �������� e-mail ���� ����������� �������, � ������� �� ���� �� ����� �������� ������

INCOM.SynchDataBis: --��������� ������������� ������� � �������� �����
select t.*,t.rowid from incom.salepoints_test t order by t.slpt_id;
select t.*,t.rowid from bis.sale_point_histories t order by t.slpt_slpt_id;
select t.*,t.rowid from bis.sale_points t order by t.slpt_id;
select t.*,t.rowid from INCOM.DEPARTMENTSTABLE_TEST t;
INCOM.LockAccountUserDealers --��������� ������������ ���� ����������� ������ ������ ���� ����� ����� �������� ������

--���. �����������---
select t.*, t.rowid from INCOM.LOGCHANGESDEALERSPR t
order by t.record_id desc

--����� ���� �������� ���������:
select t.*, t.rowid from TURCHIN.POPUP_MESSAGE_TABLE t
where t.record_id in (82111660,82111661,82111662,82111663,82111664,82111665,82111666,82111667,82111668,82111669,82111670)
--t.validity_date > to_date('29.10.2015', 'dd.mm.yyyy') and t.validity_date < to_date('31.10.2015', 'dd.mm.yyyy')
and t.userlogin = 'DL_IGORC_62';

insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111661', 'DL_IGORC_62', '(*Trouble 487328 *)', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111662', 'DL_IGORC_62', '(*Trouble 487329 *)', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111663', 'DL_IGORC_62', '(*Trouble 487330 *)', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111664', 'DL_IGORC_62', '(*Trouble 487331 *)', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111665', 'DL_IGORC_62', '(*Trouble 487332 *)', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111660', 'DL_IGORC_62', '(*Trouble 487333 *)', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111666', 'DL_IGORC_62', '(*Message*)Բ����� �����-ϲ���Ȫ���� ������� ����� ����������� {A2597456} � ���������, �����', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111667', 'DL_IGORC_62', '(*Message*)Բ����� �����-ϲ���Ȫ���� � ���������, �����2', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111668', 'DL_IGORC_62', '(*Message*)�����-ϲ���Ȫ���� � ���������, �����3', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111669', 'DL_IGORC_62', '(*Message*)������� ����� ����������� {A2597456} � ���������, �����4', (sysdate+1));
insert into TURCHIN.POPUP_MESSAGE_TABLE values ('82111670', 'DL_IGORC_62', '(*Message*)� ���������, ALEX09', (sysdate+1));

update TURCHIN.POPUP_MESSAGE_TABLE t set t.validity_date = (sysdate+1)--t.userlogin = 'DL_IGORC_62'
where t.record_id in (82111660,82111661,82111662,82111663,82111664,82111665,82111666,82111667,82111668,82111669,82111670)
--t.validity_date > to_date('20.04.2015', 'dd.mm.yyyy') and t.validity_date < to_date('22.04.2015', 'dd.mm.yyyy');

INCOM.GetAccountByDopInfo --�������� �� �� ���� ��� ���������� ������

INCOM.MovingSlptToNewDealer  --��������� ���� ����������� �� �� ����� �������
