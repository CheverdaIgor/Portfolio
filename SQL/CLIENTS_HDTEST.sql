/*--��������� ��� ����������� ������������*/
INCOM.PROBLEMBYCUSTOMERTYPE  --������ ��������� ��
INCOM.IsSWAP
INCOM.IsBSS  --������� ��������� ������� �������� BSS
INCOM.IsCustomerDBSS  --������� ��������� �������������� �������� � ���� DBSS(p_PhoneNumber)
incom.IsAccountBSS
VALERA.Is_Customer_Prepaid
INCOM.IsCustomerB2B  --������� ��������� �������������� �������� � ���� b2b (�.�. ��� �.�.+ ����.)
INCOM.IsAccountFMC  --������� ��������� �������� �� �� - "�� FMC �������� (�2�)"
INCOM.IsSubscriberFMC  --������� ��������� �������� �� ������� - "FMC �������� (�2�)"
INCOM.CheckFMCStatus  --������� �������� ������� ������ FTTB �� ������(������������� ��������� ����� ������ -- ������������� ��������)
INCOM.GetAccountFTTB_FMC  --���������� �� FTTB (FMC) (��� ����� PID = 172):
select t.*, t.rowid from INCOM.BIS_FMC_LINKPHONEBYACCOUNT_MMC t;
INCOM.GetFMCLinkPhoneByAccount  --���������� �����/�� FTTB (FMC)
select t.*, t.rowid from INCOM.BIS_FMC_LINKPHONEBYACCOUNT t;
INCOM.IsCustomerPSTN
INCOM.IsCustomerHomeInet
INCOM.CANCREATEPROBLEM  --��������� ����� �������� ��� ���� ���������
INCOM.CanCreateProblemUniversal  --��������� �������� ������ ����� ��������� ��� ProblemID
INCOM.CanCommitProblem  --��������� ����� �������� ��� ���� ��������� ����� �����������
INCOM.GetCustomerEntity_2  --��������� ���������� ��� ��������
INCOM.UpdAppStatus_3  --��������� ���������� �������
INCOM.CreateASSC_2  --������ �� �������� ����������� 0-�� ������ � ���
INCOM.CREATEACCOUNTBIS_2  --�������� �������� ����� ������ � BIS (��������� I.GA.BIS.02)
INCOM.InsProblem1092_12
incom.getaccattributesfrombis_1092  --��������� ����������� � ��� � ���������� ���. �������� �������� ����� ��� ���������  (��� PID = 1092)
Incom.ApplicationsAddition  -- ���. ��� ��� 1092
INCOM.GetLanguageByAccount  --��������� ���������� ���� �������
incom.getsiminfo  --��������� ��������� ���������� � SIM �����
INCOM.IsEDOavailable  --������� ��������� �������� �� ���� "���"

select t.*, t.rowid from VALERA.CONTRACT_MIGRATION_LIST t  --3.1.9  �������� �������� ������ ��������
---incom.getaccountinfofromweb_6---
select t.*, t.rowid from IVR.IVR_CLIENTS_PARTITION t
/*where t.clnt_id = '4378472' or t.clnt_id = '2613030'*/
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834' or t.clnt_id = '7777774'

select t.*, t.rowid from INCOM.BIS_CMB_CLIENTS t
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'

select t.*, t.rowid from INCOM.BIS_CMB_SUBS_SERVICES t /*�������� ����*/
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'

select t.*, t.rowid from IVR.IVR_SUBSCRIBERS t /*�������� ����, ��� 1772*/
where msisdn like '98971923%';

select t.*, t.rowid from INCOM.BIS_IVR_CLIENT t /*RGSC_ID=9"�� ��� ����������", PID1092, BRNC_ID 21 - PDF, pid 170=brnc_id between 1 and 7, ASSC_ID(�����������)*/
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'
or t.clnt_id = '6000001' or t.clnt_id = '6000002' or t.clnt_id = '6000003' or t.clnt_id = '6000004'
or t.assc_id = '1'  --��� ����������� �����������(ASSC_ID)--

select t.*, t.rowid from INCOM.BIS_IVR_ASSOCIATIONS t --��� (������� ������ �����������)
where t.assc_id = '1' or t.assc_id = '2'

select t.*, t.rowid from incom.bis_ivr_subscribers t  /*�������� ����*/
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'
or t.clnt_id = '6000001' or t.clnt_id = '6000002' or t.clnt_id = '6000003' or t.clnt_id = '6000004'
or t.clnt_id = '4073834'

