----------------------------------------------------------------------------
--
-- Función que obtiene la descripción de un terminado producto.
-- © DEVSPARK.2025-02-07.
--
-----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION F_Descripcion_Producto(producto_id INTEGER)
RETURNS TABLE(nombre VARCHAR, descripcion VARCHAR) AS $$
BEGIN
    RETURN QUERY 
	SELECT p.nombre, CAST(p.descripcion AS VARCHAR)
	FROM productos p
	WHERE id_producto = producto_id; 
	
END;
$$ LANGUAGE plpgsql;