-- Criação de tipos de dados dentro de uma programação em PL/SQL
-- Nossos próprios tipos de dados conforme a necessidade que tivermos
-- Para criar um tipo, usamos TYPE

CREATE OR REPLACE PACKAGE pkg_filmes AS
   TYPE tipo_reg_filmes IS RECORD (
    filme_id filmes.filme_id%TYPE, -- é do mesmo tipo do campo filme da tabela filmes
    titulo filmes.titulo%TYPE, -- é do mesmo tipo do campo titulo da tabela filmes
    diretor filmes.diretor%TYPE  , -- é do mesmo tipo do campo diretor da tabela filmes
    ano filmes.ano%TYPE,      -- é do mesmo tipo do campo ano da tabela filmes
    pais filmes.pais%TYPE ,    -- é do mesmo tipo do campo pais da tabela filmes
    duracao filmes.duracao%TYPE -- é do mesmo tipo do campo duracao da tabela filmes
    
    );

    CAMPO_NULO EXCEPTION;
    PRAGMA EXCEPTION_INIT (CAMPO_NULO, -2290);
    --Inclui filme. Em caso de erro, retorna o código e mensagem de erro,

    PROCEDURE inclui_filme (
        registro IN pkg_filmes.tipo_reg_filmes,
        cod_erro OUT NUMBER,
        msg_erro OUT VARCHAR2
    );
END pkg_filmes;
/



CREATE OR REPLACE PACKAGE BODY pkg_filmes AS
    PROCEDURE inclui_filme (
        registro IN pkg_filmes.tipo_reg_filmes,
        cod_erro OUT NUMBER,
        msg_erro OUT VARCHAR2
    )
    IS 
    BEGIN
        BEGIN   
            cod_erro := 0;
            INSERT INTO filmes VALUES registro;
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN  
                cod_erro := SQLCODE;
                msg_erro := 'id_filme ou Titulo repetido';

            WHEN CAMPO_NULO THEN
                cod_erro := SQLCODE;
                msg_erro := 'Titulo ou Diretor nulo';

            WHEN OTHERS THEN 
            cod_erro := SQLCODE;
            msg_erro := SQLCODE;
        END;
    END;
END pkg_filmes;
/

DECLARE
    registro pkg_filmes.tipo_reg_filmes;
    cod_erro NUMBER;
    msg_erro VARCHAR2;
BEGIN
    registro.filme_id := 4;
    registro.titulo   := 'Npites de Cabíria'; 
    registro.diretor  := 'Federico Fellini'; 
    registro.ano      := 1958; 
    registro.pais     := 'Itália'; 
    registro.duracao  := 110;
    pkg_filmes.inclui_filme(registro, cod_erro, msg_erro);
     IF cod_erro = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Inclusão bem sucedida.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Erro na inclusão: ' || 'ORA'|| TO_CHART(cod_erro, '00000') || '( ' || msg_erro || ')');
    END IF;
END;
/

