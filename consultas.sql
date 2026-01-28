-- 1. Total de ventas por cliente
SELECT 
    c.nombre,
    SUM(v.total) AS total_ventas
FROM ventas v
INNER JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nombre
ORDER BY total_ventas DESC;


-- 2. Productos más vendidos
SELECT 
    p.nombre,
    SUM(dv.cantidad) AS total_vendido
FROM detalle_ventas dv
INNER JOIN productos p ON dv.producto_id = p.id
GROUP BY p.nombre
ORDER BY total_vendido DESC;


-- 3. Clientes que no han realizado compras
SELECT 
    c.nombre
FROM clientes c
LEFT JOIN ventas v ON c.id = v.cliente_id
WHERE v.id IS NULL;


-- 4. Ventas por mes
SELECT 
    MONTH(fecha) AS mes,
    SUM(total) AS total_ventas
FROM ventas
GROUP BY MONTH(fecha)
ORDER BY mes;
