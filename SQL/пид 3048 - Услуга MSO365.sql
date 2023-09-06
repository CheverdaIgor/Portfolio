INCOM.CanCreateProblem3048  --��������� �������� ������ ����� ��������� ��� ProblemID=3048
INCOM.CanCommitProblem3048  --��������� �������� ������ ����� ����������� ��� ProblemID 3048
INCOM.GetSubsPacketsMSO  --��������� ���������� ������ ������� � ���������� ��������, ������������ � �������� �� ������� ����� (PID=3048)
select t.*, t.rowid from INCOM.SUBSADDDETAILMSO t  --ASOID, ������ ������� � ���������� ��������

INCOM.GetItemsFor3048  --��������� ���������� ������ ������� � ���������� ��������  ��� PID=3048
INCOM.GetSubsPacketsMSO  --��������� ���������� ������ ������� � ���������� ��������, ������������ � �������� �� ������� ����� (PID=3048)

select t.*, t.rowid from US.USEROPTIONS t  --���. ���������������� ���������
where sectionname = 'Problem 3048 vw'

INCOM.GetSubsPacketsMSO  --��������� ���������� ������ ������� � ���������� ��������, ������������ � �������� �� ������� ����� (PID=3048)
INCOM.GetAddAgreement  --��������� ���������� ����� ���. ���������� ��� PID = 3048(������������ �������������� MSO 365�)
select t.Agreement + 1  --���� ������ ������������, �� �� ������������� MSO 365
     from (select /*+index (MT IX_MAINTABLE_PHONENUMBER_ACC)*/ A.Field1 as Agreement,
                 dense_rank() over(partition by MT.Account order by MT.RecordID desc) as DenseRank
             from Valera.MainTable MT
            inner join Valera.ApplicationsInfoTable A on MT.RecordID = A.RecordID
            where MT.ProblemID = 3048
              and MT.Account = '3985435'
              and MT.ApplicationStatus = '���������'
            order by MT.RecordID desc) t
    where t.DenseRank = 1 and rownum = 1;
select t.*, t.rowid from VALERA.MAINTABLE t
where problemid = 3048 and account = '3985435';
------------------------------------------------------------------------------------------------
select decode(nvl(A.FieldValue, 0), 1, '1', '2'), nvl(A.FieldValue, 0), App.Field63, MT.RecordID  --������������� MSO 365
       from Valera.MainTable MT
      inner join Valera.ApplicationsInfoTable App on MT.RecordID = App.RecordID
       left join Incom.ApplicationsAddition A on App.RecordID = A.RecordID and A.FieldName = 'CORPORATEMSO'
           where MT.ProblemID = 3041
             and App.Field63 = '3985435'
             and MT.ApplicationStatus = '���������'
             and rownum = 1
      order by MT.RecordID desc;
select t.*, t.rowid from VALERA.MAINTABLE t
where recordid = 5689561092;
select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where recordid = 5689561092;
select t.*, decode(nvl(t.FieldValue, 0), 1, '1', '2'), nvl(t.FieldValue, 0), t.rowid from INCOM.APPLICATIONSADDITION t
where recordid = 5689561092;

