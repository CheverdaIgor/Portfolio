INCOM.GetAICheckTypesRestrict  --��������� ���������� ������� ������� ����� �������� � ����������� ��� ��������

INCOM.GetAccountInfoFromWeb_5
INCOM.GetUnbindingInfo  --��������� ���������� ������ ������������ �� ������
select t.*, t.rowid from VALERA.DISCONNECTEDCUSTOMERSTABLE t;  --������� ��������
select t.*, t.rowid from INCOM.BIS_IVR_CLIENT t  --incom.getsubscriberaccount �� ���������� ��������, �� ��� ����������� �������
where t.clnt_id in ('4073831','40738311');
select t.clnt_clnt_id, t.INN, t.rowid from incom.bis_ivr_jur_addresses t  --�������� ����������� ��� ������ ������ ����������ջ
where t.clnt_clnt_id in ('4073831', '4073832', '4073833');


INCOM.GenTmpPwd  --��������, ������� ����� ���������� http-������ �� ������� ������� ��� ��������� ���������� ������
INCOM.VerifyTmpPwd  --��������, ������� ����� ���������� http-������ �� ������� ������� ��� �������� ���������� ������

INCOM.VERIFYINN  --��������� ��������� ��� �������������� ��������
INCOM.GetAICheckTypes_2  --��������� ����������  ��� ��� ���� �������� ��������
    select UC.CHECKTPID, CT.CHECKTYPENAME, UC.SUBSCRIBERTYPE, 1 as needallcheck
           from incom.AIUSERTYPETOCHECKTYPES UC, incom.AICHECKTYPES/*����������� � ������ ������������� �������*/ CT
    where  CT.CHECKTPID = UC.CHECKTPID
           order by UC.UTCTID;
select t.*, t.rowid from INCOM.AIUSERTYPETOCHECKTYPES t;  --���������� SUBSCRIBERTYPE-� ��� ��������
INCOM.GetCoordinatorType  --������� ���������� ��� ������ ������������
select t.*, t.rowid from VALERA.CONTRACT_MIGRATION_LIST t;  --10; // ����������� ������� ��� �����������
select t.*, t.rowid from INCOM.AICHECKTYPESTORESTRICTIONS t;  --��������� �� ���� "������������� ��������"

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
  ctForeign                 = 21; // "�����" �������
  ctBSSpostpaid             = 22; // ������� BSS Postpaid
