INCOM.GetRefundScenarioType_2
INCOM.GetRefundApplicationType:
select *
from incom.UniversalApplicationType
---
select t.*, t.rowid  --������� ����������, ���������� �� ����������
 from US.EnumTypeValues t where t.TYID = 10257;
select t.*, t.rowid from INCOM.LOYALTYREASONS t  --������� ����������, ��������� �������� ��� ����������� ���
where t.problemid in '2958'
---
select t.*, t.rowid from INCOM.ProblemTaxValue t where t.problemid in ('2958')  --�������� ������, ��������� �������� ��� ����������� ���


incom.insrefundregistry_4:  --�������� ������ � ������ ��������� �������
select t.*, t.rowid from INCOM.MONEYREFUNDPARAMS t
---
incom.getrefundstatus --��������� ������� �������� ��������
---
select t.*, t.rowid from US.ENUMTYPEVALUES t
where t.TYID = '10257'
---
select ANSWERTEXT, rowid from Incom.UniversalClaimAdditionInfo where recordid = '4724228081' and QID = 6560;
      if v_Answer in ('������� �� ����������� ������', '������� �� ��������� ������')
--- --- ---INCOM.RefundRegistry--- --- ---
select R.*, R.rowid from INCOM.RefundRegistry R
order by R.registryid desc
--- --- --- --- --- --- --- --- --- --- ---
select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
order by t.recordid desc
--- --- --- --- --- --- --- --- --- --- ---
--TURCHIN.TICKETINGTABLE.NOTE
select t.recordid, t.action, t.variant, t.problemstatus, t.externalid, t.uniq_id, t.rowid
from TURCHIN.TICKETINGTABLE t
--where t.recordid = 4724231285
order by t.uniq_id desc
--- --- --- --- --- --- --- --- --- --- ---
--  TicketStatusCC = 0; // �������
--  TicketStatusOrdinal = 1; // ��������������
--  TicketStatusClosed = 2; // �������
--  TicketStatusDefferedProcess = 3; // ���������� ���������
--  TicketStatusApproveWaiting = 4; // �������� ������������
--- --- --- --- --- --- --- --- --- --- ---
INCOM.GetRefundExpert_5
INCOM.IncludePIDInRefund

--������������ ��������  p_Final (1- ����� �������������, 0 - ���������������)
INCOM.GetRefundSum_2 --��������� ������� ����� �������� �� ��������� ������
INCOM.CanCommitProblem348_2
INCOM.VerifyRefundSum_2
INCOM.InsProblem348_8

INCOM.GlobalTroubleMonitoring_2
INCOM.GlobalTroubleFinalCalc

INCOM.InsProblem1020_2:
select BIG_FIELD1 from Valera.MemosInfoTable where RecordID = '4724227747'
---

INCOM.GetRefundCalcEnabled  --�������������� ������ ����� �������� ��� ��
INCOM.IsClaimRefundAvailable_2  --����������� ��������
select t.*, t.rowid  ----------�������� PID ��� ��������, ���������� ������----------
 from US.EnumTypeValues t
  where t.TYID = 20013 and t.TVValue = &p_ProblemID and rownum = 1;
-------------------------------------------------------------------------------------
---
INCOM.Confirmation4LevelInfo: --��������� �������������� � ������� ������ 4-�� ������ �������������
select userid, username, departmentid, userpost, email, phone, userip, programid, programversion, userlogin, userpassword, dateofaddingrecord, prepaidflag, canuserseeprepaidnumbers, canuseraddsupercomments, cancalctariffplans, cansee, supervisor_id, tariff_plan_calc, canseejockers, t.appcontent.getclobval() appcontent, login_id, user_type_id, realuserlogin, rowid from VALERA.USERSTABLE t
where userid = '323'
---
select t.*, t.rowid from INCOM.REFUNDREGISTRY t
where t.recordid = '4724211645' and t.registryid = '4268370'
---
select t.*, t.rowid from INCOM.USERPROFILEBYAPPEALTYPE t  --������� ���� ��� ��������
INCOM.IsPermissionEnabled --����������� � ���������� ������ �������� '������� �������'
INCOM.GetProfileByGroupID --������� ���������� ������������� ������� ��� ������������ StepID, ScenarioType
---
incom.email

