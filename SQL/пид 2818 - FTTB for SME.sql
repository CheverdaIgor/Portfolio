INCOM.CanCreateProblem2818  --��������� �������� ������ ����� ��������� ��� ProblemID=2818

incom.getpreliminaryapps --��������� ���������� ������ ��������������� ������
--AddMessage(0, '�� ���������� ������ �������� ��� �������������� �������� ������');
select t.*, t.rowid from VALERA.MAINTABLE t
where t.problemid in ('2774');
  select t.*, t.rowid from VALERA.MEMOSINFOTABLE t
  where t.recordid in ('4724249219', '4724249220');

INCOM.GetASSCInfo_2 --������ ���������� �� ����������� 0-�� ������ � ���
WEB.HAS.GetUnionLevel0 --Asoid
select * from unionlevel0 where OKPO = '35363738'; --Asoid

--AddMessage(0, '��������� ��������� ��������� ������ �� ������� ������ ��������� ������ �������� ��������');
select incom.iscustomerhomeinet('3985435') from dual;
  select t.*, t.rowid from INCOM.BIS_IVR_CLIENT t
  where t.clnt_id = '4073831' or t.clnt_id = '4073832' or t.clnt_id = '4073833' or t.clnt_id = '4073834' or t.clnt_id = '6000001';

--AddMessage(0, '� �������� ����������� ���������� ����������, �������� �� ����� ���� ���������');
select t.*, t.rowid from INCOM.CLIENTSERVICES t --Asoid
where t.msisdn like '%98971923%' or t.serv_id = '4070';

--�������� � ������ ��������� ��� ����������� �� � �������.
select incom.isusercoa(19692) from dual;
  select count(*)
  from VALERA.Permission_User pu
  where pu.User_ID = '19692' and pu.ID_Permission_Type = 20;

INCOM.GetDeliveryModesByProblem_4 --���������� ������ �������� ��� ������� ��
INCOM.GetPreliminaryApps --��������� ���������� ������ ��������������� ������
INCOM.GetUnivProblemListParam --������� ������������ �������������� ���������
INCOM.GetXMLInfoFor2818 --��������� ���������� ������ �� �������������� ������� ������ ��� PID = 2818

select * from selfcare.sc_rate_plan t where t.billing_name = '1186';  --���������� ������ ��
select t.*, t.rowid from SELFCARE.SC_FEATURE_PARAM t where t.Action_ID ='52230003' and t.rp_id=669 and t.param_id=1;  --���������� ������ ��

INCOM.GetDeliveryModesByProblem --���������� ������ �������� ��� ������� ��
