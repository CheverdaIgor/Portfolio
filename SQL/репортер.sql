HDREPORTER.GetApplicationFormReport_4  --Процедура получения статистики по заявлениям

select t.recordid, t.account, t.rowid from VALERA.MAINTABLE t  --1092
where t.account in (1740, 1397, 1156);

select t.parentrecordid, t.recordid, t.rowid from INCOM.GROUPAPPPARENTCHILD t  --ищу 1125
where t.parentrecordid in (5689598434, 5689598859, 5689598863);  --1092

select t.recordid, t.phonenumber, t.rowid from VALERA.MAINTABLE t  --сравниваю 1125
where (t.recordid in (5689598445, 5689598446, 5689598447))
      or (t.recordid = 5689598862  and t.phonenumber = 989719233)
      or (t.recordid = 5689598865 and t.phonenumber = 989719234);
