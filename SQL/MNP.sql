INCOM.GetMNPOrders  --��������� ��������� ����������� ����������� (����� 3224)
------------------------------------------------------------------------------
INCOM.AbonentWasIdentified_3392  --��������� ��������� ������ �� ������������ �������������
INCOM.Get_ICC_By_MSISDN_3392  --��������� ��������� ������ ICC SIM �����
INCOM.GetMNPTarifPlans  --��������� ������� �������� ������ (MNP)
INCOM.MNP_ConfirmPortation  --������ �� �������� ������ �������� (MNP)
INCOM.GetMNPDueDate  --��������� ���������� ���� �������� (MNP)
INCOM.InsProblem3392  --MNP
INCOM.CanCreateProblem3392  --��������� �������� ������ ����� ��������� ��� ProblemID
INCOM.CanCommitProblem3392  --��������� �������� ������ ����� ����������� ��� ProblemID 3392
INCOM.MNP_CancelPortation  --������ �� ������ ������ �� �������� ������ �������� (MNP)
INCOM.VerifyConnectivityFor1092  --��������� ��������� ����������� ����������� ��� PID = 1092
INCOM.VerifyProblem3392  --��������� �������� ��� ������� �� ������ ��������� (ProblemID = 3392)
incom.MNP.CheckNumber  --�������������� � HTTP JSON API MNP OM
INCOM.Is_Customer_KS  --��������� ��� ���������� ������������ �������� �� ����� KS
INCOM.CheckContractNumber  --�������� ������ ��� ������������ ���� ������
INCOM.GetPortingNumberList  --��������� ���������� ������ ��� ����������� �������
select t.*, t.rowid from INCOM.APPLICATIONSADDITION t
where fieldname = 'ORDERID' and t.fielddisplayvalue = 'c383d31a-92d0-481d-abfb-5ac9f8f480c3'
order by t.recordid desc;

select t.*, t.rowid from US.ENUMTYPEVALUES t
where tyid = 20100;

delete  --�������� ����������� ������� �� ������ ��� 1092(MNP)
from valera.maintable
where recordid in (select m1.recordid
        from Incom.ApplicationsAddition App
       inner join INCOM.GroupAppParentChild Gr on App.RecordID = Gr.RecordID and App.FieldName='PORTNUMBER'
       inner join valera.maintable m1 on m1.recordid = gr.recordid);

select t.*, t.rowid from INCOM.NKP_RESERVEDNUMBERCACHE t  --����������� �����(������)
--where t.msisdn in (982195391)
order by t.msisdn desc;

INCOM.CanCommitProblem1092_4->INCOM.SetReserveMSISDN_2->:  --�������������� �� ������
--WEB.SWAP.ReserveMSISDN  --������
--WEB.SWAP.CancelReserveMSISDN  --������
--WEB.SELFCARE.ReservNumber  --������
--WEB.SELFCARE.UnReservNumber  --������
select t.*, t.rowid from WEB.ReservMSISDN_SWAP t
order by t.orderid desc;

