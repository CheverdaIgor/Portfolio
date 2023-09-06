INCOM.GetAdvertisingContent  --Возвращает контент рекламного характера для печатных бланков:
select t.*, t.rowid from INCOM.ADVERTISINGCONTENT t;

INCOM.CanCommitProblem173  --Процедура проверки данных перед сохранением для ProblemID 173
INCOM.IsOneEmailValid  --Возвращает валидность Email формату адреса ЭП
Valera.Get_Customer_Segment
INCOM.GetSubscribers  --Процедура выводит номера телефонов, указанные в «Заявление на подключение Эксклюзивный номер Contract» (PID 183) сохраненные по текущему абоненту за последние 120 дней
INCOM.GetNumberForSendingSMS  --Возвращает список номеров для отправки SMS
INCOM.RequestCallsDetail  --Процедура запроса детализации звонков по обращению "Заявления на получение детализированного отчета единоразово"
  -------------------------------------------------
  if v_ErrorID = 0 then --заглушка для тестирования
     v_ErrorID := -2;
     --v_ErrorMessage := 'Произошла ошибка при обращении в стороннюю систему';
  end if;
  -------------------------------------------------

--Igor.Cheverda@kshdtestserver.ua   Artem.Kylymnyk@kshdtestserver.ua;  test1@i.ua,  test2@i.ua;test3@i.ua
валидность не только единичного но и группы адресов, разделителем м.б.
" ",
";",
",",
chr(10).
