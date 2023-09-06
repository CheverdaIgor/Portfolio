declare 
  type list_of_names_t is table of varchar2(30) index by pls_integer;
  happyfamily list_of_names_t;
  type list_of_names_type is table of varchar2(40) index by varchar2(20);
  new_family list_of_names_type;
  
  l_row pls_integer;
  index_  varchar2(20);
BEGIN
  
  happyfamily(1):='First element'; 
  happyfamily(20):='Second element';
  happyfamily(-30):='Third element';
  happyfamily(14):='Fourth element';
  
  
  
/*  new_family(' frett1111'):= 'HELLO world';
  dbms_output.put_line(new_family(' frett1111') );
  
  new_family(' frett1111'):= '-----------';
    dbms_output.put_line(new_family(' frett1111') );
    
    
  new_family('#'):='jjjjjj';
   dbms_output.put_line(new_family('#') );
  */
  l_row:= happyfamily.LAST;
  
 dbms_output.put_line('прямой порядок');
 dbms_output.put_line('');
        
  while l_row is not null
    loop
      dbms_output.put_line(happyfamily(l_row)||' '|| to_char(l_row));
      l_row:= happyfamily.PRIOR(l_row) ;
    end loop;  
    
 /*dbms_output.put_line('');
 dbms_output.put_line('');
 dbms_output.put_line('обратный порядок');
 dbms_output.put_line('');
    
   happyfamily(-255):='New element';
 
  l_row:= happyfamily.FIRST;
    
  while l_row is not null
    loop
      dbms_output.put_line(happyfamily(l_row)||' '|| to_char(l_row));
      l_row:= happyfamily.NEXT(l_row) ;
    end loop;  
    
   dbms_output.put_line('');
   dbms_output.put_line(to_char(happyfamily.count));
    
  happyfamily.delete(-30);
  
  dbms_output.put_line(to_char(happyfamily.count));   
  
  l_row:= happyfamily.LAST;
  
 dbms_output.put_line('прямой порядок');
  dbms_output.put_line('');
        
  while l_row is not null
    loop
      dbms_output.put_line(happyfamily(l_row)||' '|| to_char(l_row));
      l_row:= happyfamily.PRIOR(l_row) ;
    end loop;  

  */
END;  
