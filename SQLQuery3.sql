


use las_5_farmas
CREATE TABLE Cliente (
    IdCliente INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    DNI CHAR(8) NOT NULL UNIQUE,
   Telefono CHAR(9)  UNIQUE,
  
);

CREATE TABLE Empleado (
    IdEmpleado INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Usuario VARCHAR(50) NOT NULL UNIQUE,
    Telefono Char(9) NOT NULL UNIQUE,
    Password VARCHAR(50)
);
CREATE TABLE Producto (
    IdProducto INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) not null,
    Precio DECIMAL(10,2) NOT NULL CHECK (Precio >= 0),
    Stock INT
);
CREATE TABLE Venta (
    IdVenta INT IDENTITY PRIMARY KEY,
    Fecha DATETIME DEFAULT GETDATE(),
    IdCliente INT,
    IdEmpleado INT,

    FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
    FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado)
);
CREATE TABLE DetalleVenta (
    IdDetalle INT IDENTITY PRIMARY KEY,
    IdVenta INT,
    IdProducto INT,
    Cantidad INT,
    Precio DECIMAL(10,2) NOT NULL,
    Total DECIMAL(10,2)

    FOREIGN KEY (IdVenta) REFERENCES Venta(IdVenta),
    FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)
);

CREATE TABLE Proveedor (
    IdProveedor INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) not null,
    Telefono VARCHAR(15) not null
);

CREATE TABLE Compra (
    IdCompra INT IDENTITY PRIMARY KEY,
    Fecha DATETIME DEFAULT GETDATE(),
    IdProveedor INT,

    FOREIGN KEY (IdProveedor) REFERENCES Proveedor(IdProveedor)
);

CREATE TABLE DetalleCompra (
    IdDetalleCompra INT IDENTITY PRIMARY KEY,
    IdCompra INT,
    IdProducto INT,
    Cantidad INT,
    Precio DECIMAL(10,2),
    Total DECIMAL(10,2),
    FOREIGN KEY (IdCompra) REFERENCES Compra(IdCompra),
    FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)
);
INSERT INTO Empleado (Nombre, Usuario,Telefono ,Password)
VALUES ('Administrador', 'admin' ,'909090900' ,'123');
INSERT INTO Proveedor (Nombre, Telefono) VALUES
('Farma Perú', '987654321'),
('Medic Center', '912345678'),
('Distribuidora Salud', '956789123');
DECLARE @i INT = 1;

WHILE @i <= 50
BEGIN
    INSERT INTO Cliente (Nombre, DNI)
    VALUES (
        CASE (@i % 5)
            WHEN 0 THEN 'Juan'
            WHEN 1 THEN 'María'
            WHEN 2 THEN 'Carlos'
            WHEN 3 THEN 'Ana'
            ELSE 'Luis'
        END + ' ' +
        CASE (@i % 5)
            WHEN 0 THEN 'Pérez'
            WHEN 1 THEN 'García'
            WHEN 2 THEN 'Torres'
            WHEN 3 THEN 'Ramírez'
            ELSE 'Flores'
        END,
        RIGHT('00000000' + CAST(@i AS VARCHAR), 8)
    );

    SET @i = @i + 1;
