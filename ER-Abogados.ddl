-- Generado por Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   en:        2022-08-29 20:44:55 CST
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE Abogados 
    (
     Id_abogado INTEGER NOT NULL , 
     Persona_Id_persona INTEGER NOT NULL , 
     No_colegiado VARCHAR (40) NOT NULL 
    )
GO

ALTER TABLE Abogados ADD CONSTRAINT Abogados_PK PRIMARY KEY CLUSTERED (Id_abogado)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Acta 
    (
     Id_acta INTEGER NOT NULL , 
     Caso_Id_caso INTEGER , 
     Fecha DATE NOT NULL , 
     Descripcion VARCHAR (500) NOT NULL , 
     Hechos IMAGE NOT NULL 
    )
GO

ALTER TABLE Acta ADD CONSTRAINT Acta_PK PRIMARY KEY CLUSTERED (Id_acta)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Caso 
    (
     Id_caso INTEGER NOT NULL , 
     Persona_Id_persona INTEGER , 
     Descripcion VARCHAR (200) NOT NULL , 
     Fecha_inicio DATE , 
     Fecha_fin DATE , 
     Nombre_Juez VARCHAR (200) , 
     Tipo_caso_Id_tCaso INTEGER NOT NULL , 
     Persona_Id_persona1 INTEGER , 
     Estado_Id_estado INTEGER NOT NULL 
    )
GO

ALTER TABLE Caso ADD CONSTRAINT Caso_PK PRIMARY KEY CLUSTERED (Id_caso)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Estado 
    (
     Id_estado INTEGER NOT NULL , 
     Estado VARCHAR (20) NOT NULL , 
     Conclusion VARCHAR (50) , 
     Medida VARCHAR (500) 
    )
GO

ALTER TABLE Estado ADD CONSTRAINT Estado_PK PRIMARY KEY CLUSTERED (Id_estado)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Persona 
    (
     Id_persona INTEGER NOT NULL , 
     Nombres VARCHAR (75) NOT NULL , 
     Apellidos VARCHAR (75) NOT NULL , 
     DPI INTEGER NOT NULL , 
     Direccion VARCHAR (150) NOT NULL , 
     Tipo_persona_Id_tipoPersona INTEGER NOT NULL 
    )
GO

ALTER TABLE Persona ADD CONSTRAINT Persona_PK PRIMARY KEY CLUSTERED (Id_persona)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Pruebas 
    (
     Id_prueba INTEGER NOT NULL , 
     Prueba IMAGE NOT NULL , 
     Estado VARCHAR (20) NOT NULL , 
     Caso_Id_caso INTEGER 
    )
GO

ALTER TABLE Pruebas ADD CONSTRAINT Pruebas_PK PRIMARY KEY CLUSTERED (Id_prueba)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Testigo 
    (
     Id_testigo INTEGER NOT NULL , 
     Persona_Id_persona1 INTEGER , 
     Relacion VARCHAR (150) NOT NULL , 
     Persona_Id_persona INTEGER 
    )
GO

ALTER TABLE Testigo ADD CONSTRAINT Testigo_PK PRIMARY KEY CLUSTERED (Id_testigo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Tipo_caso 
    (
     Id_tCaso INTEGER NOT NULL , 
     Tipo_caso VARCHAR (50) NOT NULL 
    )
GO

ALTER TABLE Tipo_caso ADD CONSTRAINT Tipo_caso_PK PRIMARY KEY CLUSTERED (Id_tCaso)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Tipo_persona 
    (
     Id_tipoPersona INTEGER NOT NULL , 
     Tipo_persona VARCHAR (50) NOT NULL 
    )
GO

ALTER TABLE Tipo_persona ADD CONSTRAINT Tipo_persona_PK PRIMARY KEY CLUSTERED (Id_tipoPersona)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Tipo_usuario 
    (
     Id_tipoUsuario INTEGER NOT NULL , 
     Tipo VARCHAR 
    )
GO

ALTER TABLE Tipo_usuario ADD CONSTRAINT Tipo_usuario_PK PRIMARY KEY CLUSTERED (Id_tipoUsuario)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Usuario 
    (
     Id_usuario INTEGER NOT NULL , 
     Tipo_usuario_Id_tipoUsuario INTEGER NOT NULL , 
     Persona_Id_persona INTEGER NOT NULL , 
     Correo VARCHAR (150) NOT NULL , 
     Contraseña VARCHAR (150) NOT NULL 
    )
GO

ALTER TABLE Usuario ADD CONSTRAINT Usuario_PK PRIMARY KEY CLUSTERED (Id_usuario)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Abogados 
    ADD CONSTRAINT Abogados_Persona_FK FOREIGN KEY 
    ( 
     Persona_Id_persona
    ) 
    REFERENCES Persona 
    ( 
     Id_persona 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Acta 
    ADD CONSTRAINT Acta_Caso_FK FOREIGN KEY 
    ( 
     Caso_Id_caso
    ) 
    REFERENCES Caso 
    ( 
     Id_caso 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Caso 
    ADD CONSTRAINT Caso_Estado_FK FOREIGN KEY 
    ( 
     Estado_Id_estado
    ) 
    REFERENCES Estado 
    ( 
     Id_estado 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Caso 
    ADD CONSTRAINT Caso_Persona_FK FOREIGN KEY 
    ( 
     Persona_Id_persona
    ) 
    REFERENCES Persona 
    ( 
     Id_persona 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Caso 
    ADD CONSTRAINT Caso_Persona_FKv1 FOREIGN KEY 
    ( 
     Persona_Id_persona1
    ) 
    REFERENCES Persona 
    ( 
     Id_persona 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Caso 
    ADD CONSTRAINT Caso_Tipo_caso_FK FOREIGN KEY 
    ( 
     Tipo_caso_Id_tCaso
    ) 
    REFERENCES Tipo_caso 
    ( 
     Id_tCaso 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Persona 
    ADD CONSTRAINT Persona_Tipo_persona_FK FOREIGN KEY 
    ( 
     Tipo_persona_Id_tipoPersona
    ) 
    REFERENCES Tipo_persona 
    ( 
     Id_tipoPersona 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Pruebas 
    ADD CONSTRAINT Pruebas_Caso_FK FOREIGN KEY 
    ( 
     Caso_Id_caso
    ) 
    REFERENCES Caso 
    ( 
     Id_caso 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Testigo 
    ADD CONSTRAINT Testigo_Persona_FK FOREIGN KEY 
    ( 
     Persona_Id_persona
    ) 
    REFERENCES Persona 
    ( 
     Id_persona 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Testigo 
    ADD CONSTRAINT Testigo_Persona_FKv1 FOREIGN KEY 
    ( 
     Persona_Id_persona1
    ) 
    REFERENCES Persona 
    ( 
     Id_persona 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Usuario 
    ADD CONSTRAINT Usuario_Persona_FK FOREIGN KEY 
    ( 
     Persona_Id_persona
    ) 
    REFERENCES Persona 
    ( 
     Id_persona 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Usuario 
    ADD CONSTRAINT Usuario_Tipo_usuario_FK FOREIGN KEY 
    ( 
     Tipo_usuario_Id_tipoUsuario
    ) 
    REFERENCES Tipo_usuario 
    ( 
     Id_tipoUsuario 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             23
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
