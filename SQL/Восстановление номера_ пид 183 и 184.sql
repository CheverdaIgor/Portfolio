Изменения по базе
  Измененные:
   Процедуры:
--  INCOM.CanCreateProblem184 – Процедура проверки данных перед открытием для ProblemID=184
select /*+index (m IX_MAINTABLE_PHONENUMBER)*/
                   M.RecordID
                  ,dense_rank() over(partition by M.PhoneNumber order by M.RecordDate desc) as DenseRank
                  ,M.UserName
                  ,M.ReactionTxt
                  ,M.rowid
               from VALERA.MainTable M
              where M.PhoneNumber = '989719232'
                and M.ProblemID = 186
                and upper(M.UserName) = 'FRAUD'
                and M.ReactionTxt like 'По вопросам восстановления номера%'
                 or M.ReactionTxt like 'По вопросу блокирования абонента%';
select t.*, t.rowid from VALERA.DISCONNECTEDCUSTOMERSTABLE t;  --Если с момента развязывания прошло более 90 дней (Дата обращения + 89 дней меньше текущей системной даты)

--  INCOM.CANCOMMITPROBLEM  - Процедура общих проверок для всех обращений перед сохранением
--  INCOM.InsProblem184_2 - Внесение "заявления на замену мобильного номера"
--  INCOM.UpdAppStatus_2  - Процедура обновления статуса
--  HDREPORTER.Getproblems184 - Процедура получения статистики по "подключение после развязывания"
--  VALERA.HD_PACK. GetTreeProblems – Реализован механизм запрета для сотрудников Call Center видеть в дереве обращение 184

Новые:
  Процедуры:
--  INCOM.CheckStartDate - Процедура проверки даты создания заявки на восстановление номера 
--  INCOM.GetUnbindingInfo - Процедура возвращает данные развязывания по номеру
--  INCOM.GetRestorationCost - Процедура возвращает стоимость услуги по восстановлению номера
--  INCOM.CanCommitProblem184 - Процедура проверки данных перед сохранением для ProblemID 184
--  INCOM.OnlineRequestRestoration - Процедура онлайн заявки на восстановление номера
--  INCOM.IsReplacementDueRestoration - Определяет, доступность флага «Замена производится в связи с восстановлением номера»

Данные:
--  INCOM.APPLICATIONMETAINFO  –  расширен перечень атрибутов,  отображаемых при открытии сохраненного обращения PID = 184
--  INCOM.PROBLEMID4DEALERS - разрешение для фиксирования сотрудникам дилеров
