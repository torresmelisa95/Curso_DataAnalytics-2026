-- ══════════════════════════════════════════
-- RetailChain — UNION y UNION ALL
-- Autor: Melisa Torres
-- Fecha: 29/08/2026
-- ══════════════════════════════════════════

SELECT * FROM inventario_sucursal_norte;
SELECT * FROM inventario_sucursal_sur;

-- ── CONSULTA 1: UNION ────────────────────
-- Reporte de Catálogo Unificado
-- Pregunta de negocio: ¿Qué productos únicos comercializa
-- la empresa en toda su red de sucursales?
-- Operador: UNION (elimina filas completamente duplicadas)

SELECT id_producto, nombre_producto FROM inventario_sucursal_norte
UNION
SELECT id_producto, nombre_producto FROM inventario_sucursal_sur;

-- ── CONSULTA 2: UNION ALL ────────────────
-- Auditoría de Stock Total
-- Pregunta de negocio: ¿Cuántos registros físicos de stock
-- existen en total entre ambas sucursales?
-- Operador: UNION ALL (mantiene todos los registros incluyendo duplicados)

SELECT id_producto, stock FROM inventario_sucursal_norte
UNION ALL
SELECT id_producto, stock FROM inventario_sucursal_sur;

-- ── CONSULTA 3: COMPARACIÓN DE RESULTADOS ─
-- Ejecutá estas dos consultas para comparar cuántas filas
-- devuelve cada operador y explicá la diferencia en tu README

SELECT COUNT(*) AS filas_union     
FROM 
	(SELECT id_producto, nombre_producto FROM inventario_sucursal_norte
	UNION
	SELECT id_producto, nombre_producto FROM inventario_sucursal_sur)    
AS resultado_union; 
/* es el alias de la tabla derivada — el nombre que le tenés que dar obligatoriamente a la subconsulta que pusiste entre paréntesis en el FROM. 
SQL exige que toda subconsulta en el FROM tenga un alias, aunque no lo uses después, porque internamente la trata como si fuera una tabla temporal sin nombre 
y necesita un identificador para poder referenciarla. */

SELECT COUNT(*) AS filas_union_all 
FROM 
	(SELECT id_producto, stock FROM inventario_sucursal_norte
	UNION ALL
	SELECT id_producto, stock FROM inventario_sucursal_sur)
AS resultado_union_all;
