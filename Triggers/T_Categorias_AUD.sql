CREATE OR REPLACE FUNCTION F_Categoria_AUD() 
RETURNS TRIGGER AS $$
BEGIN
    -- INSERT
    IF TG_OP = 'INSERT' THEN
        INSERT INTO Auditoria (accion, tabla, id_registro, fecha)
        VALUES ('INSERT', TG_TABLE_NAME, NEW.id_categoria, NOW());
    
    -- UPDATE
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO Auditoria (accion, tabla, id_registro, fecha)
        VALUES ('UPDATE', TG_TABLE_NAME, NEW.id_categoria, NOW());

    -- DELETE
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO Auditoria (accion, tabla, id_registro, fecha)
        VALUES ('DELETE', TG_TABLE_NAME, OLD.id_categoria, NOW());
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER T_Categorias_AUD
AFTER INSERT OR UPDATE OR DELETE
ON Categorias
FOR EACH ROW
EXECUTE FUNCTION F_Categoria_AUD();
