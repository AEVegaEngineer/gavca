-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2017 a las 19:08:53
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cardexmp`
--

INSERT INTO `cardexmp` (`id`, `mp_codigo`, `comp_doc`, `car_valor_anterior`, `car_valor_actual`, `created_at`, `updated_at`) VALUES
(15, 'MI00003', '25468543465', '0.0000', '3.0000', '2017-11-29 14:23:29', '2017-11-29 14:23:29'),
(16, 'MI00007', '25468543465', '0.0000', '4.0000', '2017-11-29 14:23:29', '2017-11-29 14:23:29'),
(17, 'MI00016', '25468543465', '7.0000', '9.0000', '2017-11-29 14:23:29', '2017-11-29 14:23:29'),
(18, 'MI00011', '25468543465', '2.0000', '5.0000', '2017-11-29 14:23:30', '2017-11-29 14:23:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `comp_doc`, `comp_proveedor`, `comp_fecha`, `comp_monto`, `created_at`, `updated_at`) VALUES
(21, '25468543465', 'PROV01', '2017-11-29 14:11:35', '3552.1901', '2017-11-29 14:22:15', '2017-11-29 14:23:29');

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
  `requerimiento` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiasprimas`
--

INSERT INTO `materiasprimas` (`id`, `mp_codigo`, `mp_cantidad`, `created_at`, `updated_at`) VALUES
(6, 'MI00013', 6, '2017-11-29 03:03:04', '2017-11-29 03:13:25'),
(7, 'MI00008', 2, '2017-11-29 03:03:04', '2017-11-29 03:03:04'),
(8, 'MI00016', 9, '2017-11-29 03:03:04', '2017-11-29 14:23:30'),
(9, 'MI00011', 5, '2017-11-29 03:13:25', '2017-11-29 14:23:30'),
(10, 'MI00004', 4, '2017-11-29 03:13:26', '2017-11-29 03:13:26'),
(11, 'MI00018', 3, '2017-11-29 03:13:26', '2017-11-29 03:13:26'),
(12, 'MI00007', 4, '2017-11-29 14:23:29', '2017-11-29 14:23:29'),
(13, 'MI00003', 3, '2017-11-29 14:23:29', '2017-11-29 14:23:29');

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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `par_codigo`, `par_nombre`, `par_unidad`, `par_costo`, `par_observacion`, `created_at`, `updated_at`) VALUES
(7, 'MP00000', 'ATÚN ', 'KILO', '64457.0000', '', '2017-10-14 06:10:50', '2017-11-23 16:34:26'),
(9, 'MP00001', 'VAINITA', 'KILO', '4000.0000', '', '2017-10-14 06:11:31', '2017-11-23 16:34:55'),
(10, 'MP00002', 'ZANAHORIA', 'KILO', '5000.0000', '', '2017-10-14 06:11:49', '2017-11-23 16:35:05'),
(14, 'MP00003', 'COLIFLOR', 'KILO', '4000.0000', '', '2017-10-14 10:10:19', '2017-11-23 16:35:12'),
(15, 'MP00004', 'CEBOLLÍN', 'KILO', '4500.0000', '', '2017-10-14 10:11:07', '2017-11-23 16:35:38'),
(16, 'MP00005', 'CEBOLLA', 'KILO', '4000.0000', '', '2017-10-14 10:11:21', '2017-11-23 16:35:30'),
(17, 'MP00006', 'CÉLERI (APIO ESPAÑA)', 'KILO', '4500.0000', '', '2017-10-14 10:11:38', '2017-11-23 16:35:22'),
(18, 'MP00007', 'AJOPORRO', 'KILO', '4500.0000', '', '2017-10-14 10:11:53', '2017-11-23 16:35:46'),
(19, 'MP00008', 'PIMENTÓN', 'KILO', '6000.0000', '', '2017-10-14 10:12:08', '2017-11-23 16:35:57'),
(20, 'MP00009', 'ACEITUNA', 'KILO', '35000.0000', '', '2017-10-14 10:12:21', '2017-11-23 16:36:04'),
(21, 'MP00010', 'SALSA DE TOMATE', 'KILO', '13000.0000', '', '2017-10-14 10:12:44', '2017-11-23 16:36:16'),
(22, 'MI29703', 'AZÚCAR', 'KILO', '13600.0000', '', '2017-10-14 10:12:58', '2017-11-23 16:36:30'),
(23, 'MI00002', 'SAL', 'KILO', '1000.0000', '', '2017-10-14 10:13:18', '2017-11-23 16:36:43'),
(24, 'MI00003', 'VINAGRE', 'LITRO', '750.0000', '', '2017-10-14 10:13:32', '2017-11-23 16:36:52'),
(25, 'MI00004', 'PIMIENTA', 'GRAMO', '59.5000', '', '2017-10-14 10:13:52', '2017-11-23 16:37:03'),
(26, 'MI00005', 'FRASCO  500 CC', 'UNIDAD', '239.7600', '', '2017-10-14 10:14:08', '2017-11-23 16:37:28'),
(27, 'MI00006', 'ETIQUETA FRASCO DE 500GR', 'UNIDAD', '0.0000', '', '2017-10-14 10:14:22', '2017-10-14 10:14:22'),
(28, 'MI00007', 'PRESINTO TAPA DE 500GR', 'UNIDAD', '0.5000', '', '2017-10-14 10:14:37', '2017-10-14 10:14:37'),
(29, 'MI00008', 'GAS (COSTO 1% DE CONSUMO)', '1%', '163.6400', '', '2017-10-14 10:14:52', '2017-11-23 16:37:53'),
(30, 'MI00009', 'ELECTRICIDAD', 'KWH', '500.0000', '', '2017-10-14 10:15:06', '2017-11-25 20:19:28'),
(31, 'MP23301', 'AGUA', 'UNITARIO E', '0.0000', '', '2017-10-14 10:15:23', '2017-11-23 16:38:10'),
(32, 'MI00011', 'GUANTES DE LATEX RE-USABLES', 'PAR', '335.6300', '', '2017-10-14 10:15:40', '2017-11-23 16:38:25'),
(33, 'MI00012', 'DETERGENTE PARA PISOS', 'LITRO', '12.9200', '', '2017-10-14 10:15:54', '2017-11-23 16:38:35'),
(34, 'MI00013', 'DETERGENTE PARA VAJILLAS', 'LITRO', '2875.0000', '', '2017-10-14 10:16:08', '2017-11-23 16:38:44'),
(35, 'MI00014', 'ALCOHOL', 'LITRO', '3139.0000', '', '2017-10-14 10:16:23', '2017-11-23 16:38:53'),
(36, 'MI00015', 'BOLSA DE BASURA', 'UNIDAD', '261.3300', '', '2017-10-14 10:16:39', '2017-11-23 16:39:02'),
(37, 'MI00016', 'ESPONJA DE LIMPIEZA', 'UNIDAD', '0.0000', '', '2017-10-14 10:16:54', '2017-10-14 10:16:54'),
(38, 'MI00017', 'COLETO', 'UNIDAD', '0.0000', '', '2017-10-14 10:17:10', '2017-10-14 10:17:10'),
(39, 'MI00018', 'FÓSFOROS ', 'C.GRDE', '1.6300', '', '2017-10-14 10:17:22', '2017-11-23 16:39:15'),
(42, 'MP00011', 'TRUCHA AHUMADA', 'KILO', '49.7800', '', '2017-10-14 14:08:08', '2017-10-14 14:26:26'),
(43, 'MP00012', 'ACEITE', 'LITRO', '7500.0000', '', '2017-10-14 23:35:58', '2017-11-23 16:34:42'),
(44, 'MP00013', 'FRESA', 'KILO', '12000.0000', 'COSTO FALSO', '2017-10-15 00:24:43', '2017-10-15 00:27:21'),
(49, 'MI00019', 'TAPA DE 63mm, 500cc, TWIST BLANCA', 'UNIDAD', '661.5000', '', '2017-10-31 21:03:35', '2017-11-23 16:37:42'),
(80, 'MP40753', 'PERTINA', 'LITRO', '2000.0000', '', '2017-11-15 07:22:36', '2017-11-15 07:29:09'),
(81, 'MI57453', 'PLANTA ELECTRICA', 'UNIDAD', '100000.0000', 'Ta barata', '2017-11-23 09:36:16', '2017-11-23 09:36:16'),
(82, 'MI34730', 'PLÁSTICO TERMOENCOJIBLE', 'KILO', '10000.0000', '', '2017-11-23 17:37:08', '2017-11-25 21:17:34'),
(83, 'MI22626', 'BANDEJA DE CARTÓN (12 FCOS 500CC)', 'UNIDAD', '0.0000', '', '2017-11-23 17:38:17', '2017-11-23 17:38:17'),
(84, 'MI96863', 'GRAPAS PARA CARTON', 'UNIDAD', '20.0000', '', '2017-11-23 17:38:38', '2017-11-23 17:38:38'),
(85, 'MI70455', 'PEGAMENTO PARA CARTÓN', 'CC', '0.0000', '', '2017-11-23 17:39:04', '2017-11-23 17:39:04'),
(86, 'MI94454', 'FRASCO 300CC', 'UNIDAD', '250.0000', '', '2017-11-25 20:46:10', '2017-11-25 20:46:10'),
(87, 'MI39932', 'TAPA ALUMINIO 300CC', 'UNIDAD', '100.0000', '', '2017-11-25 20:48:19', '2017-11-25 20:48:19'),
(88, 'MI90549', 'BANDEJA DE CARTON DE 12 FCO 300CC', 'UNIDAD', '250.0000', '', '2017-11-25 21:09:10', '2017-11-25 21:09:10'),
(89, 'MI16405', 'ETIQUETA PIMENTÓN AGRIDULCE 330G', 'UNIDAD', '200.0000', '', '2017-11-25 21:10:49', '2017-11-25 21:10:49'),
(90, 'MI17377', 'CLAVITOS DE ESPECIAS', 'KILO', '100000.0000', '', '2017-11-25 22:03:15', '2017-11-25 22:05:20'),
(92, 'MP00014', 'ALCAPARRAS', 'KILO', '20000.0000', '', '2017-11-29 16:55:23', '2017-11-29 16:55:23'),
(93, 'MP00015', 'LECHOZA', 'KILO', '10000.0000', '', '2017-11-29 16:55:53', '2017-11-29 16:55:53'),
(94, 'MI00000', 'COMPUTADORA', 'UNIDAD', '8000000.0000', '', '2017-11-29 16:56:29', '2017-11-29 16:56:29');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `prov_codigo`, `prov_nombre`, `prov_rif`, `prov_direccion`, `prov_contacto`, `prov_condiciones`, `prov_retencion`, `prov_saldo`, `prov_cred_o_cont`, `created_at`, `updated_at`) VALUES
(9, 'PROV01', 'Primer Proveedor', 'J-365473764', 'Av. Las Americas, 1 Cuadra abajo del GRIM', '02744173436, gonzasupermercado@gmail.com', 'Credito de vez en cuando, contado el resto del tiempo', 0, '0.0000', 'contado', '2017-11-29 02:41:19', '2017-11-29 02:41:19'),
(10, 'PROV02', 'Gonza', 'J-365473764', 'Av. Las Americas, 1 Cuadra abajo del GRIM', '02744173436, gonzasupermercado@gmail.com', 'Credito de vez en cuando, contado el resto del tiempo', 0, '0.0000', 'contado', '2017-11-29 03:16:23', '2017-11-29 03:16:23');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimientos`
--

CREATE TABLE IF NOT EXISTS `requerimientos` (
`id` int(10) unsigned NOT NULL,
  `req_fecha` date DEFAULT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `req_ingrediente` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `req_total` decimal(25,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, '4251.4000', 300, 21, '17623.6700', NULL, '2017-11-25 20:34:13');

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
 ADD PRIMARY KEY (`id`), ADD KEY `requerimientos_ibfk_1` (`rec_nombre`), ADD KEY `requerimientos_ibfk_2` (`req_ingrediente`);

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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `costofijos`
--
ALTER TABLE `costofijos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `producciona`
--
ALTER TABLE `producciona`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `produccionb`
--
ALTER TABLE `produccionb`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `produccionc`
--
ALTER TABLE `produccionc`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
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

--
-- Filtros para la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
ADD CONSTRAINT `requerimientos_ibfk_1` FOREIGN KEY (`rec_nombre`) REFERENCES `produccion` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `requerimientos_ibfk_2` FOREIGN KEY (`req_ingrediente`) REFERENCES `parametros` (`par_nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
