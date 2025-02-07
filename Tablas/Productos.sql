CREATE TABLE Productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    marca VARCHAR(100),
    id_categoria INT,  -- Columna que almacena la relación con la tabla categorias
    precio DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    fecha_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_producto) ON DELETE SET NULL
);