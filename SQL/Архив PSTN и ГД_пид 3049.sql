INCOM.CheckArchiveFolder  --Процедура проверки номера папки
select t.*, t.rowid from INCOM.ARCHIVEFOLDERS t

select t.*, t.rowid from INCOM.CUSTOMERDOCUMENTS t  --доступность типов документов на форме

INCOM.InsProblem516_3  --Процедура вставки обращения "Оригинал обращения принят на хранение"
INCOM.InsProblem3049  --Процедура вставки обращения "Оригинал обращения принят на хранение"
INCOM.InsAppByBarCode_2  --Внесение заявлений по штрих-коду
INCOM.CanCommitProblem3049  --Процедура проверки данных перед сохранением для ProblemID 3049
INCOM.VerifyBarCode_2  --Процедура проверки корректности штрих-кода в соответствии с выбранным действием

--decode(B.Status, 1, 'на хранении в архивной компании', 2, 'изъят', 'статус не определен')--
select t.*, t.rowid from INCOM.ARCHIVEBOXES t  --номер кораба, НЕ обьязательная, в таб. не должно быть значения для «Обработка штрих-кодов»
--decode(F.Status, 0, 'не заполнена', 1, 'на хранении в архивной компании', 2, 'изъята', 'статус не определен')--
select t.*, t.rowid from INCOM.ARCHIVEFOLDERS t  --номер папки, обязательный
select t.*, t.rowid from INCOM.BARCODE2DIRECTNUMBERS t  --Номер обращения/штрих-код
select m.inarchive, m.rowid  --Это заявление уже находится в архиве! (нужно удалить значение)
       from valera.maintable m
       where m.recordid = 5689552134;

INCOM.GetFolderDefaultValue  --Процедура возвращает значение по умолчанию для поля Номер папки

INCOM.GetFolderDefaultValue  --Процедура возвращает значение по умолчанию для поля Номер папки
select t.*, t.rowid from VALERA.MAINTABLE t
where problemid = 516;
---
select O.*, O.rowid from US.UserOptions O where upper(O.OptionName) = 'DOCSINFOLDER';  --пид 516, макс.количество папок
--«С коробом [номер короба] не может быть связано более [N] папок»--действие «Передача документов в архив»
select O.OptionValue, O.rowid from US.UserOptions O where upper(O.OptionName) = 'FOLDERSINBOX ';
---
3.4.4    INCOM.ArchiveContractsPSTN  --Создание реестра договоров фиксированной связи и генеральных договоров мобильной связи
3.4.5    INCOM.RecordID2Folder  --Создание таблицы привязки обращений к архивным папкам
select t.*, t.rowid from INCOM.RECORDID2FOLDER t
order by t.recordid desc;

INCOM.InsArchiveContractsPSTN  --Процедура одноразового наполнения реестра архивных документов из БИС
--TRUNCATE TABLE INCOM.ARCHIVECONTRACTSPSTN;  --очистить таблицу

select t.*, t.rowid from INCOM.ARCHIVECONTRACTSPSTN t;  --основная таблица--

INCOM.LoadArchiveContractsPSTN  --Процедура отслеживания изменений и наполнения реестра договоров фиксированной связи и генеральных договоров мобильной связи
select t.*, t.rowid from INCOM.BIS_IVR_ASSOCIATIONS t;  --Новый генеральный договор (A.Main_Clnt_ID is not null)
--4.  PSTN – тип события 4.
--В таблице incom.bis_cmb_subs_services появился новый SUBS_ID,
--связанный с ЛС фиксированной связи (CTYPE=4001 и JRTP_ID=2 и incom.bis_cmb_clients.status_id <> 4), которого еще нет в реестре.
select t.*, t.rowid from INCOM.BIS_CMB_SUBS_SERVICES t
where account = '123';

select t.*, t.rowid from INCOM.BIS_CMB_CLIENTS t  --клиент
where assc_id in (/*10,*/11);



---3.3.	Создание новой формы обращения «Оригинал обращения принят на хранение. Документы и приложения» (PID 3049)---
select INCOM.GETFULLCOMPLECTACCOUNT(35363738) from dual;  --наличие полного комплекта документов по ЕГРПОУ
select t.*, t.rowid from INCOM.ACCOUNTREGISTER t  --наличие полного комплекта регистрационных документов по ЕГРПОУ

INCOM.GetCustomerDocuments  --Процедура возвращает документы, доступные на форме для PID = 3049
Incom.InsProblem3049 --Процедура вставки обращения "Оригинал обращения принят на хранение"
select t.*, t.rowid from INCOM.BIS_IVR_ASSOCIATIONS t  --объединение 1-го уровня

INCOM.GetContractNumbers  --Процедура возвращает список номеров договоров для PID = 3049
select t.*, t.rowid from INCOM.ARCHIVECONTRACTSPSTN t;  --основная таблица--
INCOM.GetAddContractNumbers  --Процедура возвращает список номеров приложений для PID = 3049

INCOM.GetGenContractNumbers  --Процедура возвращает список номеров ГД для PID = 3049

select t.*, t.rowid from US.ENUMTYPEVALUES t  --справочник
where tyid in ('20062', '20063')

INCOM.UpdateArchiveContractsPSTN  --Процедура обновления данных реестра договоров фиксированной связи и генеральных договоров мобильной связи

select G.Status, G.UserID, G.RecordID, G.Update_Date, G.ID, G.Okpo, G.Gencontract_Num, G.Contract_Num, G.Add_Contract_Num
        from INCOM.ArchiveContractsPSTN G
        where G.Okpo = '35363738'
          --and G.Gencontract_Num in ('1','2')
          --and G.Account in ('3985436','3985438')
          and G.Contract_Num = '55555_5'/*'Contract_Num1'*/
          --and G.Add_Contract_Num in ('1','2')
          and G.Status in (0, 1, 2)
        --returning G.ID into v_ArchiveID;

select
      M.Field30,
      M.Field28     as v_ArchiveID,
      M.Field7      as ApplicationNumber,
      M.Field4      as Account,
      M.Field23     as DocTypeID,
      M.Field12     as GenContract_num,
      M.rowid
     from Valera.MemosInfoTable M
     where M.RecordID in ('5689554685');

select t.*, t.rowid from INCOM.BIS_IVR_JUR_ADDRESSES t
where clnt_clnt_id = '4073832';

INCOM.GenerateInsProblem3049  --Генерирует обращение «Оригинал обращения принят на хранение. Документы и приложения» (PID 3049) для каждой записи ручного реестра
INCOM.LoadArchiveFolders  --Процедура заливает в реестр папок данные из ручного реестра
select t.*, t.rowid from INCOM.ARCHIVELOADDATA t

select t.*, t.rowid from VALERA.MAINTABLE t
order by t.recordid desc;
select t.*, t.rowid from VALERA.MEMOSINFOTABLE t
order by t.recordid desc;

