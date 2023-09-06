INCOM.VerifyActionForProblem1117  --ѕроверка допустимости выбранного действи€
INCOM.GetVIPCategory  --ѕроцедура возвращает категорию и тип абонента
INCOM.CanFreeServicesForProblem1117  --ѕроверка доступности бесплатной обработки за€влени€ по ProblemID = 1117

select t.*, t.rowid from VALERA.CUSTOMER_SEGMENTS t  --золотой абонент
