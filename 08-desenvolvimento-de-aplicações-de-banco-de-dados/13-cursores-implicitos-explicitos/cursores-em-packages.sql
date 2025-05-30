-- Podemos usar os cursores em outro objetos - por exemplo em procedures

--cabeçalho
CREATE OR REPLACE PACKAGE pkg_CURSOR AS
    PROCEDURE PR_EXEMPLO_CURSOR;
END pkg_CURSOR;
/

--corpo
CREATE OR REPLACE PACKAGE BODY pkg_CURSOR AS
    PROCEDURE PR_EXEMPLO_CURSOR IS
        CURSOR my_cursor IS 
            SELECT t1.deptno, t1.dname, t2.STAFF
            FROM dept t1 JOIN (SELECT deptno, count(*) STAFF
                FROM emp 
                    GROUP BY deptno) t2
            ON t1.deptno = t2.deptno;
        Reg_my_cursor my_cursor%rowtype;
    Begin
        For Reg_my_cursor in my_cursor loop
            Dbms_output.put_line ('O departamento ' || Reg_my_cursor.dname || ' tem ' || Reg_my_cursor.staff || ' funcionários.'):
        End loop;
    END;
END pkg_CURSOR;
/

-- executando o pacote 
EXECUTE pkg_CURSOR.PR_EXEMPLO_CURSOR;
