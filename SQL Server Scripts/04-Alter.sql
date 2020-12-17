--Alteração do Banco de Dados
USE [master]
GO 

ALTER DATABASE [AdventureWorks2019]
ADD FILE (	NAME = N'......',
			FILENAME = N'......',
			SIZE = 8192KB , FILEGROWTH = 65536KB 
		)
TO FILEGROUP [PRIMARY]
GO


-- Alterações de objetos no Banco de Dados 

-- Selecionar o banco
USE [BDTESTE]
GO 

-- Adicionar Chave Primária
ALTER TABLE ALUNO 
ADD CONSTRAINT PK_ALUNO PRIMARY KEY CLUSTERED
(
	COD_ALUNO
);

ALTER TABLE CURSO 
ADD CONSTRAINT PK_CURSO PRIMARY KEY CLUSTERED
(
	COD_CURSO
);


-- Verificar etrutura da tabela (conhecido como DESC / DESCRIBE)
sp_help 'CURSO';
sp_help 'ALUNO';


-- Adicionar Coluna COD_CURSO_FK na tabela ALUNO como NÃO NULA (Tabela não populada ainda)
ALTER TABLE ALUNO ADD COD_CURSO_FK int NOT NULL;


-- Alterar tamanho da coluna NOM_CURSO
ALTER TABLE CURSO ALTER COLUMN NOM_CURSO varchar(200) NOT NULL;


-- Diminuir tamanho 
ALTER TABLE CURSO ALTER COLUMN NOM_CURSO varchar(50) NOT NULL;



-- Inserir Dados
INSERT INTO CURSO VALUES (1, 'Linguagem SQL');
INSERT INTO CURSO VALUES (2, 'T-SQL');


-- Conferir se dados foam inseridos 
SELECT * FROM CURSO; 

-- Tamanho dos valores da coluna NOM_CURSO
SELECT COD_CURSO, LEN(NOM_CURSO) FROM CURSO;

-- Diminuir tamanho com tabela populada sem violar tamanho dos dados existentes 
ALTER TABLE CURSO ALTER COLUMN NOM_CURSO varchar(13) NOT NULL;

SP_HELP CURSO;


-- Diminuir tamanho com tabela populada VIOLANDO tamanho dos dados existentes 
ALTER TABLE CURSO ALTER COLUMN NOM_CURSO varchar(12) NOT NULL;

-- Adicionar compo NOT NULL com tabela populada
-- Opção 1
ALTER TABLE CURSO ADD VLR_CURSO money NOT NULL;  --error 
ALTER TABLE CURSO ADD VLR_CURSO money NULL;
ALTER TABLE CURSO ALTER COLUMN VLR_CURSO money NOT NULL;  --error 
UPDATE CURSO SET VLR_CURSO = 10000;
SELECT * FROM CURSO;
ALTER TABLE CURSO ALTER COLUMN VLR_CURSO money NOT NULL;
SP_HELP CURSO;


-- Opção 2
ALTER TABLE CURSO ADD IND_STATUS char(1) NOT NULL DEFAULT 'S';
SELECT * FROM CURSO;
SP_HELP CURSO;


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

SP_HELP ALUNO 
GO 
SP_HELP CURSO
GO