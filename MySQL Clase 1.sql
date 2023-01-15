/* DDL: Data Definition Language
	creacion / eliminacion / modificacion
    db / tablas / usuarios
*/
# Creacion de la base de datos
DROP DATABASE if exists hospital_business; -- eliminamos si existe
CREATE DATABASE hospital_business; -- creamos la db
USE hospital_business; -- seleccionamos la db

# Definicion de Tablas
/* Usuarios => turnos => Profesional
	Personal => turno/guardia
			 => especialidad
    Usuarios => turno/guardia
			 => datos => historia
             => Insumos => ventas
*/
DROP TABLES IF EXISTS users;
create TABLE users(
	id INT AUTO_INCREMENT, -- numero automatico
    username VARCHAR (20), -- cadena de texto
	userpass VARCHAR (20), -- 20 caracteres maximo
    employee boolean, -- verdadero o falso
    # Restricciones
    Primary Key(id), -- campo relacional (clave principal)
    UNIQUE KEY(username) -- campo único (local)
);
# modificacion de estructura
ALTER TABLE users
MODIFY employee BOOLEAN default false, -- modificamos el campo employee (OR "MODIFY employee INT default 0")
ADD COLUMN created datetime default current_timestamp; -- agregamos un campo (al final)
# descripción de la estructura
DESCRIBE users;


/* DML: Data Manipulation Language
	insertar / eliminar / actualizar / consultar
    registros (filas)
*/
# Carga selectiva de datos
INSERT INTO users(username, userpass)
VALUES ('cristian', 'root');
INSERT INTO users(username, employee, userpass)
VALUES ('josue', true,'12345');

# Carga Multiple
INSERT INTO users(username, userpass)
VALUES ('Maria','pass'),
       ('Ramiro','user'),
	   ('Deysi','access'),
       ('c651651','vwqt'),
       ('admin','qwd151');

# consulta genereal de datos
SELECT * FROM users;

# reinicio de tabla (eliminar registros)
TRUNCATE users; -- vuelve el contador a 0

