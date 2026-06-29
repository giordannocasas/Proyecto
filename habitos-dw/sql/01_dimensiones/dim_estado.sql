CREATE TABLE Dim_Estado (
    id_estado INT NOT NULL PRIMARY KEY,
    nombre_estado VARCHAR(50) NULL,
    es_completado BIT NULL
);

INSERT INTO Dim_Estado (id_estado, nombre_estado, es_completado) VALUES
(1, 'Iniciado', 0),
(2, 'En Progreso', 0),
(3, 'Completado', 1);
