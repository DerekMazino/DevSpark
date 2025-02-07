CREATE TABLE Auditoria (
    Id_auditoria SERIAL PRIMARY KEY,
    accion VARCHAR(100) NOT NULL,
    tabla VARCHAR(100),
    id_registro INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);