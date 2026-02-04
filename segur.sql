-- phpMyAdmin SQL Dump
-- version 5.2.2deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-02-2026 a las 03:31:43
-- Versión del servidor: 8.4.8-0ubuntu0.25.10.1
-- Versión de PHP: 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `segur`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `records`
--

CREATE TABLE `records` (
  `id` int NOT NULL,
  `mode` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_user` int NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `records`
--

INSERT INTO `records` (`id`, `mode`, `id_user`, `added`) VALUES
(1, 'E', 1, '2026-02-01 23:38:14'),
(2, 'S', 1, '2026-02-01 23:46:35'),
(5, 'E', 10, '2026-02-03 00:53:17'),
(6, 'E', 15, '2026-02-03 00:55:14'),
(7, 'S', 10, '2026-02-03 00:55:42'),
(8, 'E', 10, '2026-02-03 00:56:05'),
(9, 'E', 1, '2026-02-03 02:14:57'),
(10, 'S', 1, '2026-02-03 02:15:03'),
(11, 'S', 10, '2026-02-03 02:38:39'),
(12, 'E', 14, '2026-02-03 02:43:59'),
(13, 'S', 14, '2026-02-03 02:57:15'),
(14, 'E', 10, '2026-02-03 19:47:03'),
(15, 'E', 40, '2026-02-03 19:47:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `rol` varchar(255) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`, `added`) VALUES
(1, 'Senadores', '2026-02-01 23:25:11'),
(2, 'Diputados', '2026-02-01 23:25:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `id_rol` tinyint(1) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `office` tinyint(1) NOT NULL DEFAULT '0',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `file`, `last_name`, `first_name`, `mail`, `pass`, `id_rol`, `state`, `office`, `added`) VALUES
(1, 'almiron.jpg', 'Almirón', 'Ana Claudia', NULL, NULL, 2, 0, 1, '2026-02-01 23:58:53'),
(2, 'amendola.jpg', 'Améndola', 'Ana G.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(3, 'aparicio.jpg', 'Aparicio', 'María Sara', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(4, 'ascua.jpg', 'Ascua', 'Celeste', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(5, 'ast.jpg', 'Ast', 'Norberto', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(6, 'benitez.jpg', 'Benítez', 'Edgar V.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(7, 'benitez_hugo.jpg', 'Benítez', 'Hugo D.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(8, 'brambilla.jpg', 'Brambilla', 'Sofia', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(9, 'branz.jpg', 'Branz', 'Mario J.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(10, 'breard.jpg', 'Breard', 'Noel Eugenio', NULL, NULL, 1, 1, 1, '2026-02-01 23:58:53'),
(11, 'calvano.jpg', 'Calvano', 'Hugo R.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(12, 'canteros.jpg', 'Canteros', 'Gustavo J. A.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(13, 'carballo.jpg', 'Carballo', 'María Carlota', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(14, 'cassani.jpg', 'Cassani', 'Pedro G.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(15, 'colombi.jpg', 'Colombi', 'Ricardo', NULL, NULL, 1, 1, 0, '2026-02-01 23:58:53'),
(16, 'fernandez_recalde.jpg', 'Fernández R.', 'Emiliano', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(17, 'fick.jpg', 'Fick', 'Henry Jorge', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(18, 'flinta.jpg', 'Flinta', 'Sergio', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(19, 'galarza.jpg', 'Galarza', 'Silvia Patricia', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(20, 'gauna.jpg', 'Gauna', 'Ana Ma. Marlene', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(21, 'giotta.jpg', 'Giotta', 'Andrea María', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(22, 'gortari.jpg', 'Gortari', 'María Cecilia', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(23, 'hardoy.jpg', 'Hardoy', 'Eduardo D.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(24, 'lazzarof.jpg', 'Lazaroff P.', 'Lorena Ma. A.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(25, 'leconte.jpg', 'Leconte', 'Ricardo G.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(26, 'lertora.jpg', 'Lértora', 'Lucrecia', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(27, 'lezcano.jpg', 'Lezcano', 'Cesar Daniel', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(28, 'vernengo.jpg', 'Méndez Vernengo', 'Jesús R.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(29, 'naya.jpg', 'Naya', 'Román', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(30, 'nazer.jpg', 'Nazer', 'Eliana G.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(31, 'ojeda.jpg', 'Ojeda', 'Juan de la Cruz', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(32, 'osella.jpg', 'Osella', 'Francisco Ignacio', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(33, 'pavon.jpg', 'Pavón', 'Valeria L.', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(34, 'pellegrini.jpg', 'Pellegrini', 'Diego', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(35, 'pereyra.jpg', 'Pereyra', 'Lucia', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(36, 'quintana.jpg', 'Quintana', 'Sonia', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(37, 'romero.jpg', 'Romero', 'Jessica Natalia', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(38, 'rotela.jpg', 'Rotela Cañete', 'Albana', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(39, 'ruiz.jpg', 'Ruiz Aragón', 'José Arnaldo', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(40, 'tassano.jpg', 'Tassano', 'Eduardo A.', NULL, NULL, 2, 1, 1, '2026-02-01 23:58:53'),
(41, 'valdes.jpg', 'Valdés', 'Gustavo Adolfo', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(42, 'vallejos.jpg', 'Vallejos', 'Víctor Hugo', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(43, 'vassel.jpg', 'Vassel', 'José Lisandro', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(44, 'vaztorres.jpg', 'Vaz Torrez', 'Enrique', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53'),
(45, 'vidal.jpg', 'Vidal Domínguez', 'Adriana', NULL, NULL, 2, 0, 0, '2026-02-01 23:58:53'),
(48, 'braillard.jpg', 'Braillard Poccard', 'Pedro', NULL, NULL, 1, 0, 0, '2026-02-01 23:58:53');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`id_user`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `records`
--
ALTER TABLE `records`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `records`
--
ALTER TABLE `records`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