END;
INSERT INTO Producto (Nombre, Precio, Stock) VALUES
('Paracetamol', 2.5, 100),
('Ibuprofeno', 3.0, 80),
('Amoxicilina', 5.5, 60),
('Aspirina', 1.8, 120),
('Diclofenaco', 4.0, 90),
('Naproxeno', 3.5, 70),
('Omeprazol', 6.0, 50),
('Ranitidina', 4.5, 40),
('Loratadina', 2.8, 75),
('Cetirizina', 3.2, 65),
('Metformina', 5.0, 55),
('Enalapril', 4.2, 60),
('Losartan', 6.5, 45),
('Atorvastatina', 7.0, 35),
('Simvastatina', 6.8, 30),
('Salbutamol', 5.5, 50),
('Prednisona', 4.0, 60),
('Hidrocortisona', 3.5, 70),
('Insulina', 25.0, 20),
('Glucosa', 2.0, 100),
('Clorfenamina', 2.5, 90),
('Azitromicina', 8.0, 40),
('Ciprofloxacino', 7.5, 45),
('Doxiciclina', 6.5, 50),
('Penicilina', 5.0, 60),
('Ácido fólico', 3.0, 80),
('Vitamina C', 2.2, 100),
('Vitamina D', 3.5, 70),
('Calcio', 4.0, 65),
('Magnesio', 4.5, 60),
('Hierro', 3.8, 75),
('Melatonina', 5.5, 40),
('Diazepam', 6.0, 30),
('Clonazepam', 6.5, 25),
('Alprazolam', 7.0, 20),
('Sertralina', 8.0, 35),
('Fluoxetina', 7.5, 40),
('Escitalopram', 9.0, 30),
('Tramadol', 6.5, 50),
('Morfina', 15.0, 10),
('Codeína', 7.0, 25),
('Ketorolaco', 5.0, 60),
('Bromuro de ipratropio', 6.5, 40),
('Ambroxol', 4.5, 55),
('Jarabe para la tos', 7.5, 50),
('Antigripal', 6.0, 70),
('Alcohol', 3.0, 120),
('Agua oxigenada', 2.5, 110),
('Yodo', 2.8, 90),
('Gasas', 1.5, 200),
('Vendas', 2.0, 180),
('Termómetro', 10.0, 25),
('Tensiómetro', 30.0, 15),
('Glucómetro', 25.0, 20),
('Tiras reactivas', 12.0, 40),
('Suero oral', 3.0, 90),
('Electrolitos', 3.5, 85),
('Bicarbonato', 2.0, 100),
('Lidocaína', 6.0, 45),
('Clotrimazol', 4.5, 50),
('Ketoconazol', 5.5, 40),
('Fluconazol', 6.5, 35),
('Nistatina', 5.0, 45),
('Acyclovir', 7.0, 30),
('Valaciclovir', 8.5, 25),
('Oseltamivir', 12.0, 20),
('Vacuna gripe', 20.0, 15),
('Vacuna covid', 25.0, 10),
('Insulina rápida', 30.0, 15),
('Insulina lenta', 32.0, 12),
('Glibenclamida', 4.5, 50),
('Gliclazida', 5.5, 45),
('Furosemida', 4.0, 60),
('Hidroclorotiazida', 3.5, 70),
('Spironolactona', 4.8, 55),
('Digoxina', 6.0, 30),
('Warfarina', 5.5, 35),
('Heparina', 15.0, 20),
('Ácido acetilsalicílico', 2.0, 100),
('Metoclopramida', 4.5, 60),
('Domperidona', 5.0, 55),
('Ondansetrón', 7.5, 40),
('Loperamida', 3.0, 80),
('Sales de rehidratación', 2.5, 90),
('Carbón activado', 3.5, 70),
('Multivitamínico', 6.0, 50),
('Omega 3', 8.0, 40),
('Protector solar', 12.0, 30),
('Crema hidratante', 6.5, 45),
('Gel antibacterial', 3.0, 100),
('Mascarillas', 1.0, 200),
('Guantes', 2.0, 150),
('Jeringas', 1.5, 180),
('Lancetas', 1.2, 160),
('Suplemento zinc', 4.0, 60),
('Colágeno', 7.0, 35);




DECLARE @v INT = 1;
DECLARE @fecha DATETIME;
DECLARE @idCliente INT;
DECLARE @prod1 INT, @prod2 INT, @prod3 INT;
DECLARE @cant1 INT, @cant2 INT, @cant3 INT;
DECLARE @precio1 DECIMAL(10,2), @precio2 DECIMAL(10,2), @precio3 DECIMAL(10,2);

