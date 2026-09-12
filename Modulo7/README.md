Pre-entrega 7 – Boceto del dashboard de RetailPro
1.	Definición del propósito del dashboard: detectar cambios de desempeño de ventas por categoría-región-segmento de clientes entre años, evaluar concentración de ingresos y priorizar oportunidades de crecimiento.

2.	Definición de KPIs:
KPI 1: Variación de ingresos (%)
Definición: Cambio porcentual en los ingresos totales entre el año actual y el año anterior.
((Ingresos año actual – Ingresos año anterior) / Ingresos año anterior) × 100
Justificación: Responde directamente a la pregunta diagnóstica: ¿el negocio creció o cayó en términos de ventas? A diferencia del valor absoluto, el porcentaje permite evaluar el desempeño año a año sin que la magnitud de números opaque el resultado.

KPI 2: Concentración de ingresos (%)
Definición: Porcentaje del total de ingresos año actual que proviene de los 10 clientes con mayor volumen de ventas.
(Ingresos de los 10 clientes con mayor volumen / Ingresos totales año actual) × 100

Justificación: Identifica riesgo operativo y de negocio. Si más del 40-50% de ingresos depende de pocos clientes, hay vulnerabilidad ante pérdida de cliente o cambio de condiciones. Fundamental para la decisión estratégica.

KPI 3: Variación de ganancia (%)
Definición: Cambio porcentual en la ganancia neta total entre el año actual y el año anterior.
((Ganancia año actual - Ganancia año anterior) / Ganancia año anterior) × 100
Donde: Ganancia = Suma de (Monto_venta - Costo_total) para cada transacción

Justificación: Complementa la variación de ingresos. Muestra si el crecimiento en ventas se traduce en crecimiento en rentabilidad. Una brecha entre variación de ingresos y variación de ganancia señala problema en márgenes o costos.

KPI 4: Variación de volumen (%)
Definición: Cambio porcentual en la cantidad total de unidades vendidas entre el año actual y el año anterior.
((Unidades vendidas año actual - Unidades vendidas año anterior) / Unidades vendidas año anterior) × 100

Justificación: Diagnóstica las causas de cambios en ingresos y ganancia. Si volumen sube pero ingresos/ganancia bajan o suben menos → problema de pricing o costos. Si volumen baja pero ingresos/ganancia suben → mejor mix de productos. Es la pista para entender el "por qué".

3.	Boceto del dashboard

El dashboard se organiza en cuatro zonas principales. La zona superior contiene 4 tarjetas KPI que responden al desempeño global: Variación de Ingresos, Variación de Ganancia, Variación de Volumen y Concentración de Ingresos. La zona media izquierda muestra el gráfico de líneas de ingresos mensuales (2025 vs 2026), respondiendo a la pregunta de cuándo ocurrieron cambios en el desempeño. La zona media derecha presenta el gráfico de barras con ingresos por categoría, respondiendo cómo varió el desempeño entre categorías. La zona inferior contiene la tabla de detalle con columnas de Segmento-Región-Categoría-Ingresos-Variación YoY-Margen-% Concentración, permitiendo explorar la combinación multidimensional para identificar rubros en crecimiento, caída, márgenes y riesgo de concentración.

Justificación de tipos de gráficos
El gráfico de líneas es la visualización más efectiva para análisis temporal porque permite identificar rápidamente estacionalidades, puntos de quiebre en la tendencia y ciclos repetitivos año a año. En este caso, muestra cuándo los ingresos mejoraron o empeoraron, facilitando el diagnóstico de si el cambio fue gradual o abrupto.
El gráfico de barras horizontales es óptimo para comparar categorías porque el ojo identifica inmediatamente diferencias de magnitud entre valores. La longitud relativa de cada barra permite al usuario ver instantáneamente qué categoría genera más ingresos y cuál es la variación entre años, sin necesidad de leer números exactos.

Estructura de resumen a detalle
El diseño respeta el patrón de lectura Z/F occidental, donde el usuario comienza en la zona superior izquierda con los 4 KPIs que presentan datos agregados y de máximo impacto. A continuación, los gráficos de tendencia y barras ofrecen progresivamente mayor granularidad: el gráfico de líneas identifica cambios temporales sin detalle de categorías, y las barras desglosan por categoría. Finalmente, la tabla en zona inferior proporciona datos completamente granulares por segmento-región-categoría, permitiendo al usuario profundizar en cruce multidimensional sin saturar visualmente los elementos superiores.
Esta estructura responde al propósito del dashboard: diagnóstico rápido en el resumen visual (¿qué pasó y dónde?) y exploración detallada en la tabla (¿por qué pasó?), ordenando la información en progresión de importancia estratégica (mayor arriba) e inversa de granularidad (agregada arriba, detallada abajo).

