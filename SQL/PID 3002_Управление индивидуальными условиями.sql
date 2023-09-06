select t.*, t.rowid from VALERA.CONTRACT_MIGRATION_LIST t  --3.1.9 �������� �������� ������ ��������: ����������� �� �������� ������

select t.*, t.rowid from VALERA.MAINTABLE t  --�������� �� ���������� � ����������� ����� � ������� ������...�
where t.problemid = '469'
order by t.recordid desc

INCOM.CanCreateProblem3002  --��������� �������� ������ ����� ��������� ��� ProblemID=3002
INCOM.CommitProblem3002
select t.*, t.rowid from IVR.IVR_CLIENTS t  --ASOID
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '3'

select t.*, t.rowid from VALERA.PERMISSION_USER_PROFILES t
where t.userid in ('19692', '292') and t.id_permission_type = '84'  --��� � ���� ������������� ���� ������� ������

INCOM.GetSubscriberInfo3002 --��������� ���������� ���������� �� �������� (��� ������� � �������������� ������� PID = 3002)
select t.*, t.rowid from IVR.DIR_RATE_PLANS t;  --���������� ��
------------------------------------------------
select t.*, t.rowid from IVR.IVR_SUBSCRIBERS t  --�� ������
where msisdn in ('989719230', '989719231', '989719232','989719233','989719234')
------------------------------------------------
select t.*, t.rowid from SELFCARE.SC_RATE_PLAN t  --�� Billing_Name �������� RP_ID
where t.Billing_Name = to_char(116) or t.Billing_Name = to_char(351) or t.Billing_Name = to_char(383);
select t.*, t.rowid from Incom.TarifPlans t  --�� RP_ID �������� ��� �� �� �����������
where RTPLID in (96, 285, 310, 304);

INCOM.GetTPList_4  --��������� ������ ��
INCOM.GetASSC4Account3002  --��������� ���������� �� ����������� ���.��� ��� PID 3002
INCOM.GetASSC4Account  --��������� ������ ����������� ���.��� �� ��
-------------------------------ASOID------------------------------------------
select t.*, t.rowid from web.ASSC4ACCOUNT t  --�������������� ����������� ����� ��
select t.*, t.rowid from web.PHYSASSCID t  --�������� ASSC_ID(�� ��������), ASOID
select t.*, t.rowid from web.INDIVIDPACKSTOOKPO t  --�� �������, �������, ASOID
select t.*, t.rowid from web.INDIVIDPACKS t  --�������� �������, �������, ASOID
------------------------------------------------------------------------------

INCOM.GETGROUPAPPDETAILS3002_BY_LIST  --��������� ������� �� ����� '��������� ���������'
INCOM.GetSubsCurIndSet  --��������� ��������������� ������ ������������� �� ������ ��������
select  --����� ������
        S.MSISDN
        ,P.Set_ID      as  Set_ID
        ,P.Set_Name    as  Set_Name
        ,P.Subs_ID
        ,P.rowid
      from INCOM.HD_Subs_CurIndSet P
     inner join INCOM.BIS_Ivr_Subscribers S on P.Subs_ID = S.Subs_ID
     --where S.MSISDN in (989719230, 989719231, 989719232, 989719233, 989719234);
select t.*, t.rowid from incom.bis_ivr_subscribers t  --SUBS_ID ���.������ in (10010, 10020, 10030, 10040)
where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833'  or t.clnt_id = '4073834';
select t.*, t.rowid from INCOM.HD_SUBS_CURINDSET t;  --������ ���.�����

INCOM.GetSubsCurPack  --��������� ������ ������������ �� ������ �������� ������� � �������������� �������, �� �������� � ���.�����
select t.*, t.rowid from INCOM.HD_SUBS_CURPACK t;  --���.������ � ������

INCOM.CanChangeConditions    --��������� �������� ����������� �������� ������ �� ����� ������� (PID 3002)
INCOM.CanChangeConditions_2  --��������� �������� ����������� �������� ������ �� ����� ������� (PID 3002)
INCOM.InsProblem3002_2       --�������� ���������� �� ��������� "���������� ��������������� ���������" (PID = 3002)
select t.*, t.rowid from CHANGESUBSCONDITIONS t  --ASOID, ��������� ����� ������� �� ������
select t.*, t.rowid from PACKSCLOSE4RTPL t  --ASOID, ������ �������� ������������� � ������ ��������� �������


--INCOM.GetStartDateValue ���������� ControlsMask - ����� ������� � �����
--ControlsMask ����:
  0  - ������ �������� ����      -- ������ ��������� "����������" 
  1  - ����������� ����� �ϻ      -- ������ ��������� "����������" 
  2  - ��������������� �����     -- ������ ��������� "����������" 
  3  - ��������������� �������    -- ������ ��������� "����������" 
  4  - ��������������� �����     -- ������ ��������� "���������" 
  5  - ��������������� �������    -- ������ ��������� "���������" 
  6  - ��������                   -- ������ ��������� "���������"

INCOM.VerifySubsCurConditions_2  --��������� �������� ������� ������� ��� ���������� �������� � �������������� ������� (PID 3002)
INCOM.VerifyGroupNumbers_2  --����� �������� �� ��������� ��� ProblemID
INCOM.CanChangeConditions  --��������� �������� ����������� �������� ������ �� ����� ������� (PID 3002)

select S.Subs_ID  --��������� Subs_ID
      from INCOM.Bis_Ivr_Subscribers S
     where S.MSISDN = '989719232'
       and S.Part = (select part from incom.Bis_Active_Partition);

select  --ASOID, ������ �������� ������������� � ������ ��������� �������
                r.subs_id  as "SUBS_ID"                         
               ,r.rtpl_id  as "NEW_RTPL_ID"
               ,r.pack_id  as "PACK_ID"
               ,p.packname as "PACK_NAME"
               ,r.ind_pack as "IND_PACK"
  from web.PacksClose4RtPl r
  inner join web.IndividPacks p on p.packid = r.pack_id
  where r.subs_id = '10010'
  and r.rtpl_id = '285';

INCOM.GetGroupAppTree_2  --��������� ���������� ������ "�����������"
INCOM.CheckAbonentReregistration  --��������� ��������� ���� "���������������"
INCOM.GetProblem172Information  --��������� ������� ���������� �� ��������� "��������� �� ���������������"
--����������� ��������� ��������� ���������� � ����������� �� ���� �������:
select t.recordid, t.field2/*������ �������� �������*/, t.field3/*OldAccount*/, t.field14/*NewCustomerName*/, t.Field15/*NewAccount*/, t.field17/*��� �������*/, t.Field56/*NewOKPO*/, t.Field18/*GeneralAgreement->'111111'*/, t.Field21, t.Field22, t.rowid
from VALERA.APPLICATIONSINFOTABLE t
where t.recordid in ('5689566763');

INCOM.CheckAbonentReconnection  --�������� ����� ���������� ����������� ����� ����� ������������
INCOM.IsGeneralAgreementAvailable  --�������� ����������� ���� ������ �� � ������ ��������� �� ����� 3002

