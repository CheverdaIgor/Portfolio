INCOM.CheckArchiveFolder  --��������� �������� ������ �����
select t.*, t.rowid from INCOM.ARCHIVEFOLDERS t

select t.*, t.rowid from INCOM.CUSTOMERDOCUMENTS t  --����������� ����� ���������� �� �����

INCOM.InsProblem516_3  --��������� ������� ��������� "�������� ��������� ������ �� ��������"
INCOM.InsProblem3049  --��������� ������� ��������� "�������� ��������� ������ �� ��������"
INCOM.InsAppByBarCode_2  --�������� ��������� �� �����-����
INCOM.CanCommitProblem3049  --��������� �������� ������ ����� ����������� ��� ProblemID 3049
INCOM.VerifyBarCode_2  --��������� �������� ������������ �����-���� � ������������ � ��������� ���������

--decode(B.Status, 1, '�� �������� � �������� ��������', 2, '�����', '������ �� ���������')--
select t.*, t.rowid from INCOM.ARCHIVEBOXES t  --����� ������, �� �������������, � ���. �� ������ ���� �������� ��� ���������� �����-�����
--decode(F.Status, 0, '�� ���������', 1, '�� �������� � �������� ��������', 2, '������', '������ �� ���������')--
select t.*, t.rowid from INCOM.ARCHIVEFOLDERS t  --����� �����, ������������
select t.*, t.rowid from INCOM.BARCODE2DIRECTNUMBERS t  --����� ���������/�����-���
select m.inarchive, m.rowid  --��� ��������� ��� ��������� � ������! (����� ������� ��������)
       from valera.maintable m
       where m.recordid = 5689552134;

INCOM.GetFolderDefaultValue  --��������� ���������� �������� �� ��������� ��� ���� ����� �����

INCOM.GetFolderDefaultValue  --��������� ���������� �������� �� ��������� ��� ���� ����� �����
select t.*, t.rowid from VALERA.MAINTABLE t
where problemid = 516;
---
select O.*, O.rowid from US.UserOptions O where upper(O.OptionName) = 'DOCSINFOLDER';  --��� 516, ����.���������� �����
--�� ������� [����� ������] �� ����� ���� ������� ����� [N] �����--�������� ��������� ���������� � �����
select O.OptionValue, O.rowid from US.UserOptions O where upper(O.OptionName) = 'FOLDERSINBOX ';
---
3.4.4    INCOM.ArchiveContractsPSTN  --�������� ������� ��������� ������������� ����� � ����������� ��������� ��������� �����
3.4.5    INCOM.RecordID2Folder  --�������� ������� �������� ��������� � �������� ������
select t.*, t.rowid from INCOM.RECORDID2FOLDER t
order by t.recordid desc;

INCOM.InsArchiveContractsPSTN  --��������� ������������ ���������� ������� �������� ���������� �� ���
--TRUNCATE TABLE INCOM.ARCHIVECONTRACTSPSTN;  --�������� �������

select t.*, t.rowid from INCOM.ARCHIVECONTRACTSPSTN t;  --�������� �������--

INCOM.LoadArchiveContractsPSTN  --��������� ������������ ��������� � ���������� ������� ��������� ������������� ����� � ����������� ��������� ��������� �����
select t.*, t.rowid from INCOM.BIS_IVR_ASSOCIATIONS t;  --����� ����������� ������� (A.Main_Clnt_ID is not null)
--4.  PSTN � ��� ������� 4.
--� ������� incom.bis_cmb_subs_services �������� ����� SUBS_ID,
--��������� � �� ������������� ����� (CTYPE=4001 � JRTP_ID=2 � incom.bis_cmb_clients.status_id <> 4), �������� ��� ��� � �������.
select t.*, t.rowid from INCOM.BIS_CMB_SUBS_SERVICES t
where account = '123';

select t.*, t.rowid from INCOM.BIS_CMB_CLIENTS t  --������
where assc_id in (/*10,*/11);



---3.3.	�������� ����� ����� ��������� ��������� ��������� ������ �� ��������. ��������� � ����������� (PID 3049)---
select INCOM.GETFULLCOMPLECTACCOUNT(35363738) from dual;  --������� ������� ��������� ���������� �� ������
select t.*, t.rowid from INCOM.ACCOUNTREGISTER t  --������� ������� ��������� ��������������� ���������� �� ������

INCOM.GetCustomerDocuments  --��������� ���������� ���������, ��������� �� ����� ��� PID = 3049
Incom.InsProblem3049 --��������� ������� ��������� "�������� ��������� ������ �� ��������"
select t.*, t.rowid from INCOM.BIS_IVR_ASSOCIATIONS t  --����������� 1-�� ������

INCOM.GetContractNumbers  --��������� ���������� ������ ������� ��������� ��� PID = 3049
select t.*, t.rowid from INCOM.ARCHIVECONTRACTSPSTN t;  --�������� �������--
INCOM.GetAddContractNumbers  --��������� ���������� ������ ������� ���������� ��� PID = 3049

INCOM.GetGenContractNumbers  --��������� ���������� ������ ������� �� ��� PID = 3049

select t.*, t.rowid from US.ENUMTYPEVALUES t  --����������
where tyid in ('20062', '20063')

INCOM.UpdateArchiveContractsPSTN  --��������� ���������� ������ ������� ��������� ������������� ����� � ����������� ��������� ��������� �����

select G.Status, G.UserID, G.RecordID, G.Update_Date, G.ID, G.Okpo, G.Gencontract_Num, G.Contract_Num, G.Add_Contract_Num
        from INCOM.ArchiveContractsPSTN G
        where G.Okpo = '35363738'
          --and G.Gencontract_Num in ('1','2')
          --and G.Account in ('3985436','3985438')
          and G.Contract_Num = '55555_5'/*'Contract_Num1'*/
          --and G.Add_Contract_Num in ('1','2')
          and G.Status in (0, 1, 2)
        --returning G.ID into v_ArchiveID;

select
      M.Field30,
      M.Field28     as v_ArchiveID,
      M.Field7      as ApplicationNumber,
      M.Field4      as Account,
      M.Field23     as DocTypeID,
      M.Field12     as GenContract_num,
      M.rowid
     from Valera.MemosInfoTable M
     where M.RecordID in ('5689554685');

select t.*, t.rowid from INCOM.BIS_IVR_JUR_ADDRESSES t
where clnt_clnt_id = '4073832';

INCOM.GenerateInsProblem3049  --���������� ��������� ��������� ��������� ������ �� ��������. ��������� � ����������� (PID 3049) ��� ������ ������ ������� �������
INCOM.LoadArchiveFolders  --��������� �������� � ������ ����� ������ �� ������� �������
select t.*, t.rowid from INCOM.ARCHIVELOADDATA t

select t.*, t.rowid from VALERA.MAINTABLE t
order by t.recordid desc;
select t.*, t.rowid from VALERA.MEMOSINFOTABLE t
order by t.recordid desc;

