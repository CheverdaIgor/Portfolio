Incom.GETCOORDINATOR2OKPO1092  --��������� ������� ���������� �� ������ ����������� - ����
INCOM.SendSMS2
TURCHIN.Getemailbyname_2
INCOM.SearchClient_3
INCOM.IsCoordinator
Incom.GetSubscriberOKPOByPhone
Incom.CanCreateProblem1500
INCOM.InsTicketingTable_4 --�������� ������ � ������� ������������� ���������
VALERA.GetSegmentByOKPO --����������� �������� �������(����)
INCOM.GetCBACoordinatorOKPOList --��������� ������ ���� ������ CBA ��� ������������
INCOM.ChangeCoordinator --��������� �������������� ��������� ���������� �� �������������
INCOM.SendEmailToCoord430 --��������� �������� ������� ������������ �� email

INCOM.GetClientType --��������� ���������� ��� ��������������� �������--
    select sum(incom.IsCustomerPSTN(C.Account)) PSTN, --���� ������ ����� ��� PSTN
           sum(decode(incom.IsCustomerPSTN(C.Account),0,1,0)) MOBILE    
    from IVR.Ivr_Clients C
    inner join incom.bis_ivr_jur_addresses J on C.Clnt_ID = J.Clnt_Clnt_ID
    inner join incom.bis_active_partition p on j.part=p.part
    where j.okpo = 35363738;

--'����������� ��������� ��������� �� �����������. �� ������� ������ ��� ���� ��������� � ������ �� ��.'--
INCOM.VerifyCoordinatorByOKPO_2 --��������� ���� �� ���������� ������������� � ���� � ���������� ����������� � ������������
select M.*, AA.*, M.rowid
     --into v_App
   from valera.maintable M
      inner join Incom.ApplicationsAddition AA on M.RECORDID = AA.RECORDID
      where M.Problemid = 430 and M.Applicationstatus in ('�������', '��������������') and
            M.Phonenumber = '989719232' and AA.FOREIGNID in (31,45);
---
   select t.*, t.rowid from INCOM.APPLICATIONSADDITION t --���. � ������������
   where t.recordid = '4724250800';
---
INCOM.VerifyCoordCanHaveAccess --��������� �������� ��������� ����� ��� ������������
incom.getcoordinatorokpolist_2 --��������� ���������� ������ ���� ���� �� ������� ������������
INCOM.InsProblem430_6
INCOM.CanCommitProblem430
INCOM.RegistrationCoordinator_2 --��������� ��������� ��������� �� �������������� ���� �������������
INCOM.GetOrganizationNameByOKPO --��������� ��������� ����� ����������� �� ����

---������ �������������
select t.*, t.rowid from VALERA.DIR_COORDINATORS t
---����
select t.*, t.rowid from VALERA.DIR_COORD2OKPO t
where
t.okpo like '3536373%'
or t.coordinatorid = 5;
---����� ������
 select C.Recordid, D.Coordinatorid, D.Coord2OKPOID, C.Name, C.Msisdn, D.Okpo, C.Coord_Password, D.Coord_Password, D.resp_area, D.ISNEWPASSWORD, D.Isnewmodel, /*D.COORDCOMMENT,*/ C.coord_comm, /*D.Okpo_Comment,*/ C.Email, D.rowid, C.rowid
 from Valera.Dir_Coord2OKPO D
 inner join Valera.Dir_Coordinators C on C.RecordID = D.CoordinatorID
 where C.Msisdn like '%98971923%' or C.Msisdn like '%675720208%' or C.Msisdn like '%111111111' or C.Msisdn like '%677280243'
 ---
 UPDATE Valera.Dir_Coordinators Set msisdn = '989719232' where recordid=6;
 UPDATE Valera.Dir_Coord2OKPO Set okpo = '35363738' where coordinatorID=6;
 ---
select t.*, t.rowid from VALERA.DIR_COORDINATORS t
where t.Msisdn like '%98971923%' or t.Msisdn like '%675720208%' or t.Msisdn like '%111111111%'
---
select * from valera.send_sms_table --�������� ���
order by sms_id desc
--- --- ---
--INCOM.GetTalkResults:
select
       G.ProblemID
      ,R.ResultID
      ,R.ResultName
      ,G.GroupID
      ,R.IsAllowed
      ,R.InternalResultName
