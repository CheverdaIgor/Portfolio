INCOM.GetHeads_LZ  --���������� ������ ����������� (���� �����)
INCOM.GetCustomerInfo_LZ  --��������� ���������� ���������� �� �������� �� ������� Contr Agent (���� �����)
INCOM.CheckCustomerInfo_LZ  --��������� ��������� ���������� �� ��������, ���������� �� ������� Contr Agent � BIS
INCOM.CheckOKPOIsNew  --�������� �� �������� ������ ����/��� (���� �����)
INCOM.GetUserPermissionType  --��������� ���������� ���� �������� ������������
INCOM.GetClientType_2  --��������� ���������� ��� ��������������� �������

/*--�������� ��� ����������� ������������*/
if p_OKPO in ('35363738', '35363739') then
/*--�������� ��� ����������� ������������*/
  p_Result := 1;
  
  select decode(count(*), 0, 0, 1)
    into v_ActualInfo
   from INCOM.LZ_customerInfo C
  where C.OKPO = p_OKPO
    and trunc(C.MofifyDate) = trunc(sysdate)
    and C.RequestStatus = 1;
  
  if  v_ActualInfo = 0 then
    INCOM.InsContrAgentInfo(p_OKPO, p_Result, p_MessageText);  
  end if;
/*--�������� ��� ����������� ������������*/
else
  p_Result := 0;
  p_MessageText := '��� ���������� �� �������� �� ������� Contr Agent (���� �����)';
  end if;
/*--�������� ��� ����������� ������������*/
INCOM.InsContrAgentInfo  --��������� �������� ���������� � �� �� �� ������� Contr Agent (���� �����)
INCOM.CheckRegisteredCustomer_LZ  --�������� ������ ��������������� � �������� (���� �����)
    /*--�������� ��� ����������� ������������*/
    if p_OKPO = '35363738' then
      v_Result := 1;
      else
        v_Result := 0;
        end if;
    /*--�������� ��� ����������� ������������*/
INCOM.CanUpdateCustomerInfo_LZ  --�������� ���������� ���������� ������ � ��, ������� ����������� �� ������� CONTR AGENT (���� �����)
INCOM.SendEmailContrAgentError  --��������� �������� email ����������� �� ���������� ����������� �������� � ������� "CONTR AGENT"

--������� �������:
select t.*, t.rowid from INCOM.LZ_CUSTOMERINFO t  --����� ����
where t.id in (50,49);
--12506, ����������� �������, ����������, ���������������, ����, 118-�, 11
--01001, �.�ȯ�,����������,������ ��������,19-�
--50102, �Ͳ������������� ���.,������ в�,�����������,������ �������,���. 31,��. 20

select t.*, t.rowid from INCOM.LZ_HEADS t;  --����������
INCOM.LZ_TaxDebt  --��������� ����
INCOM.LZ_VatInfo  --���������� ���
INCOM.Liga  --����� �������������� � �������� CONTR AGENT (���� �����)
select to_char(to_date('19700101','yyyymmdd') + ((&p_Unix/1000)/24/60/60), 'dd.mm.yyyy hh24:mi:ss')  --&p_Unix = 1566594621398
from dual;

SELECT (cast(current_timestamp as date) - to_date('01-01-1970','DD-MM-YYYY'))*(86400)*1000 + (To_Char(current_timestamp, 'FF')/1000)
FROM dual;  --��������� ������� ����

