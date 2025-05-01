-- Para criar usuários precisamos conectar com um usuário DBA do banco - Sys ou System

-- Para criar usuário:
conn system/oracle

create user aaron -- usuário
identified by futebol -- senha
default tablespace system -- local de gravação padrão, gravar os dados do usuário
quota unlimicreate ted on system -- pode gravar quantos dados ele quiser enquanto hover espaço no tablespace system
password expire; -- força o usuário a trocar a senha no primeiro login, informa que está expirado

grant create session, create table to aaron;

conn aaron/futebol
show user

create table teste (id number);