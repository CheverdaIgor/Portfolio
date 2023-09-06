select s.sid, s.serial#, s.username, s.osuser, s.status, s.program, s.module, p.spid
from v$session s, v$process p
where s.paddr = p.addr and (s.osuser = 'Igor' or s.osuser = '�����')
order by username;
--order by sid;

--������� ������ ������:
--alter system kill session '<sid>,<serial#>'
alter system kill session '32,107';
alter system kill session '42,345';
alter system kill session '50,108';
alter system kill session '31,280';
alter system kill session '43,201';

--���� ����� ��������� � ����������� ���������:
--alter system kill session '<sid>,<serial#>' immediate

SELECT t.SID, t.SERIAL#, t.osuser as "User", t.MACHINE as "PC", t.PROGRAM as "Program"
FROM v$session t
--WHERE (NLS_LOWER(t.PROGRAM) = 'cash.exe') -- ���������� ������ �� ��������� cash.exe
--WHERE status='ACTIVE' and osuser!='SYSTEM' -- ���������� ���������������� ������
--WHERE username = 'INCOM' -- ���������� ������ � ����� (������������)
ORDER BY 4 ASC;
