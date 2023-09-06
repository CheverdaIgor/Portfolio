INCOM.CheckSIMPairStatus  --Процедура проверяет статус услуги сим-пара по номеру телефона
INCOM.GenContractTmpPwd  --Процедура, которая отправляет http-запрос во внешнюю систему для генерации временного пароля
--p_password => 'HEv9@zBFkRvB60CB'

INCOM.VerifyContractTmpPwd  -- Процедура, которая отправляет http-запрос во внешнюю систему для проверки временного пароля
INCOM.VerifyFreeChangeSIMTmpPwd  --Процедура проверяет возможность идентификации по временному паролю (для бесплатной замены SIM-карты)

INCOM.GetCoordinatorType  --Функция определяет тип номера координатора

INCOM.VerifyFreeChangeSIMTmpPwd  --Процедура проверяет возможность идентификации по временному паролю (для бесплатной замены SIM-карты)
select t.*, t.rowid from INCOM.SUBSSERVICEADDSTATUS t;  --ASOID: Услуга «Переадресація смс» в статусе «подключена» или «не подключена» (см. 3.4)

select t.*, t.rowid from IVR.IVR_CLIENTS t  --ASOID: Номер телефона находится в статусе «Тимчасово закрит» или «діючий» (см. 3.3)
where t.clnt_id = '4073832';

valera.get_customer_segment  --сегмент
select US.Bitwise.GetBitByNumber(6, p.Properties), p.ProblemID  --в поле valera.problemstable_new.Properties установлен 6 бит = 1
from Valera.Problemstable_new p;

