CREATE TABLE Dim_Habito (
    id_habito INT NOT NULL PRIMARY KEY,
    id_categoria INT NULL,
    nombre_habito VARCHAR(100) NULL,
    FOREIGN KEY (id_categoria) REFERENCES Dim_Categoria(id_categoria)
);

INSERT INTO Dim_Habito (id_habito, id_categoria, nombre_habito) VALUES
(1, 2, 'Practicar programacion'),
(2, 4, 'Hacer ejercicio'),
(3, 5, 'Leer libro'),
(4, 1, 'Meditar'),
(5, 5, 'Organizar trabajo'),
(6, 2, 'Ver series educativas');
