CREATE OR REPLACE FUNCTION F_Consultar_Recomendacion_X_Cliente(cliente_id INTEGER)
RETURNS TABLE(nombre VARCHAR, descripcion VARCHAR, recomendacion VARCHAR) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        p.nombre, 
        CAST(p.descripcion AS VARCHAR), -- Conversión explícita
        r.recomendacion
    FROM preferencias r
    JOIN productos p ON p.id_producto = r.id_producto
    WHERE r.id_cliente = cliente_id;
END;
$$ LANGUAGE plpgsql;
