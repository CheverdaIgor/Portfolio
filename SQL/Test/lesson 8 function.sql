create or replace function first_funct_gr3 (P_VAR1 IN NUMBER, P_VAR2 IN NUMBER)
return pls_integer
is 
begin
 return P_VAR1+P_VAR2;
end first_funct_gr3;  
