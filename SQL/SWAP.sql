INCOM.NeedSelectSWAP  --��������� �������� ������������� ������ ������ ��������
INCOM.IsSWAP  --������� ��������� � ����� ��������� ����� ��������������
  /*--�������� ��� ����������� ������������*/
  if nvl(SYS_CONTEXT('PROGRAMINFO', 'USERLOGIN'),user) = 'HDUSER' then
      v_IsSWAP := 1;
  else
      v_IsSWAP := 0;
  end if;
  /*--�������� ��� ����������� ������������*/
INCOM.ManualCancelReserveMSISDN  --��������� ������ �������������� ������
INCOM.CanCommitProblem1092_4  --��������� �������� ������ ����� ����������� ��� ProblemID 1092
Incom.autocancelreservemsisdn  --��������� �������������� ������ �������������� ������
INCOM.VerifyMigrationPrepaid_2  --��������� �������� ����������� �������� ������������ �������� �� �������������� ����� ������������

INCOM.GetMSISDNFromBISSWAP  --��������� ��������� ������
  /*--�������� ��� ����������� ������������*/
  p_MSISDN := '989719232';
  /*--�������� ��� ����������� ������������*/

INCOM.SetReserveMSISDN  --��������� �������������� ������
  /*--�������� ��� ����������� ������������*/
  if p_MSISDN = '989719232' then
  v_ErrorID := 1;
  v_ErrorMessage := 'ErrorText2';
  end if;
  /*--�������� ��� ����������� ������������*/

INCOM.CancelReserveMSISDN  --��������� ������ �������������� ������
  /*--�������� ��� ����������� ������������--*/
  if p_MSISDN = '989719231' then
  p_Result := 1;
  --ASOID, ���. ��� �������������� � ������ �������

  p_MessageText := 'ErrorText2';
  else
  /*--�������� ��� ����������� ������������*/
end if;/*--�������� ��� ����������� ������������*/

web.swap  --��������
select t.*, t.rowid from WEB.ReservMSISDN_SWAP t
order by t.orderid desc;

select t.*, t.rowid from INCOM.FAILEDCANCELRESERVATIONTAB t;  --�������� ���������� �� �������� ���������� �������� �������

select t.*, t.rowid from INCOM.EXCLUSIVENUMBER t;  --Asoid, ������������ ������ ��� 183

INCOM.IsServiceConnected  --��������� ��������� ������� ������������ ������ �� ServiveID

