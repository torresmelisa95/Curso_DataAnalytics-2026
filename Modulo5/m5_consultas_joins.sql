------ SECCIÓN DDL ------
USE master;  -- nos paramos en master para poder borrar Ventas_Tech_DB sin que la conexión esté "en uso"
GO

DROP DATABASE IF EXISTS Ventas_Tech_DB;
GO

CREATE DATABASE Ventas_Tech_DB;
GO

USE Ventas_Tech_DB;
GO

-- Iniciamos con la sentencia DROP para que el script sea repetible sin errores
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS territorios;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
	id_categoria INT PRIMARY KEY,
	nombre_categoria VARCHAR(50) NOT NULL,
	descripcion VARCHAR(200)
);

CREATE TABLE clientes (
	id_cliente INT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL, -- equivalente a nombre_empresa según mis tablas de M2
	email VARCHAR(100) UNIQUE,
	ciudad VARCHAR(100),
	fecha_registro DATE NOT NULL,
	segmento VARCHAR(20) NOT NULL,
	rubro_cliente VARCHAR(50) NOT NULL
);

CREATE TABLE territorios ( -- tabla que agrego porque la tenía en mi entregable M2
	id_territorio INT PRIMARY KEY,
	pais VARCHAR(100),
	region VARCHAR(50),
	zona VARCHAR(100)
);

