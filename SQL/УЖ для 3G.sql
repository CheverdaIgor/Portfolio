����������:

 ���������:
�  INCOM.GetFillDataAll_2  - ������� ��������� ������ ���������� ����� ��� ���������� �����
�  INCOM.GetFillData_3  - ��������� ��������� ������ ���������� ����� ��� ���������� �����
�  INCOM.GetUniversalClaimDialogTree_6  - �������� ������ ������� ��� ������������� ������ (��������)
�  INCOM.InsUniversalDialogClaim_4  - ��������� ������� ������������� ���������� ������

�������:
�  INCOM.ClaimsDialogTree � �������� ����� ���� IsInfoQuestion � ������� ����, ��� ������ �������� ��������������

����:
�  INCOM.ClaimFillData_3 � �������� ��� ���� � �������������� ���������� ��� ���������������������

�����:

���������:
--  INCOM.GetQuestsForInformationField  - ��������� ������ ��������� �������� ��� ��������������� ����
select
      t.ClaimTypeID
     ,t.QuestID
     ,t.InfoFieldid
    from INCOM.QuestionsForInformationField t
    where t.Problemid = '541';
--  INCOM.GetInformFieldsAnswer_1252  - ��������� ���������� ��������� �������� �������� ����
p_itemid: 28598
-- -- --
p_dialogxml:
<?xml version="1.0" encoding="Windows-1251"?>
<DialogItems>
  <Item QID="28592" Answer="2682"/>
  <Item QID="28593" Answer="152365"/>
  <Item QID="28594" Answer="1 - � ����������" AnswerID="445038"/>
  <Item QID="28595" Answer="123" AnswerID="8888888"/>
  <Item QID="28596" Answer="21.12.2015"/>
  <Item LastQID="-1"/>
</DialogItems>
--  INCOM.GetInformFieldsAnswer  - ��������� ���������� ����� ��� ��������������� ����
--  INCOM.CheckClosingUniversalClaim - ��������� �������� �������� �������� ����

�������:
�  INCOM.QuestionsForInformationField - ������� ��������� �������� ��� ��������������� ����
�  INCOM.ClaimStatusByRecordID - ������� ������ ������ ��������� ����� �� �������� ���� (��� ����, ����� �����, ������ �� ����� ���������� ����������)
�  INCOM.ClaimInfoForGIS - ������� �������� ������ ��� �������� ������ �� �������� �� HelpDesk � GIS

������:
�  INCOM.ClaimTypes - ���� ������������� �����. �������� ��� ������ 1285 � 1286 (�������� � ��������� ���� 3G), �������������� ��� PID = 1252 � PID = 541
�  INCOM.UniversalClaimControls - �������� ���������� ��� ��������� ������������� �����. �������� ����� �������: ���������� ������ ��� ����������� ���������� ������� 
�  INCOM.UniversalClaimDirectories - ����������� ��� ��������� ������������� �����. �������� ����� ���������� ��� ������ (��� ����������� � ���������������������
�  INCOM.FillDataRules � ����� ������� ��� ������ ������, �����, ����
�  INCOM.TalkResults � �������� ����� ���� ��������� ������ �� ������� �������
�  INCOM.TalkResultSgroup, INCOM.ReactionByProblem � �������� ������ ��� ������ ����� ��� PID = 1252, 541
�  INCOM.ClaimsDialogTree - ������� ������ �����, ����������� �� �������. �������� ������� � ���������� ������� ��� PID = 1252, 541 ��� ����� 1285 � 1286 ��������������
�  INCOM.QuestionsForInformationField � ������ ��������� � �������������� ����� �������

����:
�  INCOM.NetworkAlarmData - ��������� ��� ��� ��������� ������ �� �������

---
INCOM.InsUniversalDialogClaim_4  --��������� ������� ������������� ���������� ������
--
select t.*, t.rowid from VALERA.MEMOSINFOTABLE t
where t.recordid in ('4724249222', '4724249223')
--
select t.*, t.rowid from INCOM.CLAIMINFOFORGIS t
where t.recordid in ('4724249222', '4724249223')

