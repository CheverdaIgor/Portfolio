INCOM.NeedSelectSWAP  --Процедура проверки необходимости выбора версии биллинга
INCOM.IsSWAP  --Функция проверяет с каким биллингом будем взаимодействие
  /*--заглушка для внутреннего тестирования*/
  if nvl(SYS_CONTEXT('PROGRAMINFO', 'USERLOGIN'),user) = 'HDUSER' then
      v_IsSWAP := 1;
  else
      v_IsSWAP := 0;
  end if;
  /*--заглушка для внутреннего тестирования*/
INCOM.ManualCancelReserveMSISDN  --Процедура отмены резервирования номера
INCOM.CanCommitProblem1092_4  --Процедура проверки данных перед сохранением для ProblemID 1092
Incom.autocancelreservemsisdn  --Процедура автоматической отмены резервирования номера
INCOM.VerifyMigrationPrepaid_2  --Процедура проверки возможности миграции контрактного абонента на предоплаченную форму обслуживания

INCOM.GetMSISDNFromBISSWAP  --Процедура получения номера
  /*--заглушка для внутреннего тестирования*/
  p_MSISDN := '989719232';
  /*--заглушка для внутреннего тестирования*/

INCOM.SetReserveMSISDN  --Процедура резервирования номера
  /*--заглушка для внутреннего тестирования*/
  if p_MSISDN = '989719232' then
  v_ErrorID := 1;
  v_ErrorMessage := 'ErrorText2';
  end if;
  /*--заглушка для внутреннего тестирования*/

INCOM.CancelReserveMSISDN  --Процедура отмены резервирования номера
  /*--заглушка для внутреннего тестирования--*/
  if p_MSISDN = '989719231' then
  p_Result := 1;
  --ASOID, таб. для резервирования и отмены номеров

  p_MessageText := 'ErrorText2';
  else
  /*--заглушка для внутреннего тестирования*/
end if;/*--заглушка для внутреннего тестирования*/

web.swap  --эмулятор
select t.*, t.rowid from WEB.ReservMSISDN_SWAP t
order by t.orderid desc;

select t.*, t.rowid from INCOM.FAILEDCANCELRESERVATIONTAB t;  --внесения информации по неудачно отмененным резервам номеров

select t.*, t.rowid from INCOM.EXCLUSIVENUMBER t;  --Asoid, эксклюзивные номера пид 183

INCOM.IsServiceConnected  --Процедура проверяет наличие подключенной услуги по ServiveID

