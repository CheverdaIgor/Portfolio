create or replace package FIRST_PKG_GR3 
is 
CONST1 CONSTANT NUMBER := 10000;
procedure proc01 (p_ID IN NUMBER);
--function func01 (in_param IN NUMBER) return varchar2;

end FIRST_PKG_GR3;
/
create or replace package body FIRST_PKG_GR3 
is 

function func01  (in_param IN NUMBER) return varchar2
  is 
  begin
    null; 
   return 'ok'; 
  end;
procedure proc01 (p_ID IN NUMBER)
  is 
  var1 varchar2(50);
  begin 
 var1:=func01(10);
  end;

end FIRST_PKG_GR3;
/    
