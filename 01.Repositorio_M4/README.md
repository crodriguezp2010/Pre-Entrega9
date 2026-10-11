# RetailPro | Análisis comercial con SQL

## Descripción del proyecto

RetailPro es un proyecto académico de análisis de datos comerciales. Su objetivo es explorar información de ventas mediante consultas SQL que permiten resumir la facturación, identificar productos de mayor ingreso y estudiar patrones de compra de los clientes.

Este repositorio incluye un script del Módulo 4 con cuatro consultas de negocio desarrolladas sobre la tabla `ventas` de la base de datos `Ventas_Tech_DB`.

## Herramientas y tecnologías

- **Microsoft SQL Server:** motor de base de datos para el que están escritas las consultas (T-SQL).
- **SQL:** lenguaje utilizado para filtrar, agrupar, calcular y ordenar los resultados.
- **SQL Server Management Studio (SSMS) o herramienta compatible:** opción para conectar con SQL Server y ejecutar el script.
- **GitHub:** plataforma para almacenar y documentar los archivos del proyecto.

## Contenido del repositorio

| Archivo | Descripción |
| --- | --- |
| `m4_consultas_negocio.sql` | Script del Módulo 4 con las cuatro consultas comerciales. |
| `README.md` | Documentación del proyecto y guía para ejecutar el script. |

> Si el script se publica en GitHub con otro nombre, se debe actualizar el nombre de archivo en esta tabla.

## Consultas incluidas

1. **Resumen mensual:** Contiene el resumen ejecutivo mensual del Total facturado, cantidad de pedidos y ticket promedio, agrupados por mes.
2. **Top 5 de productos:** Ranking de productos Top 5 por total facturado.
3. **Clientes con múltiples unidades:** Listado de Clientes recurrentes que hayan realizado más de un pedido.
4. **Clasificación de facturación mensual:** Listado de Meses por encima/por debajo del promedio Total facturado por mes.

## Requisitos para ejecutar el script

- Tener acceso a una instancia de **Microsoft SQL Server**.
- Tener una herramienta para ejecutar consultas, como **SSMS**.
- Disponer de la base de datos `Ventas_Tech_DB`, con la tabla `[dbo].[ventas]` y, como mínimo, los campos `fecha_venta`, `cantidad`, `precio_unitario`, `id_producto` e `id_cliente`.
- Contar con permiso de lectura (`SELECT`) sobre la tabla.

> **Importante:** el repositorio documentado aquí no incluye un archivo de creación de la base de datos ni datos de prueba. Por tanto, se necesita acceso previo a la base para obtener resultados. No se deben publicar contraseñas ni credenciales.

## Ejecución paso a paso

1. Descarga el archivo `m4_consultas_negocio(1).sql` desde el repositorio (o clona el repositorio).
2. Abre **SQL Server Management Studio (SSMS)** y conéctate a la instancia que contiene la base de datos.
3. Verifica que exista `Ventas_Tech_DB` y que tu usuario pueda leer `[dbo].[ventas]`.
4. Abre el script desde **File > Open > File**.
5. Ejecuta el script completo con **Execute**, o selecciona una consulta específica y ejecútala por separado.
6. Revisa los resultados en la pestaña **Results**. La cuarta sección también incluye un `SELECT *` previo, por lo que devuelve un conjunto de resultados adicional.

## Consideraciones para interpretar los resultados

- **Agrupación mensual:** La consulta 1, se realiza la agrupación del total facturado por mes para ello se hace uso de la función `MONTH(fecha_venta)`.
- **Indicador de la consulta 1:** La consulta 1, aunque se llama `ticket_promedio`, divide la facturación total entre las unidades vendidas, no entre el número de pedidos. Es un **importe promedio por unidad**.
- **Clientes recurrentes:** la consulta 3 aplica la funcion `SUM(cantidad) > 1` para obtener los clientes que hayan tenido más de un pedido.
- **Promedio mensual:** la consulta 4 compara cada total mensual contra la facturación promedio mensual para ello se usa la función `AVG(cantidad * precio_unitario)`.

Estos puntos son observaciones sobre la versión actual del script; no se han alterado las consultas originales.

## Estado del proyecto

Documentación del script de consultas comerciales del **Módulo 4**. La ejecución correcta y los resultados dependen de la disponibilidad y estructura de `Ventas_Tech_DB`.
