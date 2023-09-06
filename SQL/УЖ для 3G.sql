Измененные:

 Процедуры:
–  INCOM.GetFillDataAll_2  - Функция получения правил заполнения полей для Диалоговых жалоб
–  INCOM.GetFillData_3  - Процедура получения правил заполнения полей для Диалоговых жалоб
–  INCOM.GetUniversalClaimDialogTree_6  - Получить дерево диалога для универсальной жалобы (редактор)
–  INCOM.InsUniversalDialogClaim_4  - Процедура вставки универсальной диалоговой жалобы

Таблицы:
–  INCOM.ClaimsDialogTree – добавили новое поле IsInfoQuestion – признак того, что вопрос является информационным

Типы:
–  INCOM.ClaimFillData_3 – добавили два поля – дополнительная информация для мультилукапкомбобокса

Новые:

Процедуры:
--  INCOM.GetQuestsForInformationField  - Получение списка связанных вопросов для информационного поля
select
      t.ClaimTypeID
     ,t.QuestID
     ,t.InfoFieldid
    from INCOM.QuestionsForInformationField t
    where t.Problemid = '541';
--  INCOM.GetInformFieldsAnswer_1252  - Процедура возвращает результат проверки покрытия сети
p_itemid: 28598
-- -- --
p_dialogxml:
<?xml version="1.0" encoding="Windows-1251"?>
<DialogItems>
  <Item QID="28592" Answer="2682"/>
  <Item QID="28593" Answer="152365"/>
  <Item QID="28594" Answer="1 - й Залізничний" AnswerID="445038"/>
  <Item QID="28595" Answer="123" AnswerID="8888888"/>
  <Item QID="28596" Answer="21.12.2015"/>
  <Item LastQID="-1"/>
</DialogItems>
--  INCOM.GetInformFieldsAnswer  - Процедура возвращает ответ для информационного поля
--  INCOM.CheckClosingUniversalClaim - Процедура проверки закрытия проблемы сети

Таблицы:
–  INCOM.QuestionsForInformationField - Таблица связанных вопросов для информационного поля
–  INCOM.ClaimStatusByRecordID - Таблица хранит статус обработки жалоб на покрытие сети (для того, чтобы знать, жалобы по каким обращениям обработаны)
–  INCOM.ClaimInfoForGIS - Таблица содержит данные для передача жалобы на покрытие из HelpDesk в GIS

Данные:
–  INCOM.ClaimTypes - Типы универсальных жалоб. Добавили две жалобы 1285 и 1286 (Проблема с покрытием сети 3G), соответственно для PID = 1252 и PID = 541
–  INCOM.UniversalClaimControls - Элементы управления для редактора универсальных жалоб. Добавили новый контрол: Выпадающий список для отображения нескольких колонок 
–  INCOM.UniversalClaimDirectories - Справочники для редактора универсальных жалоб. Добавили новый справочник для города (для отображения в мультилукапкомбобоксе
–  INCOM.FillDataRules – новые правила для выбора города, улицы, дома
–  INCOM.TalkResults – Добавили новый итог «Передача жалобы во внешнюю систему»
–  INCOM.TalkResultSgroup, INCOM.ReactionByProblem – добавили записи для нового итога для PID = 1252, 541
–  INCOM.ClaimsDialogTree - Таблица дерева жалоб, построенных на диалоге. Добавили вопросы и определили правила для PID = 1252, 541 для жалоб 1285 и 1286 соответственно
–  INCOM.QuestionsForInformationField – внесли связанные с информационным полем вопросы

Типы:
–  INCOM.NetworkAlarmData - табличный тип для получения данных по авариям

---
INCOM.InsUniversalDialogClaim_4  --Процедура вставки универсальной диалоговой жалобы
--
select t.*, t.rowid from VALERA.MEMOSINFOTABLE t
where t.recordid in ('4724249222', '4724249223')
--
select t.*, t.rowid from INCOM.CLAIMINFOFORGIS t
where t.recordid in ('4724249222', '4724249223')

