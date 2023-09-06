INCOM.GetPopupMessage_2  --Выборка всплывающих сообщений
INCOM.MarkUnreadTroubles  --Процедура пометки прочтения события
turchin.CLEAR_POPUP_MESSAGES  --удаление сообщений
INCOM.DelPopupMessageTable_2  --Процедура удаления всплывающего сообщения
select t.*, t.rowid from TURCHIN.POPUP_MESSAGE_TABLE t;

select t.*, t.rowid from INCOM.UNREADTROUBLES t;