WHILE @v <= 60
BEGIN
    SET @fecha = DATEADD(DAY, -(@v * 90 / 60), GETDATE());
    SET @idCliente = (@v % 50) + 1;

    SET @prod1 = (@v % 98) + 1;
    SET @prod2 = ((@v + 13) % 98) + 1;
    SET @prod3 = ((@v + 27) % 98) + 1;

    SET @cant1 = (@v % 5) + 1;
    SET @cant2 = ((@v + 2) % 4) + 1;
    SET @cant3 = ((@v + 4) % 3) + 1;

    SELECT @precio1 = Precio FROM Producto WHERE IdProducto = @prod1;
    SELECT @precio2 = Precio FROM Producto WHERE IdProducto = @prod2;
    SELECT @precio3 = Precio FROM Producto WHERE IdProducto = @prod3;

    SET @precio1 = ISNULL(@precio1, 2.50);
    SET @precio2 = ISNULL(@precio2, 3.00);
    SET @precio3 = ISNULL(@precio3, 1.80);

    INSERT INTO Venta (Fecha, IdCliente, IdEmpleado)
    VALUES (@fecha, @idCliente, 1);

    INSERT INTO DetalleVenta (IdVenta, IdProducto, Cantidad, Precio)
    VALUES (@v, @prod1, @cant1, @precio1);

    INSERT INTO DetalleVenta (IdVenta, IdProducto, Cantidad, Precio)
    VALUES (@v, @prod2, @cant2, @precio2);

    INSERT INTO DetalleVenta (IdVenta, IdProducto, Cantidad, Precio)
    VALUES (@v, @prod3, @cant3, @precio3);

    SET @v = @v + 1;
END;




select *from Venta
select *from Producto
select *from DetalleVenta
ALTER TABLE Venta DROP COLUMN DNI;
ALTER TABLE Venta ADD DNI VARCHAR(8);

DROP TABLE DetalleVenta;


DROP TABLE DetalleCompra;


DROP TABLE Venta;


DROP TABLE Compra;


DROP TABLE Cliente;
DROP TABLE Empleado;
DROP TABLE Producto;
DROP TABLE Proveedor;




select *from DetalleCompra
select *from Compra

INSERT INTO Compra (Fecha, IdProveedor) VALUES ('2025-01-10', 1);
INSERT INTO DetalleCompra (IdCompra, IdProducto, Cantidad, Precio) VALUES
(1, 1,  200, 1.50),
(1, 2,  150, 1.80),
(1, 3,  100, 3.30),
(1, 4,  200, 1.08),
(1, 7,  100, 3.60);


INSERT INTO Compra (Fecha, IdProveedor) VALUES ('2025-02-15', 2);
INSERT INTO DetalleCompra (IdCompra, IdProducto, Cantidad, Precio) VALUES
(2, 19,  50, 15.00),
(2, 22,  80,  4.80),
(2, 23,  70,  4.50),
(2, 32,  60,  3.30),
(2, 33,  50,  3.60);


INSERT INTO Compra (Fecha, IdProveedor) VALUES ('2025-03-20', 3);
INSERT INTO DetalleCompra (IdCompra, IdProducto, Cantidad, Precio) VALUES
(3, 47, 200, 1.80),
(3, 48, 180, 1.50),
(3, 50, 300, 0.90),
(3, 51, 250, 1.20),
(3, 52,  30, 6.00);


INSERT INTO Compra (Fecha, IdProveedor) VALUES ('2025-04-05', 1);
INSERT INTO DetalleCompra (IdCompra, IdProducto, Cantidad, Precio) VALUES
(4, 11, 100, 3.00),
(4, 12, 100, 2.52),
(4, 13,  80, 3.90),
(4, 14,  60, 4.20),
(4, 16,  80, 3.30);


INSERT INTO Compra (Fecha, IdProveedor) VALUES ('2025-05-18', 2);
INSERT INTO DetalleCompra (IdCompra, IdProducto, Cantidad, Precio) VALUES
(5, 27, 150, 1.32),
(5, 28, 100, 2.10),
(5, 29, 100, 2.40),
(5, 31, 100, 2.28),
(5, 36,  80, 4.80);

UPDATE Cliente
SET Telefono = '9' + RIGHT('00000000' + CAST(
    ABS(CHECKSUM(NEWID())) % 100000000
AS VARCHAR), 8)
WHERE Telefono IS NULL OR Telefono = '';

UPDATE DetalleVenta
SET Total = Cantidad * Precio;


UPDATE DetalleCompra
SET Total = Cantidad * Precio;