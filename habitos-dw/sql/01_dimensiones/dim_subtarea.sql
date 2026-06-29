CREATE TABLE Dim_Subtarea (
    id_subtarea INT NOT NULL PRIMARY KEY,
    id_tarea INT NULL,
    nombre_subtarea VARCHAR(100) NULL,
    estimacion_minutos INT NULL,
    FOREIGN KEY (id_tarea) REFERENCES Dim_Tarea(id_tarea)
);
