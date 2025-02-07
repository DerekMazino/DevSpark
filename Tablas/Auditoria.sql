CREATE TABLE Auditoria (
    Id_auditoria SERIAL PRIMARY KEY,
    accion VARCHAR(100) NOT NULL,
    tabla VARCHAR(100),
    id_registro INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE Auditoria
  IS 'Tabla para el registro de los datos de Auditoria (Actualización sobre las otras tablas)';

COMMENT ON COLUMN Auditoria.Id_auditoria
  IS 'Identificador único de la auditoria';
COMMENT ON COLUMN Auditoria.accion
  IS 'Acción sobre la tabla (INSERT - UPDATE - DELETE)';
COMMENT ON COLUMN Auditoria.tabla
  IS 'Nombre de la tabla afectada por la acción';
COMMENT ON COLUMN Auditoria.id_registro
  IS 'Registro afectado por la acción';
COMMENT ON COLUMN Auditoria.fecha
  IS 'Fecha en la que se generó la acción';