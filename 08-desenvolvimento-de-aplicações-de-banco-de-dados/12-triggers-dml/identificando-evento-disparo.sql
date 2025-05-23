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


-- Example 2

conn system/oracle
drop trigger seguro_emp;

conn scott/tiger 
drop trigger seguro_emp;

drop table aud_emp;
Create table aud_emp (
    User_name varchar2(30),
    Data date,
    Antigo_nome varchar2(50),
    Novo_nome varchar2(50),
    Antigo_salario number(7,2),
    Novo_salario (7,2)
);


CREATE OR REPLACE TRIGGER auditar_emp
    AFTER DELETE OR INSERT OR UPDATE On Scott.emp
    FOR EACH ROW
BEGIN 
    INSERT INTO aud_emp (User_name, data, Antigo_nome, Novo_nome, Antigo_salario, Novo_salario);
    VALUES (user, sysdate, :old.ename, :new.ename, :old.sal, :new.sal);
END;
/

-- testando o gatilho
insert into SCOTT.emp (empno, ename, sal, deptno)
values(7937, 'Sandra', 1203, 10);

select User_name, TO_CHAR(data, 'DD-MM-YYYY HH:MI:SS'), Antigo_nome, Novo_nome, Antigo_salario, Novo_salario from aud_emp;

-- atualizando a tabela
update scott.emp
set sal = 1300
where ename = 'SANDRA';

select User_name, TO_CHAR(data, 'DD-MM-YYYY HH:MI:SS'), Antigo_nome, Novo_nome, Antigo_salario, Novo_salario from aud_emp;