CREATE TABLE Dim_Estado (
    id_estado INT PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL,
    es_completado BIT NOT NULL
);

INSERT INTO Dim_Estado (id_estado, nombre_estado, es_completado) VALUES
(1, 'Iniciado', 0),
(2, 'En Progreso', 0),
(3, 'Completado', 1);