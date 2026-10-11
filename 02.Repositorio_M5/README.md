# RetailPro — Módulo 5: Consultas SQL con JOIN

## Descripción del proyecto

Este repositorio contiene el script SQL del **Módulo 5 de RetailPro**, un ejercicio de análisis de datos comerciales. Su finalidad es relacionar información de ventas, clientes, productos, categorías y ubicación geográfica mediante operaciones `INNER JOIN` y `LEFT JOIN`, además de obtener un resumen de ventas de períodos seleccionados.

## Herramientas utilizadas

- **Microsoft SQL Server:** motor de base de datos compatible con la sintaxis del script (`dbo`, `INNER JOIN`, `LEFT JOIN` y `UNION ALL`).
- **SQL Server Management Studio (SSMS):** entorno recomendado para abrir, ejecutar y revisar las consultas.
- **GitHub:** almacenamiento y documentación del script SQL.

## Contenido del repositorio

```text
RetailPro-M5/
├── README.md
└── m5_consultas_joins.sql
```

> El nombre de la carpeta es ilustrativo. Si el script tiene otro nombre en GitHub, ajusta esta sección.

## Consultas desarrolladas

| Consulta | Operación principal | Objetivo |
| --- | --- | --- |
| **1. Vista base del proyecto** | `INNER JOIN` | Unir ventas con clientes, productos, categorías y dimensión geográfica para mostrar el detalle de las transacciones y calcular `total_venta = cantidad × precio_unitario`. |
| **2. Clientes sin ventas** | `LEFT JOIN` + `IS NULL` | Identificar clientes sin registros de venta y mostrar nombre, correo y fecha de registro. |
| **3. Productos sin ventas** | `LEFT JOIN` + `IS NULL` | Encontrar productos sin ventas registradas e incluir su categoría y precio. |
| **4. Resumen por canal etiquetado** | `UNION ALL` + `GROUP BY` | Sumar las ventas de enero–marzo de 2026 bajo la etiqueta `Online` y las de abril–junio de 2026 bajo la etiqueta `Presencial`. |

**Aclaración de la consulta 4:** el script **no obtiene el canal de un campo de la base de datos**. Asigna las etiquetas `Online` y `Presencial` a dos períodos diferentes mediante valores escritos directamente en la consulta. Por tanto, el resultado permite comparar esos períodos etiquetados, **pero no demuestra ventas reales por canal**.

## Relaciones entre tablas

La consulta principal utiliza las siguientes relaciones; todas deben estar disponibles para que la vista integrada muestre registros:

| Tabla de origen | Campo de unión | Tabla relacionada | Campo relacionado |
| --- | --- | --- | --- |
| `ventas` | `id_cliente` | `clientes` | `id_cliente` |
| `ventas` | `id_producto` | `productos` | `id_producto` |
| `clientes` | `id_geografia` | `dimension_geografica` | `id_geografia` |
| `productos` | `id_categoria` | `categorias` | `id_categoria` |

**Interpretación:** al usar `INNER JOIN`, la consulta 1 devuelve únicamente ventas con coincidencias en todas las tablas relacionadas; si falta alguna relación, esa venta no aparece en el resultado.

## Requisitos previos

1. Disponer de una instancia accesible de **Microsoft SQL Server** y de un cliente de consultas, como **SSMS**.
2. Tener una base de datos con las tablas del esquema `dbo`: `ventas`, `clientes`, `productos`, `dimension_geografica` y `categorias`.
3. Contar con los campos utilizados por el script, entre ellos las claves de relación (`id_cliente`, `id_producto`, `id_categoria`, `id_geografia`, `id_ventas`), datos descriptivos y los campos de venta `cantidad`, `precio_unitario` y `fecha_venta`.
4. Contar con permisos de lectura (`SELECT`) sobre esas tablas y con datos cargados para obtener resultados.

> **Nota:** el archivo contiene consultas `SELECT`; **no** crea las tablas, **no** inserta datos ni define una base de datos. La estructura y los datos deben existir antes de ejecutarlo.

## Cómo ejecutar el script SQL

1. Abre **SQL Server Management Studio (SSMS)** y conéctate al servidor de SQL Server.
2. Selecciona la **base de datos de RetailPro** que contiene las cinco tablas requeridas.
3. Ve a **File > Open > File** y selecciona `m5_consultas_joins(3).sql`.
4. Confirma que la base de datos elegida en el selector de SSMS sea la correcta.
5. Haz clic en **Execute** o presiona **F5** para ejecutar todo el script. Para probar una sola consulta, selecciona únicamente ese bloque y luego presiona **F5**.
6. Revisa los resultados en la pestaña **Results** y los avisos o errores en **Messages**.

**Prueba rápida del entorno:** antes de ejecutar el archivo, puedes comprobar que la tabla principal existe en la base seleccionada:

```sql
SELECT TOP (5) *
FROM dbo.ventas;
```

Si el sistema indica que `dbo.ventas` no existe, verifica que seleccionaste la base de datos correcta y que el esquema fue creado. No ejecutes el script hasta resolverlo.

## Validaciones recomendadas

- Comprueba que las relaciones entre claves sean correctas y que la consulta 1 no duplique registros por uniones inesperadas.
- Revisa que los clientes de la consulta 2 y los productos de la consulta 3 realmente carezcan de registros relacionados en `ventas`.
- Verifica el rango de fechas de la consulta 4: `2026-01-01` a antes de `2026-04-01`, y `2026-04-01` a antes de `2026-07-01`.
- No interpretes la consulta 4 como participación real de canales de venta sin contar con una columna que identifique el canal en los datos de origen.

## Interpretación para el equipo comercial

- **Consulta 1:** proporciona detalle de ventas para estudiar cantidades, precios y montos, siempre que las relaciones entre tablas estén completas.
- **Consulta 2:** identifica clientes registrados sin compras, posibles destinatarios de una revisión de activación comercial (sin demostrar por sí sola el motivo de la inactividad).
- **Consulta 3:** identifica productos sin transacciones registradas; conviene contrastarlos con fechas de incorporación al catálogo y disponibilidad antes de recomendar acciones.
- **Consulta 4:** sirve para comparar los importes de dos trimestres de 2026, **no** para evaluar el rendimiento real de los canales online y presencial.

## Alcance

El proyecto permite analizar relaciones comerciales mediante JOIN, detectar registros sin ventas y resumir importes calculados. Los resultados dependen de los datos disponibles en la base y de la calidad de las relaciones entre tablas.

---

**Proyecto académico RetailPro — Módulo 5**
