--��������:
--INCOM.CreateASSC_2
--INCOM.CreateAccountBis_2

INCOM.GetDebtsAccountsList  --�������� ������ �� � ����������� �������������
select  --Asoid
                    D.ACCOUNT
                   ,D.DEF
                   ,D.SUM_DOLG
                   ,D.OKPO
                   ,D.CustomerPassport
                   ,D.rowid
  from incom.DebtAccounts D
  where /*OKPO = '35363738' or */CustomerPassport = 'BH-444444' or CustomerPassport = '222222222';

--ALTER TABLE incom.DebtAccounts add OKPO VARCHAR2(50);

INCOM.IsCoordIDPassport  --������� ���������� ��� �������� ������������
INCOM.VerifyCoordPassport  --��������� ��������� ����� ������� ������������
select t.*, t.rowid from VALERA.DIR_COORDINATORS t
where t.Msisdn like '%98971923%' or t.Msisdn like '%675720208%' or t.Msisdn like '%111111111%';

INCOM.VERIFYPasportCorpSubscr  --��������� ��������� ������� �������������� ��������
-- ������ �� incom.getaccountinfofromweb_5:
select t.*, t.rowid from IVR.IVR_JUR_ADDRESSES_PARTITION t
where t.clnt_clnt_id = '4073831' or t.clnt_clnt_id = '4073832' or t.clnt_clnt_id = '4073833';

INCOM.IsIDPassportRegPrd  --������� ���������� ��� �������� ������������������� �������� valera.PREPAIDINFORMATIONTABLE
INCOM.CHECKPASSPORTREGPRD  --��������� ��������� ������� ������������������� �������� valera.PREPAIDINFORMATIONTABLE
select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t;

INCOM.GetSegments1092  --��������� ���������� ������ ��������� ��� PID = 1092
incom.getpassportinfobyaccount  --������� ���������� ����� � ����� ��������� �� ������ �������� �����
incom.getaccountbydopinfo  --�������� �� �� ���� ��� ���������� ������
INCOM.GetGroupAppTree_2  --��������� ���������� ������ �����������

select t.pass_ser, t.pass_num, t.rowid from IVR.IVR_JUR_ADDRESSES_PARTITION t --���������� ������
where t.clnt_clnt_id = '4073833';

Incom.Insproblem172_8  --�������� ������ �� ��������� "��������� �� ���������������"
INCOM.Cancommitproblem172_3  --��������� �������� ������ ����� ����������� ��� ProblemID 172

incom.getaccountinfofromweb_6  --�������� ��� ������ '��������� ��'

