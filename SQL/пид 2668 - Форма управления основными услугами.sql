Измененные:

 Процедуры:
 –  INCOM.IsCoordinatorByOKPO - Функция проверяет наличие координатора по ОКПО и паролю координатора
–  INCOM.CANCREATEPROBLEM - Процедура общих проверок для всех заявлений
–  INCOM.InsGroupApplications_3 - Внесение групповых заявлений
–  INCOM.GetGroupAppTree_2 - Процедура возвращает дерево объединения
–  INCOM.GetGroupAppDetails_5 - Процедура возвращает список детализации
–  INCOM.CANCOMMITPROBLEM  - Процедура общих проверок для всех обращений перед сохранением

Новые:

Процедуры:
–  INCOM.GetAbonentTypeForProblem2668 - Функция проверяет является ли номер координатором или обслуживается координатором
–  INCOM.GetBaseServices - Процедура возвращает список базовых услуг
–  INCOM.CheckCoordPassword  - Процедура проверки пароля координатора
–  INCOM.CheckPhoneNumber  - Процедура проверки введенного телефона (кнопка Добавить номер для PID = 2668)
–  INCOM.VerifyServiceConnection - Процедура проверяет возможность подключения услуги (PID = 2668)
–  INCOM.VerifyServicesListConnection - Процедура проверки возможность подключения списка услуг (PID = 2668)
–  INCOM.CanCreateProblem2668 - Процедура проверки данных перед открытием для ProblemID=2668
–  INCOM.InsProblem2668  - Внесение информации по обращению "Подключение/отключение базовых услуг" (PID = 2668)
–  INCOM.InsGroupProblem2668 - Сохранение группового заявления "Подключение/отключение услуг"
–  INCOM.CanCommitProblem2668  - Процедура проверки данных перед сохранением для ProblemID 2668
–  INCOM.GetCoordinatorsFor2668 - Процедура для формирования выпадающего списка Координатор для PID = 2668
–  HDREPORTER.GetProblems2668
Данные:
–  US.EnumTypes – создали  новые справочники tyid=20037 и tyid=20038( 20037 – для наполнения выпадающего списка  'Уведомить с помощью SMS';
20038 – справочник возможных действий над услугами)
–  US.EnumTypeValues – наполнение значений для tyid=20037 и tyid=20038


Типы:
–  INCOM.ServicesRow - тип объектов для отображения услуг и их статусов в результирующей таблице (для проверки по каждой отдельной услуге – процедура INCOM.VerifyServiceConnection)
–  INCOM.ServicesTree - табличный тип состоящий из объектов INCOM.ServicesRow
–  INCOM.BaseServicesRow – тип объектов для отображения услуг и их статусов в результирующей таблице (для проверки списка услуг – процедура INCOM.VerifyServicesListConnection)
–  INCOM.BaseServicesTree - табличный тип состоящий из объектов INCOM.BaseServicesRow