CREATE TABLE productos (
	id_producto INT PRIMARY KEY,
	nombre_producto VARCHAR(100) NOT NULL,
	id_categoria INT,  -- para ser coherente con el entregable M3, donde creamos una tabla de categorías para normalizar la tabla productos, y la relacionamos mediante esta FK.
	-- No agrego las columnas "subcategoría" ni "costo_unitario" que tenía definidas en mis tablas del entregable M2, porque no suman para el análisis.
	precio DECIMAL(10,2) NOT NULL, -- equivalente a "precio_lista" de mi tabla del entregable M2
	stock INT DEFAULT 0,  -- equivalente a "cantidad_stock" de mis tablas del entregable M2
	activo TINYINT DEFAULT 1,

	CONSTRAINT FK_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE ventas (
	id_venta INT PRIMARY KEY,
	id_cliente INT,
	id_producto INT,
	id_territorio INT, -- lo agrego para ser coherente con entregable M2.
	cantidad INT NOT NULL, -- equivalente a "cantidad_unidades" de mi tabla del entregable M2 que representa las unidades vendidas.
	precio DECIMAL(10,2) NOT NULL, -- es equivalente a "precio_unitario" de M2, que representa precio por unidad de esa venta.
	costo DECIMAL(10,2) NOT NULL, -- es equivalente a "costo_total" de M2 y representa el costo total del producto que incluye la cantidad vendida, gastos operativos, impuestos, y otros conceptos.
	fecha_venta DATE NOT NULL,

	CONSTRAINT FK_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	CONSTRAINT FK_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
	CONSTRAINT FK_territorio FOREIGN KEY (id_territorio) REFERENCES territorios(id_territorio)
); /*las columnas ingresos totales (equivalente a total_venta de mi tabla de "ventas" del entregable  M2), margen, ganancia y canal 
que me interesan para responder a mis preguntas de negocio, las voy a generar en el SELECT de la consulta para no guardar datos desactualizados */


------ SECCIÓN DML ------
INSERT INTO categorias VALUES (1, 'Computación', 'Laptops, PCs y monitores');
INSERT INTO categorias VALUES (2, 'Accesorios', 'Periféricos y complementos');
INSERT INTO categorias VALUES (3, 'Audio', 'Auriculares y parlantes');
INSERT INTO categorias VALUES (4, 'Almacenamiento', 'Discos y memorias');

INSERT INTO clientes VALUES (1, 'María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05', 'Grande',    'Retail');
INSERT INTO clientes VALUES (2, 'Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10', 'PyME',      'Educación');
INSERT INTO clientes VALUES (3, 'Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01', 'Mediana',   'Salud');
INSERT INTO clientes VALUES (4, 'Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15', 'PyME',      'Comercio');
INSERT INTO clientes VALUES (5, 'Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01', 'Mayorista', 'Tecnología');
INSERT INTO clientes VALUES (6, 'Sofía Medina', 'sofia@mail.com', 'La Plata',      '2024-06-10', 'PyME',      'Retail'); -- le agrego este cliente para que tenga sentido la respuesta de la consulta 2 (clientes sin compras registradas)

-- agrego información de territorios basados en las ciudades reales de los clientes existentes
INSERT INTO territorios VALUES (1, 'Argentina', 'CABA',   'Buenos Aires');
INSERT INTO territorios VALUES (2, 'Argentina', 'Centro', 'Córdoba');
INSERT INTO territorios VALUES (3, 'Argentina', 'Centro', 'Rosario');
INSERT INTO territorios VALUES (4, 'Argentina', 'Cuyo',   'Mendoza');
INSERT INTO territorios VALUES (5, 'Argentina', 'NOA',    'Tucumán');

INSERT INTO productos VALUES (1, 'Laptop Pro 15',      1, 1200.00, 15, 1);
INSERT INTO productos VALUES (2, 'Mouse Inalámbrico',  2,   28.00, 80, 1);
INSERT INTO productos VALUES (3, 'Monitor 4K 27"',     1,  450.00, 12, 1);
INSERT INTO productos VALUES (4, 'Auriculares BT Pro', 3,  120.00, 35, 1);
INSERT INTO productos VALUES (5, 'SSD Externo 1TB',    4,  130.00, 18, 1);
INSERT INTO productos VALUES (6, 'Teclado Mecánico',   2,   95.00, 40, 1);
INSERT INTO productos VALUES (7, 'Webcam Full HD',     2,   45.00, 20, 1); -- agrego este dato sin ventas registradas, para la Consulta 3

INSERT INTO ventas VALUES (1,  1, 1, 1, 2, 1200.00, 1680.00, '2024-03-05');
INSERT INTO ventas VALUES (2,  2, 2, 2, 5,   28.00,  112.00, '2024-03-06');
INSERT INTO ventas VALUES (3,  3, 3, 3, 1,  450.00,  306.00, '2024-03-07');
INSERT INTO ventas VALUES (4,  1, 4, 1, 2,  120.00,  172.80, '2024-03-08');
INSERT INTO ventas VALUES (5,  4, 5, 4, 3,  130.00,  292.50, '2024-03-10');
INSERT INTO ventas VALUES (6,  2, 6, 2, 4,   95.00,  296.40, '2024-03-11');
INSERT INTO ventas VALUES (7,  5, 1, 5, 1, 1200.00,  804.00, '2024-03-12');
INSERT INTO ventas VALUES (8,  3, 2, 3, 8,   28.00,  183.68, '2024-03-13');
INSERT INTO ventas VALUES (9,  4, 4, 4, 1,  120.00,   88.80, '2024-03-14');
INSERT INTO ventas VALUES (10, 5, 3, 5, 2,  450.00,  630.00, '2024-03-15');

------ BLOQUE DE CONSULTAS ------
-- Consulta 1 - Vista base del proyecto 

SELECT 
	v.fecha_venta, 
	c.nombre,
	c.segmento,
	c.rubro_cliente AS rubro,
	t.zona,
	p.nombre_producto AS producto,
	cat.nombre_categoria AS categoria,
	v.cantidad,
	v.precio,
	v.cantidad * v.precio AS total_venta,
	((v.cantidad * v.precio) - v.costo) AS ganancia,
	CAST (ROUND (((v.cantidad * v.precio - v.costo) / (v.cantidad * v.precio)) * 100, 1) AS DECIMAL(5,1)) AS margen -- casteo el numero para que solo me muestre con un decimal el resultado
	FROM ventas AS v
INNER JOIN clientes AS c
	ON v.id_cliente = c.id_cliente
INNER JOIN territorios AS t
	ON v.id_territorio = t.id_territorio
INNER JOIN productos AS p
	ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
	ON p.id_categoria = cat.id_categoria
;
/* Validación en SQL Server (SSMS): devuelve 10 filas, una por cada venta registrada.
Coincide con lo esperado: todos los FK de ventas (cliente, producto, territorio, categoría) tienen su fila correspondiente, 
por lo que el INNER JOIN no descarta ningún registro. */

-- Consulta 2 - Clientes sin ventas (LEFT JOIN) 

SELECT 
	c.nombre,
	c.email,
	c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
	ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL 
; 
/* Validación en SQL Server (SSMS): devuelve 1 fila (Sofía Medina).
Coincide con lo esperado: es el único cliente cargado sin ninguna venta asociada. */

-- Consulta 3 - Productos sin ventas (LEFT JOIN) 

SELECT 
	p.nombre_producto AS nombre,
	cat.nombre_categoria AS categoria,
	p.precio
FROM productos AS p
LEFT JOIN ventas AS v
	ON p.id_producto = v.id_producto
INNER JOIN categorias AS cat
	ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL 
;
/* Validación en SQL Server (SSMS): devuelve 1 fila (Webcam Full HD).
Coincide con lo esperado: es el único producto cargado sin ninguna venta asociada. */

-- Consulta 4 -  Consolidado por canal (UNION ALL)

SELECT 
	canal, 
	COUNT (*) AS cantidad,
	SUM (total_venta) AS ingresos_por_canal
FROM (
	SELECT 
		v.fecha_venta AS fecha,
		v.cantidad * v.precio AS total_venta,
		'Presencial' AS canal
	FROM ventas AS v
	LEFT JOIN territorios AS t
		ON v.id_territorio = t.id_territorio
	WHERE t.pais = 'argentina' AND t.region IN ('CABA', 'CENTRO', 'CUYO')

	UNION ALL

	SELECT
		v.fecha_venta AS fecha,
		v.cantidad * v.precio AS total_venta,
		'Online' AS canal
	FROM ventas AS v
	LEFT JOIN territorios AS t
		ON v.id_territorio = t.id_territorio
	WHERE (t.pais = 'argentina' AND t.region IN ('NEA', 'NOA', 'PATAGONIA')) OR t.pais <> 'argentina'
) AS consolidado -- trato el UNION ALL como una tabla temporal ("consolidado") para poder agrupar y sumar el total por canal recién después de combinar ambos orígenes
GROUP BY canal
;
/* Validación en SQL Server (SSMS): devuelve 2 filas (Presencial: 8 ventas, $4344.00 — Online: 2 ventas, $2100.00).
Coincide con lo esperado: 8 + 2 = 10 ventas en total, sin pérdida de filas por usar UNION ALL en vez de UNION. */
