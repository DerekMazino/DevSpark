CREATE OR REPLACE FUNCTION F_Productos_Precio_X_Categoria(
    categoria_nombre VARCHAR, 
    precio_min NUMERIC DEFAULT 0, 
    precio_max NUMERIC DEFAULT 999999, 
    limite INT DEFAULT 10,
    orden VARCHAR DEFAULT 'DESC'
)
RETURNS TABLE (
    nombre    VARCHAR, 
    precio    NUMERIC, 
    categoria VARCHAR
) AS $$
BEGIN
    RETURN QUERY 
    EXECUTE format(
        'SELECT p.nombre, p.precio, c.nombre AS categoria
        FROM productos p
        JOIN categorias c ON p.id_categoria = c.id_categoria
        WHERE c.nombre = $1 
            AND p.precio BETWEEN $2 AND $3
        ORDER BY p.precio %s
        LIMIT $4', 
        CASE WHEN UPPER(orden) = 'ASC' THEN 'ASC' ELSE 'DESC' END
    ) 
    USING categoria_nombre, precio_min, precio_max, limite;
END;
$$ LANGUAGE plpgsql;