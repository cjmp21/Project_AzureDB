/****** Object:  View [dbo].[Fechas]    Script Date: 9/4/2022 8:28:24 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Fechas]
AS
SELECT DISTINCT [Fecha de Compra], YEAR([Fecha de Compra]) AS Año, MONTH([Fecha de Compra]) AS Mes, DATEPART(week, [Fecha de Compra]) AS Semana
FROM     dbo.ComprasFinal
GO


