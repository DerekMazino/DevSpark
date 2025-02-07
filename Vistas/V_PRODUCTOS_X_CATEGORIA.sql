CREATE OR REPLACE VIEW V_PRODUCTOS_X_CATEGORIA AS
SELECT pro.id_producto
,	   pro.nombre nombre_producto
,	   pro.descripcion
,	   pro.marca
,	   pro.precio
,	   pro.stock
,	   pro.fecha_ingreso
,	   cat.id_categoria
,	   cat.nombre categoria
FROM productos pro
JOIN categorias cat ON pro.id_categoria = cat.id_categoria;

COMMENT ON VIEW V_PRODUCTOS_X_CATEGORIA
  IS 'Vista con información de las preferencias por cliente';

COMMENT ON COLUMN V_PRODUCTOS_X_CATEGORIA.id_producto
  IS 'Nombres y Apellidos del cliente';
COMMENT ON COLUMN V_PRODUCTOS_X_CATEGORIA.nombre_producto
  IS 'Nombre - Modelo del producto';
COMMENT ON COLUMN V_PRODUCTOS_X_CATEGORIA.descripcion
  IS 'Descripción detallada del producto';
COMMENT ON COLUMN V_PRODUCTOS_X_CATEGORIA.marca
  IS 'Marca o fabricante del producto';
COMMENT ON COLUMN V_PRODUCTOS_X_CATEGORIA.precio
  IS 'Precio de venta actual del producto';
COMMENT ON COLUMN V_PRODUCTOS_X_CATEGORIA.stock
  IS 'Stock actual del producto';
COMMENT ON COLUMN V_PRODUCTOS_X_CATEGORIA.fecha_ingreso
  IS 'Fecha en la que el producto se creó dentro del sistema';
COMMENT ON COLUMN V_PRODUCTOS_X_CATEGORIA.id_categoria
  IS 'Identificador único de la categoria';
COMMENT ON COLUMN V_PRODUCTOS_X_CATEGORIA.categoria
  IS 'Nombre de la categoria';