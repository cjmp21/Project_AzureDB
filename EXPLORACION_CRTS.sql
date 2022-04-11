-- EXPLORACION DE DATOS CARGADOS

-- 1. TABLA ClientesFinal
-- 1.1. UNIVARIADO
SELECT Pais, COUNT(CUST_ID) Clientes
FROM [dbo].[ClientesFinal]
GROUP BY Pais

SELECT Edad, COUNT(CUST_ID) Clientes
FROM [dbo].[ClientesFinal]
GROUP BY Edad

SELECT Ocupacion, COUNT(CUST_ID) Clientes
FROM [dbo].[ClientesFinal]
GROUP BY Ocupacion

SELECT Score, COUNT(CUST_ID) Clientes
FROM [dbo].[ClientesFinal]
GROUP BY Score

SELECT [Salario USD], COUNT(CUST_ID) Clientes
FROM [dbo].[ClientesFinal]
GROUP BY [Salario USD]

SELECT [Estado Civil], COUNT(CUST_ID) Clientes
FROM [dbo].[ClientesFinal]
GROUP BY [Estado Civil]

SELECT Estado, COUNT(CUST_ID) Clientes
FROM [dbo].[ClientesFinal]
GROUP BY Estado

SELECT [Fecha de Inactividad], COUNT(CUST_ID) Clientes
FROM [dbo].[ClientesFinal]
GROUP BY [Fecha de Inactividad]

SELECT Genero, COUNT(CUST_ID) Clientes
FROM [dbo].[ClientesFinal]
GROUP BY Genero

SELECT Device, COUNT(CUST_ID) Clientes
FROM [dbo].[ClientesFinal]
GROUP BY Device

SELECT [Nivel Educativo], COUNT(CUST_ID) Clientes
FROM [dbo].[ClientesFinal]
GROUP BY [Nivel Educativo]

SELECT Carrera, COUNT(CUST_ID) Clientes
FROM [dbo].[ClientesFinal]
GROUP BY Carrera

-- 1.2. CONSULTA DEL CLIENTE PROMEDIO
SELECT *
FROM [dbo].[ClientesFinal]
WHERE (Genero = 'Femenino') AND (Pais IN ('Mexico','Argentina','Colombia'))
	   AND (Edad<40) AND (Ocupacion = 'Empleado') AND ([Salario USD] BETWEEN 6700 AND 11200)
	   AND ([Estado Civil] = 'Soltero') AND (Device = 'Iphone') AND ([Nivel Educativo] IN ('Pregrado', 'Master'))

-- 1.3. NOTA: CLIENTE PROMEDIO NO SIGNIFICATIVO POR UNIVARIADO





