SELECT distinct
       R.REGIONIBSID
      ,R.REGIONID
      ,R.REGIONNAME --
      ,D.DistrictIBSID
      ,D.DISTRICTID
      ,D.DISTRICT_UKR --
      ,T.CITYIBSID
      ,T.TOWNID
      ,T.TOWNNAMEUKR --
      ,S.STREETIBSID
      ,S.STREETID
      ,S.STREET_NAME_UNIC_UA --
      ,DZ.ZIPIBSID
      ,DZ.ZipID
      ,DZ.Zip --
      ,H.HOUSEBISID
      ,H.HOUSEID
      ,HOUSE_NUM_UA
    FROM US.DlvZip DZ
      inner join US.HOUSES H on DZ.ZIPID = H.HOUSEZIPID and H.version = 3
      inner join US.STREETS S on H.STREET_ID = S.STREETID and S.version = 3
      inner join US.TOWNS T on S.Townid = T.Townid and T.version = 3
      inner join US.Regions R on T.RegionID = R.RegionID and R.version = 3
      left join US.District D on T.Districtid = D.Districtid and D.version = 3
    where (DZ.version = 3 and H.Housebisid in ('777777', '888888', '999999')) or H.Houseid in ('4421619')
    or (DZ.Zip = '12501' or DZ.Zip = '12505' or DZ.Zip = '12506' or DZ.Zip = '12507' or DZ.Zip = 13302);


/*select t.*, t.rowid from US.STREETS t
where t.streetnameukr like '%Червонозоряний%' and t.streetid = '308407';*/

--INCOM.IsRegionalCenter --Проверка: является ли определенный населенный пункт областным центром Украины
--INCOM.GetASSCInfo_2 --Запрос информации по объединению 0-го уровня и ГКО
--INCOM.GetAddressTypeByPID --Процедура выборки списка доступных типов адресов для определенного PID

select t.*, t.rowid from US.REGIONS t
where regionid in ('1006', '2485');

select t.*, t.rowid from US.DISTRICT t
where districtid in ('3285', '1927') and regionid in ('1006', '2485');

select t.*, t.rowid from US.TOWNS t
where regionid = 1006 and townid in ('53865', '12216');

select t.*, t.rowid from US.STREETS t
where streetnamerus like '%Лермонтова%'/* and townid in ('53865', '12216')*/;
