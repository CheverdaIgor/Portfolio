DECLARE
 TYPE Employee_ROWS IS TABLE OF employee%ROWTYPE;
 TYPE Employee_ROWS2 IS TABLE OF employee.name%TYPE;
 underpaid Employee_ROWS; 
 second_col Employee_ROWS2;
 
 type rec is record 
 (name_ varchar2(50),
  first_name varchar2(40),
  birthday date
 );
 
 VAR4 employee.name%TYPE;
 VAR3 employee%rowtype;
 var_record rec;
BEGIN
 var_record.birthday:=to_date('01.01.2014','dd.mm.yyyy') ;
null;
SELECT * BULK COLLECT 
  INTO underpaid 
  FROM employee
 WHERE salary < 5000 
ORDER BY salary DESC;



SELECT name BULK COLLECT 
  INTO second_col 
  FROM employee
 WHERE salary < 5000 
ORDER BY salary DESC;

var_record.name_:='Name';

 DBMS_OUTPUT.PUT_LINE(underpaid.COUNT || ' Столько человек получают меньше 5000.');
 
/* FOR i IN underpaid.FIRST..underpaid.LAST
 LOOP
  DBMS_OUTPUT.PUT_LINE(underpaid(i).name || ' - ' || underpaid(i).salary);
 END LOOP;
*/
END;
/
