INCOM.IsEnabledGenAg1092  --����������� � �������������� ���� "����� ��"
INCOM.VerifyGenAgreement1092  --�������� ������ �� ��� PID 1092
INCOM.GETINDIVIDPACKETS_2  --��������� "������ �������������� �������, ��������� ��� ��������"
INCOM.GETINDIVIDSETS_2  -- ��������� "������ �������������� �������, ��������� ��� ��������"
INCOM.CanCommitProblem1092_3  --��������� �������� ������ ����� ����������� ��� ProblemID 1092
INCOM.GetGroupAppTree_2  --��������� ���������� ������ �����������
INCOM.GetGroupAppDetails_5  --��������� ���������� ������ �����������
INCOM.CanEditGroupDetails  --��������� ���������� ������ �� ������������� ������� �����������:
select t.problemid, t.properties, t.rowid from VALERA.PROBLEMSTABLE t
where problemid = 1092 or problemid = 172 --73857

select t.*, t.rowid from INCOM.TARIFFSFORSAVE t  --���. � ������ ��������� �� ��������� �������� �����, ������� INCOM.TARIFFSFORSAVE. ������ ������ �� ��. ��������� INCOM.GetTariffsForSave
where rtplid = 398;

select t.*, t.rowid from PHYSASSCID t  --�������� ASSC_ID, ASOID--

-- ������ �������������� ������� � ������� �������� � �������� web.IndividPacks. ������ ���������� �� ������� ����� ispacket:
select t.*, t.rowid from INDIVIDPACKS t

select t.*, t.rowid from INDIVIDPACKSTOOKPO t  --�����, �����, ASOID
where okpo = '35363738' or okpo = '2917155477';

select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where recordid = 4724256620 --��� 172, field5-��, field56-����
 or recordid = 4724250546 --��� 175, field9-��, field56-����
 or recordid = 4724256283 --��� 469, field56-��, field40-����
 or recordid = 4724253326 --��� 1125, field63-��, field62-����, ������� ����� ����� VALERA.MAINTABLE
 
INCOM.VerifyICC_2  --��������� �������� ������������ ICC ������
INCOM.GetMSISDNByICC  --��������� ����� �������� �� ���� SIM-����� ICC
Incom.VerifySimByDepartment_2  --�������� �������������� SIM-����� � ������������� ����������
INCOM.CANSIMACTIVATE  --��������� ������ �������� ����������� ��������� SIM-����
INCOM.GETLASTMSISDNFORGROUPAPP  --������������� ��� ��������� ������ �� ������� ������ � ������� ���������, ������� ������� �������, ��� ���������� �� ����� ��������� ���������

select t.*, t.rowid from UNIONLEVEL0 t  --ASOID, ASSC_ID(���.����)
where clnt_clnt_id = '4073833'

--Incom.GetBASESERVICES  --��������� ���������� ������ ������� �����
select t.*, t.rowid from INCOM.BASESERVICES t

INCOM.GetASSC4Account1092  --��������� ���������� �� ����������� ���.��� ��� PID 1092
select t.*, t.rowid from ASSC4ACCOUNT t  --ASSCID ��� ���.���

INCOM.DeferredActivation1092_3  --��������� ��������� pid1092 �� ����� "���������� ���������"
select *
      from Incom.ApplicationsAddition
     where RecordID in (5689565789), 5689564068, 5689564070)
       and FieldName in ('RESTORENUMBER', 'ONLINEACTIVATION');

INCOM.CheckAddedPhoneNumber  --��������� �������� ��� ���������� ������ � ������� (PID 1092)
select t.*, t.rowid from VALERA.DISCONNECTEDCUSTOMERSTABLE t;  --������� ��������

/*�� ��� ��������! ����� ������ � ������ ������ ��!!! � ����������� ����� ���������� ������� ������� ������� ��������.
��� ������ �������, ����������, ����������� ������������ �������������� � InfoStar (RS1007).������� ���������?*/
select t.*, t.rowid from INCOM.FINDSPRFRAUD t;  --ASOID

INCOM.GetAccountByDopInfo  --�������� �� �� ���� ��� ���������� ������
INCOM.GetDefaultSLPTID  --����������� ���� ������������ �������� ����� - ���������� �������� ��� ��� ����������
