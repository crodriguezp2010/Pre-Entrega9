 
 --Consulta 1 — Resumen ejecutivo mensual Total facturado, cantidad de pedidos y ticket promedio, agrupados por mes. 
 --Calculá el total como cantidad * precio_unitario. Usá alias descriptivos en español y agrupá por mes con EXTRACT(MONTH FROM fecha_venta).
 
 
 SELECT 
    SUM(cantidad * precio_unitario) AS total_facturado,
    SUM(cantidad) AS cantidad,
	cast ((SUM(cantidad * precio_unitario)) / (SUM(cantidad)) AS DECIMAL(10,2)) as ticket_promedio,
    MONTH(fecha_venta) AS mes
FROM [Ventas_Tech_DB].[dbo].[ventas]
GROUP BY MONTH(fecha_venta);



--Consulta 2 — Ranking de productos Top 5 de id_producto por total facturado, 
--mostrando las unidades vendidas (SUM(cantidad)) y el total generado. Usá GROUP BY id_producto, ORDER BY y limitá el resultado a 5.

SELECT TOP (5)
    SUM(cantidad * precio_unitario) AS total_facturado,
    SUM(cantidad) AS cantidad,
    id_producto
FROM [Ventas_Tech_DB].[dbo].[ventas]
GROUP BY id_producto
ORDER BY total_facturado desc;


--Consulta 3 — Clientes recurrentes id_cliente que hayan realizado más de un pedido, 
--mostrando la cantidad de pedidos y el total gastado. Usá GROUP BY id_cliente y HAVING COUNT(*) > 1.

SELECT SUM(cantidad) AS cantidad_pedido,
    SUM(cantidad * precio_unitario) AS total_gastado,
    id_cliente
FROM [Ventas_Tech_DB].[dbo].[ventas]
GROUP BY id_cliente
HAVING SUM(cantidad) > 1
ORDER BY cantidad_pedido desc;

--Consulta 4 — Meses por encima/por debajo del promedio Total facturado por mes, 
-- con una columna adicional que etiquete con CASE WHEN si ese mes quedó 'Por encima' o 'Por debajo' del promedio mensual general.

SELECT  *
FROM [Ventas_Tech_DB].[dbo].[ventas]

SELECT
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE
        WHEN SUM(cantidad * precio_unitario) >= (SELECT 
                                                    AVG(cantidad * precio_unitario) AS PROMEDIO
                                                FROM [Ventas_Tech_DB].[dbo].[ventas]) THEN 'ENCIMA'
        ELSE 'DEBAJO'
    END AS promedio,
    MONTH(fecha_venta) AS mes
FROM [Ventas_Tech_DB].[dbo].[ventas]
GROUP BY MONTH(fecha_venta)
ORDER BY MONTH(fecha_venta);