declare 
type type_VARRAYS  is varray(15) of varchar2(100); 
V_ARR type_VARRAYS:=type_VARRAYS();
begin
   V_ARR.extend(5);
   V_ARR(1):='First element of VARRAYS';
   V_ARR(2):='Second element of VARRAYS';   
   V_ARR(3):='Third element of VARRAYS';  
   V_ARR(4):=' element of VARRAYS';  
   V_ARR(5):='Fifth element of VARRAYS';    
   

for i in V_ARR.first..V_ARR.last loop
  dbms_output.put_line(V_ARR(i));
end loop;  
  

  dbms_output.put_line(V_ARR.count);


  dbms_output.put_line(V_ARR.limit); 
  
  V_ARR.trim;  
--    V_ARR.delete(2);   -- нельзя!!!
  dbms_output.put_line('После трима '||V_ARR.count);

   dbms_output.put_line('**************************************');  
for i in V_ARR.first..V_ARR.last loop
  dbms_output.put_line(V_ARR(i));
end loop;    
  
  V_ARR.delete; -- Можно

   dbms_output.put_line('**************************************');  
   dbms_output.put_line(V_ARR.count);

  dbms_output.put_line(V_ARR.limit); 
   V_ARR.extend(5);
   V_ARR(1):='Fifth element of VARRAYS';    
   dbms_output.put_line(V_ARR(1));
end;