from INCOM.TalkResults R
inner join INCOM.TalkResultsGroup G on G.ResultID = R.ResultID
where G.ProblemID = '2562' and R.ResultID = '56191';
---���������� ������ "������������� ���������"(��������� �������� "������� ��������")
select RP.PROBLEMID, RP.Resultid, RT.Resultname, RP.REACTIONID, R.REACTIONNAME, RP.rowid
        from Incom.ReactionByProblem RP
        inner join Incom.Reactions R on R.ReactionID = RP.ReactionID
        inner join INCOM.TalkResults RT on RT.Resultid = RP.Resultid
        where RP.ProblemID = '2562';
---
select t.*, t.rowid from VALERA.MEMOSINFOTABLE t
order by t.recordid desc
---  ---�����:
select t.*, t.rowid from VALERA.PERMISSION_USER_PROFILES t
where t.userid = '19692'
--and t.id_permission_type in (5,6,8,9,10,30,31)
and t.id_permission_type in (9,10,30,5,6,31,8,12)

order by t.id_permission_type;
---
select t.*, t.rowid from VALERA.PERMISSION_TYPE_ACTION t
where t.id_permission_action in (82, 83)
order by t.id_permission_type;
---
select t.*, t.rowid from VALERA.PERMISSION_ACTION t
where t.permission_action like '%������ � ��������� ������������ ������������ ������������%'
or t.permission_action like '%������ � ��������� ���������� ���������� ������������%'
or t.permission_action like '%������ � ������ ������ �������� � ��%'
or t.id_permission_action = '79';
---
select t.*, t.rowid from VALERA.PERMISSION_TYPE t
where t.permission_type like '%��-������ � ������ ������ �������� � ��%'
---  --- ---

select t.*, t.rowid from INCOM.COORDINATORACCESS t --������ ���������� ������������
---
select t.*, t.rowid from INCOM.COORDINATORACCESSLIST t--- ������������ ���������� ������������
where t.coord2okpoid in (5,6);
---���������� ��� ��������������� �������:
--           0 - MOBILE
--           1 - PSTN
--           2 - MOBILE+PSTN
select sum(incom.IsCustomerPSTN(C.Account)) PSTN,
           sum(decode(incom.IsCustomerPSTN(C.Account),0,1,0)) MOBILE
    from IVR.Ivr_Clients C
    inner join incom.bis_ivr_jur_addresses J on C.Clnt_ID = J.Clnt_Clnt_ID
    inner join incom.bis_active_partition p on j.part=p.part
    where j.okpo = '35363738';
---
--INCOM.RegistrationCoordinator_2 --��������� ��������� ��������� �� �������������� ���� �������������
select /*+ index (M ix_maintable_problemid_rd) */
     M.UserName as UserName,
     M.PhoneNumber as PhoneNumber,
     M.AgentDepartmentID as AgentDepartmentID,
     M.APPLICATIONSTATUS as ApplicationStatus,
     M.ReactionTXT,
     A.*,
     ADR.CITYID,
     ADR.DISTRICTID,
     ADR.ZIPID,
     ADR.STREETID,
     ADR.REGIONID,
     ADR.STREET,
     ADR.CITY,
     ADR.ZIP
   from Valera.Maintable M
     inner join Valera.ApplicationsInfoTable A on A.RecordID = M.RecordID
     left join INCOM.AddressInfo ADR on ADR.RecordID = M.RecordID and ADR.AddrTypeID = 3
   where ((M.RecordDate > (sysdate - 5) and
           M.RecordDate < (sysdate - 0.00486) /*7 �����*/  and
           M.Applicationstatus = '�������') or
           (m.recorddate >= (trunc(sysdate) - 5) and
           m.applicationstatus = '��������������')
          )
       and (M.ProblemID = 430) and (M.UserName <> 'SELFCARE')
---
--delete
select t.*, t.rowid
from VALERA.MAINTABLE t
WHERE t.problemid = '430' and t.phonenumber like '%98971923%'
---
select t.*, t.rowid from INCOM.SMSTEXTCONFIGPID430 t  --���������� ������ ���
---
select c.language, c.smsencoding, c.rowid
from valera.customerinformationtable c
where c.phonenumber like '%989719232%';
--exception
--when others then
--v_language := '����������';
--v_smsencoding := '���������';
---

INCOM.GetProblem430_5  --��������� ��������� ������ �� Problem 430

