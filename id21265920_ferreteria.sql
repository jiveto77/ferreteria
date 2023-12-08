-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-11-2023 a las 23:53:05
-- Versión del servidor: 10.5.20-MariaDB
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id21265920_ferreteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha_empaque` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `lote_produccion` varchar(50) NOT NULL,
  `ingredientes` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` enum('activo','de_baja') NOT NULL DEFAULT 'activo',
  `fecha_baja` date DEFAULT NULL,
  `usuario_baja` int(11) DEFAULT NULL,
  `razon_baja` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `codigo`, `nombre`, `fecha_empaque`, `fecha_vencimiento`, `lote_produccion`, `ingredientes`, `precio`, `stock`, `estado`, `fecha_baja`, `usuario_baja`, `razon_baja`) VALUES
(1, 'F001', 'Martillo', '2023-01-01', '2025-01-01', 'L123', 'Acero inoxidable', 15.99, 50, 'activo', NULL, NULL, NULL),
(2, 'F002', 'Destornillador', '2023-01-02', '2025-01-01', 'M456', 'Mango de plástico', 8.50, 100, 'activo', NULL, NULL, NULL),
(3, 'F003', 'Clavos', '2023-01-03', '2025-01-01', 'P789', 'Hierro galvanizado', 1.25, 500, 'activo', NULL, NULL, NULL),
(4, 'F004', 'Sierra eléctrica', '2023-01-04', '2025-01-01', 'A012', 'Potencia de 1200W', 89.99, 20, 'activo', NULL, NULL, NULL),
(5, 'F005', 'Cinta métrica', '2023-01-05', '2025-01-01', 'W345', 'Longitud de 5 metros', 6.75, 80, 'activo', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo_electronico` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `cedula`, `direccion`, `telefono`, `correo_electronico`) VALUES
(1, 'Ana López', '1234567890', 'Calle 1, Ciudad A', '555-1234', 'ana@email.com'),
(2, 'Carlos Pérez', '2345678901', 'Avenida 2, Ciudad B', '555-5678', 'carlos@email.com'),
(3, 'Elena Ramírez', '3456789012', 'Calle 3, Ciudad C', '555-8765', 'elena@email.com'),
(4, 'Juan García', '4567890123', 'Avenida 4, Ciudad D', '555-4321', 'juan@email.com'),
(5, 'Laura Rodríguez', '5678901234', 'Calle 5, Ciudad E', '555-7890', 'laura@email.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_venta`
--

CREATE TABLE `detalles_venta` (
  `id` int(11) NOT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `articulo_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `total_linea` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `detalles_venta`
--

INSERT INTO `detalles_venta` (`id`, `venta_id`, `articulo_id`, `cantidad`, `precio_unitario`, `total_linea`) VALUES
(1, 5, 1, 3, 10.00, 30.00),
(2, 5, 2, 2, 8.00, 16.00),
(3, 6, 3, 5, 15.00, 75.00),
(4, 6, 4, 1, 25.00, 25.00),
(5, 7, 1, 2, 10.00, 20.00),
(6, 7, 5, 3, 5.00, 15.00),
(7, 8, 2, 4, 8.00, 32.00),
(8, 8, 3, 1, 15.00, 15.00),
(9, 9, 4, 2, 25.00, 50.00),
(10, 9, 5, 1, 5.00, 5.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_articulo`
--

CREATE TABLE `imagenes_articulo` (
  `id` int(11) NOT NULL,
  `articulo_id` int(11) DEFAULT NULL,
  `ruta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `imagenes_articulo`
--

INSERT INTO `imagenes_articulo` (`id`, `articulo_id`, `ruta`) VALUES
(1, 1, 'imagen1.jpg'),
(2, 2, 'imagen2.jpg'),
(3, 3, 'imagen3.jpg'),
(4, 4, 'imagen4.jpg'),
(5, 5, 'imagen5.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `contrasena`, `rol_id`) VALUES
(1, 'admin', 'contrasena_admin', 1),
(2, 'cliente1', 'contrasena_cliente', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha_venta` date NOT NULL,
  `total_venta` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `cliente_id`, `fecha_venta`, `total_venta`) VALUES
(5, 1, '2023-01-01', 75.00),
(6, 2, '2023-02-01', 120.00),
(7, 3, '2023-03-01', 45.00),
(8, 4, '2023-04-01', 90.00),
(9, 5, '2023-05-01', 60.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estado_indice` (`estado`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_venta`
--
ALTER TABLE `detalles_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_id` (`venta_id`),
  ADD KEY `articulo_id` (`articulo_id`);

--
-- Indices de la tabla `imagenes_articulo`
--
ALTER TABLE `imagenes_articulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articulo_id` (`articulo_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `detalles_venta`
--
ALTER TABLE `detalles_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `imagenes_articulo`
--
ALTER TABLE `imagenes_articulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_venta`
--
ALTER TABLE `detalles_venta`
  ADD CONSTRAINT `detalles_venta_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`),
  ADD CONSTRAINT `detalles_venta_ibfk_2` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`);

--
-- Filtros para la tabla `imagenes_articulo`
--
ALTER TABLE `imagenes_articulo`
  ADD CONSTRAINT `imagenes_articulo_ibfk_1` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
