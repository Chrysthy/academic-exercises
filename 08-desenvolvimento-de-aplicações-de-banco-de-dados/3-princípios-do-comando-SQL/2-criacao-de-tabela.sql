create table turma (cod_turma number(2) primary key, descricao_turma varchar2(30));
-- Cria uma tabela chamada turma com duas colunas: cod_turma (número de 2 dígitos) e descricao_turma (texto de até 30 caracteres).

alter table turma
add periodo varchar2(15);
-- Modifica a tabela existente turma adicionando uma nova coluna chamada periodo.

describe turma;
-- Exibe a estrutura da tabela turma, mostrando as colunas e seus tipos de dados.

drop table turma;
-- Remove a tabela turma do banco de dados, se existir.