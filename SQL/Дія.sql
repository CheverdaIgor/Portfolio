INCOM.GetAICheckTypes_3  --��������� ����������  ��� ��� ���� �������� ��������
INCOM.GetIsAbonentIdetificated  --��������� ��������� ��������������� �� �������
INCOM.GetIsCoordinatorIdetificated  --��������� ��������� ��������������� �� �����������
incom.DiiaGetResponses  --��������� ��������� ������ ��������� ���������� ������������� ĳ�, ��� ������ ������ ������

INCOM.DiiaRequestShare  --��������� ��������� ����� � Ĳ� � �����, �������� �� ����
INCOM.DiiaCheckResponse  --��������� ����������� �볺������� ����������� �� ��������� ����� �� ��� ����������� ����������� ����
select t.*, t.rowid from INCOM.DIIAABONENTINFO t
order by t.requestid desc;

--�����������:
INCOM.DiiaCheckCoordFIO  --��������� �������� �.�.�. ������������
INCOM.VerifyCoordPassport  --��������� ��������� ����� ������� ������������
--���.����:
INCOM.VERIFYPasportCorpSubscr  --��������� ��������� ������� �������������� ��������
INCOM.VERIFYFIOCorpSubscr  --��������� ��������� ��� �������������� ��������
INCOM.VERIFYINN  --��������� ��������� ��� �������������� ��������

declare
  id varchar2(50);
  result number;
  message varchar(250);
begin
  select to_char(max(requestId)) into id from INCOM.DIIAABONENTINFO;
  INCOM.SaveDiiaDataFromApiLayer(
    p_RequestId => id,
    p_Type => 'internalPassport',  --�ID-�����
    --p_Type => 'foreignPassport',  --������������ �������
    --p_Type => 'driveLicense',  --������������� �������������
    p_LastNameUA => 'COORDINATOR - ����_2',  --�������=989719232: UserType = 8 - �����������
    --p_LastNameUA => '������ 3985435 - �������� ϲ���Ȫ����� "MIRATECH" ������� ����� - 33',  --�������=989719231: UserType = 3 - ���.����
    --p_LastNameUA => '������ 35363738 - �������� ϲ���Ȫ����� "MIRATECH" ������� �����',  --�������=989719234: UserType = 9 - ���.����
    --p_LastNameUA => 'COORDINATOR - ����',  --�������=989719234: UserType = 9 - �����������
    --p_FirstNameUA => '�������',
    --p_MiddleNameUA => '�����',
    p_Birthday => '29.08.1976',  --������������ �������/������������� �������������
    p_TaxpayerNumber => '2800000000',
    p_DocNumber => '111111111',
    p_Result => result,
    p_MessageText => message
  );
  if (result = 0) then
    DBMS_OUTPUT.PUT_LINE(message);
  end if;
end;

/*Add comments to the columns 
comment on column INCOM.AIUSERTYPETOCHECKTYPES.SUBSCRIBERTYPE
//���� ���������
  ctNone = 0;             // �� ��������
  ctPrepaid = 1;          // ������� �������
  ctPrepaidWithReg = 2;   //  ������� � �����������
  ctContractFiz = 3;      // �������� ��� ���� ��� �����
  ctContractUR = 4;       // ����������� �� ���� ��� ������������
  csContractURCoord = 5;  //�������� � ��. ���� � �����.
  csCoord = 6;            //K����������.
  csHomeInet = 7;         //�������� ����;
  csCoordContractUR = 8;  // ����������� �������� ��.
  csCoordContractFIZ = 9; // ����������� �������� ���.
  csCoordPrepaid = 10;    // ����������� ������� ��� �����������
  csCoordPrepaidWithReg     = 11; //����������� ������� � ������������
  csCoordOutOperator        = 12; //����������� ����� �� ������� ��������� (�� ��)
  ctContractFizUnbinded     = 13; // �������� ��� ���� ��� ����� - �� ������������
  ctContractURUnbinded      = 14; // ����������� �� ���� ��� ������������ - �� ������������
  ctContractURCoordUnbinded = 15; // �������� � ��. ���� � �����. - �� ������������
  csFMCContract             = 16; // FMC �������� (�2�)
  csWithoutDocs             = 17; // ��� ����������� - ��� ����������
  ctDBSS                    = 18; // ������� DBSS(incom.iscustomerdbss, VALERA.Is_Customer_Prepaid = 10)
  ctPrepaidWithReginDMP     = 19; // ������� � ������������ � DMP
  ctUndocument              = 20; // ��. ���� ��� ����������
  ctForeign                 = 21; // "�����" �������*/

declare
  id varchar2(50);
  result number;
  message varchar(250);
begin
  select to_char(max(requestId)) into id from INCOM.DIIAABONENTINFO;
  INCOM.SaveDiiaDataFromApiLayer(
    p_RequestId => id,
    p_Type => 'internalPassport',  --�ID-�����
    --p_Type => 'foreignPassport',  --������������ �������
    --p_Type => 'driveLicense',  --������������� �������������
    --p_SerialNumber => '111111112', -- ������� ����� (���������� ����)
    --p_SerialNumber => 'FF123456', -- ������� ����� (���������� ����)
    p_DocNumber => '111111111',
    p_DepartmentUA  => '��� ������ �������� (���.)',
    p_ExpirationDate  => '01.01.2027',
    --p_IssueDate  => '01.01.2020',  --�� ����� ������ ����: �ID-����� ���� ������������ �������
    --p_CreationDate  => '02.02.2020',  --������������� �������������
    p_GenderUA  => '�',
    p_ResidenceUA  => '12505, ����������� �������, ����������, ���������������, Ĳ�, 118-�, 11',
    p_LastNameUA => 'Բ����� �����-ϲ���Ȫ���� �������',  --�������=989719231: UserType = 3 - ���.����
    --p_LastNameUA => 'driveLicense',
    p_FirstNameUA => '�����',
    p_MiddleNameUA => '�����������',
    p_Birthday => '29.08.1976',
    p_TaxpayerNumber => '2800000000',
    p_Result => result,
    p_MessageText => message
  );
  if (result = 0) then
    DBMS_OUTPUT.PUT_LINE(message);
  end if;
end;
