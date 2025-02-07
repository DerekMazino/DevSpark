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

COMMENT ON VIEW V_CLIENTES_PREFERENCIAS
  IS 'Vista con información de las preferencias por cliente';

COMMENT ON COLUMN V_CLIENTES_PREFERENCIAS.nombre_cliente
  IS 'Nombres y Apellidos del cliente';
COMMENT ON COLUMN V_CLIENTES_PREFERENCIAS.nombre_producto
  IS 'Nombre - Modelo del producto';
COMMENT ON COLUMN V_CLIENTES_PREFERENCIAS.descripcion
  IS 'Descripción detallada del producto';
COMMENT ON COLUMN V_CLIENTES_PREFERENCIAS.nombre_categoria
  IS 'Nombre de la categoria';
COMMENT ON COLUMN V_CLIENTES_PREFERENCIAS.recomendacion
  IS 'Indica si la recomendación es Altamente Recomendado, Recomendado o No Recomendado';