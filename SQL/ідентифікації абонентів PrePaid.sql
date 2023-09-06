--Новые процедуры:
INCOM.GenPrepaidTmpPwd --заглушка, которая будет отправлять http-запрос во внешнюю систему для генерации временного пароля
INCOM.VerifyPrepaidTmpPwd --заглушка, которая будет отправлять http-запрос во внешнюю систему для проверки временного пароля
INCOM.GetPrepaidPassportByMSISDN --Паспортные данные определяются по номеру телефона абонента в таблице VALERA.PREPAIDINFORMATIONTABLE, если абонент зарегистрировал их
select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t

--INCOM.GetTalkResults:
select
       G.ProblemID
      ,R.ResultID
      ,R.ResultName
      ,G.GroupID
      ,R.IsAllowed
      ,R.InternalResultName
from INCOM.TalkResults R
inner join INCOM.TalkResultsGroup G on G.ResultID = R.ResultID
where G.ProblemID = '2573'
---выпадающий список "Сопровождение обращения"(активация закладки "Реакция компании")
select RP.PROBLEMID, RP.Resultid, RT.Resultname, RP.REACTIONID, R.REACTIONNAME, RP.rowid
        from Incom.ReactionByProblem RP
        inner join Incom.Reactions R on R.ReactionID = RP.ReactionID
        inner join INCOM.TalkResults RT on RT.Resultid = RP.Resultid
        where RP.ProblemID = '2573';

Incom.IdentificationCheckTypes
INCOM.CanCreateProblem2573 --Процедура проверки данных перед открытием для ProblemID
