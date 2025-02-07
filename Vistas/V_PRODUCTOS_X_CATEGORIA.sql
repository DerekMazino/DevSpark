CREATE OR REPLACE VIEW V_PRODUCTOS_X_CATEGORIA AS
SELECT p.id_producto
,	   p.nombre nombre_producto
,	   p.descripcion
,	   p.marca
,	   p.precio
,	   p.stock
,	   p.fecha_ingreso
,	   c.id_categoria
,	   c.nombre categoria
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria;