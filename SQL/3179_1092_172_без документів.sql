INCOM.CheckConnectivity  --Процедура проверки при нажатии на кнопку "Проверка возможности подключения" (PID = 3179)
INCOM.IsAccountWithoutDocs  --Функция проверяет является ли ЛС - "ЛС без документов"
select t.RGSC_ID, t.clnt_id, t.rowid from INCOM.BIS_IVR_CLIENT t /*9-з відміткою «Без документів»*/
where t.clnt_id in ('4073831', '4073832', '4073833', '4073834');

INCOM.GetTypeApplicationForms  --Процедура возвращает тип аппликационной формы
INCOM.GetPhoneNumberList1462  --Процедура получения списка всех сохраненных номеров в обращении на смену информации
INCOM.CanCreateProblem1462  --Процедура проверки данных перед открытием для ProblemID=1462
INCOM.InsProblem1462_4  --Внесение данных по обращению "Заявление на смену информации"
INCOM.CanCommitProblem1462  --Процедура проверки данных перед сохранением для "Изменения информации" (PID 1462)
select /*+index (m IX_MAINTABLE_PHONENUMBER_ACC)*/ max(M.RecordDate)  --'На 91-й день заявка на смену информации по ЛС «без документов» не принимается'
          from VALERA.Maintable M
          inner join Valera.Applicationsinfotable A on M.RecordID = A.RecordID and A.Field22 = 3
         where M.ProblemID = 1092
           and M.Account = 3985436
           and M.ApplicationStatus <> 'Ошибочно';

select t.*, t.rowid from VALERA.MAINTABLE t
where recordid in (5689577870, 5689577868);

INCOM.IsLegalAccountWithoutDocs  --Функция проверяет является ли ЛС - "ЛС без документов" для юр.лиц
INCOM.AutoProcessApp172  --Процедура автоматической обработки обращения 172
INCOM.SendEmailFor1092  --Процедура отправки email уведомлений по заявкам на подключение без документов

