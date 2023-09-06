select t.*, t.rowid from VALERA.PERMISSION_TYPE_ACTION t
where t.id_permission_action in (79, 80, 81)
and t.id_permission_type = '1'
order by t.id_permission_action;

select t.*, t.rowid from VALERA.PERMISSION_USER_PROFILES t
where t.userid = '19692'
and t.id_permission_type in (1, 10, 20, 28, 29, 47, 61, 67)
order by t.id_permission_type;
---
select t.*, t.rowid from VALERA.PERMISSION_TYPE_ACTION t
where t.id_permission_type in (1, 10, 20, 28, 29, 47, 61, 67) and t.id_permission_action in (79)
order by t.id_permission_type;

select t.*, t.rowid from VALERA.PERMISSION_TYPE_ACTION t
where t.id_permission_type in (20, 28, 29, 47, 67) and t.id_permission_action in (80)
order by t.id_permission_type;

select t.*, t.rowid from VALERA.PERMISSION_TYPE_ACTION t
where t.id_permission_type in (47, 67) and t.id_permission_action in (81)
order by t.id_permission_type;


INCOM.GetReactionList2503 --���������� ������ ������� ��� PID=2503 �� ��������, ����� ���������
(--INCOM.GETCOORDINATORINFOFORLC)
INCOM.GetEmailByName
TURCHIN.Getemailbyname_2

INCOM.GetTalkResults2503 --��������� ������ ������� ������ ���������
INCOM.GetPhonesFor2503 --���������� �������� ��� 2503

select t.*, t.rowid from INCOM.SIEBEL_ASSIGNMENT t
where t.segment is not null or
t.okpo = '35363738';

select Valera.Get_Customer_Segment(989719231, 0) from dual;

Incom.CanCommitProblem
valera.MemosInfoTable

Incom.GetNewTarifPlanFor2503
Incom.InsHoldAbonentRequest
Incom.CanCreateHoldAbonentRequest
Incom.GetHoldAbonentRequest --���������� �������������� ����� ��� pid2503 "���������� ��������������� ��������"
INCOM.HD_Can_I_Change_TP

--- ����� ��: INCOM.GetTariffsForSave
select t.*, t.rowid from INCOM.TARIFFSFORSAVE t
where t.rtplid = '285'
order by t.rtplid;
--
select t.*, t.rowid from SELFCARE.SC_RATE_PLAN t
where t.rp_id in (277, 337, 220) and t.billing_name in (321, 389, 285)
--
select t.*, t.rowid from SELFCARE.SC_HZ_ID2RATE_PLAN t

select t. recordid, t.field10, t.field23, t.rowid from VALERA.MEMOSINFOTABLE t
where t.recordid in (4724231290, 4724231347, 4724231379, 4724231384, 4724231389)

update Incom.MemorandumsAddition set  --������������� ��������� ���������
fieldvalue = '<PhoneInfo><Number>989719231</Number><CurrentTP>�������������</CurrentTP><NewTP></NewTP><Source>1</Source><CurrRTPLID>285</CurrRTPLID><NewRTPLID></NewRTPLID></PhoneInfo>'
where recordid = 4724231389
and fieldname = 'PhoneInfo';

select t.fieldvalue, t.rowid
from Incom.MemorandumsAddition t
where t.recordid = 4724231389
and t.fieldname = 'PhoneInfo';

--ASOID:
--SubsInfo, ������� ���������� �������� ID ������������ � ������ �������, ������� ����������� ��������� ������ �������
--����� �������� WEB.phonepackets.
--����� ��� �������� ���������� � �������� ���������� SubsServicesDetail
INCOM.CanCreateHoldAbonentRequest --�������� ����������� �������� ������ ������ ��������� pid2503 "���������� �������� �����"
INCOM.GetFeatureActionForSave --���������� Action_id � ���� ������ �������� ������ ��� �������� ���������� ��� ��������� ����� (pid2503)
---
select t.*, t.rowid from PHONEPACKETS t; --����������
---
select action_id
          ,decode(f_order_done_term_en, 'Last day of current month', last_day(trunc(sysdate))+1,
                  'First day of next month', last_day(trunc(sysdate))+1,
                  trunc(sysdate)) as connectdate
      from SELFCARE.sc_feature2actions  a
     inner join SELFCARE.sc_rate_plan p on a.rp_id = p.rp_id
    where a.feature_id = '619'
      and p.billing_name = '285'
      and a.action_type_id = decode('��������� �����', '���������� �����', 1, '��������� �����', 4)
      and sysdate between a.date_from and a.date_to
      and rownum = 1; -- �������������� ������ ���������
---
select t.*, t.rowid from SELFCARE.SC_RATE_PLAN t --�������� ����, ��� ���.989719232 - ��� �������������� ��
where t.billing_name = '285' and t.rp_id = '220';
---
select t.action_id, t.id --WEB.phonepackets.PACKET_ID: 14757
from SELFCARE.sc_feature_param t
where t.rp_id = 220 and t.action_id in (56190001, 56190002)
order by t.param_id;
---
select distinct a.feature_id, p.id --FEATURE_ID: 619
from selfcare.sc_feature_param p 
inner join SELFCARE.sc_feature2actions a on a.action_id = p.action_id
where p.id = '14757';
---
select distinct a.feature_id, f.f_name_ru --�������� ��� ����� ������ � ����� �� �������� selfcare
         from SELFCARE.sc_feature2actions a
         inner join SELFCARE.sc_feature f on a.feature_id = f.feature_id 
         inner join SELFCARE.sc_feature_param p on a.action_id = p.action_id and a.rp_id = p.rp_id
         inner join SELFCARE.sc_rate_plan r on a.rp_id = r.rp_id
         where r.billing_name = to_char(285) and p.id = 14757;
---
---
select t.*, t.rowid from INCOM.FEATURETOGOAL t --�����������(������� �������� ������� ��� SaveDesk)
---
select t.*, t.rowid from SELFCARE.SC_FEATURE t --��� ������(PROCEDURE INCOM.GetPacketTypeForSave)
where t.f_name_ru like '%������ SD(BIZ/Unlim/���)%'
---
select INCOM.IsPermissionEnabled(50, 19692) from dual;
---
INCOM.GetConnectionTargetForSave_2  --���������� ����� ����������� � ����������� �� ���� ������������
select t.*, t.rowid
      from US.enumtypevalues t
     where t.tyid = 10387
       and t.isallowed = 1
       and (t.tvvalue = 1); -- ������ "���������"

INCOM.CanCreateProblem2503  --��������� �������� ������ ����� ��������� ��� ProblemID
INCOM.GetTariffsForSave  --���������� �������� ������� ��� ���������� ��������

Incom.GetPhonePackets  --���������� ������ �������, ������������ � ������
