--Usar base de datos
USE 
----------------------------------------------------5 REGISTROS TABLAS MAESTRAS------------------------------------------------------------------------

-----Registro en tabla area
INSERT INTO 
	area (area_name, last_name, first_name, area_status) 
VALUES
	('Produccion', 'Avila Rios', 'Ana', 'Activo'),
	('Contabilidad', 'Campos Perez', 'Maria', 'Activo'),
	('Marketing', 'Rosales', 'Claudio', 'Activo'),
	('Recursos Humanos', 'Mayurí Tarazona', 'Juan', 'Activo'),
	('Ventas', 'Guerra Solano', 'Luis', 'Activo')
GO

------Registro en tabla depreciation
INSERT INTO 
	depreciation (percentage, detail, depreciation_status) 
VALUES
	(0.25, 'ganado de trabajo y reproducción, redes de pesca', 'Activo'),
	(0.20, 'vehículo de transporte', 'Activo'),
	(0.20, 'maquinaria y equipos utilizados por las actividades mineras', 'Activo'),
	(0.25, 'equipo de recopilación de datos', 'Activo'),
	(0.10, 'maquinaria y equipo adquirido a partir del 1/1/1991', 'Activo'),
	(0.10, 'otros bienes activos fijos', 'Activo')
GO

---------------------------------------------------- 10 REGISTROS TABLA TRANSACCIONAL -------------------
EXEC InsertarBienFijo 
	@detalle = 'Escritorio color gris', 
	@valor_libro = 800, 
	@fecha_admision = '2023-02-01', 
	@area_id = 2, 
	@depreciation_id = 3
GO
EXEC InsertarBienFijo 
	@detalle = 'Impresora HP', 
	@valor_libro = 500.00, 
	@fecha_admision = '2023-02-20',
	@area_id = 2, 
	@depreciation_id = 4
GO
EXEC InsertarBienFijo 
	@detalle = 'Escritorio color gris', 
	@valor_libro = 800.00, 
	@fecha_admision = '2023-02-01', 
	@area_id = 3, 
	@depreciation_id = 6
GO
EXEC InsertarBienFijo 
	@detalle = 'Silla Ejecutiva', 
	@valor_libro = 150.00, 
	@fecha_admision = '2023-04-05', 
	@area_id = 4, 
	@depreciation_id = 6
GO
EXEC InsertarBienFijo 
	@detalle = 'Teléfono IP', 
	@valor_libro = 200.00, 
	@fecha_admision = '2023-05-12', 
	@area_id = 5, 
	@depreciation_id = 4
GO
EXEC InsertarBienFijo 
	@detalle = 'Monitor LCD', 
	@valor_libro = 300.00, 
	@fecha_admision = '2023-06-08', 
	@area_id = 5, 
	@depreciation_id = 4
GO
EXEC InsertarBienFijo 
	@detalle = 'Archivador Metálico', 
	@valor_libro = 250.00, 
	@fecha_admision = '2023-07-15', 
	@area_id = 4, 
	@depreciation_id = 6
GO
EXEC InsertarBienFijo 
	@detalle = 'Lámpara de Escritorio', 
	@valor_libro = 50.00, 
	@fecha_admision = '2023-08-20', 
	@area_id = 3, 
	@depreciation_id = 6
GO
EXEC InsertarBienFijo 
	@detalle = 'Calculadora Científica', 
	@valor_libro = 30.00, 
	@fecha_admision = '2023-09-10', 
	@area_id = 2, 
	@depreciation_id = 4
GO
EXEC InsertarBienFijo 
	@detalle = 'Teclado Inalámbrico',
	@valor_libro = 40.00, 
	@fecha_admision = '2023-10-05', 
	@area_id = 1, 
	@depreciation_id = 4
GO