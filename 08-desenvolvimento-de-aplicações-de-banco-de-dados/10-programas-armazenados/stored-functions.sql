CREATE OR REPLACE FUNCTION descobrir_salario
(p_id in emp.Empno%type)
return number
IS
     v_salario emp.sal%type := 0;
    BEGIN
        Select sal into v_salario
        From emp
        Where empno = p_id;
        Return v_salario;
    End descobrir_salario;
/

select descobrir_salario(7934) from dual;



