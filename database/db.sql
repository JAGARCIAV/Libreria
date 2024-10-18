CREATE DATABASE IF NOT EXISTS Libreria;

USE Libreria;

-- TABLE USER
-- all pasword wil be encrypted using SHA2
CREATE TABLE users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  fullname VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(60) NOT NULL, -- La contraseña será cifrada
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) AUTO_INCREMENT=2;

-- Insertar un usuario de ejemplo
INSERT INTO users (email, password, fullname) 
VALUES ('john@gmail.com', SHA2('password123', 256), 'John Carter');

-- Crear tabla categorias
CREATE TABLE categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,   -- Identificador único de la categoría
  nombre VARCHAR(100) NOT NULL,        -- Nombre de la categoría
  descripcion TEXT,                    -- Descripción de la categoría
  url_imagen VARCHAR(255)              -- URL de la imagen asociada a la categoría
);

-- Insertar algunas categorías de ejemplo
INSERT INTO categorias (nombre, descripcion, url_imagen)
VALUES 
('Libros de Texto', 'Libros utilizados en el aula', 'https://example.com/libros_texto.jpg'),
('Libros de Lectura', 'Libros recomendados para la lectura en casa', 'https://example.com/libros_lectura.jpg'),
('Material Escolar', 'Artículos como cuadernos, lápices, etc.', 'https://example.com/material_escolar.jpg'),
('Libros de Referencia', 'Enciclopedias y diccionarios', 'https://example.com/libros_referencia.jpg');

-- Crear tabla productos
CREATE TABLE productos (
  id INT AUTO_INCREMENT PRIMARY KEY,   -- Identificador único del producto
  nombre VARCHAR(100) NOT NULL,        -- Nombre del producto
  descripcion TEXT,                    -- Descripción del producto
  precio DECIMAL(10,2) NOT NULL,       -- Precio del producto
  cantidad INT NOT NULL,               -- Cantidad disponible en stock
  url_imagen VARCHAR(255),             -- URL de la imagen asociada al producto
  categoria_id INT,                    -- Relación con la tabla de categorías
  FOREIGN KEY (categoria_id) REFERENCES categorias(id)  -- Clave foránea a la tabla de categorías
);

-- Insertar algunos productos de ejemplo asegurando que los categoria_id existen
INSERT INTO productos (nombre, descripcion, precio, cantidad, url_imagen, categoria_id)
VALUES 
('Matemáticas 1', 'Libro de texto de matemáticas para primer grado', 25.00, 15, 'https://example.com/matematicas1.jpg', 1),
('Cuentos de la Selva', 'Colección de cuentos para lectura infantil', 15.50, 10, 'https://example.com/cuentos_selva.jpg', 2),
('Cuaderno Universitario', 'Cuaderno universitario de 100 hojas', 3.00, 50, 'https://example.com/cuaderno_universitario.jpg', 3),
('Enciclopedia Escolar', 'Enciclopedia general para estudiantes', 35.99, 5, 'https://example.com/enciclopedia.jpg', 4),
('Geografía del Mundo', 'Libro de texto sobre geografía', 30.00, 20, 'https://example.com/geografia.jpg', 1),
('Lápices de Colores', 'Paquete de lápices de colores', 5.99, 100, 'https://example.com/lapices.jpg', 3);
-- LINKS TABLE
CREATE TABLE links (
  id INT(11) NOT NULL,
  title VARCHAR(150) NOT NULL,
  url VARCHAR(255) NOT NULL,
  description TEXT,
  user_id INT(11),
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id)
);

ALTER TABLE links
  ADD PRIMARY KEY (id);

ALTER TABLE links
  MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;

DESCRIBE links;