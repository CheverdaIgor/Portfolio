declare 
--NESTED TABLE
TYPE NES_TABLE is table of VARCHAR2(150);
--TYPE NES_TABLE2 is table of VARCHAR2(150);
V_NES_TABLE NES_TABLE :=NES_TABLE(); --Нестет тейбл должны быть проинициализированны.
V_NES_TABLE2 NES_TABLE;
V_NES_TABLE3 NES_TABLE;
l_row pls_integer;
begin
 -- V_NES_TABLE:= NES_TABLE(); 
  V_NES_TABLE.extend(5); -- После чего организовуем "ячейки" для хранения информации
  V_NES_TABLE(1) := 'First';
  V_NES_TABLE(2) := 'Second';  
 -- V_NES_TABLE(3) := 'Serd';
  V_NES_TABLE(4) := 'Forth';
  V_NES_TABLE(5) := 'Fivth';  
  
  V_NES_TABLE.Delete(3);
dbms_output.put_line( V_NES_TABLE.count );
  
  V_NES_TABLE2 := NES_TABLE();  
  V_NES_TABLE2.extend(5);
   V_NES_TABLE2(1) := '2First';
  V_NES_TABLE2(2) := '2Second';  
  V_NES_TABLE2(3) := '2Serd';
  V_NES_TABLE2(4) := '2Forth';
  V_NES_TABLE2(5) := '2Fivth';   
  
  V_NES_TABLE3 := NES_TABLE();  
  V_NES_TABLE3.extend(V_NES_TABLE.count+V_NES_TABLE2.count);  
  
  V_NES_TABLE3 := V_NES_TABLE multiset union V_NES_TABLE2;
 --  V_NES_TABLE.Delete(3);
/*  
  for i in V_NES_TABLE.first..V_NES_TABLE.last
  loop
      dbms_output.put_line(V_NES_TABLE(i)||' '|| to_char(i));
  end loop;  */
   l_row:=V_NES_TABLE3.first; 
   
  while l_row is not null
    loop
      dbms_output.put_line(V_NES_TABLE3(l_row));
      l_row:= V_NES_TABLE3.next(l_row) ;
    end loop;   
    
 if V_NES_TABLE2.exists(4) then 
    V_NES_TABLE2.delete(4);
  end if;   
  
  
/*  dbms_output.put_line(to_char(V_NES_TABLE2.count));
  
  V_NES_TABLE2.Delete(5);
  
  dbms_output.put_line(to_char(V_NES_TABLE2.count));
  
  V_NES_TABLE2.TRIM;
  
  dbms_output.put_line(to_char(V_NES_TABLE2.count));
*/
 /* if V_NES_TABLE2.exists(4) then 
    V_NES_TABLE2.delete(4);
  end if;  
\*  for i in V_NES_TABLE2.first..V_NES_TABLE2.last
  loop
      dbms_output.put_line(V_NES_TABLE2(i));
  end loop; *\
  l_row:=V_NES_TABLE2.last;

 while l_row is not null
    loop
      dbms_output.put_line(V_NES_TABLE2(l_row));
      l_row:= V_NES_TABLE2.prior(l_row) ;
    end loop;   
     
   l_row:=V_NES_TABLE2.first; 
   
  while l_row is not null
    loop
      dbms_output.put_line(V_NES_TABLE2(l_row));
      l_row:= V_NES_TABLE2.next(l_row) ;
    end loop;    
     */
end;
