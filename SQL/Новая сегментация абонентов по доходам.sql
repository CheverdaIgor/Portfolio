INCOM.GetAdditionalSIMInfo475  --��������� ��������� ������ ICC-����� �������������� SIM ���� ��� PID = 475 (SIM-����)
select t.*, t.rowid from SIMCARDS t  --Asoid, �������� "������ SIM-������":
/*where extract(value(d),'//MAIN/text()').getStringVal() = '0'
        and extract(value(d),'//ASTY_ASTY_ID/text()').getStringVal() = '2'
        and extract(value(d),'//MSTP_MSTP_ID/text()').getStringVal() = '1'
        and extract(value(d),'//CONNECTED/text()').getStringVal() = 'Y';*/
where t.msisdn like '%98971923%'
order by t.msisdn;
INCOM.CanFreeConnectSpareSIM_2  --��������� ����������� ����������� ����������� �������� SIM-����� ��� PID = 475 (SIM-����)

INCOM.GetAdditionalDATASIMInfo  --��������� ��������� ���������� � �������������� SIM ����� ��� PID = 1772 (DATA SIM-����):
/*where extract(value(d),'//MAIN/text()').getStringVal() = '0'
        and extract(value(d),'//ASTY_ASTY_ID/text()').getStringVal() = '2'
        and extract(value(d),'//MSTP_MSTP_ID/text()').getStringVal() = '2'
        and extract(value(d),'//CONNECTED/text()').getStringVal() = 'Y';*/
select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t  --Asoid, �������� ������������ ������ "�������� SIM", ��� 1117 (4-�����., 3-�����., 0-�� �����.)
where t.msisdn like '%98971923%';

INCOM.CanFreeServiceForProblem1117_2  --�������� ����������� ���������� ��������� ��������� �� ProblemID = 1117
INCOM.GetFreeServiceReasonsLookup  --������� ������������ (����� ������ ������������ ReasonID = (19,20) ��� PID=179 Prepaid)

Valera.Get_Customer_Segment  --function
select t.*, t.rowid from VALERA.CUSTOMER_SEGMENTS t;

INCOM.GetSIMInfo  --��������� ��������� ���������� � SIM �����
INCOM.CanCommitProblem1772  --��������� �������� ������ ����� ����������� ��� ProblemID 1772
INCOM.CanCommitProblem1117  --����������� ��������/�������� � ������ ���������� ���������
INCOM.GetActionsForProblem1117_3  --�������� ��������� �������� �� �������� ��� Problem1117 (�������� SIM)
select t.*, t.rowid from VALERA.CUSTOMER_SEGMENTS t;
  select t.tvValue, t.rowid
  from US.EnumTypeValues t
  where t.TYID = 10319
    and t.tvName = 'MinPriceValue';

select t.*, t.rowid from INCOM.PP_GET_SERVICES t;  --ASOID, �������� ������������ ������ "�������� SIM", �������
select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t;  --ASOID, �������� ������������ ������ "�������� SIM", ��������

incom.getabonentarpulevel_3  --��������� ���������� ������� ���������� ��������
incom.checkabonentmigrate  --�������� ����� �������� ��������
VALERA.GET_CUSTOMER_PHONE_MODEL  --�������� ����� �������� (��������� ����������)

select M.RecordDate, M.ProblemID, M.APPLICATIONSTATUS, M.rowid
                   from Valera.Maintable M
                  where M.ProblemID in (469, 489)
                   --and to_char(M.RecordDate, 'MM') = to_char(sysdate, 'MM')
                   and M.PhoneNumber = '989719232';

