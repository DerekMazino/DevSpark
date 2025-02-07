----------------------------------------------------------------------------
--
-- Función que obtiene el stock de marca según su categoria.
-- © DEVSPARK.2025-02-07.
--
-----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION F_Obtener_Productos_X_Categoria(nombre_categoria VARCHAR)
RETURNS TABLE(marca VARCHAR, categoria VARCHAR, cantidad INT) AS $$
BEGIN
    RETURN QUERY 
    SELECT p.marca, c.nombre, SUM(p.stock)::INT
    FROM productos p
    JOIN categorias c ON p.id_categoria = c.id_categoria
    WHERE c.nombre = nombre_categoria AND p.stock > 0
    GROUP BY p.marca, c.nombre;
END;
$$ LANGUAGE plpgsql;