-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2017 a las 12:14:48
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aumentos`
--

INSERT INTO `aumentos` (`id`, `aum_aumento`, `aum_descripcion`, `created_at`, `updated_at`) VALUES
(27, '110.00', 'Eneroo 2018', '2017-11-07 01:42:22', '2017-11-07 01:12:22'),
(28, '100.00', 'Febreroo 2017', '2017-11-07 01:42:35', '2017-11-07 01:12:35');

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
(1, 'ALQUILER PLANTA MOCOTIES', '61002.00', '2017-10-22 05:41:45', '2017-11-07 01:14:05'),
(2, 'ALQUILER DEPÓSITO Y OFICINA', '100002.00', '2017-10-22 05:44:40', '2017-11-07 01:13:59'),
(3, 'SUELDOS  ADMINISTRATIVOS', '1947082.36', '2017-10-22 05:44:54', '2017-11-07 01:14:10'),
(4, 'HONORARIOS CONTADOR', '60002.00', '2017-10-22 05:45:06', '2017-11-07 01:14:16'),
(5, 'HONORARIOS ABOGADOS (ACTAS)', '8332.33', '2017-10-22 05:45:21', '2017-11-07 01:14:21'),
(6, 'SISTEMA DE ALARMA (SISTEL)', '2.00', '2017-10-22 05:45:34', '2017-11-07 01:14:27'),
(7, 'SUELDO MARINO ROJAS', '325542.00', '2017-10-22 05:45:48', '2017-11-07 01:14:32'),
(9, 'HONORARIOS ASESOSRÍA EN SEGURIDAD INDUSTRIAL', '12002.00', '2017-11-01 01:17:16', '2017-11-07 01:14:38');

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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `rec_nombre`, `ing_ingrediente`, `created_at`, `updated_at`) VALUES
(69, 'Antipasto de Atún 500G (B)', 'ATÚN ', '2017-10-31 21:00:43', '2017-10-31 21:00:43'),
(70, 'Antipasto de Atún 500G (B)', 'ACEITE', '2017-10-31 21:00:50', '2017-10-31 21:00:50'),
(71, 'Antipasto de Atún 500G (B)', 'VAINITA', '2017-10-31 21:00:56', '2017-10-31 21:00:56'),
(72, 'Antipasto de Atún 500G (B)', 'ZANAHORIA', '2017-10-31 21:01:03', '2017-10-31 21:01:03'),
(73, 'Antipasto de Atún 500G (B)', 'COLIFLOR', '2017-10-31 21:01:08', '2017-10-31 21:01:08'),
(74, 'Antipasto de Atún 500G (B)', 'CÉLERI (APIO ESPAÑA)', '2017-10-31 21:01:15', '2017-10-31 21:01:15'),
(75, 'Antipasto de Atún 500G (B)', 'CEBOLLA', '2017-10-31 21:01:21', '2017-10-31 21:01:21'),
(76, 'Antipasto de Atún 500G (B)', 'CEBOLLÍN', '2017-10-31 21:01:27', '2017-10-31 21:01:27'),
(77, 'Antipasto de Atún 500G (B)', 'AJOPORRO', '2017-10-31 21:01:33', '2017-10-31 21:01:33'),
(78, 'Antipasto de Atún 500G (B)', 'PIMENTÓN', '2017-10-31 21:01:39', '2017-10-31 21:01:39'),
(79, 'Antipasto de Atún 500G (B)', 'ACEITUNA', '2017-10-31 21:01:46', '2017-10-31 21:01:46'),
(80, 'Antipasto de Atún 500G (B)', 'SALSA DE TOMATE', '2017-10-31 21:01:53', '2017-10-31 21:01:53'),
(81, 'Antipasto de Atún 500G (B)', 'AZÚCAR', '2017-10-31 21:01:59', '2017-10-31 21:01:59'),
(82, 'Antipasto de Atún 500G (B)', 'SAL', '2017-10-31 21:02:05', '2017-10-31 21:02:05'),
(83, 'Antipasto de Atún 500G (B)', 'VINAGRE', '2017-10-31 21:02:12', '2017-10-31 21:02:12'),
(84, 'Antipasto de Atún 500G (B)', 'PIMIENTA', '2017-10-31 21:02:19', '2017-10-31 21:02:19'),
(85, 'Antipasto de Atún 500G (B)', 'FRASCO  500GR', '2017-10-31 21:02:29', '2017-10-31 21:02:29'),
(86, 'Antipasto de Atún 500G (B)', 'TAPA DE 63mm, 500cc, TWIST BLANCA', '2017-10-31 21:05:47', '2017-10-31 21:05:47'),
(87, 'Antipasto de Atún 500G (B)', 'GAS (COSTO 1% DE CONSUMO)', '2017-10-31 21:05:58', '2017-10-31 21:05:58'),
(88, 'Antipasto de Atún 500G (B)', 'ELECTRICIDAD', '2017-10-31 21:12:40', '2017-10-31 21:12:40'),
(89, 'Antipasto de Atún 500G (B)', 'AGUA', '2017-10-31 21:12:49', '2017-10-31 21:12:49'),
(90, 'Antipasto de Atún 500G (B)', 'GUANTES DE LATEX RE-USABLES', '2017-10-31 21:12:57', '2017-10-31 21:12:57'),
(91, 'Antipasto de Atún 500G (B)', 'DETERGENTE PARA PISOS', '2017-10-31 21:13:08', '2017-10-31 21:13:08'),
(92, 'Antipasto de Atún 500G (B)', 'DETERGENTE PARA VAJILLAS', '2017-10-31 21:13:27', '2017-10-31 21:13:27'),
(93, 'Antipasto de Atún 500G (B)', 'ALCOHOL', '2017-10-31 21:13:41', '2017-10-31 21:13:41'),
(94, 'Antipasto de Atún 500G (B)', 'BOLSA DE BASURA', '2017-10-31 21:13:56', '2017-10-31 21:13:56'),
(95, 'Antipasto de Atún 500G (B)', 'ESPONJA DE LIMPIEZA', '2017-10-31 21:14:10', '2017-10-31 21:14:10'),
(96, 'Antipasto de Atún 500G (B)', 'COLETO', '2017-10-31 21:14:19', '2017-10-31 21:14:19'),
(97, 'Antipasto de Atún 500G (B)', 'FÓSFOROS ', '2017-10-31 21:14:29', '2017-10-31 21:14:29'),
(98, 'Nueva Receta 2', 'ATÚN ', '2017-11-07 01:16:31', '2017-11-07 01:16:31'),
(99, 'Nueva Receta 2', 'VAINITA', '2017-11-07 01:16:34', '2017-11-07 01:16:34'),
(100, 'Nueva Receta 2', 'ZANAHORIA', '2017-11-07 01:16:37', '2017-11-07 01:16:37'),
(101, 'Nueva Receta 2', 'COLIFLOR', '2017-11-07 01:16:40', '2017-11-07 01:16:40'),
(102, 'Nueva Receta 2', 'CEBOLLÍN', '2017-11-07 01:16:43', '2017-11-07 01:16:43');

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
(1, '102.00', '10002.00', '22.23', '62.00', '10002.00', '476.13', '2017-10-11 04:00:00', '2017-11-07 01:13:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE IF NOT EXISTS `parametros` (
`id` int(10) unsigned NOT NULL,
  `par_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `par_unidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `par_costo` decimal(25,4) DEFAULT NULL,
  `par_observacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `par_nombre`, `par_unidad`, `par_costo`, `par_observacion`, `created_at`, `updated_at`) VALUES
