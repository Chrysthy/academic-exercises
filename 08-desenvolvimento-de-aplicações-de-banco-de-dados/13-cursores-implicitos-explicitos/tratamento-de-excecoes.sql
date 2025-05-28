-- Em SQL, exceptions (exceções) são mecanismos usados principalmente em procedimentos armazenados (stored procedures), gatilhos (triggers) ou blocos 
-- de código PL/SQL ou T-SQL para capturar e tratar erros que ocorrem durante a execução de comandos SQL.

-- Elas funcionam de forma semelhante às exceções em linguagens de programação como Python, Java ou C#, permitindo 
-- identificar um erro, interromper o fluxo normal da execução e executar um bloco de código para lidar com esse erro.

-- Example 1

ACCEPT p_nome PROMPT 'Digite o nome do funcionário ...'
DECLARE
_nome emp.ename%type := '&p_nome';
_ename emp.ename%type;
_sal emp.sal%type;
BEGIN   
    SELECT ename, sal
    INTO v_ename, v_sal 
    FROM emp
    WHERE job = 'CLERK' and ename = v_nome;
EXCEPTION 
when NO_DATA_FOUND then
    DBMS_OUTPUT.PUT_LINE('NENHUM REGISTRO FOI ENCONTRADO');
when TOO_MANY_ROWS then
    DBMS_OUTPUT.PUT_LINE('MUITOS FUNCIONÁRIOS POSSUEM ESSE CARGO.');
when OTHERS then
    DBMS_OUTPUT.PUT_LINE('ERRO DESCONHECIDO');
END;
/
