CREATE OR REPLACE PROCEDURE P_ACTUALIZA_STOCK(producto_id INT, nueva_cantidad INT)
AS $$
BEGIN
    UPDATE Productos
    SET stock = stock + nueva_cantidad
    WHERE id_producto = producto_id;
END;
$$ LANGUAGE plpgsql;