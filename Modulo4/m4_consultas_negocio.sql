USE Ventas_Tech_DB;
GO

SELECT * FROM ventas;

/* CONSULTA 1 - Resumen ejecutivo mensual:
	- Total facturado
	- Cantidad de pedidos
	- Ticket promedio */

SELECT
    MONTH (fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) / COUNT(*) AS ticket_promedio
FROM ventas
GROUP BY MONTH (fecha_venta)
ORDER BY mes;

/* CONSULTA 2 - Ranking de productos:
    - Top 5 de id_producto por total facturado + unidades vendidas */

SELECT TOP 5
    id_producto,
    SUM(cantidad * precio_unitario) AS total_facturado,
    SUM (cantidad) AS Unidades_vendidas
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC
;

/* CONSULTA 3 - Clientes recurrentes:
    - Clientes con +1 pedido
    - Cant pedidos
    - Total gastado */

SELECT 
    id_cliente,
    COUNT (id_venta) AS cantidad_pedidos ,
    SUM (cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT (id_venta) > 1
ORDER BY total_gastado DESC
;

/* CONSULTA 4 - Meses por encima/por debajo del promedio:
    - Total facturado por mes + etiqueta "por encima/por debajo" prom mensual */

SELECT
    MONTH(fecha_venta) AS mes,
    YEAR(fecha_venta) AS año,
    SUM(cantidad * precio_unitario) AS total_facturado,
    AVG(SUM(cantidad * precio_unitario)) OVER () AS promedio_mensual, 
    CASE 
        WHEN SUM(cantidad * precio_unitario) > AVG(SUM(cantidad * precio_unitario)) OVER () THEN 'Por encima'
        WHEN SUM(cantidad * precio_unitario) < AVG(SUM(cantidad * precio_unitario)) OVER () THEN 'Por debajo'
        ELSE 'Igual al promedio'
    END AS etiqueta
FROM ventas
GROUP BY MONTH(fecha_venta), YEAR(fecha_venta);

-- COMENTARIOS DE HALLLAZGOS:
/*
HALLAZGO 1: Solo 2 productos generan la mayoría de los ingresos

Los productos 1 y 3 concentran el 76.8% de todo lo facturado en marzo ($4.950 de $6.444). Si algo falla con uno de estos dos productos 
(interrupción del suministro o disminución de la demanda), los ingresos bajarían significativamente.

HALLAZGO 2: Demasiado dependiente de 2 clientes

Los clientes 1 y 5 son responsables del 73.6% de las ventas ($4.740 de $6.444). Esta concentración es un riesgo estratégico importante. 
Si uno de estos dos clientes se va o reduce sus compras, los ingresos caerían de forma importante.

HALLAZGO 3: Producto 2 vende mucho pero genera poco dinero

El producto 2 registra 13 unidades vendidas (cantidad más alta), pero solo generó $364 en total (5.6% del total facturado). 
Probablemente tiene un precio muy bajo o poco margen. Conviene evaluar si sigue siendo rentable venderlo o si hay oportunidad de reposicionarlo con mayor precio para incrementar los ingresos. */
