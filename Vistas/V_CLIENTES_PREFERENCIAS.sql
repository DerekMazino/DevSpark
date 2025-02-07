CREATE OR REPLACE VIEW V_CLIENTES_PREFERENCIAS AS
SELECT cli.id_cliente
,	   cli.nombre nombre_cliente
,	   pro.nombre nombre_producto
,	   pro.descripcion
,	   cat.nombre nombre_categoria
,	   pre.recomendacion
FROM clientes     cli
JOIN preferencias pre ON cli.id_cliente   = pre.id_cliente
JOIN productos    pro ON pro.id_producto  = pre.id_producto
JOIN categorias   cat ON cat.id_categoria = pro.id_categoria;