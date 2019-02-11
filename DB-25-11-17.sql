-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2017 a las 20:33:36
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `gavca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aumentos`
--

CREATE TABLE IF NOT EXISTS `aumentos` (
`id` int(10) unsigned NOT NULL,
  `aum_aumento` decimal(5,2) NOT NULL,
  `aum_descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aumentos`
--

INSERT INTO `aumentos` (`id`, `aum_aumento`, `aum_descripcion`, `created_at`, `updated_at`) VALUES
(29, '15.00', 'Diciembre 2014', '2017-11-23 16:41:05', '2017-11-23 16:41:05'),
(30, '15.00', 'Febrero 2015', '2017-11-23 16:41:23', '2017-11-23 16:41:23'),
(31, '20.00', 'Mayo 2015', '2017-11-23 17:11:56', '2017-11-23 16:41:56'),
(32, '10.00', 'Julio 2015', '2017-11-23 16:42:16', '2017-11-23 16:42:16'),
(33, '30.00', 'Noviembre 2015', '2017-11-23 16:42:36', '2017-11-23 16:42:36'),
(34, '20.00', 'Marzo 2016', '2017-11-23 16:42:56', '2017-11-23 16:42:56'),
(35, '30.00', 'Mayo 2016', '2017-11-23 16:43:14', '2017-11-23 16:43:14'),
(36, '50.00', 'Septiembre 2016', '2017-11-23 16:43:33', '2017-11-23 16:43:33'),
(37, '20.00', 'Noviembre 2016', '2017-11-23 16:43:53', '2017-11-23 16:43:53'),
(38, '50.00', 'Enero 2017', '2017-11-23 16:44:07', '2017-11-23 16:44:07'),
(39, '60.00', 'Mayo 2017', '2017-11-23 16:44:28', '2017-11-23 16:44:28'),
(40, '50.00', 'Julio 2017', '2017-11-23 16:44:44', '2017-11-23 16:44:44'),
(41, '40.00', 'Septiembre 2017', '2017-11-23 16:44:58', '2017-11-23 16:44:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cardexmp`
--

CREATE TABLE IF NOT EXISTS `cardexmp` (
`id` int(10) unsigned NOT NULL,
  `mp_codigo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comp_doc` varchar(255) NOT NULL,
  `car_valor_anterior` decimal(25,4) NOT NULL,
  `car_valor_actual` decimal(25,4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE IF NOT EXISTS `compras` (
`id` int(10) unsigned NOT NULL,
  `comp_doc` varchar(255) NOT NULL,
  `comp_proveedor` varchar(255) NOT NULL,
  `comp_fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comp_monto` decimal(25,4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costofijos`
--

CREATE TABLE IF NOT EXISTS `costofijos` (
`id` int(10) unsigned NOT NULL,
  `cf_concepto` varchar(255) NOT NULL,
  `cf_montomes` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `costofijos`
--

INSERT INTO `costofijos` (`id`, `cf_concepto`, `cf_montomes`, `created_at`, `updated_at`) VALUES
(1, 'ALQUILER PLANTA MOCOTIES', '60000.00', '2017-10-22 05:41:45', '2017-11-23 17:33:13'),
(2, 'ALQUILER DEPÓSITO Y OFICINA', '100000.00', '2017-10-22 05:44:40', '2017-11-23 17:33:33'),
(3, 'SUELDOS  ADMINISTRATIVOS', '1947082.36', '2017-10-22 05:44:54', '2017-11-07 01:14:10'),
(4, 'HONORARIOS CONTADOR', '60000.00', '2017-10-22 05:45:06', '2017-11-23 17:33:46'),
(5, 'HONORARIOS ABOGADOS (ACTAS)', '8332.33', '2017-10-22 05:45:21', '2017-11-07 01:14:21'),
(6, 'SISTEMA DE ALARMA (SISTEL)', '2.00', '2017-10-22 05:45:34', '2017-11-07 01:14:27'),
(7, 'SUELDO MARINO ROJAS', '325542.00', '2017-10-22 05:45:48', '2017-11-07 01:14:32'),
(9, 'HONORARIOS ASESOSRÍA EN SEGURIDAD INDUSTRIAL', '12002.00', '2017-11-01 01:17:16', '2017-11-07 01:14:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencias`
--

CREATE TABLE IF NOT EXISTS `dependencias` (
`id` int(10) unsigned NOT NULL,
  `dep_padre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dep_hijo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dep_produccion` int(10) unsigned DEFAULT NULL,
  `relacion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dependencias`
--

INSERT INTO `dependencias` (`id`, `dep_padre`, `dep_hijo`, `dep_produccion`, `relacion`, `created_at`, `updated_at`) VALUES
(13, 'Antipasto de Atún 500G (C)', 'Antipasto de Atún 500G (B)', 71, 12, '2017-11-23 17:36:07', '2017-11-25 13:10:20'),
(14, 'Mermelada de Coleto (B)', 'Mermelada de Coleto (A)', 79, 1, '2017-11-25 16:05:20', '2017-11-25 16:07:52'),
(15, 'Mermelada de Coleto de 12 unidades (C)', 'Mermelada de Coleto (B)', 83, 12, '2017-11-25 16:11:26', '2017-11-25 16:15:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE IF NOT EXISTS `ingredientes` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ing_ingrediente` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `rec_nombre`, `ing_ingrediente`, `created_at`, `updated_at`) VALUES
(124, 'Antipasto de Atún 500G (B)', 'ATÚN ', '2017-11-23 16:27:20', '2017-11-23 16:27:20'),
(125, 'Antipasto de Atún 500G (B)', 'ACEITE', '2017-11-23 16:27:27', '2017-11-23 16:27:27'),
(126, 'Antipasto de Atún 500G (B)', 'VAINITA', '2017-11-23 16:27:35', '2017-11-23 16:27:35'),
(127, 'Antipasto de Atún 500G (B)', 'ZANAHORIA', '2017-11-23 16:27:43', '2017-11-23 16:27:43'),
(128, 'Antipasto de Atún 500G (B)', 'COLIFLOR', '2017-11-23 16:27:50', '2017-11-23 16:27:50'),
(129, 'Antipasto de Atún 500G (B)', 'CÉLERI (APIO ESPAÑA)', '2017-11-23 16:27:57', '2017-11-23 16:27:57'),
(130, 'Antipasto de Atún 500G (B)', 'CEBOLLA', '2017-11-23 16:28:03', '2017-11-23 16:28:03'),
(131, 'Antipasto de Atún 500G (B)', 'CEBOLLÍN', '2017-11-23 16:28:10', '2017-11-23 16:28:10'),
(132, 'Antipasto de Atún 500G (B)', 'AJOPORRO', '2017-11-23 16:28:15', '2017-11-23 16:28:15'),
(133, 'Antipasto de Atún 500G (B)', 'PIMENTÓN', '2017-11-23 16:28:22', '2017-11-23 16:28:22'),
(134, 'Antipasto de Atún 500G (B)', 'ACEITUNA', '2017-11-23 16:28:28', '2017-11-23 16:28:28'),
(135, 'Antipasto de Atún 500G (B)', 'SALSA DE TOMATE', '2017-11-23 16:28:37', '2017-11-23 16:28:37'),
(136, 'Antipasto de Atún 500G (B)', 'AZÚCAR', '2017-11-23 16:28:43', '2017-11-23 16:28:43'),
(137, 'Antipasto de Atún 500G (B)', 'SAL', '2017-11-23 16:28:50', '2017-11-23 16:28:50'),
(138, 'Antipasto de Atún 500G (B)', 'VINAGRE', '2017-11-23 16:28:58', '2017-11-23 16:28:58'),
(139, 'Antipasto de Atún 500G (B)', 'PIMIENTA', '2017-11-23 16:29:08', '2017-11-23 16:29:08'),
(140, 'Antipasto de Atún 500G (B)', 'FRASCO  500 CC', '2017-11-23 16:29:19', '2017-11-23 16:29:19'),
(141, 'Antipasto de Atún 500G (B)', 'TAPA DE 63mm, 500cc, TWIST BLANCA', '2017-11-23 16:29:27', '2017-11-23 16:29:27'),
(142, 'Antipasto de Atún 500G (B)', 'GAS (COSTO 1% DE CONSUMO)', '2017-11-23 16:29:36', '2017-11-23 16:29:36'),
(143, 'Antipasto de Atún 500G (B)', 'ELECTRICIDAD', '2017-11-23 16:29:43', '2017-11-23 16:29:43'),
(144, 'Antipasto de Atún 500G (B)', 'AGUA', '2017-11-23 16:29:49', '2017-11-23 16:29:49'),
(145, 'Antipasto de Atún 500G (B)', 'GUANTES DE LATEX RE-USABLES', '2017-11-23 16:29:56', '2017-11-23 16:29:56'),
(146, 'Antipasto de Atún 500G (B)', 'DETERGENTE PARA PISOS', '2017-11-23 16:30:07', '2017-11-23 16:30:07'),
(147, 'Antipasto de Atún 500G (B)', 'DETERGENTE PARA VAJILLAS', '2017-11-23 16:30:13', '2017-11-23 16:30:13'),
(148, 'Antipasto de Atún 500G (B)', 'ALCOHOL', '2017-11-23 16:30:20', '2017-11-23 16:30:20'),
(149, 'Antipasto de Atún 500G (B)', 'BOLSA DE BASURA', '2017-11-23 16:30:26', '2017-11-23 16:30:26'),
(150, 'Antipasto de Atún 500G (B)', 'ESPONJA DE LIMPIEZA', '2017-11-23 16:30:35', '2017-11-23 16:30:35'),
(151, 'Antipasto de Atún 500G (B)', 'COLETO', '2017-11-23 16:30:47', '2017-11-23 16:30:47'),
(152, 'Antipasto de Atún 500G (B)', 'FÓSFOROS ', '2017-11-23 16:30:57', '2017-11-23 16:30:57'),
(153, 'Antipasto de Atún 500G (C)', 'ETIQUETA FRASCO DE 500GR', '2017-11-23 17:36:18', '2017-11-23 17:36:18'),
(154, 'Antipasto de Atún 500G (C)', 'PRESINTO TAPA DE 500GR', '2017-11-23 17:36:28', '2017-11-23 17:36:28'),
(155, 'Antipasto de Atún 500G (C)', 'PLÁSTICO TERMOENCOJIBLE', '2017-11-23 17:37:29', '2017-11-23 17:37:29'),
(156, 'Antipasto de Atún 500G (C)', 'BANDEJA DE CARTÓN (12 FCOS 500CC)', '2017-11-23 17:39:24', '2017-11-23 17:39:24'),
(157, 'Antipasto de Atún 500G (C)', 'GRAPAS PARA CARTON', '2017-11-23 17:39:32', '2017-11-23 17:39:32'),
(158, 'Antipasto de Atún 500G (C)', 'PEGAMENTO PARA CARTÓN', '2017-11-23 17:39:38', '2017-11-23 17:39:38'),
(159, 'Antipasto de Atún 500G (C)', 'ELECTRICIDAD', '2017-11-23 17:39:44', '2017-11-23 17:39:44'),
(160, 'Mermelada de Coleto (A)', 'ALCOHOL', '2017-11-25 15:50:01', '2017-11-25 15:50:01'),
(161, 'Mermelada de Coleto (A)', 'CEBOLLÍN', '2017-11-25 15:50:04', '2017-11-25 15:50:04'),
(162, 'Mermelada de Coleto (A)', 'COLETO', '2017-11-25 15:50:07', '2017-11-25 15:50:07'),
(163, 'Mermelada de Coleto (A)', 'ELECTRICIDAD', '2017-11-25 15:50:11', '2017-11-25 15:50:11'),
(164, 'Mermelada de Coleto (B)', 'ATÚN ', '2017-11-25 16:05:31', '2017-11-25 16:05:31'),
(165, 'Mermelada de Coleto (B)', 'PIMIENTA', '2017-11-25 16:05:37', '2017-11-25 16:05:37'),
(166, 'Mermelada de Coleto de 12 unidades (C)', 'PERTINA', '2017-11-25 16:11:37', '2017-11-25 16:11:37'),
(167, 'Mermelada de Coleto de 12 unidades (C)', 'PLANTA ELECTRICA', '2017-11-25 16:11:42', '2017-11-25 16:11:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiasprimas`
--

CREATE TABLE IF NOT EXISTS `materiasprimas` (
`id` int(10) unsigned NOT NULL,
  `mp_codigo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mp_cantidad` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_recetas_table', 1),
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2017_10_10_163141_create_parametros_table', 1),
('2017_10_12_170000_create_ingredientes_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miscelaneos`
--

CREATE TABLE IF NOT EXISTS `miscelaneos` (
`id` int(10) unsigned NOT NULL,
  `tru_cant` decimal(10,2) NOT NULL,
  `tru_cost_unit` decimal(10,2) NOT NULL,
  `tru_kilo` decimal(10,2) NOT NULL,
  `gas_porc_util` decimal(10,2) NOT NULL,
  `gas_cost_bomb` decimal(10,2) NOT NULL,
  `std_x_frasco` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `miscelaneos`
--

INSERT INTO `miscelaneos` (`id`, `tru_cant`, `tru_cost_unit`, `tru_kilo`, `gas_porc_util`, `gas_cost_bomb`, `std_x_frasco`, `created_at`, `updated_at`) VALUES
(1, '102.00', '10002.00', '22.23', '62.00', '10002.00', '475.94', '2017-10-11 04:00:00', '2017-11-07 01:13:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE IF NOT EXISTS `parametros` (
`id` int(10) unsigned NOT NULL,
  `par_codigo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `par_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `par_unidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `par_costo` decimal(25,4) DEFAULT NULL,
  `par_observacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `par_codigo`, `par_nombre`, `par_unidad`, `par_costo`, `par_observacion`, `created_at`, `updated_at`) VALUES
(7, 'MP0000', 'ATÚN ', 'KILO', '64457.0000', '', '2017-10-14 06:10:50', '2017-11-23 16:34:26'),
(9, 'MP0001', 'VAINITA', 'KILO', '4000.0000', '', '2017-10-14 06:11:31', '2017-11-23 16:34:55'),
(10, 'MP0002', 'ZANAHORIA', 'KILO', '5000.0000', '', '2017-10-14 06:11:49', '2017-11-23 16:35:05'),
(14, 'MP0003', 'COLIFLOR', 'KILO', '4000.0000', '', '2017-10-14 10:10:19', '2017-11-23 16:35:12'),
(15, 'MP0004', 'CEBOLLÍN', 'KILO', '4500.0000', '', '2017-10-14 10:11:07', '2017-11-23 16:35:38'),
(16, 'MP0005', 'CEBOLLA', 'KILO', '4000.0000', '', '2017-10-14 10:11:21', '2017-11-23 16:35:30'),
(17, 'MP0006', 'CÉLERI (APIO ESPAÑA)', 'KILO', '4500.0000', '', '2017-10-14 10:11:38', '2017-11-23 16:35:22'),
(18, 'MP0007', 'AJOPORRO', 'KILO', '4500.0000', '', '2017-10-14 10:11:53', '2017-11-23 16:35:46'),
(19, 'MP0008', 'PIMENTÓN', 'KILO', '6000.0000', '', '2017-10-14 10:12:08', '2017-11-23 16:35:57'),
(20, 'MP0009', 'ACEITUNA', 'KILO', '35000.0000', '', '2017-10-14 10:12:21', '2017-11-23 16:36:04'),
(21, 'MP0010', 'SALSA DE TOMATE', 'KILO', '13000.0000', '', '2017-10-14 10:12:44', '2017-11-23 16:36:16'),
(22, 'MI29703', 'AZÚCAR', 'KILO', '13600.0000', '', '2017-10-14 10:12:58', '2017-11-23 16:36:30'),
(23, 'MI0002', 'SAL', 'KILO', '1000.0000', '', '2017-10-14 10:13:18', '2017-11-23 16:36:43'),
(24, 'MI0003', 'VINAGRE', 'LITRO', '750.0000', '', '2017-10-14 10:13:32', '2017-11-23 16:36:52'),
(25, 'MI0004', 'PIMIENTA', 'GRAMO', '59.5000', '', '2017-10-14 10:13:52', '2017-11-23 16:37:03'),
(26, 'MI0005', 'FRASCO  500 CC', 'UNIDAD', '239.7600', '', '2017-10-14 10:14:08', '2017-11-23 16:37:28'),
(27, 'MI0006', 'ETIQUETA FRASCO DE 500GR', 'UNIDAD', '29.2500', '', '2017-10-14 10:14:22', '2017-10-14 10:14:22'),
(28, 'MI0007', 'PRESINTO TAPA DE 500GR', 'UNIDAD', '0.5000', '', '2017-10-14 10:14:37', '2017-10-14 10:14:37'),
(29, 'MI0008', 'GAS (COSTO 1% DE CONSUMO)', '1%', '163.6400', '', '2017-10-14 10:14:52', '2017-11-23 16:37:53'),
(30, 'MI0009', 'ELECTRICIDAD', 'KWH', '0.0000', '', '2017-10-14 10:15:06', '2017-10-14 10:15:06'),
(31, 'MP23301', 'AGUA', 'UNITARIO E', '0.0000', '', '2017-10-14 10:15:23', '2017-11-23 16:38:10'),
(32, 'MI0011', 'GUANTES DE LATEX RE-USABLES', 'PAR', '335.6300', '', '2017-10-14 10:15:40', '2017-11-23 16:38:25'),
(33, 'MI0012', 'DETERGENTE PARA PISOS', 'LITRO', '12.9200', '', '2017-10-14 10:15:54', '2017-11-23 16:38:35'),
(34, 'MI0013', 'DETERGENTE PARA VAJILLAS', 'LITRO', '2875.0000', '', '2017-10-14 10:16:08', '2017-11-23 16:38:44'),
(35, 'MI0014', 'ALCOHOL', 'LITRO', '3139.0000', '', '2017-10-14 10:16:23', '2017-11-23 16:38:53'),
(36, 'MI0015', 'BOLSA DE BASURA', 'UNIDAD', '261.3300', '', '2017-10-14 10:16:39', '2017-11-23 16:39:02'),
(37, 'MI0016', 'ESPONJA DE LIMPIEZA', 'UNIDAD', '0.0000', '', '2017-10-14 10:16:54', '2017-10-14 10:16:54'),
(38, 'MI0017', 'COLETO', 'UNIDAD', '0.0000', '', '2017-10-14 10:17:10', '2017-10-14 10:17:10'),
(39, 'MI0018', 'FÓSFOROS ', 'C.GRDE', '1.6300', '', '2017-10-14 10:17:22', '2017-11-23 16:39:15'),
(42, 'MP0011', 'TRUCHA AHUMADA', 'KILO', '49.7800', '', '2017-10-14 14:08:08', '2017-10-14 14:26:26'),
(43, 'MP0012', 'ACEITE', 'LITRO', '7500.0000', '', '2017-10-14 23:35:58', '2017-11-23 16:34:42'),
(44, 'MP0013', 'FRESA', 'KILO', '12000.0000', 'COSTO FALSO', '2017-10-15 00:24:43', '2017-10-15 00:27:21'),
(49, 'MI0019', 'TAPA DE 63mm, 500cc, TWIST BLANCA', 'UNIDAD', '661.5000', '', '2017-10-31 21:03:35', '2017-11-23 16:37:42'),
(80, 'MP40753', 'PERTINA', 'LITRO', '2000.0000', '', '2017-11-15 07:22:36', '2017-11-15 07:29:09'),
(81, 'MI57453', 'PLANTA ELECTRICA', 'UNIDAD', '100000.0000', 'Ta barata', '2017-11-23 09:36:16', '2017-11-23 09:36:16'),
(82, 'MI34730', 'PLÁSTICO TERMOENCOJIBLE', 'KILO', '10000.0000', '', '2017-11-23 17:37:08', '2017-11-23 17:37:08'),
(83, 'MI22626', 'BANDEJA DE CARTÓN (12 FCOS 500CC)', 'UNIDAD', '0.0000', '', '2017-11-23 17:38:17', '2017-11-23 17:38:17'),
(84, 'MI96863', 'GRAPAS PARA CARTON', 'UNIDAD', '20.0000', '', '2017-11-23 17:38:38', '2017-11-23 17:38:38'),
(85, 'MI70455', 'PEGAMENTO PARA CARTÓN', 'CC', '0.0000', '', '2017-11-23 17:39:04', '2017-11-23 17:39:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE IF NOT EXISTS `produccion` (
`id` int(10) unsigned NOT NULL,
  `pro_fecha` date NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_etapa` varchar(5) NOT NULL,
  `pro_produccion` int(11) NOT NULL,
  `pro_costo` decimal(25,4) DEFAULT NULL,
  `pro_mano_obra` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id`, `pro_fecha`, `rec_nombre`, `pro_etapa`, `pro_produccion`, `pro_costo`, `pro_mano_obra`, `created_at`, `updated_at`) VALUES
(71, '2017-06-12', 'Antipasto de Atún 500G (B)', 'PB', 60, '7320.4800', '2.0000', '2017-11-23 16:32:24', '2017-11-24 10:39:07'),
(72, '2016-12-08', 'Antipasto de Atún 500G (C)', 'PC', 10, '92486.1400', '2.0000', '2017-11-23 17:40:44', '2017-11-25 10:05:49'),
(74, '2017-11-10', 'Antipasto de Atún 500G (C)', 'PC', 2, '283582.4100', '3.0000', '2017-11-25 12:47:56', '2017-11-25 12:48:00'),
(75, '2017-11-25', 'Antipasto de Atún 500G (B)', 'PB', 36, NULL, '2.0000', '2017-11-25 12:58:45', '2017-11-25 13:04:45'),
(76, '2017-11-25', 'Antipasto de Atún 500G (C)', 'PC', 2, '129524.0300', '3.0000', '2017-11-25 12:58:45', '2017-11-25 12:58:57'),
(77, '2017-11-24', 'Antipasto de Atún 500G (B)', 'PB', 12, NULL, '2.0000', '2017-11-25 13:10:20', '2017-11-25 13:10:20'),
(78, '2017-11-24', 'Antipasto de Atún 500G (C)', 'PC', 2, '120712.2000', '2.0000', '2017-11-25 13:10:20', '2017-11-25 13:10:31'),
(79, '2017-11-23', 'Mermelada de Coleto (A)', 'PA', 100, '936.1800', '2.5000', '2017-11-25 15:51:30', '2017-11-25 15:51:37'),
(80, '2017-11-24', 'Mermelada de Coleto (A)', 'PA', 50, NULL, '2.5000', '2017-11-25 16:06:19', '2017-11-25 16:06:19'),
(81, '2017-11-24', 'Mermelada de Coleto (B)', 'PB', 50, '8426.4700', '2.5000', '2017-11-25 16:06:19', '2017-11-25 16:13:18'),
(82, '2017-11-25', 'Mermelada de Coleto (A)', 'PA', 30, NULL, '2.5000', '2017-11-25 16:07:52', '2017-11-25 16:07:52'),
(83, '2017-11-25', 'Mermelada de Coleto (B)', 'PB', 20, '12091.1000', '1.5000', '2017-11-25 16:07:52', '2017-11-25 16:13:29'),
(84, '2017-11-26', 'Mermelada de Coleto (B)', 'PB', 10, NULL, '1.5000', '2017-11-25 16:15:05', '2017-11-25 16:15:05'),
(85, '2017-11-26', 'Mermelada de Coleto de 12 unidades (C)', 'PC', 5, '215663.6800', '2.5000', '2017-11-25 16:15:05', '2017-11-25 17:33:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producciona`
--

CREATE TABLE IF NOT EXISTS `producciona` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producciona`
--

INSERT INTO `producciona` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(1, 'Mermelada de Coleto (A)', 30, '2017-11-25 15:51:30', '2017-11-25 16:07:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccionb`
--

CREATE TABLE IF NOT EXISTS `produccionb` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccionb`
--

INSERT INTO `produccionb` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(2, 'Antipasto de Atún 500G (B)', 12, '2017-11-23 16:32:24', '2017-11-25 13:10:20'),
(3, 'Mermelada de Coleto (B)', 10, '2017-11-25 16:06:19', '2017-11-25 16:15:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccionc`
--

CREATE TABLE IF NOT EXISTS `produccionc` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccionc`
--

INSERT INTO `produccionc` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(2, 'Antipasto de Atún 500G (C)', 16, '2017-11-23 17:40:44', '2017-11-25 13:10:20'),
(3, 'Mermelada de Coleto de 12 unidades (C)', 5, '2017-11-25 16:15:05', '2017-11-25 16:15:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccionmes`
--

CREATE TABLE IF NOT EXISTS `produccionmes` (
  `id` int(10) unsigned NOT NULL,
  `produccion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccionmes`
--

INSERT INTO `produccionmes` (`id`, `produccion`, `created_at`, `updated_at`) VALUES
(1, 5280, '2017-10-11 08:00:00', '2017-11-01 00:25:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE IF NOT EXISTS `proveedors` (
`id` int(10) unsigned NOT NULL,
  `prov_codigo` varchar(255) NOT NULL,
  `prov_nombre` varchar(255) NOT NULL,
  `prov_rif` varchar(255) NOT NULL,
  `prov_direccion` varchar(255) NOT NULL,
  `prov_contacto` varchar(255) NOT NULL,
  `prov_condiciones` varchar(255) NOT NULL,
  `prov_retencion` int(1) NOT NULL,
  `prov_saldo` decimal(25,4) NOT NULL,
  `prov_cred_o_cont` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `prov_codigo`, `prov_nombre`, `prov_rif`, `prov_direccion`, `prov_contacto`, `prov_condiciones`, `prov_retencion`, `prov_saldo`, `prov_cred_o_cont`, `created_at`, `updated_at`) VALUES
(1, 'PROV51', 'Garzon', 'RV194225810', 'Av. Las Americas, Mérida edo. Mérida,Venezuela', '02744173436', 'no', 0, '0.0000', 'credito', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'PROV4526', 'Gonza', 'J-365473764', 'Av. Las Americas, 1 Cuadra abajo del GRIM', '02744173436', 'Credito de vez en cuando, contado el resto del tiempo', 1, '0.0000', 'contado', '2017-11-15 03:49:46', '2017-11-15 07:06:11'),
(9, 'PROV4527', 'Comercial Gomez', 'J-365473764', 'Av. Las Americas, 1 Cuadra abajo del GRIM', '02744173436, gonzasupermercado@gmail.com', 'Credito de vez en cuando, contado el resto del tiempo', 1, '0.0000', 'credito', '2017-11-23 09:34:20', '2017-11-23 09:34:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE IF NOT EXISTS `recetas` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rec_activo` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `rec_proc` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `rec_nombre`, `rec_activo`, `rec_proc`, `created_at`, `updated_at`) VALUES
(14, 'Antipasto de Atún 500G (B)', 'si', 'PB', '2017-11-23 16:27:01', '2017-11-23 16:27:01'),
(15, 'Antipasto de Atún 500G (C)', 'si', 'PC', '2017-11-23 17:35:26', '2017-11-23 17:35:26'),
(16, 'Mermelada de Coleto (A)', 'si', 'PA', '2017-11-25 15:49:32', '2017-11-25 15:51:08'),
(17, 'Mermelada de Coleto (B)', 'si', 'PB', '2017-11-25 16:05:05', '2017-11-25 16:05:05'),
(18, 'Mermelada de Coleto de 12 unidades (C)', 'si', 'PC', '2017-11-25 16:08:51', '2017-11-25 16:10:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimientos`
--

CREATE TABLE IF NOT EXISTS `requerimientos` (
`id` int(10) unsigned NOT NULL,
  `req_fecha` date DEFAULT NULL,
  `rec_nombre` varchar(255) NOT NULL,
  `req_ingrediente` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `req_total` decimal(25,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requerimientos`
--

INSERT INTO `requerimientos` (`id`, `req_fecha`, `rec_nombre`, `req_ingrediente`, `req_total`, `created_at`, `updated_at`) VALUES
(288, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ATÚN ', '2.9800', '2017-10-31 21:28:41', '2017-11-23 16:33:39'),
(289, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ACEITE', '1.5000', '2017-10-31 21:28:41', '2017-11-23 16:33:39'),
(290, '2017-06-12', 'Antipasto de Atún 500G (B)', 'VAINITA', '2.9000', '2017-10-31 21:28:41', '2017-11-23 16:33:39'),
(291, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ZANAHORIA', '3.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:39'),
(292, '2017-06-12', 'Antipasto de Atún 500G (B)', 'COLIFLOR', '3.8000', '2017-10-31 21:28:41', '2017-11-23 16:33:39'),
(293, '2017-06-12', 'Antipasto de Atún 500G (B)', 'CÉLERI (APIO ESPAÑA)', '3.1700', '2017-10-31 21:28:41', '2017-11-23 16:33:39'),
(294, '2017-06-12', 'Antipasto de Atún 500G (B)', 'CEBOLLA', '3.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:39'),
(295, '2017-06-12', 'Antipasto de Atún 500G (B)', 'CEBOLLÍN', '3.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:39'),
(296, '2017-06-12', 'Antipasto de Atún 500G (B)', 'AJOPORRO', '3.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:39'),
(297, '2017-06-12', 'Antipasto de Atún 500G (B)', 'PIMENTÓN', '2.3400', '2017-10-31 21:28:41', '2017-11-23 16:33:39'),
(298, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ACEITUNA', '0.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:39'),
(299, '2017-06-12', 'Antipasto de Atún 500G (B)', 'SALSA DE TOMATE', '2.5000', '2017-10-31 21:28:41', '2017-11-23 16:33:39'),
(300, '2017-06-12', 'Antipasto de Atún 500G (B)', 'AZÚCAR', '0.3000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(301, '2017-06-12', 'Antipasto de Atún 500G (B)', 'SAL', '0.1500', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(302, '2017-06-12', 'Antipasto de Atún 500G (B)', 'VINAGRE', '1.5000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(303, '2017-06-12', 'Antipasto de Atún 500G (B)', 'PIMIENTA', '50.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(304, '2017-06-12', 'Antipasto de Atún 500G (B)', 'FRASCO  500GR', '60.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(305, '2017-06-12', 'Antipasto de Atún 500G (B)', 'TAPA DE 63mm, 500cc, TWIST BLANCA', '60.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(306, '2017-06-12', 'Antipasto de Atún 500G (B)', 'GAS (COSTO 1% DE CONSUMO)', '1.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(307, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ELECTRICIDAD', '0.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(308, '2017-06-12', 'Antipasto de Atún 500G (B)', 'AGUA', '0.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(309, '2017-06-12', 'Antipasto de Atún 500G (B)', 'GUANTES DE LATEX RE-USABLES', '4.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(310, '2017-06-12', 'Antipasto de Atún 500G (B)', 'DETERGENTE PARA PISOS', '0.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(311, '2017-06-12', 'Antipasto de Atún 500G (B)', 'DETERGENTE PARA VAJILLAS', '0.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(312, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ALCOHOL', '0.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(313, '2017-06-12', 'Antipasto de Atún 500G (B)', 'BOLSA DE BASURA', '0.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(314, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ESPONJA DE LIMPIEZA', '0.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(315, '2017-06-12', 'Antipasto de Atún 500G (B)', 'COLETO', '0.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(316, '2017-06-12', 'Antipasto de Atún 500G (B)', 'FÓSFOROS ', '0.0000', '2017-10-31 21:28:41', '2017-11-23 16:33:40'),
(317, '2017-11-06', 'Nueva Receta 2', 'ATÚN ', '5.0000', '2017-11-07 01:17:25', '2017-11-07 01:17:54'),
(318, '2017-11-06', 'Nueva Receta 2', 'VAINITA', '3.0000', '2017-11-07 01:17:25', '2017-11-07 01:17:54'),
(319, '2017-11-06', 'Nueva Receta 2', 'ZANAHORIA', '2.0000', '2017-11-07 01:17:25', '2017-11-07 01:17:54'),
(320, '2017-11-06', 'Nueva Receta 2', 'COLIFLOR', '2.0000', '2017-11-07 01:17:25', '2017-11-07 01:17:54'),
(321, '2017-11-06', 'Nueva Receta 2', 'CEBOLLÍN', '2.0000', '2017-11-07 01:17:25', '2017-11-07 01:17:54'),
(322, '2017-11-08', 'Nueva Receta 2', 'ATÚN ', '5.0000', '2017-11-14 09:17:04', '2017-11-14 09:17:17'),
(323, '2017-11-08', 'Nueva Receta 2', 'VAINITA', '4.0000', '2017-11-14 09:17:04', '2017-11-14 09:17:17'),
(324, '2017-11-08', 'Nueva Receta 2', 'ZANAHORIA', '3.0000', '2017-11-14 09:17:04', '2017-11-14 09:17:17'),
(325, '2017-11-08', 'Nueva Receta 2', 'COLIFLOR', '5.0000', '2017-11-14 09:17:04', '2017-11-14 09:17:17'),
(326, '2017-11-08', 'Nueva Receta 2', 'CEBOLLÍN', '2.0000', '2017-11-14 09:17:04', '2017-11-14 09:17:17'),
(327, '2017-11-01', 'Nueva Receta 2', 'ATÚN ', '5.0000', '2017-11-14 10:11:28', '2017-11-14 10:13:21'),
(328, '2017-11-01', 'Nueva Receta 2', 'VAINITA', '4.0000', '2017-11-14 10:11:28', '2017-11-14 10:13:21'),
(329, '2017-11-01', 'Nueva Receta 2', 'ZANAHORIA', '3.0000', '2017-11-14 10:11:28', '2017-11-14 10:13:21'),
(330, '2017-11-01', 'Nueva Receta 2', 'COLIFLOR', '2.0000', '2017-11-14 10:11:28', '2017-11-14 10:13:21'),
(331, '2017-11-01', 'Nueva Receta 2', 'CEBOLLÍN', '1.0000', '2017-11-14 10:11:28', '2017-11-14 10:13:21'),
(332, '2017-11-02', 'Antipasto de Atún 500G (B)', 'ATÚN ', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(333, '2017-11-02', 'Antipasto de Atún 500G (B)', 'ACEITE', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(334, '2017-11-02', 'Antipasto de Atún 500G (B)', 'VAINITA', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(335, '2017-11-02', 'Antipasto de Atún 500G (B)', 'ZANAHORIA', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(336, '2017-11-02', 'Antipasto de Atún 500G (B)', 'COLIFLOR', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(337, '2017-11-02', 'Antipasto de Atún 500G (B)', 'CÉLERI (APIO ESPAÑA)', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(338, '2017-11-02', 'Antipasto de Atún 500G (B)', 'CEBOLLA', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(339, '2017-11-02', 'Antipasto de Atún 500G (B)', 'CEBOLLÍN', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(340, '2017-11-02', 'Antipasto de Atún 500G (B)', 'AJOPORRO', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(341, '2017-11-02', 'Antipasto de Atún 500G (B)', 'PIMENTÓN', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(342, '2017-11-02', 'Antipasto de Atún 500G (B)', 'ACEITUNA', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(343, '2017-11-02', 'Antipasto de Atún 500G (B)', 'SALSA DE TOMATE', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(344, '2017-11-02', 'Antipasto de Atún 500G (B)', 'AZÚCAR', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(345, '2017-11-02', 'Antipasto de Atún 500G (B)', 'SAL', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(346, '2017-11-02', 'Antipasto de Atún 500G (B)', 'VINAGRE', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(347, '2017-11-02', 'Antipasto de Atún 500G (B)', 'PIMIENTA', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(348, '2017-11-02', 'Antipasto de Atún 500G (B)', 'FRASCO  500GR', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(349, '2017-11-02', 'Antipasto de Atún 500G (B)', 'TAPA DE 63mm, 500cc, TWIST BLANCA', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(350, '2017-11-02', 'Antipasto de Atún 500G (B)', 'GAS (COSTO 1% DE CONSUMO)', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(351, '2017-11-02', 'Antipasto de Atún 500G (B)', 'ELECTRICIDAD', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(352, '2017-11-02', 'Antipasto de Atún 500G (B)', 'AGUA', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(353, '2017-11-02', 'Antipasto de Atún 500G (B)', 'GUANTES DE LATEX RE-USABLES', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(354, '2017-11-02', 'Antipasto de Atún 500G (B)', 'DETERGENTE PARA PISOS', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(355, '2017-11-02', 'Antipasto de Atún 500G (B)', 'DETERGENTE PARA VAJILLAS', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(356, '2017-11-02', 'Antipasto de Atún 500G (B)', 'ALCOHOL', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(357, '2017-11-02', 'Antipasto de Atún 500G (B)', 'BOLSA DE BASURA', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(358, '2017-11-02', 'Antipasto de Atún 500G (B)', 'ESPONJA DE LIMPIEZA', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(359, '2017-11-02', 'Antipasto de Atún 500G (B)', 'COLETO', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(360, '2017-11-02', 'Antipasto de Atún 500G (B)', 'FÓSFOROS ', NULL, '2017-11-14 10:16:59', '2017-11-14 10:16:59'),
(361, '2017-11-01', 'Nueva Receta', 'ATÚN ', '1.0000', '2017-11-14 10:19:48', '2017-11-14 10:20:18'),
(362, '2017-11-01', 'Nueva Receta', 'COLIFLOR', '2.0000', '2017-11-14 10:19:48', '2017-11-14 10:20:18'),
(363, '2017-11-01', 'Nueva Receta', 'CEBOLLA', '3.0000', '2017-11-14 10:19:48', '2017-11-14 10:20:18'),
(364, '2017-11-10', 'Nueva Receta', 'ATÚN ', '3.0000', '2017-11-14 10:29:20', '2017-11-14 10:29:47'),
(365, '2017-11-10', 'Nueva Receta', 'COLIFLOR', '2.0000', '2017-11-14 10:29:20', '2017-11-14 10:29:47'),
(366, '2017-11-10', 'Nueva Receta', 'CEBOLLA', '1.0000', '2017-11-14 10:29:20', '2017-11-14 10:29:47'),
(370, '2017-10-11', 'Mermelada de Piña (500 gr)', 'Piña', '200.0000', '2017-11-14 15:42:23', '2017-11-14 15:42:50'),
(371, '2017-10-11', 'Mermelada de Piña (500 gr)', 'AZÚCAR', '100.0000', '2017-11-14 15:42:23', '2017-11-14 15:42:50'),
(372, '2017-10-11', 'Mermelada de Piña (500 gr)', 'AGUA', '200.0000', '2017-11-14 15:42:23', '2017-11-14 15:42:50'),
(374, '2017-11-17', 'Nueva Receta', 'ATÚN ', '5.0000', '2017-11-17 07:52:59', '2017-11-17 07:53:06'),
(375, '2017-11-17', 'Nueva Receta', 'COLIFLOR', '4.0000', '2017-11-17 07:53:00', '2017-11-17 07:53:06'),
(376, '2017-11-17', 'Nueva Receta', 'CEBOLLA', '3.0000', '2017-11-17 07:53:00', '2017-11-17 07:53:06'),
(377, '2017-11-17', 'Cualquier Cosa (A)', 'ATÚN ', '5.0000', '2017-11-17 22:56:53', '2017-11-17 22:58:07'),
(378, '2017-11-17', 'Cualquier Cosa (A)', 'COLIFLOR', '4.0000', '2017-11-17 22:56:53', '2017-11-17 22:58:07'),
(379, '2017-11-17', 'Cualquier Cosa (A)', 'CEBOLLA', '3.0000', '2017-11-17 22:56:53', '2017-11-17 22:58:07'),
(389, '2017-11-22', 'Mermelada de Piña 500G (A)', 'AZÚCAR', '5.0000', '2017-11-22 13:42:22', '2017-11-22 13:42:28'),
(391, '2017-11-09', 'Antipasto de Atún 500G (B)', 'ACEITUNA', '10.0000', '2017-11-23 06:33:18', '2017-11-23 06:41:00'),
(392, '2017-11-10', 'Antipasto de Atún 500G (C)', 'ATÚN ', '5.0000', '2017-11-23 08:44:22', '2017-11-25 12:47:59'),
(393, '2017-11-10', 'Antipasto de Atún 500G (C)', 'VAINITA', '4.0000', '2017-11-23 08:44:22', '2017-11-25 12:47:59'),
(394, '2017-11-16', 'Mermelada de Piña 500G (A)', 'AZÚCAR', '15.0000', '2017-11-23 09:30:49', '2017-11-23 09:30:52'),
(395, '2016-12-08', 'Antipasto de Atún 500G (C)', 'ETIQUETA FRASCO DE 500GR', '120.0000', '2017-11-23 17:40:44', '2017-11-23 17:41:44'),
(396, '2016-12-08', 'Antipasto de Atún 500G (C)', 'PRESINTO TAPA DE 500GR', '120.0000', '2017-11-23 17:40:44', '2017-11-23 17:41:44'),
(397, '2016-12-08', 'Antipasto de Atún 500G (C)', 'PLÁSTICO TERMOENCOJIBLE', '0.5200', '2017-11-23 17:40:44', '2017-11-23 17:41:44'),
(398, '2016-12-08', 'Antipasto de Atún 500G (C)', 'BANDEJA DE CARTÓN (12 FCOS 500CC)', '10.0000', '2017-11-23 17:40:44', '2017-11-23 17:41:44'),
(399, '2016-12-08', 'Antipasto de Atún 500G (C)', 'GRAPAS PARA CARTON', '40.0000', '2017-11-23 17:40:44', '2017-11-23 17:41:44'),
(400, '2016-12-08', 'Antipasto de Atún 500G (C)', 'PEGAMENTO PARA CARTÓN', '50.0000', '2017-11-23 17:40:45', '2017-11-23 17:41:44'),
(401, '2016-12-08', 'Antipasto de Atún 500G (C)', 'ELECTRICIDAD', '5.0000', '2017-11-23 17:40:45', '2017-11-23 17:41:44'),
(402, '2017-11-25', 'Antipasto de Atún 500G (C)', 'ETIQUETA FRASCO DE 500GR', '5.0000', '2017-11-25 12:58:45', '2017-11-25 12:58:55'),
(403, '2017-11-25', 'Antipasto de Atún 500G (C)', 'PRESINTO TAPA DE 500GR', '4.0000', '2017-11-25 12:58:45', '2017-11-25 12:58:55'),
(404, '2017-11-25', 'Antipasto de Atún 500G (C)', 'PLÁSTICO TERMOENCOJIBLE', '3.0000', '2017-11-25 12:58:45', '2017-11-25 12:58:55'),
(405, '2017-11-25', 'Antipasto de Atún 500G (C)', 'BANDEJA DE CARTÓN (12 FCOS 500CC)', '2.0000', '2017-11-25 12:58:45', '2017-11-25 12:58:55'),
(406, '2017-11-25', 'Antipasto de Atún 500G (C)', 'GRAPAS PARA CARTON', '1.0000', '2017-11-25 12:58:45', '2017-11-25 12:58:55'),
(407, '2017-11-25', 'Antipasto de Atún 500G (C)', 'PEGAMENTO PARA CARTÓN', '2.0000', '2017-11-25 12:58:45', '2017-11-25 12:58:55'),
(408, '2017-11-25', 'Antipasto de Atún 500G (C)', 'ELECTRICIDAD', '3.0000', '2017-11-25 12:58:45', '2017-11-25 12:58:55'),
(409, '2017-11-24', 'Antipasto de Atún 500G (C)', 'ETIQUETA FRASCO DE 500GR', '5.0000', '2017-11-25 13:10:20', '2017-11-25 13:10:30'),
(410, '2017-11-24', 'Antipasto de Atún 500G (C)', 'PRESINTO TAPA DE 500GR', '4.0000', '2017-11-25 13:10:20', '2017-11-25 13:10:30'),
(411, '2017-11-24', 'Antipasto de Atún 500G (C)', 'PLÁSTICO TERMOENCOJIBLE', '3.0000', '2017-11-25 13:10:20', '2017-11-25 13:10:30'),
(412, '2017-11-24', 'Antipasto de Atún 500G (C)', 'BANDEJA DE CARTÓN (12 FCOS 500CC)', '2.0000', '2017-11-25 13:10:20', '2017-11-25 13:10:30'),
(413, '2017-11-24', 'Antipasto de Atún 500G (C)', 'GRAPAS PARA CARTON', '1.0000', '2017-11-25 13:10:20', '2017-11-25 13:10:30'),
(414, '2017-11-24', 'Antipasto de Atún 500G (C)', 'PEGAMENTO PARA CARTÓN', '2.0000', '2017-11-25 13:10:20', '2017-11-25 13:10:30'),
(415, '2017-11-24', 'Antipasto de Atún 500G (C)', 'ELECTRICIDAD', '3.0000', '2017-11-25 13:10:20', '2017-11-25 13:10:30'),
(416, '2017-11-23', 'Mermelada de Coleto (A)', 'ALCOHOL', '5.0000', '2017-11-25 15:51:30', '2017-11-25 15:51:35'),
(417, '2017-11-23', 'Mermelada de Coleto (A)', 'CEBOLLÍN', '4.0000', '2017-11-25 15:51:30', '2017-11-25 15:51:35'),
(418, '2017-11-23', 'Mermelada de Coleto (A)', 'COLETO', '5.0000', '2017-11-25 15:51:30', '2017-11-25 15:51:35'),
(419, '2017-11-23', 'Mermelada de Coleto (A)', 'ELECTRICIDAD', '4.0000', '2017-11-25 15:51:30', '2017-11-25 15:51:35'),
(420, '2017-11-24', 'Mermelada de Coleto (B)', 'ATÚN ', '5.0000', '2017-11-25 16:06:19', '2017-11-25 16:06:24'),
(421, '2017-11-24', 'Mermelada de Coleto (B)', 'PIMIENTA', '4.0000', '2017-11-25 16:06:19', '2017-11-25 16:06:24'),
(422, '2017-11-25', 'Mermelada de Coleto (B)', 'ATÚN ', '3.0000', '2017-11-25 16:07:52', '2017-11-25 16:07:57'),
(423, '2017-11-25', 'Mermelada de Coleto (B)', 'PIMIENTA', '2.0000', '2017-11-25 16:07:52', '2017-11-25 16:07:57'),
(424, '2017-11-26', 'Mermelada de Coleto de 12 unidades (C)', 'PERTINA', '4.0000', '2017-11-25 16:15:05', '2017-11-25 16:15:21'),
(425, '2017-11-26', 'Mermelada de Coleto de 12 unidades (C)', 'PLANTA ELECTRICA', '3.0000', '2017-11-25 16:15:05', '2017-11-25 16:15:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salarios`
--

CREATE TABLE IF NOT EXISTS `salarios` (
`id` int(10) unsigned NOT NULL,
  `sal_mensual` decimal(25,4) NOT NULL,
  `unidad_tributaria` int(11) NOT NULL,
  `cant_cesta_ticket` int(11) NOT NULL,
  `salario_integral` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `salarios`
--

INSERT INTO `salarios` (`id`, `sal_mensual`, `unidad_tributaria`, `cant_cesta_ticket`, `salario_integral`, `created_at`, `updated_at`) VALUES
(1, '4251.4000', 300, 21, '17623.6700', NULL, '2017-11-24 10:38:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `privilegio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `privilegio`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Andres Vega', 'andres_vega93@hotmail.com', '$2y$10$9EhJlqnSNAK3F8tvvWU44ukQqdTPEUwBSzAhBdlyZcTk31Xa4.x.m', 'admin', 'd48ArzbEO5Y9BdAXBw3onNQraPLhWiRyCOKw941wyvCg0R4v8lvFAohhYAeE', '2017-10-11 06:32:19', '2017-11-14 15:16:44'),
(5, 'prueba3', 'prueba3@tst.com', '$2y$10$9Ge8iisKXVWRk0ycO3.xE.fZ.YZXhziw8k3U/4qLiCltsxIHOjv0K', 'secretaria', 'aItB4PSBQonSSzYCgDj6eh5E4PWgwAgwFpGMcfihy88iia8ZfQSqNofaBDFf', '2017-10-11 07:59:41', '2017-11-07 01:11:16'),
(7, 'Carlos', 'carlos@gmail.com', '$2y$10$9uwn8GSSYhLxzaSZnhawBu8f0sqBvgRRYHu8yQpI7/pILxLjx.WVK', 'admin', 'ExDDv98oudjXWskR26I5QkbOewRumyiGCLZaTQBmdyb3lGKsrBn48aPYmSTp', '2017-10-14 11:48:38', '2017-10-26 20:57:23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aumentos`
--
ALTER TABLE `aumentos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
 ADD PRIMARY KEY (`id`), ADD KEY `cardexmp_ibfk_1` (`mp_codigo`), ADD KEY `cardexmp_ibfk_2` (`comp_doc`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `comp_doc` (`comp_doc`);

--
-- Indices de la tabla `costofijos`
--
ALTER TABLE `costofijos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dependencias`
--
ALTER TABLE `dependencias`
 ADD PRIMARY KEY (`id`), ADD KEY `dependencias_ibfk_3` (`dep_padre`), ADD KEY `dependencias_ibfk_4` (`dep_hijo`), ADD KEY `dependencias_ibfk_2` (`dep_produccion`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
 ADD PRIMARY KEY (`id`), ADD KEY `ing_FK1` (`rec_nombre`), ADD KEY `ing_FK2` (`ing_ingrediente`);

--
-- Indices de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mp_codigo` (`mp_codigo`);

--
-- Indices de la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `par_nombre` (`par_nombre`), ADD UNIQUE KEY `par_codigo` (`par_codigo`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
 ADD KEY `password_resets_email_index` (`email`), ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
 ADD PRIMARY KEY (`id`), ADD KEY `produccion_ibfk_1` (`rec_nombre`);

--
-- Indices de la tabla `producciona`
--
ALTER TABLE `producciona`
 ADD PRIMARY KEY (`id`), ADD KEY `producciona_ibfk_1` (`rec_nombre`);

--
-- Indices de la tabla `produccionb`
--
ALTER TABLE `produccionb`
 ADD PRIMARY KEY (`id`), ADD KEY `produccionb_ibfk_1` (`rec_nombre`);

--
-- Indices de la tabla `produccionc`
--
ALTER TABLE `produccionc`
 ADD PRIMARY KEY (`id`), ADD KEY `produccionc_ibfk_1` (`rec_nombre`);

--
-- Indices de la tabla `proveedors`
--
ALTER TABLE `proveedors`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `prov_codigo` (`prov_codigo`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `recetas_rec_nombre_unique` (`rec_nombre`);

--
-- Indices de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salarios`
--
ALTER TABLE `salarios`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aumentos`
--
ALTER TABLE `aumentos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `costofijos`
--
ALTER TABLE `costofijos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=168;
--
-- AUTO_INCREMENT de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT de la tabla `producciona`
--
ALTER TABLE `producciona`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `produccionb`
--
ALTER TABLE `produccionb`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `produccionc`
--
ALTER TABLE `produccionc`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=426;
--
-- AUTO_INCREMENT de la tabla `salarios`
--
ALTER TABLE `salarios`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
ADD CONSTRAINT `cardexmp_ibfk_1` FOREIGN KEY (`mp_codigo`) REFERENCES `parametros` (`par_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `cardexmp_ibfk_2` FOREIGN KEY (`comp_doc`) REFERENCES `compras` (`comp_doc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `dependencias`
--
ALTER TABLE `dependencias`
ADD CONSTRAINT `dependencias_ibfk_2` FOREIGN KEY (`dep_produccion`) REFERENCES `produccion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `dependencias_ibfk_3` FOREIGN KEY (`dep_padre`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `dependencias_ibfk_4` FOREIGN KEY (`dep_hijo`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
ADD CONSTRAINT `ing_FK1` FOREIGN KEY (`rec_nombre`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ing_FK2` FOREIGN KEY (`ing_ingrediente`) REFERENCES `parametros` (`par_nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
ADD CONSTRAINT `fk_mat_prim_param_1` FOREIGN KEY (`mp_codigo`) REFERENCES `parametros` (`par_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
ADD CONSTRAINT `produccion_ibfk_1` FOREIGN KEY (`rec_nombre`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producciona`
--
ALTER TABLE `producciona`
ADD CONSTRAINT `producciona_ibfk_1` FOREIGN KEY (`rec_nombre`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `produccionb`
--
ALTER TABLE `produccionb`
ADD CONSTRAINT `produccionb_ibfk_1` FOREIGN KEY (`rec_nombre`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `produccionc`
--
ALTER TABLE `produccionc`
ADD CONSTRAINT `produccionc_ibfk_1` FOREIGN KEY (`rec_nombre`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
