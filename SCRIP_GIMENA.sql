USE master;

------------- Crear la base de datos db_Track
IF DB_ID (N'db_Track3') IS NOT NULL
	DROP DATABASE db_Track3
GO
CREATE DATABASE db_Track3
GO
---.Poner en uso db_Track
USE db_Track3;
---------------------------------------------------TABLA MAESTRA------------------------------------
-- Crear tabla area
CREATE TABLE area (
    id_area INT IDENTITY(1,1) PRIMARY KEY,
    area_name VARCHAR(20) NULL,
    last_name VARCHAR(30) NULL,
    first_name VARCHAR(30) NULL,
    area_status CHAR(10) NULL,
    CONSTRAINT names_area_name UNIQUE (area_name)
);

-- Crear tabla depreciacion
CREATE TABLE depreciation (
    id_por INT IDENTITY(1,1) PRIMARY KEY,
    percentage DECIMAL(8,2) NULL,
    detail VARCHAR(100) NULL,
    depreciation_status CHAR(10) NULL
);

-- Table: fixed_assets
CREATE TABLE fixed_assets (
    code varchar(6),
    detail VARCHAR(100) NULL,
    amount INT NULL,
    book_value DECIMAL(8,2) NULL,
    admission_date DATE NULL,
    depreciation_date DATE NULL,
    annual_depreciation DECIMAL(8,2) NULL,
    monthly_depreciation DECIMAL(8,2) NULL,
    accumulated_depreciation DECIMAL(8,2) NULL,
    status CHAR(4) NULL,
    depreciation_id_por INT NOT NULL,
    area_id_area INT NOT NULL,
    CONSTRAINT CHECK_2 CHECK ((status IN ('baja', 'alta'))),
    CONSTRAINT fixed_assets_pk PRIMARY KEY (code)
);

-- --------------------RELACIONES
-- Reference: fixed_assets_area (table: fixed_assets)
ALTER TABLE fixed_assets ADD CONSTRAINT fixed_assets_area
    FOREIGN KEY (area_id_area)
    REFERENCES area (id_area);

-- Reference: fixed_assets_depreciation (table: fixed_assets)
ALTER TABLE fixed_assets ADD CONSTRAINT fixed_assets_depreciation
    FOREIGN KEY (depreciation_id_por)
    REFERENCES depreciation (id_por);
----------------------------------------------------------------------------------------------------------------------------
-----------------------                  IMPLEMENTACION DE INDICES NO CLUSTERED             ------------------------

CREATE NONCLUSTERED INDEX IX_Area_AreaName
ON area (area_name);
 
CREATE NONCLUSTERED INDEX IX_Depreciation_Percentage
ON depreciation (percentage);

----------------------------------------------------------------------------------------------------------------------------
------------------------------    PROCESO ALMACENADO ------------------------

CREATE PROCEDURE InsertarBienFijo
    @detalle VARCHAR(100),
    @valor_libro DECIMAL(8,2),
    @fecha_admision DATE,
    @area_id INT,
    @depreciation_id INT
AS
BEGIN
    -- Declarar variables
    DECLARE @code VARCHAR(6);
    DECLARE @fecha_depreciacion DATE = DATEFROMPARTS(YEAR(GETDATE()), 12, 31);
    DECLARE @monto INT = 1;
    DECLARE @status CHAR(4) = 'alta';
    DECLARE @depreciacion_anual DECIMAL(8,2);
    DECLARE @depreciacion_mensual DECIMAL(8,2);
    DECLARE @acumulada_depreciacion DECIMAL(8,2) = 0;
    DECLARE @num_meses INT;

    -- Generar el código EQ-000
    SELECT @code = 'EQ-' + RIGHT('000' + CAST(ISNULL(MAX(CAST(RIGHT(code, 3) AS INT)), 0) + 1 AS VARCHAR(3)), 3)
    FROM fixed_assets;

    -- Calcular depreciación anual
    SELECT @depreciacion_anual = (@valor_libro * percentage) / 100
    FROM depreciation
    WHERE id_por = @depreciation_id;

    -- Calcular depreciación mensual
    SELECT @depreciacion_mensual = @depreciacion_anual / 12;

    -- Calcular el número de meses transcurridos
    SELECT @num_meses = DATEDIFF(MONTH, @fecha_admision, @fecha_depreciacion);

    -- Calcular depreciación acumulada
    SELECT @acumulada_depreciacion = @depreciacion_mensual * @num_meses;

    -- Insertar el bien fijo en la tabla fixed_assets
    INSERT INTO fixed_assets (code, detail, amount, book_value, admission_date, depreciation_date,
        annual_depreciation, monthly_depreciation, accumulated_depreciation, status, depreciation_id_por, area_id_area)
    VALUES (@code, @detalle, @monto, @valor_libro, @fecha_admision, @fecha_depreciacion,
        @depreciacion_anual, @depreciacion_mensual, @acumulada_depreciacion, @status, @depreciation_id, @area_id);
END;

----------------------------------------------------------------------------------------------------------------------------

