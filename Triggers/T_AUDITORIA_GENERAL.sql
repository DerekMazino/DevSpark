----------------------------------------------------------------------------
--
-- Trigger de auditoria general para todas las tablas
-- © DEVSPARK.2025-02-07.
--
-----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION F_AUDITORIA_GENERAL() 
RETURNS TRIGGER AS $$
DECLARE
    id_registro INT;
    columna_id TEXT;
BEGIN
    -- Determinar la clave primaria de la tabla afectada
    SELECT column_name 
    INTO columna_id
    FROM information_schema.columns 
    WHERE table_name = TG_TABLE_NAME
    AND column_name LIKE 'id_%'
    ORDER BY ordinal_position
    LIMIT 1;

    -- Obtener el valor del ID según la operación
    IF TG_OP = 'INSERT' THEN
        EXECUTE format('SELECT ($1).%I', columna_id) USING NEW INTO id_registro;
    ELSIF TG_OP = 'UPDATE' THEN
        EXECUTE format('SELECT ($1).%I', columna_id) USING NEW INTO id_registro;
    ELSIF TG_OP = 'DELETE' THEN
        EXECUTE format('SELECT ($1).%I', columna_id) USING OLD INTO id_registro;
    END IF;

    -- Insertar en la tabla de auditoría
    INSERT INTO Auditoria (accion, tabla, id_registro, fecha)
    VALUES (TG_OP, TG_TABLE_NAME, id_registro, NOW());

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER T_Categorias_AUD
AFTER INSERT OR UPDATE OR DELETE
ON Categorias
FOR EACH ROW
EXECUTE FUNCTION F_AUDITORIA_GENERAL();

CREATE TRIGGER T_Clientes_AUD
AFTER INSERT OR UPDATE OR DELETE
ON Clientes
FOR EACH ROW
EXECUTE FUNCTION F_AUDITORIA_GENERAL();

CREATE TRIGGER T_Auditoria_Preferencias
AFTER INSERT OR UPDATE OR DELETE
ON Preferencias
FOR EACH ROW
EXECUTE FUNCTION F_AUDITORIA_GENERAL();

CREATE TRIGGER T_Preferencias_AUD
AFTER INSERT OR UPDATE OR DELETE
ON Productos
FOR EACH ROW
EXECUTE FUNCTION F_AUDITORIA_GENERAL();
