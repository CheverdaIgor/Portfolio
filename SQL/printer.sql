incom.IsNeedPrintersVerify  --������� ���������� ������� ������������� �������� ��������
INCOM.SaveToPrintersLog  --������� ����������� ��������� ��������� � ������� � ���������� � ���

select t.*, t.rowid from VALERA.LOG_ERR_ARCH t
order by t.create_date desc;

/*select * from INCOM.ERRORLOG t \*��� ������*\
--where t.errortext like '%vtVerifyCanCreateProblem%' and t.errordate >= '26.11.2013'
order by t.errorid desc;*/
