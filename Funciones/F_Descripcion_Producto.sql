CREATE OR REPLACE FUNCTION F_Descripcion_Producto(producto_id INTEGER)
RETURNS TABLE(nombre VARCHAR, descripcion VARCHAR) AS $$
BEGIN
    RETURN QUERY 
	SELECT p.nombre, CAST(p.descripcion AS VARCHAR)
	FROM productos p
	WHERE id_producto = producto_id; 
	
END;
$$ LANGUAGE plpgsql;