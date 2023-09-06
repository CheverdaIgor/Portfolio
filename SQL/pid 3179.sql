INCOM.CalculateBirthDateByINN  --Процедура для вычисления Даты рождения по ИНН
select to_date('01.01.1900', 'dd.mm.yyyy') + (substr('2800000000', 1, 5) - 1)
from dual;

INCOM.get_verification_pkg.GetInfoForAccount  -- инфо по ЛС
INCOM.VerifyDebtProblem1092_2  --Проверка наличия дебиторской задолженности PID 1092
INCOM.GetAccountByDopInfo  --Получить ЛС по ОКПО или паспортным данным
INCOM.VerifyCoordAtClient  --Процедура проверки наличия координатора у клиента или заявления об отказе

INCOM.GetAccountInfoFromWeb_6
INCOM.GetLanguageByAccount  --Процедура возвращает язык клиента
INCOM.GetDeliveryZoneByDepartmentID  --Процедура выборки зоны доставки по департаменту пользователя