select t.*, t.rowid from incom.bis_ivr_jur_addresses t  --��������� �� ��������, �������� ����������� ��� ������ ������ ����������ջ
where t.clnt_clnt_id = '4073831' or t.clnt_clnt_id = '4073832' or t.clnt_clnt_id = '4073833' or t.clnt_clnt_id = '4073834'
or t.clnt_clnt_id = '6000001' or t.clnt_clnt_id = '6000002' or t.clnt_clnt_id = '6000003' or t.clnt_clnt_id = '6000004'
or t.clnt_clnt_id = '4073834'

select t.*, t.rowid from IVR.IVR_SUBSCRIBERS_PARTITION t  /*�������� ����, ����� ������*/
/*where t.msisdn = 675720208*/
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834'
or t.msisdn = '670000312' or t.msisdn = '670000341'

select * from INCOM.TARIFPLANS t /*�������� �����*/
--where t.hdname like '%��������������%'
order by (t.hdname)

select t.*, t.rowid from IVR.DIR_RATE_PLANS t  --RTPL_ID ������� ������ ���� � �����������

select t.*, t.rowid from incom.siebel_assignment t /*������� ��*/
where t.OKPO = '35363738' or t.OKPO = '35363739'

-- ������ �� incom.getaccountinfofromweb_6:
select t.*, t.rowid from IVR.IVR_JUR_ADDRESSES_PARTITION t
--where t.INN = '1234567822'
--where t.okpo = '38005157'
where t.clnt_clnt_id = '4073830' or t.clnt_clnt_id = '4073831' or t.clnt_clnt_id = '4073832' or t.clnt_clnt_id = '4073833'
or t.clnt_clnt_id = '4073834';

select * from VALERA.CUSTOMER_SEGMENTS t
where t.msisdn = '989719232';

VALERA.Is_Customer_Prepaid  --������� ���������� ��� ��������
select t.*, t.rowid from VALERA.PREPAID_NUMBERS_RANGE t
where t.first_number like '6897%' or t.first_number like '9897%' or t.first_number like '6770%'
--'678000270' BETWEEN first_number and last_number AND rownum=1
--'676711434' BETWEEN first_number and last_number AND rownum=1
--'677280243' BETWEEN first_number and last_number AND rownum=1
select t.*, t.rowid from VALERA.CONTRACT_MIGRATION_LIST t;

select t.*, t.rowid from INCOM.BIS_ACTIVE_PARTITION t

select t.problemid, t.parentid, t.knowledgeaddress, t.rowid
from VALERA.PROBLEMSTABLE_new t /*VALERA.PROBLEMSTABLE_NEW*/
where t.knowledgeaddress not in 'null' and t.parentid = 167
order by t.parentid
--t.problemid = '1009'
--order by t.knowledgeaddress
/*where t.problemnamerus like '%������%'*/

select t.*, t.rowid from VALERA.MAINTABLE t /*���������� 523 ���������, �� ������: 675720208*/
--where t.problemid in (172, 182, 3102)
--where t.phonenumber = '671141411' and t.problemid = '2774'
--where t.recordid = '5689555016'
order by t.recordid desc
--select * from INCOM.MAINTABLEADDITION t where /*t.maintableaddid = '4724215551' and */t.recordid = '4724260841';
--select t.*, t.rowid from INCOM.APPLICATIONSADDITION t where t.recordid = 4724260841;
select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
order by t.recordid desc
where recordid = 5689555017;

select t.*, t.rowid from VALERA.PROBLEMSTABLE t
/*where t.fullproblemnamerus like '%��������� ���������������%'*/
/*where t.UNIVERSALAPPEALTYPEID = 1*/
where t.problemid = '987' and t.isallowed = '1'

Incom.VerifyProblem365_2  --�������� ������� ������� ������
select t.*, t.rowid from INCOM.DIRECTNUMBERSLIST t /*������ �����, ��� 365, ����� ������ ��� �����������, �������� ������ �� 0*/

/*Incom.GetInformationItems_2*/
select t.*, t.rowid from VALERA.PROBLEMSTABLE_new t
where t.problemid in ('516', '1092',/*'1134', '3048' , */'462', '961', '3179'), '3157', '3070', '180', '3014')
or t.problemid = '2818' or t.problemid = '1120' or t.problemid = '330' or t.problemid = '460' or t.problemid = '475'
where t.universalappealtypeid = '3' and t.connectiontype = '1'
and t.isallowed = '1' and t.problemid = '1549' or t.problemid = '1084'
 /*where t.universalappealtypeid = '5' and t.connectiontype = '1'
  and t.problemid = '1540'*/
   /*where t.universalappealtypeid = '4' and t.connectiontype = '1'
    and t.problemid = '1109'*/

