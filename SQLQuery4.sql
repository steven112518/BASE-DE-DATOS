



UPDATE Cliente
SET Telefono = '9' + RIGHT('00000000' + CAST(
    ABS(CHECKSUM(NEWID())) % 100000000
AS VARCHAR), 8)
WHERE Telefono IS NULL OR Telefono = '';

