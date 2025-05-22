-- códigos de programação, mas são acionados por uma ação nossa
-- Ela é acionada com a ocorrência de um determinado evento. Aciona um evento e aí a trigger é acionada
-- Precisa dizer qual é o evento que vai acionar, se será uma trigger before ou after e o que tem que acontecer quando esse trigger for disparado.

CREATE TRIGGER nome_gatilho (BEFORE | AFTER) (INSERT | UPDATE | DELETE) ON nome_tabela FOR 
EACH ROW
BEGIN
    comandos;
END;