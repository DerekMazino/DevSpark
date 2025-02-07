----------------------------------------------------------------------------
--
-- Tabla para el registro de los datos de Preferencias por cliente.
-- © DEVSPARK.2025-02-07.
--
-----------------------------------------------------------------------------
CREATE TABLE Preferencias (
    id_preferencia SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    recomendacion VARCHAR(30) CHECK (recomendacion IN ('Altamente Recomendado', 'Recomendado', 'No Recomendado')),
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES Preferencias(id_cliente) ON DELETE CASCADE,
    CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE CASCADE
);

COMMENT ON TABLE Preferencias
  IS 'Tabla para el registro de los datos de Preferencias por cliente';

COMMENT ON COLUMN Preferencias.id_preferencia
  IS 'Identificador único de la preferencia';
COMMENT ON COLUMN Preferencias.id_cliente
  IS 'Identificador único por cliente';
COMMENT ON COLUMN Preferencias.id_producto
  IS 'Identificador único por producto';
COMMENT ON COLUMN Preferencias.recomendacion
  IS 'Indica si la recomendación es Altamente Recomendado, Recomendado o No Recomendado';