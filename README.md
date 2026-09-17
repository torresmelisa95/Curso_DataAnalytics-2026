# Curso_DataAnalytics-2026

## Descripción General

Este repositorio contiene los scripts SQL, análisis de datos y visualizaciones desarrollados como parte del **Curso de Data Analytics de Coder House**. Incluye el proyecto **RetailPro**, un análisis de datos para un distribuidor de tecnología, así como ejercicios y entregas previas de módulos iniciales.

El proyecto RetailPro comienza en Modulo3 con la creación de la base de datos relacional, carga de datos de ventas y consultas de análisis diseñadas para extraer insights operacionales y comerciales. El objetivo es proporcionar un conjunto completo de herramientas para analizar el rendimiento de ventas, comportamiento de clientes y dinámicas territoriales.

## Estructura del Repositorio

```
Curso_DataAnalytics-2026/
├── Modulo2/
│   └── modulo2_unidad1_diseno.sql [Ejercicio del curso - no parte de RetailPro]
├── Modulo3/
│   ├── modulo3_unidad1_inventario-b... [Ejercicio del curso - no parte de RetailPro]
│   └── ventas_tech_db.sql [INICIO DEL PROYECTO RETAILPRO]
├── Modulo4/
│   └── m4_consultas_negocio.sql [RetailPro]
├── Modulo5/
│   ├── README.md
│   └── m5_consultas_joins.sql [RetailPro]
├── Modulo6/
│   └── Pipeline_ETL_Torres_Melisa.pbix [RetailPro]
├── Modulo7/
│   └── README.md
├── Modulo8/
│   └── Torres_Melisa_Checkpoint2.pbix [RetailPro]
└── README.md
```

## Requisitos Técnicos

Se requiere **SQL Server 2019 o superior** para ejecutar los scripts. Acceso a SQL Server Management Studio (SSMS) o herramienta equivalente para ejecutar consultas. Power BI Desktop (versión actual) si se desea trabajar con los dashboards en desarrollo.

## Cómo Clonar el Repositorio

```bash
git clone https://github.com/torresmelisa95/Curso_DataAnalytics-2026.git
cd Curso_DataAnalytics-2026
```

## Cómo Ejecutar los Scripts SQL de RetailPro

Para el proyecto RetailPro, los scripts deben ejecutarse en orden secuencial a partir de Modulo3:

1. **Modulo3** (`ventas_tech_db.sql`): Crea la base de datos, define las tablas relacionales con restricciones de integridad y carga datos iniciales.
2. **Modulo4** (`m4_consultas_negocio.sql`): Ejecuta consultas de análisis sobre los datos.
3. **Modulo5** (`m5_consultas_joins.sql`): Consultas avanzadas con JOINs entre múltiples tablas.

Abre SQL Server Management Studio, copia y pega cada script en orden. Los scripts están diseñados para ser reutilizables: si necesitas reiniciar, ejecuta nuevamente el script de Modulo3 para limpiar la base de datos.

## Descripción de Tablas Principales (RetailPro)

La base de datos RetailPro incluye las siguientes tablas relacionadas:

**Categorías:** Tipos de productos (Computación, Accesorios, Audio, Almacenamiento).

**Productos:** Catálogo completo con nombre, categoría, precio y stock disponible.

**Clientes:** Información de cuentas con nombre, email, ciudad, fecha de registro y segmento.

**Territorios:** Zonas geográficas de ventas con país, región y zona.

**Ventas:** Tabla transaccional que vincula clientes, productos, territorios y fechas con cantidad vendida y precio.

Las relaciones entre tablas se mantienen mediante claves foráneas para garantizar consistencia de datos.

## Consultas Disponibles (RetailPro)

### Modulo4 — m4_consultas_negocio.sql

**Consulta 1 - Resumen ejecutivo mensual:** Muestra total facturado, cantidad de pedidos y ticket promedio por mes.

**Consulta 2 - Ranking de productos:** Lista los 5 productos más rentables por total facturado y unidades vendidas.

**Consulta 3 - Clientes recurrentes:** Identifica clientes con más de un pedido, cantidad de pedidos y total gastado.

**Consulta 4 - Desempeño mensual:** Compara ingresos mensuales contra el promedio e identifica si están por encima o por debajo.

### Modulo5 — m5_consultas_joins.sql

Consultas base que consolidan datos de ventas con todas las dimensiones (cliente, territorio, producto, categoría) para alimentar reportes Power BI.

## Visualizaciones Power BI (RetailPro)

**Modulo6 (`Pipeline_ETL_Torres_Melisa.pbix`):** Pipeline ETL completo que procesa la base de datos RetailPro en Power BI. Incluye la carga de datos desde SQL Server, transformaciones y validaciones de integridad (en desarrollo).

**Modulo7 (`README.md`):** Boceto del dashboard RetailPro con diseño de visualizaciones propuestas (KPIs, gráficos, tablas de análisis).

**Modulo8 (`Torres_Melisa_Checkpoint2.pbix`):** Checkpoint completado con carga de datos desde SQL Server, creación del modelo relacional en Power BI, conexión entre tablas, construcción del esquema estrella (tabla de hechos Ventas con dimensiones Productos, Clientes, Territorios, Categorías) y tabla de verificación que valida la integridad de la estructura.

**Nota:** Los archivos .pbix son binarios y no se pueden visualizar directamente en GitHub. Para abrirlos, descargá el archivo y abrilo con Power BI Desktop.

## Estado Actual y Próximos Pasos

**Estado actual:** Base de datos RetailPro creada, tablas relacionales operativas, consultas de análisis funcionales. Scripts SQL validados y documentados. Pipeline ETL en Power BI completado. Modelo relacional de Power BI construido.

**Próximos pasos:** Completar dashboard final con visualizaciones de KPIs. Optimizar índices en tablas de ventas. Agregar datos históricos para análisis de tendencias multianuales. Crear procedimientos almacenados para reportes automáticos.

## Autor

Proyecto desarrollado como parte del Curso de Data Analytics 2026 de Coder House.

Para preguntas o sugerencias, abre un issue en este repositorio.

---

**Última actualización:** Septiembre 2026
