/*select t.field30, t.field26 as PDF_1_0, t.field44 as PDF_��_���, t.field27 as �����_�����, t.field6 as �����, t.account, t.big_field1, t.rowid*/
select t.*, t.rowid
from VALERA.APPLICATIONSINFOTABLE t
where t.recordid = '4724212059';

--select t2.problemid, t2.maintableaddid, t2.account, t2.reactiontxt, t2.rowid
select t2.*, t2.rowid
from INCOM.MAINTABLEADDITION t2 where t2.recordid = '4724211866';

select t.*, t.rowid from INCOM.ADDRESSINFO t
where t.recordid = '4724212059';

/*select t1.problemid, t1.phonenumber, t1.account, t1.rowid
from VALERA.MAINTABLE t1 where t1.recordid = '4724211860'*/

/*select t.*, t.rowid from WEB.DICTIONARY_INFO t*/
