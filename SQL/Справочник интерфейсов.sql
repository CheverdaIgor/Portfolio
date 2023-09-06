--IP адрес сервира:
select t.*, t.rowid from INCOM.HTTPSERVERS t;

--название функции:
select t.*, t.rowid from INCOM.HTTPLINKS t;
--кеш результатів HTTP-запитів:
select t.*, t.rowid from INCOM.HTTPLINKSCACHE t;

--параметры:
select t.*, t.rowid from INCOM.HTTPLINKPARAMETERS t
where t.linkid = 8

--функция для тестирования - incom.http.getclobfromhttplinks
p_params =   ACTION=&LOGIN=&PASSWORD=&USERNAME=&USERIP=&CHANNEL=&MS=&ACC=

--PID 185, измененные процедуры:
incom.getsubscriberinfo
incom.iscustomerpstn
incom.verifyproblem185
INCOM.CanCommitProblem185