select * from INCOM.MAINTABLEADDITION t /*id ������������ ���������� ���������*/
where t.maintableaddid = '4724205049'

select t.*, t.rowid from VALERA.MAINTABLE t /*VALERA.MAINTABLE*/
where t.recordid = '5689605714' or t.recordid = '4724250326' or t.recordid = '4724250323'
 or t.recordid = '4724240536' or t.recordid = '4724240542'or t.recordid = '4724240543'

/*\*��������� ������*\
insert into incom.bis_ivr_jur_addresses
select * from ivr.ivr_jur_addresses_partition where clnt_clnt_id = '4073833'*/

INCOM.GetAccountInfoFromWeb_3
Incom.IsCustomerPSTN
INCOM.IsCustomerHomeInet

select * from INCOM.ERRORLOG t /*��� ������*/
--where t.errortext like '%vtVerifyCanCreateProblem%' and t.errordate >= '26.11.2013'
order by t.errorid desc

--INCOM.GETUNIVCLAIMCALLHISTORY --�������� ������ ��� ������� � ������� "�������" ������������� ������ �� "������� �������" ������� �������
update incom.univclaimcallhistory set recorddate = sysdate+5; /*���������� ������ �������*/
select t.*, t.rowid from INCOM.UNIVCLAIMCALLHISTORY t
where t.phonenumber in ('670000364', '670000341', '670000342', '670000343', 670000344, 670000345, '670000359', '989719232')
and t.userlogin = 'ALEX09'

--������������� �2�:
--INCOM.RegisterM2MAdmin
--INCOM.CheckM2MAdmin

--FUNCTION INCOM.IsContractPhoneActive
--���������� ������ ��������� ����������� ����� ������������(�������/���)

--�� ��������, �����:
--INCOM.GlobalTroubleAuthorization_2
--INCOM.FeatureStatus4Answer
select t.*, t.rowid from US.ENUMTYPEVALUES t
where t.tyid = -140 and t.tvvalue = '9581' or t.tvvalue = '9582'
order by (t.tvid) desc

Incom.RegisterM2MAdmin --����������� �������������� �2�
incom.checkm2madmin --�������� �������������� �2�

INCOM.GetASSCContract --������ ������ ������� ��������

INCOM.GetAddrType --��������� ���� ������. ����������: 1 - ����. ����, 2 - �, 3 - �������

INCOM.GetAccountInfoFromWeb_5 --��������� ���������� ���������� �� �������� �� ��
INCOM.GetSubscriberInfoByWeb_4 --��������� ���������� ���������� �� �������� �� ��� ������ ����� ��

select t.*, t.rowid from VALERA.DIR_COORDINATORS t --�����������
where t.msisdn = '989719231' or t.msisdn = '989719232' or t.msisdn = '989719234'
select t.*, t.rowid from VALERA.DIR_COORD2OKPO t
select t.*, t.rowid from INCOM.COORDINATORACCESSLIST t

select t.*, t.rowid from INCOM.ADDRESSINFO t --����������� �������� ���.
order by(t.recordid) desc

INCOM.GetAddressTypeByPID --��������� ������� ������ ��������� ����� ������� ��� ������������� PID
select t.*, t.rowid from INCOM.ADDRESSTYPEBYPID t --����������� ���� ������ � ����������� �� PID

--������ ��������� �� ���� ��:
select t.*, t.rowid from VALERA.PROBLEMSTABLE_NEW t
where coid = 10531

incom.getanymsisdnbyokpo --����������� ������ ��������, �� ����. ����

----------------------------------------------------------------------------------
select * from INCOM.ERRORLOG t
--where t.errortext like
--'%The number of items cannot be greater than 64, if the EditValueFormat is cvfInteger%'
--'%vtCaptionForm: �� ������ ��������� ��� �������� ��� ��������� ������ ������ (dataset)%'
--'%�������: cdsData: ����� ������ (Dataset) �� � ������ �������������� ��� �������%'
order by t.errordate desc;
----------------------------------------------------------------------------------
select * from valera.send_sms_table --�������� ���
order by sms_id desc
---
---���������� ������ "������������� ���������"(��������� �������� "������� ��������")
select RP.PROBLEMID, RP.Resultid, RT.Resultname, RP.REACTIONID, R.REACTIONNAME, RP.rowid
        from Incom.ReactionByProblem RP
        inner join Incom.Reactions R on R.ReactionID = RP.ReactionID
        inner join INCOM.TalkResults RT on RT.Resultid = RP.Resultid
        where RP.ProblemID = '2562';
---
select t.*, t.rowid from TURCHIN.TROUBLE_LIST_TABLE t --�������
order by t.trouble_id desc

