USE AdventureWorks2019
GO 


-- Selecionar todas as linhas das colunas das colunas Name e ProductNumber da tabela Product
SELECT Name, ProductNumber
FROM Production.Product
GO

-- Selecionar todas as linhas de todas as colunas da tabela Product
SELECT * 
FROM Production.Product
GO

-- Adicionar coluna e repetir o comando
ALTER TABLE Production.Product
ADD SpecialEdition bit NULL
GO


-- Exemplo de objeto inexistente (essa tabela nao existe)
SELECT Name, ProductNumber
FROM master.Production.Product
GO
-- correto
SELECT Name, ProductNumber
FROM Production.Product
GO
-- Nome do banco - nome do schema - nome da tabela
SELECT Name, ProductNumber
FROM AdventureWorks2019.Production.Product
GO

-- Coluna inexistente
SELECT ProductName, ProductNumber
FROM AdventureWorks2019.Production.Product
GO