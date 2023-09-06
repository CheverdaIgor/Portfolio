select t.*, t.rowid from VALERA.PROBLEMSTABLE_NEW t where t.problemnamerus = 'Дифференцированный счет'

select t.*, t.rowid from VALERA.PROBLEMSTABLE t where t.problemid = '430'

select t.*, t.rowid from VALERA.PROBLEMSTABLE_new t where t.universalappealtypeid = '5' and t.connectiontype = '1'
and t.isallowed = '1' and t.problemid = '1540'

select f.problemid from Valera.Hd_Forbidden_Problemids f where f.problemid = '1540'

