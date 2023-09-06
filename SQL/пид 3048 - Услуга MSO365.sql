INCOM.CanCreateProblem3048  --Процедура проверки данных перед открытием для ProblemID=3048
INCOM.CanCommitProblem3048  --Процедура проверки данных перед сохранением для ProblemID 3048
INCOM.GetSubsPacketsMSO  --Процедура возвращает список пакетов и количество лицензий, подключенных у абонента на текущие сутки (PID=3048)
select t.*, t.rowid from INCOM.SUBSADDDETAILMSO t  --ASOID, список пакетов и количество лицензий

INCOM.GetItemsFor3048  --Процедура возвращает список пакетов и количество лицензий  для PID=3048
INCOM.GetSubsPacketsMSO  --Процедура возвращает список пакетов и количество лицензий, подключенных у абонента на текущие сутки (PID=3048)

select t.*, t.rowid from US.USEROPTIONS t  --сох. пользовательские настройки
where sectionname = 'Problem 3048 vw'

INCOM.GetSubsPacketsMSO  --Процедура возвращает список пакетов и количество лицензий, подключенных у абонента на текущие сутки (PID=3048)
INCOM.GetAddAgreement  --Процедура возвращает Номер доп. соглашения для PID = 3048(«подключение корпоративного MSO 365»)
select t.Agreement + 1  --если записи возвращаются, то не корпоративный MSO 365
     from (select /*+index (MT IX_MAINTABLE_PHONENUMBER_ACC)*/ A.Field1 as Agreement,
                 dense_rank() over(partition by MT.Account order by MT.RecordID desc) as DenseRank
             from Valera.MainTable MT
            inner join Valera.ApplicationsInfoTable A on MT.RecordID = A.RecordID
            where MT.ProblemID = 3048
              and MT.Account = '3985435'
              and MT.ApplicationStatus = 'Выполнено'
            order by MT.RecordID desc) t
    where t.DenseRank = 1 and rownum = 1;
select t.*, t.rowid from VALERA.MAINTABLE t
where problemid = 3048 and account = '3985435';
------------------------------------------------------------------------------------------------
select decode(nvl(A.FieldValue, 0), 1, '1', '2'), nvl(A.FieldValue, 0), App.Field63, MT.RecordID  --корпоративный MSO 365
       from Valera.MainTable MT
      inner join Valera.ApplicationsInfoTable App on MT.RecordID = App.RecordID
       left join Incom.ApplicationsAddition A on App.RecordID = A.RecordID and A.FieldName = 'CORPORATEMSO'
           where MT.ProblemID = 3041
             and App.Field63 = '3985435'
             and MT.ApplicationStatus = 'Выполнено'
             and rownum = 1
      order by MT.RecordID desc;
select t.*, t.rowid from VALERA.MAINTABLE t
where recordid = 5689561092;
select t.*, t.rowid from VALERA.APPLICATIONSINFOTABLE t
where recordid = 5689561092;
select t.*, decode(nvl(t.FieldValue, 0), 1, '1', '2'), nvl(t.FieldValue, 0), t.rowid from INCOM.APPLICATIONSADDITION t
where recordid = 5689561092;

