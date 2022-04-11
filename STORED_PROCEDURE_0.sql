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
-- Description: <Description, CREA TABLAS INPUT PARA LA BD>
-- =============================================
CREATE PROCEDURE dbo.CREA_TABLAS

AS
BEGIN
    SET NOCOUNT ON

-- 1. Tabla ClientesInput
CREATE TABLE ClientesInput (
[id]  varchar(100),
[Nombre]	varchar(100),
[Pais]	varchar(100),
[edad]	varchar(100),
[Ocupacion]	varchar(100),
[Score]	varchar(100),
[Salario net USD]	varchar(100),
[Estado Civil]	varchar(100),
[Estado]	varchar(100),
[Fecha Inactividad]	varchar(100),
[Genero]	varchar(100),
[Device]	varchar(100),
[Nivel Educativo]	varchar(100),
[Carrera] varchar(100)
);

-- 2. Tabla ProductoInput
CREATE TABLE ProductoInput (
[id]  varchar(100),
[nombre]	varchar(100),
[Valor]	varchar(100),
[Cantidad Datos GB]	varchar(100),
[Vigencia (dias)]	varchar(100),
);

-- 3. Tabla ComprasInput
CREATE TABLE ComprasInput (
[id]  varchar(100),
[cust_id]	varchar(100),
[prod_id]	varchar(100),
[Gasto]	varchar(100),
[FechaCompra]	varchar(100),
[Mediopago (Tarjeta o Cash)]  varchar(100)
);

-- 4. MENSAJE FINAL
PRINT N'Tablas depuradas correctamente.
		Tablas creadas: 3'
;
END
GO
