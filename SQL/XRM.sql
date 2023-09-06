--npm run start
INCOM.GetavAvailableEventsXRM  --Процедура определения доступности кнопки "XRM"
INCOM.Getnumbertypebycall  --Получение информации о звонке (MSISDN,ACCOUNT,NUMBERTYPE) по номеру звонка, пришедшего в ХД из телефонии
INCOM.NeedShowActiveOffer_2  --Надо ли показывать значек доллара для СС (Активные предложения)
OCS.GetContactByANI  --Процедура возвращает информацию о контакте по ANI в очереди для HD
select t.*, t.rowid from OCS.OCSCALLS t;

incom.getcustomerinformation_4  --Процедура возвращает информацию по абоненту
select t.*, t.rowid from VALERA.CUSTOMERINFORMATIONTABLE t;

TURCHIN.HD_GREETING  --TURCHIN.Hd_Greeting
INCOM.DisplayGreeting  --Функция определяет отображать ли приветствие
INCOM.InsMainTable2IVR_3  --Внесение связи между звонком IVR и сохраненным обращением
select t.*, t.rowid from INCOM.MAINTABLE2IVR t
where t.recorddate like to_date('24.06.2020','dd.mm.yyyy')
order by t.recorddate desc;

select t.actionname, t.actiontype, t.jsondate, t.rowid
from INCOM.XRMLOG t
where t.jsondate is not null
order by t.jsondate desc;

select t.* from VALERA.V_MAINTABLE_FOR_XRM t;

INCOM.GetCSRToolboxURL_3  --Получить URL для доступа к окну CSRToolbox
