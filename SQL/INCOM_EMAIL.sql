INCOM.EMAIL  --Универсальный механизм отправки E-mail
select t.*, t.rowid from INCOM.SAVEDEMAIL t;  --расширили полем message_clob  - CLOB

select t.*, t.rowid from INCOM.SAVEDEMAIL t;
select t.*, t.rowid from INCOM.FAILINGEMAILS t;
select t.*, t.rowid from INCOM.SAVEDEMAILATTACHMENTS t;

<html><BODY><p>Проверка CLOB</p></BODY></HTML>

valera.send_emailhtml  --тестирование отправки
INCOM.SendEQMapping    --тестирование отправки со вложением

select t.*, t.rowid from INCOM.SMTPERRORCODES t;  --код ошибок при отправке email

