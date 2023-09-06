DECLARE
BEGIN
  FOR k IN 1..4001 LOOP
    INSERT INTO VALERA.DEPARTMENT_REGION VALUES('1029', '9');
  END LOOP;
END;

select t.departmentid, t.regionid
--delete
from VALERA.DEPARTMENT_REGION t
where t.departmentid = '1029';
