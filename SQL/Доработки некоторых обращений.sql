INCOM.GetCustomerEntity  --��������� ���������� ��� ��������
INCOM.GetSIMInfo  --��������� ��������� ���������� � SIM �����
INCOM.GetSIMInfo461_2  -- ��������� ��������� ���������� � SIM ������
INCOM.GetDataForProblem461Contract  --��������� ������� ��������� �� ��������� ������ PUK ���� (��������)

select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t

pps_adm.prepaid_sim_cards_for_hd_v

Incom.GetDirectNumber_2  --��������� ������� ������ �������
Incom.GetActions365_2  --��������� ������� �������� � �� �������� Problem365
select t.*, t.rowid from INCOM.DIRECTNUMBERSLIST t /*������ �����, ��� 365, ����� ������ ��� �����������*/
select t.*, t.rowid from INCOM.CLIENTSERVICES t  --ASOID, ��� 365(������ �����), ���������, ����� ����������
where msisdn = '989719232';

Incom.CanCreateProblem1118  --��������� �������� ������ ����� ��������� ��� ProblemID
Incom.Cancommitproblem1118  --����������� ��������/�������� � ������ ����������
INCOM.InsProblem1118        --��������� �� ��������� �������� SIM-�����

INCOM.GetActionsForProblem1117_3  --�������� ��������� �������� �� �������� ��� Problem1117 (�������� SIM)
INCOM.GetSpareSIMStatus  --�������� ��������� ������ "�������� SIM" ��� �����������/���������� ���������/�� OKPO
INCOM.HasActiveSpareSIM  --�������� ������� �������� SIM-����� � ���������� ������ ���������
Incom.CanCreateProblem1117  --��������� �������� ������ ����� ��������� ��� ProblemID
Incom.CanCommitProblem1117  --����������� ��������/�������� � ������ ���������� ���������
/*ASOID:*/
select t.*, t.rowid from INCOM.SUBSADDDETAIL t  --�������� ������� �������� SIM-����� � ���������� ������ ���������, ��� 1117
where t.ms like '%98971923%';
or
select t.*, t.rowid from INCOM.PP_GET_SERVICES_DETAILS t  --��� 1118: "����� ���� ��������� SIM-�����" ���� �������� "���������" ��� ��� 1117
where t.msisdn like '%98971923%';

select t.*, to_number(replace(tvValue,',','.')), t.rowid
  from US.EnumTypeValues t
  where t.TYID = 10319 and t.tvName = 'MinPriceValue';

select t.*, t.rowid from VALERA.CUSTOMER_SEGMENTS t  -- ���������� ������� ���������� ��������, ��������� ��������� ���������� �������� ������� ������ �Gold� (ARPU = 4)  � �Platinum� (ARPU = 7)
where t.msisdn like '%98971923%';

INCOM.GetOrganizationNameByOKPO  --��������� ��������� ����� ����������� �� ����
INCOM.CanUseSpareSIMForContract  --�������� ����������� �������������� ������ (�������� SIM-�����) ������������ ��������
