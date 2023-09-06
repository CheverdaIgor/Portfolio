select t.*, t.rowid from INCOM.FTTBLOCALITYSUBSLIMIT t
where townid in (122723, 150710);

INCOM.LoadFTTBLocalitySubsLimit  --Процедура заливки и синхронизации данных в таблицу INCOM.FTTBLocalitySubsLimit
INCOM.UpdateFTTBLocalitySubsLimit  --Процедура обновления количества абонентов в INCOM.FTTBLocalitySubsLimit
INCOM.RunProfiles_2  --Сканирует таблицу профилей и запускает проверку, в случае срабатывания профиля идет оповещение
select t.*, t.rowid from INCOM.NOTIFYPROFILEPROBLEMS t
where t.problemid in '348';

select t.*, t.rowid from VALERA.MEMOSINFOTABLE t  --пид 1452
where recordid in (5689567344, 5689567345, 5689597778, 5689597785);

select t.*, t.rowid from INCOM.NOTIFYPROFILEPROBLEMS t
where profileid = 180;

select /*+ index (mt IX_MAINTABLE_PROBLEMID_RD) */
                 mt.problemid, j.cit_cit_id, j.clnt_clnt_id, mt.recordID
                 --, tt.townid, tt.city_name_unic_ua as townname, f.informationlimit
                from VALERA.MainTable mt
                left join VALERA.MemosInfoTable mi on mt.recordID = mi.recordID
                left join INCOM.BIS_IVR_Client c on mi.field8 = c.account and c.part = 2/* and (C.Status_ID = 2 and C.CTYP_ID = 4001 and C.JRTP_ID = 1)*/
                left join INCOM.BIS_IVR_Jur_Addresses j on c.clnt_id = j.clnt_clnt_id and c.part = j.part
              --  left join US.Towns tt on j.cit_cit_id = tt.cityibsid and  tt.version = 3
               -- left join INCOM.FTTBLocalitySubsLimit f on tt.townid = f.townid
                where mt.problemID = 1452/*348*//*1309*/
                and (C.Status_ID = 2 and C.CTYP_ID = 4001 and C.JRTP_ID = 1);
