INCOM.GetDealers  --Процедура выборки списка продавцов
INCOM.CheckAvailableSubsForB2B  --Процедура проверяет доступных абонентов для пользователя HD с ролью «Дилер продажу - партнер B2B»
select t.*, t.rowid from INCOM.SIEBEL_ASSIGNMENT t;

incom.verifygenagreement1092  --Проверка номера ГД для PID 1092
select t.*, t.rowid from PHYSASSCID t;  --ASOID: пид 1092, номер ГД
