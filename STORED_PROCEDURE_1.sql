-- =======================================================
-- Create Stored Procedure Template for Azure SQL Database
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, CHARLY>
-- Create Date: <Create Date, 08/04/2022>
-- Description: <Description, DEPURA LAS TABLAS DE LA BASE DE DATOS>
-- =============================================
CREATE PROCEDURE dbo.DEPURA_TABLAS

AS
BEGIN

    SET NOCOUNT ON

	-- 1. TABLA ClientesInput

-- 1.1 CREA TABLA ClientesFinal
SELECT  CAST([id] AS VARCHAR) AS [CUST_ID]
	  , CAST([Nombre] AS VARCHAR) AS [Nombre]
	  , CAST([Pais] AS VARCHAR) AS [Pais]
	  , CAST([edad] AS NUMERIC) AS [Edad]
	  , CAST(IIF(LEFT(UPPER(Ocupacion),1) = 'E', 'Empleado'
		   , IIF(LEFT(UPPER(Ocupacion),1) ='I', 'Independiente', NULL)) AS VARCHAR) AS [Ocupacion]
	  , CAST([Score] AS NUMERIC) [Score]
	  , CAST([Salario net USD] AS MONEY) AS [Salario USD]
	  , CAST(IIF(LEFT(LTRIM(UPPER([Estado Civil])),1) = 'C','Casado'
		   , IIF(LEFT(LTRIM(UPPER([Estado Civil])),1) = 'S', 'Soltero'
		   , IIF(LEFT(LTRIM(UPPER([Estado Civil])),1) = 'D', 'Divorciado','Otro'))) AS VARCHAR) AS [Estado Civil]
	  , CAST([Estado] AS VARCHAR) AS [Estado]
	  , CAST([Fecha Inactividad] AS SMALLDATETIME) AS [Fecha de Inactividad]
	  , CAST(IIF(LEFT(LTRIM(UPPER(Genero)),1) = 'M','Masculino'
		   , IIF(LEFT(LTRIM(UPPER(Genero)),1) = 'F', 'Femenino', 'Otro')) AS VARCHAR) AS [Genero]
	  , CAST(Device AS VARCHAR) AS [Device]
	  , CAST([Nivel Educativo] AS VARCHAR) AS [Nivel Educativo]
	  , CAST([Carrera] AS VARCHAR) AS [Carrera]
INTO [dbo].[ClientesFinal]
FROM [dbo].[ClientesInput]
WHERE ISNUMERIC([Salario net USD])=1
UNION ALL
SELECT  CAST([id] AS VARCHAR) AS [CUST_ID]
	  , CAST([Nombre] AS VARCHAR) AS [Nombre]
	  , CAST([Pais] AS VARCHAR) AS [Pais]
	  , CAST([edad] AS NUMERIC) AS [Edad]
	  , CAST(IIF(LEFT(UPPER(Ocupacion),1) = 'E', 'Empleado'
		   , IIF(LEFT(UPPER(Ocupacion),1) ='I', 'Independiente', NULL)) AS VARCHAR) AS [Ocupacion]
	  , CAST([Score] AS NUMERIC) [Score]
	  , CAST(LEFT([Salario net USD],4) AS MONEY) AS [Salario USD]
	  , CAST(IIF(LEFT(LTRIM(UPPER([Estado Civil])),1) = 'C','Casado'
		   , IIF(LEFT(LTRIM(UPPER([Estado Civil])),1) = 'S', 'Soltero'
		   , IIF(LEFT(LTRIM(UPPER([Estado Civil])),1) = 'D', 'Divorciado','Otro'))) AS VARCHAR) AS [Estado Civil]
	  , CAST([Estado] AS VARCHAR) AS [Estado]
	  , CAST([Fecha Inactividad] AS SMALLDATETIME) AS [Fecha de Inactividad]
	  , CAST(IIF(LEFT(LTRIM(UPPER(Genero)),1) = 'M','Masculino'
		   , IIF(LEFT(LTRIM(UPPER(Genero)),1) = 'F', 'Femenino', 'Otro')) AS VARCHAR) AS [Genero]
	  , CAST(Device AS VARCHAR) AS [Device]
	  , CAST([Nivel Educativo] AS VARCHAR) AS [Nivel Educativo]
	  , CAST([Carrera] AS VARCHAR) AS [Carrera]
FROM [dbo].[ClientesInput]
WHERE ISNUMERIC([Salario net USD])=0

-- 1.2 BORRA TABLA ClientesInput
DROP TABLE [dbo].[ClientesInput]
;

-- 2. TABLA ProductoInput

-- 2.1 CREA TABLA ProductoFinal
SELECT  CAST([id] AS VARCHAR) AS [PROD_ID]
	  , CAST([nombre] AS VARCHAR) AS [Nombre]
	  , CAST([Valor] AS MONEY) AS [Valor]
	  , CAST([Cantidad Datos GB] AS NUMERIC) AS [Cupo (GB)]
	  , CAST([Vigencia (dias)] AS NUMERIC) AS [Vigencia (dias)]
INTO [dbo].[ProductoFinal]
FROM [dbo].[ProductoInput]

-- 2.2 BORRA TABLA ProductoInput
DROP TABLE [dbo].[ProductoInput]
;

-- 3. TABLA ComprasInput

-- 3.1 CREA TABLA ComprasFinal
SELECT  CAST([id] AS VARCHAR) AS [ID]
	  , CAST([cust_id] AS VARCHAR)  AS [CUST_ID]
	  , CAST([prod_id] AS VARCHAR)  AS [PROD_ID]
	  , CAST([Gasto] AS MONEY) AS [Gasto]
	  , CAST([FechaCompra] AS SMALLDATETIME) AS [Fecha de Compra]
	  , CAST(IIF([Mediopago (Tarjeta o Cash)] = 'C', 'Cash'
		   , IIF([Mediopago (Tarjeta o Cash)] = 'T', 'Tarjeta', 'Otro')) AS VARCHAR) AS [Medio de Pago]
INTO [dbo].[ComprasFinal]
FROM [dbo].[ComprasInput]

-- 3.2 BORRA TABLA ClientesInput
DROP TABLE [dbo].[ComprasInput]
;

-- 4. MENSAJE FINAL
PRINT N'Tablas depuradas correctamente.
		Tablas eliminadas: 3
		Tablas creadas: 3'
;


END
GO