(7, 'ATÚN ', 'KILO', '1884.0000', '', '2017-10-14 06:10:50', '2017-10-19 21:45:04'),
(9, 'VAINITA', 'KILO', '3603.0000', '', '2017-10-14 06:11:31', '2017-10-28 05:48:19'),
(10, 'ZANAHORIA', 'KILO', '650.0000', '', '2017-10-14 06:11:49', '2017-10-14 06:11:49'),
(14, 'COLIFLOR', 'KILO', '300.0000', '', '2017-10-14 10:10:19', '2017-10-14 10:10:19'),
(15, 'CEBOLLÍN', 'KILO', '500.0000', '', '2017-10-14 10:11:07', '2017-10-14 10:11:07'),
(16, 'CEBOLLA', 'KILO', '1150.0000', '', '2017-10-14 10:11:21', '2017-10-14 10:11:21'),
(17, 'CÉLERI (APIO ESPAÑA)', 'KILO', '300.0000', '', '2017-10-14 10:11:38', '2017-10-14 10:11:38'),
(18, 'AJOPORRO', 'KILO', '300.0000', '', '2017-10-14 10:11:53', '2017-10-14 10:11:53'),
(19, 'PIMENTÓN', 'KILO', '800.0000', '', '2017-10-14 10:12:08', '2017-10-14 10:12:08'),
(20, 'ACEITUNA', 'KILO', '2000.0000', '', '2017-10-14 10:12:21', '2017-10-14 10:12:21'),
(21, 'SALSA DE TOMATE', 'KILO', '2678.5700', '', '2017-10-14 10:12:44', '2017-10-14 10:12:44'),
(22, 'AZÚCAR', 'KILO', '300.0000', '', '2017-10-14 10:12:58', '2017-10-14 10:12:58'),
(23, 'SAL', 'KILO', '10.0000', '', '2017-10-14 10:13:18', '2017-10-14 10:13:18'),
(24, 'VINAGRE', 'LITRO', '255.0600', '', '2017-10-14 10:13:32', '2017-10-14 10:13:32'),
(25, 'PIMIENTA', 'GRAMO', '20.0000', '', '2017-10-14 10:13:52', '2017-10-14 10:13:52'),
(26, 'FRASCO  500GR', 'UNIDAD', '57.4100', '', '2017-10-14 10:14:08', '2017-10-14 10:14:08'),
(27, 'ETIQUETA FRASCO DE 500GR', 'UNIDAD', '29.2500', '', '2017-10-14 10:14:22', '2017-10-14 10:14:22'),
(28, 'PRESINTO TAPA DE 500GR', 'UNIDAD', '0.5000', '', '2017-10-14 10:14:37', '2017-10-14 10:14:37'),
(29, 'GAS (COSTO 1% DE CONSUMO)', '1%', '92.3100', '', '2017-10-14 10:14:52', '2017-10-14 10:14:52'),
(30, 'ELECTRICIDAD', 'KWH', '0.0000', '', '2017-10-14 10:15:06', '2017-10-14 10:15:06'),
(31, 'AGUA', 'UNITARIO E', '0.0000', '', '2017-10-14 10:15:23', '2017-10-14 10:15:23'),
(32, 'GUANTES DE LATEX RE-USABLES', 'PAR', '335.6300', '', '2017-10-14 10:15:40', '2017-10-14 10:15:40'),
(33, 'DETERGENTE PARA PISOS', 'LITRO', '12.9200', '', '2017-10-14 10:15:54', '2017-10-14 10:15:54'),
(34, 'DETERGENTE PARA VAJILLAS', 'LITRO', '32.0600', '', '2017-10-14 10:16:08', '2017-10-14 10:16:08'),
(35, 'ALCOHOL', 'LITRO', '300.0000', '', '2017-10-14 10:16:23', '2017-10-14 10:16:23'),
(36, 'BOLSA DE BASURA', 'UNIDAD', '49.8400', '', '2017-10-14 10:16:39', '2017-10-14 10:16:39'),
(37, 'ESPONJA DE LIMPIEZA', 'UNIDAD', '0.0000', '', '2017-10-14 10:16:54', '2017-10-14 10:16:54'),
(38, 'COLETO', 'UNIDAD', '0.0000', '', '2017-10-14 10:17:10', '2017-10-14 10:17:10'),
(39, 'FÓSFOROS ', 'C.GRDE', '1.6300', '', '2017-10-14 10:17:22', '2017-10-14 10:17:22'),
(40, 'MANO DE OBRA', 'JORNAL ', '1830.3600', '', '2017-10-14 10:25:53', '2017-10-14 10:25:53'),
(42, 'TRUCHA AHUMADA', 'KILO', '49.7800', '', '2017-10-14 14:08:08', '2017-10-14 14:26:26'),
(43, 'ACEITE', 'LITRO', '1200.0000', '', '2017-10-14 23:35:58', '2017-10-14 23:35:58'),
(44, 'FRESA', 'KILO', '12000.0000', 'COSTO FALSO', '2017-10-15 00:24:43', '2017-10-15 00:27:21'),
(48, 'MESA', 'UNIDAD', '5482.5600', '', '2017-10-28 07:38:54', '2017-10-28 07:38:54'),
(49, 'TAPA DE 63mm, 500cc, TWIST BLANCA', 'UNIDAD', '661.5000', '', '2017-10-31 21:03:35', '2017-10-31 21:03:35'),
(50, 'TABLA 2', 'UNIDAD 2', '14002.0000', 'Cuadrada 2', '2017-11-07 01:15:09', '2017-11-07 01:15:45');

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
  `rec_nombre` varchar(255) NOT NULL,
  `pro_produccion` int(11) NOT NULL,
  `pro_mano_obra` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id`, `pro_fecha`, `rec_nombre`, `pro_produccion`, `pro_mano_obra`, `created_at`, `updated_at`) VALUES
(48, '2017-06-12', 'Antipasto de Atún 500G (B)', 168, '3.0000', '2017-10-31 21:28:41', '2017-11-01 02:14:34'),
(49, '2017-11-06', 'Nueva Receta 2', 123, '2.5000', '2017-11-07 01:17:25', '2017-11-07 01:17:25');

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
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE IF NOT EXISTS `recetas` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rec_activo` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `rec_proc` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `rec_nombre`, `rec_activo`, `rec_proc`, `created_at`, `updated_at`) VALUES
(9, 'Antipasto de Atún 500G (C)', 'si', 'PC', '2017-10-31 20:46:29', '2017-10-31 20:59:33'),
(10, 'Antipasto de Atún 500G (B)', 'si', 'PB', '2017-10-31 20:56:32', '2017-10-31 20:59:25'),
(11, 'Nueva Receta 2', 'no', 'PA', '2017-11-07 01:16:11', '2017-11-07 01:59:32');

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
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requerimientos`
--

INSERT INTO `requerimientos` (`id`, `req_fecha`, `rec_nombre`, `req_ingrediente`, `req_total`, `created_at`, `updated_at`) VALUES
(288, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ATÚN ', '2.9800', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(289, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ACEITE', '1.5000', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(290, '2017-06-12', 'Antipasto de Atún 500G (B)', 'VAINITA', '2.9000', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(291, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ZANAHORIA', '3.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(292, '2017-06-12', 'Antipasto de Atún 500G (B)', 'COLIFLOR', '3.8000', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(293, '2017-06-12', 'Antipasto de Atún 500G (B)', 'CÉLERI (APIO ESPAÑA)', '3.1700', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(294, '2017-06-12', 'Antipasto de Atún 500G (B)', 'CEBOLLA', '3.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(295, '2017-06-12', 'Antipasto de Atún 500G (B)', 'CEBOLLÍN', '3.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(296, '2017-06-12', 'Antipasto de Atún 500G (B)', 'AJOPORRO', '3.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(297, '2017-06-12', 'Antipasto de Atún 500G (B)', 'PIMENTÓN', NULL, '2017-10-31 21:28:41', '2017-10-31 21:28:41'),
(298, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ACEITUNA', '0.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(299, '2017-06-12', 'Antipasto de Atún 500G (B)', 'SALSA DE TOMATE', '2.5000', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(300, '2017-06-12', 'Antipasto de Atún 500G (B)', 'AZÚCAR', '0.3000', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(301, '2017-06-12', 'Antipasto de Atún 500G (B)', 'SAL', '0.1500', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(302, '2017-06-12', 'Antipasto de Atún 500G (B)', 'VINAGRE', '1.5000', '2017-10-31 21:28:41', '2017-10-31 21:33:42'),
(303, '2017-06-12', 'Antipasto de Atún 500G (B)', 'PIMIENTA', '50.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(304, '2017-06-12', 'Antipasto de Atún 500G (B)', 'FRASCO  500GR', '60.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(305, '2017-06-12', 'Antipasto de Atún 500G (B)', 'TAPA DE 63mm, 500cc, TWIST BLANCA', NULL, '2017-10-31 21:28:41', '2017-10-31 21:28:41'),
(306, '2017-06-12', 'Antipasto de Atún 500G (B)', 'GAS (COSTO 1% DE CONSUMO)', '1.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(307, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ELECTRICIDAD', '0.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(308, '2017-06-12', 'Antipasto de Atún 500G (B)', 'AGUA', '0.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(309, '2017-06-12', 'Antipasto de Atún 500G (B)', 'GUANTES DE LATEX RE-USABLES', '4.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(310, '2017-06-12', 'Antipasto de Atún 500G (B)', 'DETERGENTE PARA PISOS', '0.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(311, '2017-06-12', 'Antipasto de Atún 500G (B)', 'DETERGENTE PARA VAJILLAS', '0.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(312, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ALCOHOL', '0.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(313, '2017-06-12', 'Antipasto de Atún 500G (B)', 'BOLSA DE BASURA', '0.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(314, '2017-06-12', 'Antipasto de Atún 500G (B)', 'ESPONJA DE LIMPIEZA', '0.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(315, '2017-06-12', 'Antipasto de Atún 500G (B)', 'COLETO', '0.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(316, '2017-06-12', 'Antipasto de Atún 500G (B)', 'FÓSFOROS ', '0.0000', '2017-10-31 21:28:41', '2017-10-31 21:33:43'),
(317, '2017-11-06', 'Nueva Receta 2', 'ATÚN ', '5.0000', '2017-11-07 01:17:25', '2017-11-07 01:17:54'),
(318, '2017-11-06', 'Nueva Receta 2', 'VAINITA', '3.0000', '2017-11-07 01:17:25', '2017-11-07 01:17:54'),
(319, '2017-11-06', 'Nueva Receta 2', 'ZANAHORIA', '2.0000', '2017-11-07 01:17:25', '2017-11-07 01:17:54'),
(320, '2017-11-06', 'Nueva Receta 2', 'COLIFLOR', '2.0000', '2017-11-07 01:17:25', '2017-11-07 01:17:54'),
(321, '2017-11-06', 'Nueva Receta 2', 'CEBOLLÍN', '2.0000', '2017-11-07 01:17:25', '2017-11-07 01:17:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salarios`
--

