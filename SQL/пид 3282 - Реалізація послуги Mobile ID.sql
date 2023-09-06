INCOM.GetProblem3282Information  --��������� ���������� ���������� �� ������ �� ��������� ����������� ��.����
INCOM.GetASSCInfo_2  --������ ���������� �� ����������� 0-�� ������ � ���
INCOM.GetPersonalAccount  --�������� "������������ ��" ��������� �� ������ ���������� �����
INCOM.CanCreateProblem3282  --��������� �������� ������ ����� ��������� ��� ProblemID=3282
INCOM.GetPacketMobile  --��������� ���������� ������ ��� ���������� ������ ������� "����� SMS"  (����� PID = 3282)
INCOM.GetCoordPermissionRecordID  --��������� ���������� ������������� ��������������� ������-���������� �� ������������
select t.*, t.rowid from VALERA.MAINTABLE t  --v_RecordDate_391 > v_RecordDate_172 then ������-���������� ��������� �� ��������������
where (recordid = 5689575872 and t.problemid = '172')
or (recordid = 5689576821 and t.problemid = '391');

select t.*, t.rowid from VALERA.MEMOSINFOTABLE t  --��������������� ������-���������� �� ������������
where recordid = 5689576821;

INCOM.GetActions3282  --��������� ���������� �������� ��� ����������� ������ "��������":
select t.*, t.rowid from INCOM.SUBS_MOBILE t;  --Asoid, ��������� ������� � �������� �� Mobile
select t.*, t.rowid from PHONEPACKETS t;  --Asoid, ���������� ���������� �� ������ SMSMobileID = 21865, 21866

--���������� ������ ������ �MobileID� �� ������:
--if v_MI_Account is null then
select E.*, E.rowid from US.EnumTypeValues E
where E.TyId = 20085 and E.TvValue = '1';
--else
select t.*, t.rowid from INCOM.CLIENTSERVICES t  --Asoid
where serv_id = 1600 or serv_id = 1601;

select                                           --�������� �������������� ��. ����
           A.Field41    as RepresentFIO
          ,A.Field42    as RepresentPassport
          ,A.Field28    as RepresentIDPassport
          ,A.Field36    as RepresentValidity
          ,A.Field43    as RepresentIssuedBy
          ,A.Field35    as RepresentPassportDate
          --,to_date((select FieldDisplayValue from Incom.ApplicationsAddition where RecordID = &v_RecordID and FieldName = 'RepresentBirthday' and rownum=1), 'dd.mm.yyyy')    as RepresentBirthday
          ,A.Field53    as RepresentSex
          ,A.Field50    /*as RepresentINN*/  --'XXXXXXXXXX' ���� '2222222222'
          ,A.Field30    as RepresentDocument
          ,A.Field51    as POANumber
          --,to_date((select FieldDisplayValue from Incom.ApplicationsAddition where RecordID = &v_RecordID and FieldName = 'POADate' and rownum=1), 'dd.mm.yyyy')              as POADate
          ,A.rowid
from VALERA.APPLICATIONSINFOTABLE A
where A.recordid = 5689579752;

INCOM.GetAdditionalSIMInfo475  --��������� ��������� ������ ICC-����� �������������� SIM ���� ��� PID = 475 (SIM-����)
INCOM.InsProblem3283  --��������� ������� ��������� ������������ ������ Mobile ID�
INCOM.GetPassportInfoByMSISDN  --������� ���������� ���, ����� � ����� ��������� �� ������ ��������
INCOM.GetDebtsAccountsList  --�������� ������ �� � ����������� �������������

select MT.RecordID, MT.RecordDate, nvl2(A.Field1, A.Field1, A.Field2) as Certificate
                  ,dense_rank() over(partition by MT.PhoneNumber order by MT.RecordID desc) as DenseRank
              from VALERA.Maintable MT
             inner join Valera.Applicationsinfotable A on MT.RecordID = A.RecordID
             where MT.PhoneNumber = '989719232'
              and MT.ProblemID = 3283
              and MT.ApplicationStatus not in ('��������');

select t.*, t.rowid from VALERA.MAINTABLE t
where recordid = 5689550480;
select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where recordid = 5689550480;

INCOM.IsSubscriberFOP  --������� ��������� �������� �� ����� �������� ���
