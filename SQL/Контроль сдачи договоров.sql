INCOM.InsProblem516_5  --��������� ������� ��������� "�������� ��������� ������ �� ��������"
select t.*, t.rowid from INCOM.RECORDID2FOLDER t;

INCOM.CanPrintAgreement  --����������� �������� �������� "������ ����������������� ����������"
INCOM.GetSubscriberInfo  --��������� ���������� ���������� � �������� �� ��� ������ �������� ��� �� ������ �������� �����
INCOM.GetAgreementRegisterInfo  --��������� ������ � ������� ����������� ����������
select t.*, t.rowid from INCOM.SUBSAGREEMENTREGISTER t
order by t.recordid desc;

select t.recordid, t.field59, t.field63, t.big_field1, t.rowid
from VALERA.APPLICATIONSINFOTABLE t
order by t.recordid desc;

INCOM.GetAccountByDopInfo  --�������� �� �� ���� ��� ���������� ������
  /*--�������� ��� ����������� ������������*/
  if p_OKPO in ('35363741', '35363742') then
  v_Account := null;
  end if;
  /*--�������� ��� ����������� ������������*/

