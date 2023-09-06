INCOM.GetHeads_LZ  --Возвращает список подписантов (Лига Закон)
INCOM.GetCustomerInfo_LZ  --Процедура возвращает информацию об абоненте из системы Contr Agent (Лига Закон)
INCOM.CheckCustomerInfo_LZ  --Процедура проверяет информацию об абоненте, полученную из системы Contr Agent с BIS
INCOM.CheckOKPOIsNew  --Проверка по критерию нового ОКПО/ИНН (Лига Закон)
INCOM.GetUserPermissionType  --Процедура возвращает роль текущего пользователя
INCOM.GetClientType_2  --Процедура возвращает тип координируемого клиента

/*--заглушка для внутреннего тестирования*/
if p_OKPO in ('35363738', '35363739') then
/*--заглушка для внутреннего тестирования*/
  p_Result := 1;
  
  select decode(count(*), 0, 0, 1)
    into v_ActualInfo
   from INCOM.LZ_customerInfo C
  where C.OKPO = p_OKPO
    and trunc(C.MofifyDate) = trunc(sysdate)
    and C.RequestStatus = 1;
  
  if  v_ActualInfo = 0 then
    INCOM.InsContrAgentInfo(p_OKPO, p_Result, p_MessageText);  
  end if;
/*--заглушка для внутреннего тестирования*/
else
  p_Result := 0;
  p_MessageText := 'нет информации об абоненте из системы Contr Agent (Лига Закон)';
  end if;
/*--заглушка для внутреннего тестирования*/
INCOM.InsContrAgentInfo  --Процедура внесения информации в БД ХД из системы Contr Agent (Лига Закон)
INCOM.CheckRegisteredCustomer_LZ  --Проверка клиент зарегистрирован в компании (Лига Закон)
    /*--заглушка для внутреннего тестирования*/
    if p_OKPO = '35363738' then
      v_Result := 1;
      else
        v_Result := 0;
        end if;
    /*--заглушка для внутреннего тестирования*/
INCOM.CanUpdateCustomerInfo_LZ  --Проверка разрешения обновления данных в ХД, данными полученными из системы CONTR AGENT (Лига Закон)
INCOM.SendEmailContrAgentError  --Процедура отправки email уведомлений по неуспешным результатам запросов в систему "CONTR AGENT"

--Созданы таблицы:
select t.*, t.rowid from INCOM.LZ_CUSTOMERINFO t  --общая инфа
where t.id in (50,49);
--12506, Житомирська область, Коростишів, Коростишівський, Лазо, 118-А, 11
--01001, М.КИЇВ,ПЕЧЕРСЬКИЙ,ВУЛИЦЯ ХРЕЩАТИК,19-А
--50102, ДНІПРОПЕТРОВСЬКА ОБЛ.,КРИВИЙ РІГ,ІНГУЛЕЦЬКИЙ,ВУЛИЦЯ КАТКОВА,БУД. 31,КВ. 20

select t.*, t.rowid from INCOM.LZ_HEADS t;  --подписанты
INCOM.LZ_TaxDebt  --налоговый долг
INCOM.LZ_VatInfo  --плательщик НДС
INCOM.Liga  --Пакет взаимодействия с системой CONTR AGENT (Лига Закон)
select to_char(to_date('19700101','yyyymmdd') + ((&p_Unix/1000)/24/60/60), 'dd.mm.yyyy hh24:mi:ss')  --&p_Unix = 1566594621398
from dual;

SELECT (cast(current_timestamp as date) - to_date('01-01-1970','DD-MM-YYYY'))*(86400)*1000 + (To_Char(current_timestamp, 'FF')/1000)
FROM dual;  --получение текущей даты

