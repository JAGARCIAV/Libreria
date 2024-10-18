-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2024 a las 23:57:33
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `libreria` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `libreria`;

-- --------------------------------------------------------
-- Estructura de tabla para la tabla `categorias`
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `url_imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `categorias`
INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `url_imagen`) VALUES
(1, 'Libros de Referencia', 'Enciclopedias y diccionarios', 'https://static.vecteezy.com/system/resources/previews/007/460/508/non_2x/set-of-colorful-school-supplies-books-and-notebooks-stationery-accessories-photo.jpg');

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `links`
CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `links`
INSERT INTO `links` (`id`, `title`, `url`, `description`, `user_id`, `created_at`) VALUES
(1, 'Free template', 'https://themewagon.com/theme-price/free/', 'Pagina Para Templates de html y css que te ayuda a mejorar tu pagina web y no pierdes tiempo', 4, '2024-10-16 13:14:52');

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `productos`
CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `url_imagen` varchar(255) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `productos`
INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `url_imagen`, `categoria_id`) VALUES
(1, 'Enciclopedia Escolar', 'Enciclopedia general para estudiantes', 35.99, 5, 'https://example.com/enciclopedia.jpg', 1),
(2, 'Carpeta', 'Carpeta color morado 1000 hojas', 30.00, 80, 'img.png', 1);

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `sessions`
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `sessions`
INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('H9cc2YW82dosEk8tpTXFTEp-MGbDIUu2', 1729202158, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":5},\"flash\":{}}');

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `users`
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `users`
INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `created_at`) VALUES
(1, 'Luis', 'luis@gmail.com', 'luis123', '2024-10-15 20:49:30'),
(2, 'Jose David', 'david@gmail.com', 'david123', '2024-10-15 20:51:01'),
(3, 'Jose David', 'prueba3@gmail.com', '$2a$10$AR1hmpFFM8z.3Y84SjKSzexvTdG0/iBvrw.SAPnu/OC54p8WDyFJW', '2024-10-16 10:30:52'),
(4, 'Jhon Dade', 'jhon@gmail.com', '$2a$10$FVn.xF3pRYXS5jYZ1e6.M.42CxuvJ7CzisN1SuWreu1I9N7iD.hae', '2024-10-16 14:48:18');

-- --------------------------------------------------------

-- Índices para tablas volcadas

-- Índices de la tabla `categorias`
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

-- Índices de la tabla `links`
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

-- Índices de la tabla `productos`
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

-- Índices de la tabla `sessions`
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

-- Índices de la tabla `users`
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

-- AUTO_INCREMENT de las tablas volcadas

-- AUTO_INCREMENT de la tabla `categorias`
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- AUTO_INCREMENT de la tabla `links`
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-- AUTO_INCREMENT de la tabla `productos`
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

-- AUTO_INCREMENT de la tabla `users`
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- Restricciones para tablas volcadas

-- Filtros para la tabla `links`
ALTER TABLE `links`
  ADD CONSTRAINT `links_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

-- Filtros para la tabla `productos`
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
