--IP ����� �������:
select t.*, t.rowid from INCOM.HTTPSERVERS t;

--�������� �������:
select t.*, t.rowid from INCOM.HTTPLINKS t;
--��� ���������� HTTP-������:
select t.*, t.rowid from INCOM.HTTPLINKSCACHE t;

--���������:
select t.*, t.rowid from INCOM.HTTPLINKPARAMETERS t
where t.linkid = 8

--������� ��� ������������ - incom.http.getclobfromhttplinks
p_params =   ACTION=&LOGIN=&PASSWORD=&USERNAME=&USERIP=&CHANNEL=&MS=&ACC=

--PID 185, ���������� ���������:
incom.getsubscriberinfo
incom.iscustomerpstn
incom.verifyproblem185
INCOM.CanCommitProblem185