select*from fixed_assets
select*from depreciation
select*from area

---------------------3 Sentencias para actualizar registros maestros-------------------------------------------------------------------------------

UPDATE area
SET area_status = 'Inactivo'
WHERE id_area = 1;
select*from area


UPDATE depreciation
SET depreciation_status = 'Inactivo'
WHERE id_por = 1;
select*from depreciation

UPDATE area
SET last_name = 'Rosales Acuña'
WHERE area_name = 'Marketing';
select*from area

--------------------------------------- 3 SENTENCIAS PARA ACTUALIZAR REGISTRO TRANSACCIONAL -------------------------------------------------------------------------------------

UPDATE fixed_assets
SET detail = 'Portátil Asus', 
    admission_date = '2023-01-01'
WHERE code = 'EQ-001';
select*from fixed_assets

UPDATE fixed_assets
SET status = 'baja'
WHERE code = 'EQ-002';
select*from fixed_assets

UPDATE fixed_assets
SET area_id_area = 2
WHERE code = 'EQ-003';
select*from fixed_assets

----------------------------------------------------------------------------------------------------------------------------

--3 sentencias de consultas

SELECT * FROM fixed_assets
WHERE book_value BETWEEN 500.00 AND 1000.00;

SELECT *FROM area
WHERE area_name LIKE '%Marketing%' OR area_name LIKE '%Contabilidad%';

SELECT *FROM fixed_assets
WHERE area_id_area IN (1, 2, 3) AND depreciation_id_por = 4 AND status = 'alta';

----------------------------------------------------------------------------------------------------------------------------

--Reglas de negocio dar de baja 

CREATE PROCEDURE DarDeBajaActivoFijo
    @code VARCHAR(6)
AS
BEGIN
    DECLARE @valor_libro DECIMAL(8,2);
    DECLARE @acumulada_depreciacion DECIMAL(8,2);

    -- Obtener el valor en libros y la depreciación acumulada del activo fijo
    SELECT @valor_libro = book_value,
           @acumulada_depreciacion = accumulated_depreciation
    FROM fixed_assets
    WHERE code = @code;

    -- Verificar si el activo fijo debe ser dado de baja
    IF @acumulada_depreciacion >= @valor_libro
    BEGIN
        UPDATE fixed_assets
        SET status = 'baja'
        WHERE code = @code;

        PRINT 'El activo fijo ' + @code + ' ha sido dado de baja.';
    END
    ELSE
    BEGIN
        PRINT 'El activo fijo ' + @code + ' aún genera valor y no puede ser dado de baja.';
    END
END;

EXEC DarDeBajaActivoFijo @code = 'EQ-001';

------------------------------------------------ en funcion fecha

CREATE PROCEDURE ActualizarEstadoActivos
AS
BEGIN
    DECLARE @current_date DATE = GETDATE();

    UPDATE fixed_assets
    SET status = 
        CASE 
            WHEN admission_date > @current_date THEN 'baja' 
            WHEN DATEDIFF(MONTH, admission_date, @current_date) > 60 THEN 'baja' 
            ELSE 'alta'
        END;

    PRINT 'Se han actualizado los estados de los activos fijos.';
END;

EXEC ActualizarEstadoActivos;

---------------------------------CURSOR-------------------------------------------------------------------------------------------


DECLARE @code VARCHAR(6);
DECLARE @detail VARCHAR(100);
DECLARE @amount INT;
DECLARE @book_value DECIMAL(8, 2);
DECLARE @admission_date DATE;
DECLARE @depreciation_date DATE;
DECLARE @annual_depreciation DECIMAL(8, 2);
DECLARE @monthly_depreciation DECIMAL(8, 2);
DECLARE @accumulated_depreciation DECIMAL(8, 2);
DECLARE @status CHAR(4);
DECLARE @depreciation_id_por INT;
DECLARE @area_id_area INT;

DECLARE cursor_fixed_assets CURSOR FOR
    SELECT
        code,
        detail,
        amount,
        book_value,
        admission_date,
        depreciation_date,
        annual_depreciation,
        monthly_depreciation,
        accumulated_depreciation,
        status,
        depreciation_id_por,
        area_id_area
    FROM
        fixed_assets;

OPEN cursor_fixed_assets;

FETCH NEXT FROM cursor_fixed_assets INTO
    @code,
    @detail,
    @amount,
    @book_value,
    @admission_date,
    @depreciation_date,
    @annual_depreciation,
    @monthly_depreciation,
    @accumulated_depreciation,
    @status,
    @depreciation_id_por,
    @area_id_area;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Codigo: ' + @code + ', Detalle: ' + @detail ;

    FETCH NEXT FROM cursor_fixed_assets INTO
        @code,
        @detail,
        @amount,
        @book_value,
        @admission_date,
        @depreciation_date,
        @annual_depreciation,
        @monthly_depreciation,
        @accumulated_depreciation,
        @status,
        @depreciation_id_por,
        @area_id_area;
END

CLOSE cursor_fixed_assets;
DEALLOCATE cursor_fixed_assets;