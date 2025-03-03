-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-03-2025 a las 19:42:56
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `super`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(1, 'Lácteos'),
(2, 'Carnes'),
(3, 'Bebidas'),
(4, 'Panadería'),
(5, 'Frutas y Verduras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellido`, `correo`, `telefono`, `direccion`) VALUES
(1, 'Juan', 'Pérez', 'juan.perez@email.com', '123456789', 'Calle 1 #123'),
(2, 'María', 'Gómez', 'maria.gomez@email.com', '987654321', 'Calle 2 #456'),
(3, 'Carlos', 'López', 'carlos.lopez@email.com', '456123789', 'Calle 3 #789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id_detalle` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id_detalle`, `id_venta`, `id_producto`, `cantidad`, `subtotal`) VALUES
(1, 1, 1, 2, 3.00),
(2, 1, 5, 1, 2.25),
(3, 2, 3, 1, 8.99),
(4, 2, 7, 3, 9.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `salario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `apellido`, `cargo`, `salario`) VALUES
(1, 'Ana', 'Martínez', 'Cajera', 1200.00),
(2, 'Luis', 'Ramírez', 'Gerente', 2500.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `id_categoria`) VALUES
(1, 'Leche Entera', 'Leche entera 1L', 1.50, 50, 1),
(2, 'Queso Mozzarella', 'Queso mozzarella 500g', 4.75, 30, 1),
(3, 'Carne de Res', 'Carne de res 1kg', 8.99, 20, 2),
(4, 'Pollo Entero', 'Pollo entero 2kg', 7.50, 15, 2),
(5, 'Coca-Cola', 'Botella de Coca-Cola 2L', 2.25, 40, 3),
(6, 'Pan Baguette', 'Baguette fresco', 1.20, 25, 4),
(7, 'Manzana Roja', 'Manzana roja por kg', 3.00, 35, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_cliente`, `id_empleado`, `fecha`, `total`) VALUES
(1, 1, 1, '2025-03-03 18:42:24', 10.25),
(2, 2, 2, '2025-03-03 18:42:24', 18.50);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_clientes_top_completo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_clientes_top_completo` (
`id_cliente` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`total_gastado` decimal(32,2)
,`total_compras` bigint(21)
,`productos_comprados` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_detalle_venta_completo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_detalle_venta_completo` (
`id_venta` int(11)
,`producto` varchar(100)
,`cantidad` int(11)
,`subtotal` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_historial_compras_detallado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_historial_compras_detallado` (
`id_venta` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`fecha` timestamp
,`total` decimal(10,2)
,`productos_comprados` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_categorias_ventas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_categorias_ventas` (
`id_producto` int(11)
,`producto` varchar(100)
,`descripcion` text
,`precio` decimal(10,2)
,`stock` int(11)
,`categoria` varchar(100)
,`total_vendido` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_productos_mas_vendidos_completo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_productos_mas_vendidos_completo` (
`id_producto` int(11)
,`nombre` varchar(100)
,`total_vendido` decimal(32,0)
,`ingresos_generados` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_stock_categorias_ventas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_stock_categorias_ventas` (
`categoria` varchar(100)
,`total_stock` decimal(32,0)
,`total_vendido` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ventas_detalles_completos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ventas_detalles_completos` (
`id_venta` int(11)
,`cliente` varchar(100)
,`apellido` varchar(100)
,`empleado` varchar(100)
,`empleado_apellido` varchar(100)
,`fecha` timestamp
,`total` decimal(10,2)
,`producto` varchar(100)
,`cantidad` int(11)
,`subtotal` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ventas_mensuales_detalladas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ventas_mensuales_detalladas` (
`id_venta` int(11)
,`cliente` varchar(100)
,`empleado` varchar(100)
,`fecha` timestamp
,`total` decimal(10,2)
,`productos_vendidos` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ventas_por_cliente_completo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ventas_por_cliente_completo` (
`id_cliente` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`total_comprado` decimal(32,2)
,`cantidad_compras` bigint(21)
,`productos_comprados` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ventas_por_empleado_completo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ventas_por_empleado_completo` (
`id_empleado` int(11)
,`nombre` varchar(100)
,`apellido` varchar(100)
,`total_ventas` bigint(21)
,`monto_total` decimal(32,2)
,`productos_vendidos` mediumtext
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_clientes_top_completo`
--
DROP TABLE IF EXISTS `vista_clientes_top_completo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_clientes_top_completo`  AS SELECT `c`.`id_cliente` AS `id_cliente`, `c`.`nombre` AS `nombre`, `c`.`apellido` AS `apellido`, sum(`v`.`total`) AS `total_gastado`, count(`v`.`id_venta`) AS `total_compras`, group_concat(distinct `p`.`nombre` separator ', ') AS `productos_comprados` FROM (((`ventas` `v` join `clientes` `c` on(`v`.`id_cliente` = `c`.`id_cliente`)) join `detalle_ventas` `dv` on(`v`.`id_venta` = `dv`.`id_venta`)) join `productos` `p` on(`dv`.`id_producto` = `p`.`id_producto`)) GROUP BY `c`.`id_cliente` ORDER BY sum(`v`.`total`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_detalle_venta_completo`
--
DROP TABLE IF EXISTS `vista_detalle_venta_completo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_detalle_venta_completo`  AS SELECT `dv`.`id_venta` AS `id_venta`, `p`.`nombre` AS `producto`, `dv`.`cantidad` AS `cantidad`, `dv`.`subtotal` AS `subtotal` FROM (`detalle_ventas` `dv` join `productos` `p` on(`dv`.`id_producto` = `p`.`id_producto`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_historial_compras_detallado`
--
DROP TABLE IF EXISTS `vista_historial_compras_detallado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_historial_compras_detallado`  AS SELECT `v`.`id_venta` AS `id_venta`, `c`.`nombre` AS `nombre`, `c`.`apellido` AS `apellido`, `v`.`fecha` AS `fecha`, `v`.`total` AS `total`, group_concat(`p`.`nombre` separator ', ') AS `productos_comprados` FROM (((`ventas` `v` join `clientes` `c` on(`v`.`id_cliente` = `c`.`id_cliente`)) join `detalle_ventas` `dv` on(`v`.`id_venta` = `dv`.`id_venta`)) join `productos` `p` on(`dv`.`id_producto` = `p`.`id_producto`)) GROUP BY `v`.`id_venta` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_categorias_ventas`
--
DROP TABLE IF EXISTS `vista_productos_categorias_ventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos_categorias_ventas`  AS SELECT `p`.`id_producto` AS `id_producto`, `p`.`nombre` AS `producto`, `p`.`descripcion` AS `descripcion`, `p`.`precio` AS `precio`, `p`.`stock` AS `stock`, `c`.`nombre` AS `categoria`, sum(`dv`.`cantidad`) AS `total_vendido` FROM ((`productos` `p` join `categorias` `c` on(`p`.`id_categoria` = `c`.`id_categoria`)) left join `detalle_ventas` `dv` on(`p`.`id_producto` = `dv`.`id_producto`)) GROUP BY `p`.`id_producto` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_productos_mas_vendidos_completo`
--
DROP TABLE IF EXISTS `vista_productos_mas_vendidos_completo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_productos_mas_vendidos_completo`  AS SELECT `p`.`id_producto` AS `id_producto`, `p`.`nombre` AS `nombre`, sum(`dv`.`cantidad`) AS `total_vendido`, sum(`dv`.`subtotal`) AS `ingresos_generados` FROM (`detalle_ventas` `dv` join `productos` `p` on(`dv`.`id_producto` = `p`.`id_producto`)) GROUP BY `p`.`id_producto` ORDER BY sum(`dv`.`cantidad`) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_stock_categorias_ventas`
--
DROP TABLE IF EXISTS `vista_stock_categorias_ventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_stock_categorias_ventas`  AS SELECT `c`.`nombre` AS `categoria`, sum(`p`.`stock`) AS `total_stock`, sum(`dv`.`cantidad`) AS `total_vendido` FROM ((`productos` `p` join `categorias` `c` on(`p`.`id_categoria` = `c`.`id_categoria`)) left join `detalle_ventas` `dv` on(`p`.`id_producto` = `dv`.`id_producto`)) GROUP BY `c`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ventas_detalles_completos`
--
DROP TABLE IF EXISTS `vista_ventas_detalles_completos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ventas_detalles_completos`  AS SELECT `v`.`id_venta` AS `id_venta`, `c`.`nombre` AS `cliente`, `c`.`apellido` AS `apellido`, `e`.`nombre` AS `empleado`, `e`.`apellido` AS `empleado_apellido`, `v`.`fecha` AS `fecha`, `v`.`total` AS `total`, `p`.`nombre` AS `producto`, `dv`.`cantidad` AS `cantidad`, `dv`.`subtotal` AS `subtotal` FROM ((((`ventas` `v` join `clientes` `c` on(`v`.`id_cliente` = `c`.`id_cliente`)) join `empleados` `e` on(`v`.`id_empleado` = `e`.`id_empleado`)) join `detalle_ventas` `dv` on(`v`.`id_venta` = `dv`.`id_venta`)) join `productos` `p` on(`dv`.`id_producto` = `p`.`id_producto`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ventas_mensuales_detalladas`
--
DROP TABLE IF EXISTS `vista_ventas_mensuales_detalladas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ventas_mensuales_detalladas`  AS SELECT `v`.`id_venta` AS `id_venta`, `c`.`nombre` AS `cliente`, `e`.`nombre` AS `empleado`, `v`.`fecha` AS `fecha`, `v`.`total` AS `total`, group_concat(`p`.`nombre` separator ', ') AS `productos_vendidos` FROM ((((`ventas` `v` join `clientes` `c` on(`v`.`id_cliente` = `c`.`id_cliente`)) join `empleados` `e` on(`v`.`id_empleado` = `e`.`id_empleado`)) join `detalle_ventas` `dv` on(`v`.`id_venta` = `dv`.`id_venta`)) join `productos` `p` on(`dv`.`id_producto` = `p`.`id_producto`)) WHERE month(`v`.`fecha`) = month(curdate()) AND year(`v`.`fecha`) = year(curdate()) GROUP BY `v`.`id_venta` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ventas_por_cliente_completo`
--
DROP TABLE IF EXISTS `vista_ventas_por_cliente_completo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ventas_por_cliente_completo`  AS SELECT `c`.`id_cliente` AS `id_cliente`, `c`.`nombre` AS `nombre`, `c`.`apellido` AS `apellido`, sum(`v`.`total`) AS `total_comprado`, count(`v`.`id_venta`) AS `cantidad_compras`, group_concat(distinct `p`.`nombre` separator ', ') AS `productos_comprados` FROM (((`ventas` `v` join `clientes` `c` on(`v`.`id_cliente` = `c`.`id_cliente`)) join `detalle_ventas` `dv` on(`v`.`id_venta` = `dv`.`id_venta`)) join `productos` `p` on(`dv`.`id_producto` = `p`.`id_producto`)) GROUP BY `c`.`id_cliente` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ventas_por_empleado_completo`
--
DROP TABLE IF EXISTS `vista_ventas_por_empleado_completo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ventas_por_empleado_completo`  AS SELECT `e`.`id_empleado` AS `id_empleado`, `e`.`nombre` AS `nombre`, `e`.`apellido` AS `apellido`, count(`v`.`id_venta`) AS `total_ventas`, sum(`v`.`total`) AS `monto_total`, group_concat(distinct `p`.`nombre` separator ', ') AS `productos_vendidos` FROM (((`ventas` `v` join `empleados` `e` on(`v`.`id_empleado` = `e`.`id_empleado`)) join `detalle_ventas` `dv` on(`v`.`id_venta` = `dv`.`id_venta`)) join `productos` `p` on(`dv`.`id_producto` = `p`.`id_producto`)) GROUP BY `e`.`id_empleado` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
