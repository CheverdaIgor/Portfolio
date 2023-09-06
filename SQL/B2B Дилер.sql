INCOM.CanCreateProblem180  --Процедура проверки данных перед открытием для ProblemID
INCOM.CanCommitProblem180  --Процедура проверки данных перед сохранением для ProblemID 180

INCOM.CanCreateProblem321  --Процедура проверки данных перед открытием для ProblemID
incom.VerifySegment469  --Процедура проверки соответствия сегмента для клиента для сотрудников Дилера

select t.*, t.rowid from INCOM.PERMISSION_TYPE_REPORT t
where id_permission_type = 89;  --отчеты

select t.*, t.rowid from VALERA.PERMISSION_USER_PROFILES t
where t.userid in (293);

