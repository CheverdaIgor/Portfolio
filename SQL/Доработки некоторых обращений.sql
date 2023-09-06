INCOM.GetCustomerEntity  --Процедура возвращает тип абонента
INCOM.GetSIMInfo  --Процедура получения информации о SIM карте
INCOM.GetSIMInfo461_2  -- Процедура получения информации о SIM картах
INCOM.GetDataForProblem461Contract  --Процедура вставки Заявление на повторную выдачу PUK кода (Контракт)

select t.*, t.rowid from VALERA.PREPAIDINFORMATIONTABLE t

pps_adm.prepaid_sim_cards_for_hd_v

Incom.GetDirectNumber_2  --Процедура выборки прямых номеров
Incom.GetActions365_2  --Процедура выборки действий и их проверки Problem365
select t.*, t.rowid from INCOM.DIRECTNUMBERSLIST t /*прямой номер, пид 365, выбор номера при подключении*/
select t.*, t.rowid from INCOM.CLIENTSERVICES t  --ASOID, пид 365(прямой номер), подключен, новый функционал
where msisdn = '989719232';

Incom.CanCreateProblem1118  --Процедура проверки данных перед открытием для ProblemID
Incom.Cancommitproblem1118  --Необходимые проверки/действия в момент сохранения
INCOM.InsProblem1118        --Заявление на активацию запасной SIM-карты

INCOM.GetActionsForProblem1117_3  --Получить доступные действия по абоненту для Problem1117 (запасная SIM)
INCOM.GetSpareSIMStatus  --Проверка состояния услуги "запасная SIM" для контрактных/припейдных абонентов/по OKPO
INCOM.HasActiveSpareSIM  --Проверка наличия запасной SIM-карты с неистекшим сроком активации
Incom.CanCreateProblem1117  --Процедура проверки данных перед открытием для ProblemID
Incom.CanCommitProblem1117  --необходимые проверки/действия в момент сохранения заявления
/*ASOID:*/
select t.*, t.rowid from INCOM.SUBSADDDETAIL t  --Проверка наличия запасной SIM-карты с неистекшим сроком активации, пид 1117
where t.ms like '%98971923%';
or
select t.*, t.rowid from INCOM.PP_GET_SERVICES_DETAILS t  --пид 1118: "Истек срок активации SIM-карты" либо действие "Отключить" для пид 1117
where t.msisdn like '%98971923%';

select t.*, to_number(replace(tvValue,',','.')), t.rowid
  from US.EnumTypeValues t
  where t.TYID = 10319 and t.tvName = 'MinPriceValue';

select t.*, t.rowid from VALERA.CUSTOMER_SEGMENTS t  -- определяем уровень доходности абонента, участнику программы лояльности «Золотой абонент» уровня «Gold» (ARPU = 4)  и «Platinum» (ARPU = 7)
where t.msisdn like '%98971923%';

INCOM.GetOrganizationNameByOKPO  --Процедура получения имени организации по ОКПО
INCOM.CanUseSpareSIMForContract  --Проверка возможности предоставления услуги (запасной SIM-карты) контрактному абоненту
