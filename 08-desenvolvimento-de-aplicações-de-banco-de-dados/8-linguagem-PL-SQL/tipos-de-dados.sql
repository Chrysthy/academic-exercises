-- Tipos de dados

DECLARE 
    v_deptno NUMBER(2);
    v_loc VARCHAR2(15);
BEGIN
    SELECT deptno, loc 
    INTO v_deptno, v_loc 
    FROM dept 
    WHERE dname= 'SALES';
    
    DBMS_OUTPUT.PUT_LINE('O código do Departamento é' || v_deptno || ' e a localização é ' || v_loc);
END;
/