--��������� ������� ��������� ���������� ���� (PID = 348 ��� FTTB):
INCOM.CalcTroubleDays
--��������� �������� ������ ��� ���������� ��������� ���������� ���� � ������ ����� ���������� (PID = 348 ��� FTTB):
INCOM.GetCalcTroubleDays_3 --�������� ��������� ������� ������������� � ��� 348
--��������� �������� ����������� �������� � ����� ������������� (PID = 348 ��� FTTB):
INCOM.VerifyCorrectionMode
--�������� ������ ��������������� ��������� (��� �� � ����� PSTN):
INCOM.GetAbonentIDByAccount


INCOM.IsCustomerPSTN
INCOM.IsCustomerHomeInet

VALERA.Is_Customer_Prepaid
Incom.Getabonentidbyaccount


select FIRST_VALUE(ID_PERMISSION_TYPE) OVER (ORDER BY ID_PERMISSION_TYPE ASC)
     from valera.PERMISSION_USER_PROFILES
     where UserID = '292' and ID_PERMISSION_TYPE in (33, --��-ϳ����������� ���������� ����� 1-�� ���� ��� ��������� ��������
                                     49)

--- ��� 3 �� ��:
INCOM.GetSumLimitVKKKResidue
INCOM.GetSumLimitExceptionsResidue
INCOM.GetSumLimitCTOResidue

--- ��������:
HDREPORTER.GetRefundAppeals_5
INCOM.UpdRefundRegistry_3
---
INCOM.GetStorageFilesList
HDREPORTER.GetProblems1020_2

update 
incom.refundregistry 
set status = 1
where 
REGISTRYID in (
 4269544
,4269542
,4269538
,4269537
,4269536
,4269531
,4269530);
Commit;

select t.*, t.rowid
from INCOM.REFUNDREGISTRY t
where --t.CUSTOMERTYPE = 5 and t.Status = 1 and t.ScenarioType = 1
--order by t.registryid desc
--and
 t.REGISTRYID in (
4269544
,4269543
,4269542
,4269538
,4269537
,4269536
,4269531
,4269530
,4269525 --�������� 4-������, ������ 10
,4269581 --�������� 4-������, ������ 10
) order by t.status

--- ---
  if v_Account is null then
    if VALERA.Is_Customer_Prepaid(v_MSISDN) = 0 then
      v_CustomerType := 0;
    else
      v_CustomerType := 1;
    end if;
  else
    if INCOM.IsCustomerPSTN(v_Account) = 0 then
      v_CustomerType := 7;
    elsif INCOM.IsCustomerHomeInet(v_Account) = 1 then
      v_CustomerType := 5;
    else
      v_CustomerType := 6;
    end if;
  end if;
--- ---

select t.*, t.rowid from TURCHIN.TROUBLE_LIST_TABLE t
where t.trouble_id = '487315' --������� ��� ������������ ��� 348

--������ ��� ���������, ������:
--33 ��-ϳ����������� ���������� ����� 1 ���� ��� ��������� �������� 57 ϳ����������� ���������� ����� 1 ���� ��� ��������� ��������
--34 ��-ϳ����������� ���������� ����� 2 ���� ��� ��������� �������� 58 ϳ����������� ���������� ����� 2 ���� ��� ��������� ��������
--35 ��-ϳ����������� ���������� ����� 3 ���� ��� ��������� �������� 59 ϳ����������� ���������� ����� 3 ���� ��� ��������� ��������
--57 ��-ϳ����������� ���������� ����� 1 ���� ��� ����� �������� 60 ������������� �������� ������� 1-�� ������ �� ������ ����������
--58 ��-ϳ����������� ���������� ����� 2 ���� ��� ����� �������� 61 ������������� �������� ������� 2-�� ������ �� ������ ����������
--76 ��-ϳ����������� ���������� ����� 4 ���� ��� ��������� �������� 78 ϳ����������� ���������� ����� 4 ���� ��� ��������� ��������
select t.*, t.rowid from VALERA.PERMISSION_TYPE_ACTION t
where --t.id_permission_type = '76' or
t.id_permission_action in (57, 58, 59, 60, 61, 78)
order by t.id_permission_action;

--������ ��������� ���������:
0-�������� ������� �������������;
1-������ ������ �������������;
2-��������� ������ �������������;
3-������ ������ �������������;
4-��������� ������ �������������;
5-�������� �� ����������� (PID = 348);
6-������������ (PID = 348);
7-��������� (PID = 348);
8-������� �������� �� (PID = 348);
9-������� ����������� (PID=348);
10-������� ��������������� �������������

