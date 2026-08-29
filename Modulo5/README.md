¿Cuántas filas devuelve cada consulta y por qué son distintas? Explicá con ejemplos concretos de los datos qué filas se eliminaron con UNION.

La consulta con UNION devuelve 11 filas y la consulta con UNION ALL devuelve 14. Son distintas porque el operador UNION elimina los duplicados, que con UNION ALL no sucede. Con UNION se eliminaron los registros con el mismo id_producto (103, 104, 106) y con el mismo nombre "Webcam HD 1080p".

¿Por qué UNION ALL es más eficiente que UNION? ¿Qué operación adicional realiza UNION internamente que consume más recursos?

UNION ALL es más eficiente y rápido que UNION porque apila las filas tal cual vienen en cada tabla: no realiza ninguna validación ni ordenamiento extra. En cambio, con UNION el motor debe ordenar los datos y compararlos para eliminar los duplicados. (Nota adicional, investigada por fuera de la clase: según documentación de SQL Server, este paso de ordenamiento (sort) que aplica UNION para detectar duplicados puede resolverse también mediante una estructura hash, dependiendo de cómo el optimizador arme el plan de ejecución; en ambos casos, ese trabajo extra de agrupar y comparar filas es lo que consume más CPU y memoria que UNION ALL.)

¿En qué casos de negocio usarías cada uno? Dá al menos dos ejemplos reales distintos a los del ejercicio.

Para UNION: unificar la lista de clientes que compraron en la tienda física y en la tienda online, para saber cuántos clientes distintos tiene la empresa en total (si alguien compró en ambos canales con los mismos datos, contás una sola vez). 
Otro caso: combinar las direcciones de email de dos bases de marketing distintas antes de mandar una campaña, para no mandarle el mismo mail dos veces a la misma persona.

Para UNION ALL: consolidar las transacciones de venta de dos sucursales en un solo reporte mensual, donde cada transacción es un evento real e independiente aunque dos clientes distintos hayan comprado el mismo producto por el mismo monto el mismo día.
Otro caso: union. consolidar las facturas emitidas por dos sucursales distintas para calcular el total facturado en el mes. Cada factura es una venta real e independiente, así que aunque dos facturas de clientes distintos coincidan en monto y fecha, ambas deben sumar al total.


¿Qué pasa si las columnas de ambas consultas no coinciden en número o tipo? ¿Qué error genera SQL?

Si el número de columnas entre ambas consultas no coincide, SQL Server genera un error de compilación antes de ejecutar nada, indicando que todas las consultas combinadas con UNION deben tener la misma cantidad de columnas.
Ejemplo: "All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists"
Si el número de columnas coincide pero los tipos de dato no son compatibles, el comportamiento depende de si existe una conversión implícita posible: si los tipos son compatibles (por ejemplo, int y decimal), SQL Server convierte automáticamente al tipo más amplio y no hay error; si no puede convertir de forma segura (por ejemplo, texto no numérico contra un entero), arroja un error de conversión al ejecutar la consulta.
Ejemplo: "Conversion failed when converting the varchar value '...' to data type int".
