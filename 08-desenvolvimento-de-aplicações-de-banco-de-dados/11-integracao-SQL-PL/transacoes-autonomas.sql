-- Transação começa com qualqer operação DML, um insert um upadte um delete
-- pode ser terminada com commit ou desfeita rollback

drop table tab1;
drop table tab2;

CREATE TABLE tab1 (
    a1 Number,
    a2 Number
);

CREATE TABLE tab2 (
    b1 Number,
    b2 Number
);

CREATE OR REPLACE PROCEDURE exemplo_transacao (
    aa1 NUMBER,
    aa2 NUMBER,
    bb1 NUMBER,
    bb2 NUMBER,
    commit_ou_rollback NUMBER
)
IS  
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN 
    INSERT INTO tab1 VALUES (aa1, bb1);
    INSERT INTO tab2 VALUES (bb1, bb2);
    IF commit_ou_rollback = 1 Then                  
        COMMIT;
    ELSE
        rollback;
    END IF;
END;
/

BEGIN 
    exemplo_transacao(1, 2, 10, 20, 1);
    exemplo_transacao(3, 4, 30, 40, 0);
    exemplo_transacao(5, 6, 50, 60, 1);
END;
/

select * from tab1;
select * from tab2;
