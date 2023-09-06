INCOM.GetCustomerEntity_2  --Процедура возвращает тип абонента
INCOM.IsMultiReregistration  --Проверка факта нескольких перерегистраций за текущий месяц
INCOM.Is172Present  --Проверка наличия pid = 172 (pid = 330
INCOM.IsSegmentChangeAvailable  --Проверка возможности смены сегмента (pid = 182, 330, 172)
INCOM.GetTPList_5  --Получение списка ТП
INCOM.GetPhonesForTPGroupSwitch  --обработка нового режима "REREG"
Incom.HD_Can_I_Change_TP  --Проверяет возможность перехода с одного тарифного плана на другой
  /*--заглушка для внутреннего тестирования*/
  p_Result := 1;
  p_PrintApp := 0;
  p_ResultText := null;
  /*--заглушка для внутреннего тестирования*/

