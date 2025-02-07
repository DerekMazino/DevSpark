CREATE TABLE Preferencias (
    id_preferencia SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    recomendacion VARCHAR(20) CHECK (recomendacion IN ('Altamente Recomendado', 'Recomendado', 'No Recomendado')),
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_preferencia) ON DELETE CASCADE,
    CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES productos(id_preferencia) ON DELETE CASCADE
);


