-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-01-2023 a las 08:45:46
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id` int(11) NOT NULL,
  `numero_caja` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `folio` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_edit` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id`, `numero_caja`, `nombre`, `folio`, `activo`, `fecha_alta`, `fecha_edit`) VALUES
(1, '1', 'Caja General', 1, 1, '2022-07-03 08:08:40', NULL),
(2, '2', 'Caja Secundaria', 1, 1, '2023-01-03 06:26:20', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` smallint(6) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_edit` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `activo`, `fecha_alta`, `fecha_edit`) VALUES
(1, 'Laptops', 1, '2023-01-03 06:41:34', '2023-01-03 05:41:34'),
(2, 'Impresoras', 1, '2023-01-03 06:41:41', '2023-01-03 05:41:41'),
(3, 'Mouses', 1, '2023-01-03 06:41:49', '2023-01-03 05:41:49'),
(4, 'Teclados', 1, '2023-01-03 06:41:57', '2023-01-03 05:41:57'),
(5, 'Procesadores', 1, '2023-01-03 06:42:07', '2023-01-03 05:42:06'),
(6, 'Tarjetas de video', 1, '2023-01-03 06:42:29', '2023-01-03 05:42:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` smallint(6) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_edit` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `direccion`, `telefono`, `correo`, `activo`, `fecha_alta`, `fecha_edit`) VALUES
(2, 'efrain', 'juliaca', '912691276', 'efrainsaul120@gmail.com', 0, '2023-01-03 01:33:13', '2023-01-03 00:33:13'),
(10, 'Juan Manuel', 'jr. san martin', '945154234', 'juanmanuel@gmail.com', 0, '2023-01-03 06:52:22', '2023-01-03 05:52:22'),
(11, 'Oscar Cari ', 'jr. gardeñas ', '965081955', 'oscaryana154@gmail.com', 0, '2023-01-03 06:52:19', '2023-01-03 05:52:19'),
(12, 'Jose Roberto', 'Jr Tupac Amaru', '978456123', 'JR_10@gmail.com', 1, '2023-01-03 05:52:59', '2023-01-03 05:52:59'),
(13, 'Diego Paucara', 'Urb. Zarumilla ', '945612753', 'Diego_2033@hotmail.com', 1, '2023-01-03 05:54:02', '2023-01-03 05:54:02'),
(14, 'Jhon Mariano', 'Jr. apurimac', '945635456', 'jm_mariano@gmail.com', 1, '2023-01-03 05:57:08', '2023-01-03 05:57:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `folio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `folio`, `total`, `id_usuario`, `activo`, `fecha_alta`) VALUES
(7, '63b3d163195e8', '0.00', 10, 1, '2023-01-03 05:55:50'),
(8, '63b3d29ae476a', '0.00', 10, 1, '2023-01-03 06:02:51'),
(9, '63b3da6b9d69c', '63000.00', 9, 1, '2023-01-03 06:34:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `valor` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `valor`) VALUES
(1, 'tienda_nombre', 'PC_RADIANTE'),
(2, 'tienda_rfc', '75329710'),
(3, 'tienda_telefono', '946097942'),
(4, 'tienda_email', 'canazapaucara@gmail.com'),
(5, 'tienda_direccion', 'Jr Gonzales Prada'),
(6, 'ticket_leyenda', '\"Vuelva Pronto\"');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id`, `id_compra`, `id_producto`, `nombre`, `cantidad`, `precio`, `fecha_alta`) VALUES
(14, 9, 27, 'Tarjeta de video rtx 3050 gygagyte', 30, '2100.00', '2023-01-03 06:34:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id`, `id_venta`, `id_producto`, `nombre`, `cantidad`, `precio`, `fecha_alta`) VALUES
(39, 24, 13, 'Paneton', 1, '15.00', '2022-12-27 18:20:08'),
(40, 27, 3, 'Torta', 1, '23.00', '2023-01-02 02:53:26'),
(41, 28, 6, 'Galletas', 1, '4.00', '2023-01-02 04:35:00'),
(42, 32, 6, 'Galletas', 1, '4.00', '2023-01-02 05:08:26'),
(43, 33, 22, 'papa', 1, '20.00', '2023-01-02 05:56:28'),
(44, 34, 6, 'Galletas', 1, '4.00', '2023-01-02 06:30:35'),
(45, 36, 22, 'papa', 1, '20.00', '2023-01-02 06:49:00'),
(46, 37, 22, 'papa', 1, '20.00', '2023-01-02 14:57:32'),
(47, 38, 22, 'papa', 1, '20.00', '2023-01-02 15:13:19'),
(48, 39, 22, 'papa', 1, '20.00', '2023-01-02 16:10:45'),
(49, 40, 6, 'Galletas', 1, '4.00', '2023-01-02 17:02:44'),
(50, 41, 6, 'Galletas', 1, '4.00', '2023-01-02 17:15:35'),
(51, 42, 6, 'Galletas', 1, '4.00', '2023-01-02 17:15:48'),
(52, 43, 6, 'Galletas', 1, '4.00', '2023-01-02 17:17:59'),
(53, 44, 6, 'Galletas', 2, '4.00', '2023-01-02 17:18:30'),
(54, 45, 6, 'Galletas', 1, '4.00', '2023-01-02 17:21:33'),
(55, 46, 6, 'Galletas', 1, '4.00', '2023-01-02 17:25:26'),
(56, 47, 6, 'Galletas', 1, '4.00', '2023-01-03 02:29:16'),
(57, 48, 23, 'Impresora epson l3110', 1, '600.00', '2023-01-03 05:58:00'),
(58, 49, 23, 'Impresora epson l3110', 1, '600.00', '2023-01-03 05:59:02'),
(59, 49, 25, 'Procesador 12va generación i7', 1, '1300.00', '2023-01-03 05:59:02'),
(60, 49, 27, 'Tarjeta de video rtx 3050 gygagyte', 1, '2100.00', '2023-01-03 05:59:02'),
(61, 50, 26, 'Laptop gamer hp procesador core i5 pavilion', 1, '2300.00', '2023-01-03 06:00:02'),
(62, 50, 24, 'Impresora Epson l4260', 1, '720.00', '2023-01-03 06:00:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL DEFAULT 0.00,
  `ventas` int(11) NOT NULL DEFAULT 0,
  `existencias` int(11) NOT NULL DEFAULT 0,
  `stock_minimo` int(11) NOT NULL DEFAULT 0,
  `inventariable` tinyint(4) NOT NULL,
  `id_unidad` smallint(6) NOT NULL,
  `id_categoria` smallint(6) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_edit` timestamp NULL DEFAULT NULL,
  `id_cliente` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `imagen`, `nombre`, `precio_venta`, `precio_compra`, `ventas`, `existencias`, `stock_minimo`, `inventariable`, `id_unidad`, `id_categoria`, `activo`, `fecha_alta`, `fecha_edit`, `id_cliente`) VALUES
(6, '000007', '', 'Galletas', '4.00', '4.00', 12, -12, 20, 1, 1, 3, 0, '2023-01-03 06:40:10', NULL, 0),
(22, '011', '', 'papa', '20.00', '20.00', 5, -5, 20, 1, 5, 3, 0, '2023-01-03 06:40:13', NULL, 0),
(23, '000001', '', 'Impresora epson l3110', '750.00', '600.00', 2, -2, 20, 1, 12, 2, 1, '2023-01-03 06:59:02', NULL, 0),
(24, '000002', '', 'Impresora Epson l4260', '880.00', '720.00', 1, -1, 20, 1, 12, 2, 1, '2023-01-03 07:00:02', NULL, 0),
(25, '000003', '', 'Procesador 12va generación i7', '1500.00', '1300.00', 1, -1, 10, 1, 12, 5, 1, '2023-01-03 06:59:02', NULL, 0),
(26, '000004', '', 'Laptop gamer hp procesador core i5 pavilion', '2600.00', '2300.00', 1, -1, 12, 1, 12, 1, 1, '2023-01-03 07:00:02', NULL, 0),
(27, '000005', '', 'Tarjeta de video rtx 3050 gygagyte', '2500.00', '2100.00', 1, 29, 4, 1, 12, 6, 1, '2023-01-03 07:34:42', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_edit` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `activo`, `fecha_alta`, `fecha_edit`) VALUES
(1, 'Administrador', 1, '2022-07-03 08:10:16', NULL),
(2, 'Cajero', 1, '2022-07-03 08:10:16', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporal_compra`
--

CREATE TABLE `temporal_compra` (
  `id` int(11) NOT NULL,
  `folio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `id_producto` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `temporal_compra`
--

INSERT INTO `temporal_compra` (`id`, `folio`, `id_producto`, `codigo`, `nombre`, `cantidad`, `precio`, `subtotal`) VALUES
(12, '62cd02838c3c0', 3, '000003', 'PAPAS-FRITAS-LAYS', 1, '8.00', '8.00'),
(13, '62cd02838c3c0', 4, '000004', 'INCA-KOLA-6-PACK', 1, '12.00', '12.00'),
(14, '62cd03efd086e', 3, '000003', 'PAPAS-FRITAS-LAYS', 1, '8.00', '8.00'),
(15, '62cd03efd086e', 1, '000001', 'SUBLIME', 1, '12.00', '12.00'),
(16, '62cd095aeb4f5', 4, '000004', 'INCA-KOLA-6-PACK', 1, '12.00', '12.00'),
(17, '62cd095aeb4f5', 1, '000001', 'SUBLIME', 1, '12.00', '12.00'),
(18, '62cd0cf31a3f0', 2, '000002', 'G-CHIPS-AHOY', 2, '6.00', '12.00'),
(19, '62cd0cf31a3f0', 4, '000004', 'INCA-KOLA-6-PACK', 1, '12.00', '12.00'),
(22, '62cd109775714', 2, '000002', 'G-CHIPS-AHOY', 1, '6.00', '6.00'),
(62, '63aeddc029c71', 13, '000005', 'Paneton', 2, '15.00', '30.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `id` smallint(6) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_corto` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `activo` tinyint(3) NOT NULL DEFAULT 1,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_edit` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`id`, `nombre`, `nombre_corto`, `activo`, `fecha_alta`, `fecha_edit`) VALUES
(1, 'Gramo', 'gr', 0, '2023-01-03 06:43:08', '2023-01-03 05:43:08'),
(2, 'Gramo', 'Gr', 0, '2023-01-03 06:40:24', '2023-01-03 05:40:24'),
(3, 'Litro', 'Lt', 0, '2023-01-03 06:43:21', '2023-01-03 05:43:21'),
(4, 'Miligramo', 'mg', 0, '2023-01-03 06:43:11', '2023-01-03 05:43:11'),
(5, 'Kilogramo', 'kg', 0, '2023-01-03 06:43:13', '2023-01-03 05:43:13'),
(6, 'Libras', 'lb', 0, '2023-01-03 06:43:19', '2023-01-03 05:43:19'),
(7, 'Litro', 'Lt', 0, '2023-01-03 06:43:16', '2023-01-03 05:43:16'),
(8, 'Arroba', 'Ar', 0, '2023-01-02 02:52:24', '2023-01-02 01:52:24'),
(9, 'masa', 'ms', 0, '2023-01-01 17:41:49', '2023-01-01 16:41:49'),
(10, 'Metro', 'mt', 0, '2023-01-01 18:05:51', '2023-01-01 17:05:51'),
(11, 'hh5', '5h5h', 0, '2023-01-02 08:49:35', '2023-01-02 07:49:35'),
(12, 'Unidades', 'unidad', 1, '2023-01-03 05:43:40', '2023-01-03 05:43:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(130) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `id_caja` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fecha_edit` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`, `nombre`, `id_caja`, `id_rol`, `activo`, `fecha_alta`, `fecha_edit`) VALUES
(9, 'Juan10', '$2y$10$rRBLzCwTbcdNiBF.1hbXTuiXsE0f3WRndPsUN31mX0W1dLug4sNTu', 'Juan Diego', 1, 1, 1, '2023-01-03 05:19:43', '2023-01-03 05:19:43'),
(10, 'miguel12', '$2y$10$5LuECSWtKjBRN7/22XI.F.MpEaoxmtVK9S8ViEqUU36o73TFhrs9m', 'Miguel Angel', 2, 2, 1, '2023-01-03 05:21:37', '2023-01-03 05:21:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `folio` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_usuario` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `forma_pago` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `folio`, `total`, `fecha_alta`, `id_usuario`, `id_caja`, `id_cliente`, `forma_pago`, `activo`) VALUES
(23, '63aa6150a361a', '3.00', '2022-12-27 03:18:46', 5, 1, 3, '001', 0),
(24, '63ab44d5cc19c', '15.00', '2022-12-27 18:20:08', 5, 1, 2, '001', 1),
(25, '63aedde0d16e4', '0.00', '2022-12-30 11:47:31', 1, 1, 1, 'Selec', 1),
(26, '63aee05f9b358', '0.00', '2022-12-30 11:58:08', 1, 1, 1, 'Selec', 1),
(27, '63b25509ef638', '23.00', '2023-01-02 02:53:26', 1, 1, 2, '001', 1),
(28, '63b26ce8afa47', '4.00', '2023-01-02 04:35:00', 1, 1, 1, '001', 1),
(29, '63b26dca8253a', '0.00', '2023-01-02 04:48:36', 1, 1, 1, 'Selec', 1),
(30, '63b271c473184', '0.00', '2023-01-02 04:55:20', 1, 1, 1, 'Selec', 1),
(31, '63b274c56e197', '0.00', '2023-01-02 05:08:08', 1, 1, 1, 'Selec', 1),
(32, '63b274cbd5b42', '4.00', '2023-01-02 05:08:26', 1, 1, 1, '001', 1),
(33, '63b28000a1507', '20.00', '2023-01-02 05:56:28', 1, 1, 1, '001', 1),
(34, '63b288103e6f4', '4.00', '2023-01-02 06:30:35', 1, 1, 1, '001', 1),
(35, '63b28a25539fc', '0.00', '2023-01-02 06:39:23', 1, 1, 1, 'Selec', 1),
(36, '63b28c64411db', '20.00', '2023-01-02 06:49:00', 1, 1, 1, 'Selec', 1),
(37, '63b2fee52ce28', '20.00', '2023-01-02 14:57:32', 1, 1, 1, 'Selec', 1),
(38, '63b30299f126b', '20.00', '2023-01-02 15:13:19', 1, 1, 1, 'Selec', 1),
(39, '63b310082c6c4', '20.00', '2023-01-02 16:10:45', 1, 1, 1, 'Selec', 1),
(40, '63b31c3f24a16', '4.00', '2023-01-02 17:02:44', 1, 1, 1, 'Selec', 1),
(41, '63b31f3ec6baf', '4.00', '2023-01-02 17:15:35', 8, 1, 1, 'Selec', 1),
(42, '63b31f4c68731', '4.00', '2023-01-02 17:15:48', 8, 1, 1, 'Selec', 1),
(43, '63b31fd357ea2', '4.00', '2023-01-02 17:17:59', 8, 1, 1, 'Selec', 1),
(44, '63b31fdf34152', '8.00', '2023-01-02 17:18:30', 8, 1, 1, '001', 1),
(45, '63b3209e0a55b', '4.00', '2023-01-02 17:21:33', 8, 1, 1, '001', 1),
(46, '63b3219294560', '4.00', '2023-01-02 17:25:26', 8, 1, 1, 'Selec', 1),
(47, '63b3a0ff486c5', '4.00', '2023-01-03 02:29:16', 8, 1, 1, 'Selec', 1),
(48, '63b3d1ebab6cb', '600.00', '2023-01-03 05:58:00', 10, 2, 1, '001', 1),
(49, '63b3d209c97b4', '4000.00', '2023-01-03 05:59:02', 10, 2, 14, '002', 1),
(50, '63b3d25c4d043', '3020.00', '2023-01-03 06:00:02', 10, 2, 13, '001', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_compras_usuario` (`id_usuario`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_compra` (`id_compra`),
  ADD KEY `fk_detalle_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `fk_producto_unidad` (`id_unidad`),
  ADD KEY `fk_producto_categoria` (`id_categoria`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temporal_compra`
--
ALTER TABLE `temporal_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_caja` (`id_caja`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `temporal_compra`
--
ALTER TABLE `temporal_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_compras_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `fk_detalle_compra` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id`),
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `fk_producto_unidad` FOREIGN KEY (`id_unidad`) REFERENCES `unidades` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_caja` FOREIGN KEY (`id_caja`) REFERENCES `cajas` (`id`),
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
