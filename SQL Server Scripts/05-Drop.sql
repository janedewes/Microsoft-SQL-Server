-- Criar novo banco 
CREATE DATABASE BDTESTE_DROP
GO

-- Selecionar o banco
USE BDTESTE_DROP
GO


CREATE TABLE ALUNO
(	COD_ALUNO int NOT NULL,
	NOM_ALUNO varchar(100) NOT NULL
);


CREATE TABLE CURSO
(
	COD_CURSO int NOT NULL,
	NOM_CURSO varchar (100) NOT NULL 
)
GO

-- Adicionar Chave Primária
ALTER TABLE ALUNO 
ADD CONSTRAINT PK_ALUNO PRIMARY KEY CLUSTERED
(
	COD_ALUNO
)
GO

ALTER TABLE CURSO 
ADD CONSTRAINT PK_CURSO PRIMARY KEY CLUSTERED
(
	COD_CURSO
)
GO

-- Adicionar coluna COD_CURSO_FK  na tabela aluno 
ALTER TABLE ALUNO ADD COD_CURSO_FK int NULL
GO

-- Alterar coluna COD_CURSO_FK para não nula
ALTER TABLE ALUNO ALTER COLUMN COD_CURSO_FK int NOT NULL
GO

-- Adicionar chave estrangeira COD_CURSO_FK na tabela ALUNO
ALTER TABLE ALUNO
ADD CONSTRAINT FK_ALUNO_CURSO FOREIGN KEY
(
	COD_CURSO_FK
) REFERENCES CURSO 
(
	COD_CURSO
)
ON UPDATE NO ACTION 
ON DELETE NO ACTION;
GO 

CREATE SYNONYM TB_ALUNO_NEW FOR ALUNO
GO 


-- Remover sinonimo 
DROP SYNONYM TB_ALUNO_NEW;


-- Remover coluna (não é objeto independente) 
ALTER TABLE ALUNO DROP COLUMN NOM_ALUNO;

SP_HELP ALUNO;


-- Remover tabela (com FK)
DROP TABLE ALUNO;
DROP TABLE CURSO;


-- Remover Banco de dados 
USE master;
DROP DATABASE BDTESTE_DROP;


-- Remover Banco de dados que está sendo usado em outra sessão
USE BDTESTE;
SELECT * FROM CURSO;

USE master;
DROP DATABASE BDTESTE;


-- Listar processos bloqueados 
SELECT 
FROM * sysprocesses
WHERE blocked <> 0

SELECT *
FROM sys.dm_exec_requests
WHERE blocking_session_id <> 0
