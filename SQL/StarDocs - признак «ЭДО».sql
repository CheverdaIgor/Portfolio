INCOM.VerifyBarCode_2  --��������� �������� ������������ �����-���� � ������������ � ��������� ���������
select t.*, t.rowid from VALERA.MAINTABLE t
where recordid in (5689579816, 5689579817, 5689579808, 5689579810);
select t.*, t.rowid from INCOM.APPLICATIONSADDITION t
where (recordid in (5689579816, 5689579817, 5689579808, 5689579810) and fieldname = 'EDO');

INCOM.CanCommitProblem516  --��������� �������� ������ ����� ����������� ��� ProblemID 516
select t.*, t.rowid from VALERA.MAINTABLE t
where recordid in (5689580322, 5689580437, 5689580398);
select App.*, App.rowid from Incom.ApplicationsAddition App 
where App.RecordID in ('5689580437', '5689580430','5689580398') and App.Fieldname = 'EDO1';

select max(R.RecordID)  --��� 516: '� ��������� ' || v_RecordID || ' �� ��� ���������� ������� "���", �� �������, ��� ������ ������������� ��������� � ������������ "�������� ���������� ������ �� �������� - �������� � ����������� ������"?'
        from (
           select /*+index (m IX_MAINTABLE_PHONENUMBER)*/ max(MT.RecordID) as RecordID
             from VALERA.Maintable M
            inner join INCOM.GroupAppParentchild G on M.RecordID = G.RecordID
            inner join VALERA.Maintable MT on G.ParentRecordID = MT.RecordID 
            where M.PhoneNumber = '989719232'
              and M.ProblemID in (1125)
              and M.RecordDate > (sysdate - 60)
              and MT.Account = '3985436' 
              and MT.ApplicationStatus = '���������'
           union
          select /*+index (m IX_MAINTABLE_PHONENUMBER)*/ max(M.RecordID) as RecordID
           from VALERA.Maintable M
          inner join Valera.ApplicationsInfoTable A on M.RecordID = A.RecordID and A.Field56 = '3985436'
          where M.PhoneNumber =  '989719232'
            and M.ProblemID = 469
            and M.RecordDate > (sysdate - 60)
            and M.ApplicationStatus = '���������'    
            ) R;