CREATE TABLE IF NOT EXISTS `salarios` (
`id` int(10) unsigned NOT NULL,
  `sal_mensual` decimal(25,4) NOT NULL,
  `unidad_tributaria` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `salarios`
--

INSERT INTO `salarios` (`id`, `sal_mensual`, `unidad_tributaria`, `created_at`, `updated_at`) VALUES
(1, '10811.8400', 310, NULL, '2017-11-07 01:11:55');

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
(1, 'Andres Vega', 'andres_vega93@hotmail.com', '$2y$10$9EhJlqnSNAK3F8tvvWU44ukQqdTPEUwBSzAhBdlyZcTk31Xa4.x.m', 'admin', 'JEBNKaxIQJN60NeTcPQyrBXg8jDsLGQ3PcTui2Ht7SKjEUc7XjTCDowD851S', '2017-10-11 06:32:19', '2017-10-29 01:00:07'),
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
-- Indices de la tabla `costofijos`
--
ALTER TABLE `costofijos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
 ADD PRIMARY KEY (`id`), ADD KEY `ing_FK1` (`rec_nombre`), ADD KEY `ing_FK2` (`ing_ingrediente`);

--
-- Indices de la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `par_nombre` (`par_nombre`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
 ADD KEY `password_resets_email_index` (`email`), ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
 ADD PRIMARY KEY (`id`);

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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `costofijos`
--
ALTER TABLE `costofijos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT de la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=322;
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
-- Filtros para la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
ADD CONSTRAINT `ing_FK1` FOREIGN KEY (`rec_nombre`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `ing_FK2` FOREIGN KEY (`ing_ingrediente`) REFERENCES `parametros` (`par_nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
