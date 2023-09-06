��������� �� ����
  ����������:
   ���������:
--  INCOM.CanCreateProblem184 � ��������� �������� ������ ����� ��������� ��� ProblemID=184
select /*+index (m IX_MAINTABLE_PHONENUMBER)*/
                   M.RecordID
                  ,dense_rank() over(partition by M.PhoneNumber order by M.RecordDate desc) as DenseRank
                  ,M.UserName
                  ,M.ReactionTxt
                  ,M.rowid
               from VALERA.MainTable M
              where M.PhoneNumber = '989719232'
                and M.ProblemID = 186
                and upper(M.UserName) = 'FRAUD'
                and M.ReactionTxt like '�� �������� �������������� ������%'
                 or M.ReactionTxt like '�� ������� ������������ ��������%';
select t.*, t.rowid from VALERA.DISCONNECTEDCUSTOMERSTABLE t;  --���� � ������� ������������ ������ ����� 90 ���� (���� ��������� + 89 ���� ������ ������� ��������� ����)

--  INCOM.CANCOMMITPROBLEM  - ��������� ����� �������� ��� ���� ��������� ����� �����������
--  INCOM.InsProblem184_2 - �������� "��������� �� ������ ���������� ������"
--  INCOM.UpdAppStatus_2  - ��������� ���������� �������
--  HDREPORTER.Getproblems184 - ��������� ��������� ���������� �� "����������� ����� ������������"
--  VALERA.HD_PACK. GetTreeProblems � ���������� �������� ������� ��� ����������� Call Center ������ � ������ ��������� 184

�����:
  ���������:
--  INCOM.CheckStartDate - ��������� �������� ���� �������� ������ �� �������������� ������ 
--  INCOM.GetUnbindingInfo - ��������� ���������� ������ ������������ �� ������
--  INCOM.GetRestorationCost - ��������� ���������� ��������� ������ �� �������������� ������
--  INCOM.CanCommitProblem184 - ��������� �������� ������ ����� ����������� ��� ProblemID 184
--  INCOM.OnlineRequestRestoration - ��������� ������ ������ �� �������������� ������
--  INCOM.IsReplacementDueRestoration - ����������, ����������� ����� ������� ������������ � ����� � ��������������� ������

������:
--  INCOM.APPLICATIONMETAINFO  �  �������� �������� ���������,  ������������ ��� �������� ������������ ��������� PID = 184
--  INCOM.PROBLEMID4DEALERS - ���������� ��� ������������ ����������� �������
