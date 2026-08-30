## Validación y pruebas
Todos los scripts de esta entrega fueron ejecutados y testeados en **Microsoft SQL Server (SSMS)** antes de subirlos al repositorio.
- Se verificó que cada consulta devuelva la cantidad de filas esperada según los datos cargados (ver comentarios de validación en `m5_consultas_joins.sql`).
- En la Consulta 4 se confirmó que `UNION ALL` conserva las 10 ventas sin eliminar filas, a diferencia de `UNION`, que sí las hubiera eliminado en caso de valores idénticos entre ambos orígenes.
