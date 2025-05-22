-- Example 1
conn system/oracle
drop table event_log;

create table event_log(
    evento varchar2(100)
);

CREATE OR REPLACE TRIGGER log_logon
    AFTER LOGON ON DATABASE 
    WHEN (USER = 'SYSTEM' OR USER='SCOTT')
BEGIN 
    INSERT INTO event_log VALUES ('O usuario ' || USER || 'efetuou login no banco de dados em ' || TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS'));
    END;
/


-- testando gatilho

conn scott/tiger 
conn system/oracle

-- Para o usuário a trigger é transparente, não aparece para o usuário. Ele não sabe que está sendo monitorado.



select * from event_log
-- Se dermos o select, irá aparecer que o usuário efetuou o login