----------------------------------------------------------------------------
--
-- Trigger de auditoria de la tabla productos.
-- © DEVSPARK.2025-02-07.
--
-----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION F_Productos_AUD() 
RETURNS TRIGGER AS $$
BEGIN
    -- INSERT
    IF TG_OP = 'INSERT' THEN
        INSERT INTO Auditoria (accion, tabla, id_registro, fecha)
        VALUES ('INSERT', TG_TABLE_NAME, NEW.id_producto, NOW());
    
    -- UPDATE
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO Auditoria (accion, tabla, id_registro, fecha)
        VALUES ('UPDATE', TG_TABLE_NAME, NEW.id_producto, NOW());

    -- DELETE
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO Auditoria (accion, tabla, id_registro, fecha)
        VALUES ('DELETE', TG_TABLE_NAME, OLD.id_producto, NOW());
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER T_Productos_AUD
AFTER INSERT OR UPDATE OR DELETE
ON Productos
FOR EACH ROW
EXECUTE FUNCTION F_Productos_AUD();