--ID Bis �� ID HD ��� ��������� ������
select INCOM.GetAddrParamBISID('district', 4088) from dual  --4647003
select INCOM.GetAddrParamBISID('region', 2682) from dual  --6
select INCOM.GetAddrParamBISID('city', 124556) from dual  --727
select INCOM.GetAddrParamBISID('street', 584629) from dual  --18096296
select INCOM.GetAddrParamBISID('zip', 19059) from dual  --17404

---��������---
select --����������� ������������� ��� ��� 348
      cast(case when (substr(TLT.PROBLEM_NAME,1,35) = '����������� ����� � ������������� (' or instr(tlt.problem_name,'is not reachable')> 0) and decode(TLT.ServiceList, '311;', 1, 0) =1 then 1 else 0 end   as number)         as AutoTrouble
      ,cast(decode(TLT.ServiceList, '311;', 1, 0) as number) as NetworkTrouble -- 1 - ������� ������
 from TURCHIN.Trouble_List_Table TLT
where TLT.Trouble_Id = '487303'

select t.*, t.rowid from TURCHIN.TROUBLE_LIST_TABLE t --�������
where t.trouble_id = '487303'
order by t.trouble_id desc

select ANSWERTEXT, rowid --if v_Answer in ('������� �� ����������� ������', '������� �� ��������� ������')
 from Incom.UniversalClaimAdditionInfo
  where recordid = '4724228081' and QID = 6560;

select t.*, t.rowid from INCOM.REFUNDREGISTRY t --���.�������
order by t.registryid desc

--��� ����������� �������� - VALERA.Get_Customer_Segment
select VALERA.Get_Customer_Segment('989719234',0) from dual --��� �����.
select VALERA.Get_Customer_Segment('3985438',1) from dual --��� ��.

select t.*, t.rowid from STARCLUB.STCDISCOUNT t  --�������� � ������� ��������

select t.*, t.rowid from INCOM.DIRECTNUMBERSLIST t --��� ����������� ������ ������ ���� ����� 0
where t.msisdn like '%98971923%'

Valera.Get_Customer_Segment --����������� ��������
INCOM.GetControlsForProblem179: --��������� ���������� ����� ����������� ����� ������������� ��������
select t.*, t.rowid from INCOM.AICHECKTYPES t
select t.*, t.rowid from INCOM.CONTROLSFORPROBLEM179_NEW t
Incom.GetIdentificationType  --��������� ��������� ��������� ��� �������� ��������� �� ������

update INCOM.VIRTUALMSISDN t set t.apprecordid = null --��� ���������� ��� 1142
where t.msisdn = '989719232';
select t.*, t.rowid from INCOM.VIRTUALMSISDN t; --��������

INCOM.GetInformFieldsAnswer  --��������� ���������� ����� ��� ��������������� ����
incom.getinformfieldsanswer_1252  --��������� ���������� ��������� �������� �������� ����
select t.*, t.rowid from INCOM.ALARMS_TEST t  --��������� �������� ������� ������� ���� 3G

--INCOM.IsCustomerFMC  --������� ��������� ���������� �� �������� ������ FMC (Fixed Mobile Convergence)
select t.*, t.rowid from INCOM.BIS_FMC_LINKPHONEBYACCOUNT t;
--if (upper(v_ClntType) = 'PSTN' and v_RegistrCat in (5, 6)) and  v_ClntClassID = 51 then
--return 1;

select t.*, t.rowid from INCOM.PROBLEMBYCUSTOMERTYPE t  --������������ ��� ���������� ������ � ��

select Incom.GetCustomerEntity(null, 989719232)  --1 '���������� ����', 2 '����������� ����'
from dual;

-- DEBUG
  if SYS_CONTEXT ('USERENV', 'SESSION_USER') = 'SYS' then
    INCOM.SETCONTEXTFORUSER('DL_HDUSER');
  end if;
-- END DEBUG

--insert into INCOM.BIS_IVR_SUBSCRIBERS(
select '50' || trunc(DBMS_RANDOM.VALUE(1000000, 9999999)) msisdn,
          t.subs_id,
          t.clnt_id,
          t.rtpl_id,
          t.sbst_id,
          t.sdate,
          t.pers_clnt_id,
          t.activation_date,
          t.stnd_id,
          t.status_date,
          (select part from incom.bis_active_partition) part,
          t.ncls_ncls_id,
          t.def
     from INCOM.BIS_IVR_SUBSCRIBERS t
     join INCOM.BIS_IVR_SUBSCRIBERS s
       on 1 = 1
    where t.msisdn = '989719234'
      and rownum < 501--)

