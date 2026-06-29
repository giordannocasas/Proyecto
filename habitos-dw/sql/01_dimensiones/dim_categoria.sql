CREATE TABLE Dim_Categoria (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL
);

INSERT INTO Dim_Categoria (id_categoria, nombre_categoria) VALUES
(1, 'Salud'),
(2, 'Estudio'),
(3, 'Trabajo'),
(4, 'Ejercicio'),
(5, 'Lectura'),
(6, 'Finanzas'),
(7, 'Social'),
(8, 'Hobbies'),
(9, 'Productividad'),
(10, 'Otros');