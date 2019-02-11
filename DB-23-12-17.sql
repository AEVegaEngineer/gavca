-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-12-2017 a las 19:02:24
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cardexmp`
--

INSERT INTO `cardexmp` (`id`, `mp_codigo`, `comp_doc`, `car_valor_anterior`, `car_valor_actual`, `created_at`, `updated_at`) VALUES
(1, 'MI00000', '25468543460', '0.0000', '20.0000', '2017-12-10 04:57:46', '2017-12-10 04:57:46'),
(2, 'MI00001', '25468543460', '0.0000', '2.0000', '2017-12-10 04:57:46', '2017-12-10 04:57:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `comp_doc`, `comp_proveedor`, `comp_fecha`, `comp_monto`, `created_at`, `updated_at`) VALUES
(61, '25468543460', 'PROV01', '2017-12-10 16:53:02', '1809400.0000', '2017-12-10 04:56:16', '2017-12-10 04:57:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dependencias`
--

INSERT INTO `dependencias` (`id`, `dep_padre`, `dep_hijo`, `dep_produccion`, `requerimiento`, `created_at`, `updated_at`) VALUES
(3, 'EJEMPLO RECETA B', 'EJEMPLO RECETA A', 32, 10, '2017-12-18 08:55:11', '2017-12-18 08:56:23'),
(4, 'EJEMPLO RECETA B', 'EJEMPLO RECETA A 2', 33, 10, '2017-12-18 08:55:14', '2017-12-18 08:56:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `rec_nombre`, `ing_ingrediente`, `created_at`, `updated_at`) VALUES
(19, 'EJEMPLO RECETA A', 'ACEITE', '2017-12-17 08:40:09', '2017-12-17 08:40:09'),
(20, 'EJEMPLO RECETA A', 'ACEITUNAS', '2017-12-17 08:40:13', '2017-12-17 08:40:13'),
(21, 'EJEMPLO RECETA A', 'ÁCIDO CÍTRICO', '2017-12-17 08:40:15', '2017-12-17 08:40:15'),
(22, 'EJEMPLO RECETA A 2', 'AJOPORRO', '2017-12-17 08:40:21', '2017-12-17 08:40:21'),
(23, 'EJEMPLO RECETA A 2', 'ALBAHACA', '2017-12-17 08:40:24', '2017-12-17 08:40:24'),
(24, 'EJEMPLO RECETA A 2', 'ALCOHOL', '2017-12-17 08:40:28', '2017-12-17 08:40:28'),
(25, 'EJEMPLO RECETA B', 'ACEITE', '2017-12-18 08:18:56', '2017-12-18 08:18:56'),
(26, 'EJEMPLO RECETA B', 'ACEITUNAS', '2017-12-18 08:18:59', '2017-12-18 08:18:59');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiasprimas`
--

INSERT INTO `materiasprimas` (`id`, `mp_codigo`, `mp_cantidad`, `created_at`, `updated_at`) VALUES
(1, 'MI00001', 2, '2017-12-10 04:57:46', '2017-12-10 04:57:46'),
(2, 'MI00000', 20, '2017-12-10 04:57:46', '2017-12-10 04:57:46');

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
  `par_cost_updated` timestamp NULL DEFAULT NULL,
  `par_default` int(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `par_codigo`, `par_nombre`, `par_unidad`, `par_costo`, `par_observacion`, `par_cost_updated`, `par_default`, `created_at`, `updated_at`) VALUES
(98, 'MI00000', 'ACEITE', 'LITRO', '33000.0000', 'ACTUALIZADO AL 02/11/2017', '2017-12-18 11:03:50', 0, '2017-12-02 22:17:39', '2017-12-18 11:03:50'),
(99, 'MI00001', 'ACEITUNAS', 'KILO', '500000.0000', 'ACTUALIZADO AL 30/11/2017 ESPECULATIVO', '2017-12-18 11:04:23', 0, '2017-12-02 22:19:23', '2017-12-18 11:04:23'),
(100, 'MP00000', 'AJOPORRO', 'KILO', '45000.0000', 'ACTUALIZADO AL 29/11201', NULL, 0, '2017-12-02 22:24:43', '2017-12-02 22:24:43'),
(101, 'MI00002', 'ÁCIDO CÍTRICO', 'KILO', '9000.0000', 'ACTUALIZADO AL 22/02/2017', NULL, 0, '2017-12-02 22:26:53', '2017-12-09 21:19:27'),
(102, 'MP00001', 'ALBAHACA', 'KILO', '4000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, '2017-12-02 22:35:18', '2017-12-02 22:35:18'),
(103, 'MI00003', 'ALCOHOL', 'LITRO', '3139.0000', 'ACTUALIZADO AL 25/01/2017', NULL, 0, '2017-12-02 22:39:43', '2017-12-04 21:56:12'),
(104, 'MI00004', 'ALMIDÓN DE MAÍZ (MAICINA) ', 'KILO', '55555.5600', 'ACTUALIZADO AL 29/11/2017', NULL, 0, '2017-12-02 22:43:57', '2017-12-02 22:43:57'),
(105, 'MI00005', 'ATÚN ENLATADO', 'KILO', '86981.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, '2017-12-03 17:19:18', '2017-12-03 17:19:18'),
(106, 'MP00002', 'ATÚN FRESCO', 'KILO', '0.0000', '', NULL, 0, '2017-12-03 17:22:12', '2017-12-03 17:22:12'),
(107, 'MI00006', 'AZÚCAR', 'KILO', '13600.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, '2017-12-03 17:24:14', '2017-12-03 17:24:14'),
(108, 'MI00007', 'BANDEJA CARTÓN 12x500cc', 'UNIDAD', '500.0000', 'COSTO ESPECULATIVO', NULL, 0, '2017-12-03 17:29:49', '2017-12-03 17:29:49'),
(109, 'MI00008', 'BANDEJA CARTÓN 12x300cc', 'UNIDAD', '500.0000', 'COSTO ESPECULATIVO', NULL, 0, '2017-12-03 17:31:42', '2017-12-03 17:31:42'),
(110, 'MI00009', 'BANDEJA CARTÓN 6x300cc', 'UNIDAD', '300.0000', 'COSTO ESPECULATIVO', NULL, 0, '2017-12-03 17:32:42', '2017-12-03 17:32:42'),
(111, 'MI00010', 'BANDEJA CARTÓN 24x200cc', 'UNIDAD', '600.0000', 'COSTO ESPECULATIVO', NULL, 0, '2017-12-03 17:34:19', '2017-12-03 17:34:19'),
(113, 'MP00003', 'CEBOLLA', 'KILO', '30000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, '2017-12-03 17:45:26', '2017-12-03 17:45:26'),
(117, 'MP00005', 'VAINITA', 'KILO', '6000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, '2017-12-04 21:49:07', '2017-12-04 21:49:07'),
(118, 'MP00006', 'ZANAHORIA ', 'KILO', '6400.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, '2017-12-04 21:51:43', '2017-12-04 21:51:43'),
(119, 'MP00007', 'PIMENTÓN', 'KILO', '9550.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, '2017-12-04 21:52:27', '2017-12-04 21:52:27'),
(120, 'MP00008', 'COLIFLOR', 'KILO', '6000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, '2017-12-04 21:53:19', '2017-12-04 21:53:19'),
(121, 'MP00009', 'CÉLERI (APIO ESPAÑA)', 'KILO', '4500.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, '2017-12-04 21:54:09', '2017-12-04 21:54:09'),
(122, 'MP00010', 'CEBOLLÍN', 'KILO', '2500.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, '2017-12-04 21:54:34', '2017-12-04 21:54:34'),
(123, 'MI00011', 'SAL', 'KILO', '10000.0000', 'PRECIO INVENTADO', NULL, 0, '2017-12-10 18:41:38', '2017-12-10 18:41:38'),
(124, 'MI00012', 'GAS', '% DE LA CARGA', '20000.0000', '', NULL, 0, '2017-12-10 18:43:21', '2017-12-10 18:43:21'),
(125, 'MI00013', 'FRASCO 500CC', 'UNIDAD', '3000.0000', 'COSTO INVENTADO', NULL, 1, '2017-12-10 18:45:39', '2017-12-15 23:09:45'),
(126, 'MI00014', 'PRESINTO FRASCO 500cc', 'UNIDAD', '1000.0000', 'COSTO INVENTADO', NULL, 1, '2017-12-10 18:47:12', '2017-12-15 23:09:55'),
(127, 'MI00015', 'ETIQUETA ANTIPASTO ATÚN 470G', 'UNIDAD', '2500.0000', 'PRECIO INVENTADO', NULL, 1, '2017-12-10 18:48:47', '2017-12-15 23:10:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id`, `pro_fecha`, `rec_nombre`, `pro_etapa`, `pro_produccion`, `pro_costo`, `pro_mano_obra`, `created_at`, `updated_at`) VALUES
(32, '2017-12-01', 'EJEMPLO RECETA A', 'PA', 10, '215683.3800', '2.0000', '2017-12-18 08:53:04', '2017-12-18 09:11:03'),
(33, '2017-12-01', 'EJEMPLO RECETA A 2', 'PA', 15, '10830.7300', '2.0000', '2017-12-18 08:53:28', '2017-12-18 09:10:55'),
(34, '2017-12-02', 'EJEMPLO RECETA A', 'PA', 0, NULL, '2.0000', '2017-12-18 08:56:23', '2017-12-18 08:56:23'),
(35, '2017-12-02', 'EJEMPLO RECETA A 2', 'PA', 5, NULL, '2.0000', '2017-12-18 08:56:23', '2017-12-18 09:10:15'),
(36, '2017-12-02', 'EJEMPLO RECETA B', 'PB', 10, '766722.2200', '4.0000', '2017-12-18 08:56:24', '2017-12-18 11:15:35');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producciona`
--

INSERT INTO `producciona` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(3, 'EJEMPLO RECETA A', 0, '2017-12-18 08:53:04', '2017-12-18 08:56:23'),
(4, 'EJEMPLO RECETA A 2', 5, '2017-12-18 08:53:28', '2017-12-18 08:56:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccionb`
--

INSERT INTO `produccionb` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(2, 'EJEMPLO RECETA B', 10, '2017-12-18 08:56:23', '2017-12-18 08:56:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `prov_codigo`, `prov_nombre`, `prov_rif`, `prov_direccion`, `prov_contacto`, `prov_condiciones`, `prov_retencion`, `prov_saldo`, `prov_cred_o_cont`, `created_at`, `updated_at`) VALUES
(2, 'PROV01', 'Proveedor', 'J287327', 'ashda', 'sajhda', 'asjdhas', 1, '0.0000', 'credito', '2017-12-04 18:57:53', '2017-12-04 18:57:53');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `rec_nombre`, `rec_activo`, `rec_proc`, `created_at`, `updated_at`) VALUES
(5, 'EJEMPLO RECETA A', 'si', 'PA', '2017-12-17 08:35:09', '2017-12-17 08:35:09'),
(6, 'EJEMPLO RECETA A 2', 'si', 'PA', '2017-12-17 08:35:21', '2017-12-17 08:35:21'),
(7, 'EJEMPLO RECETA B', 'si', 'PB', '2017-12-17 08:35:37', '2017-12-17 08:35:37');

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
  `req_default` int(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requerimientos`
--

INSERT INTO `requerimientos` (`id`, `req_fecha`, `rec_nombre`, `req_ingrediente`, `req_total`, `req_default`, `created_at`, `updated_at`) VALUES
(31, '2017-12-01', 'EJEMPLO RECETA A', 'ACEITE', '2.0000', 0, '2017-12-18 08:52:59', '2017-12-18 08:53:04'),
(32, '2017-12-01', 'EJEMPLO RECETA A', 'ACEITUNAS', '4.0000', 0, '2017-12-18 08:52:59', '2017-12-18 08:53:04'),
(33, '2017-12-01', 'EJEMPLO RECETA A', 'ÁCIDO CÍTRICO', '6.0000', 0, '2017-12-18 08:52:59', '2017-12-18 08:53:04'),
(34, '2017-12-01', 'EJEMPLO RECETA A 2', 'AJOPORRO', '2.0000', 0, '2017-12-18 08:53:24', '2017-12-18 08:53:28'),
(35, '2017-12-01', 'EJEMPLO RECETA A 2', 'ALBAHACA', '4.0000', 0, '2017-12-18 08:53:24', '2017-12-18 08:53:28'),
(36, '2017-12-01', 'EJEMPLO RECETA A 2', 'ALCOHOL', '6.0000', 0, '2017-12-18 08:53:24', '2017-12-18 08:53:28'),
(37, '2017-12-01', 'EJEMPLO RECETA B', 'ACEITE', NULL, 0, '2017-12-18 08:55:01', '2017-12-18 08:55:01'),
(38, '2017-12-01', 'EJEMPLO RECETA B', 'ACEITUNAS', NULL, 0, '2017-12-18 08:55:01', '2017-12-18 08:55:01'),
(39, '2017-12-02', 'EJEMPLO RECETA B', 'ACEITE', '10.0000', 0, '2017-12-18 08:55:42', '2017-12-18 08:56:23'),
(40, '2017-12-02', 'EJEMPLO RECETA B', 'ACEITUNAS', '10.0000', 0, '2017-12-18 08:55:42', '2017-12-18 08:56:23');

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
(1, '4251.4000', 300, 21, '17623.6700', NULL, '2017-12-18 11:17:19');

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
(1, 'Andres Vega', 'andres_vega93@hotmail.com', '$2y$10$9EhJlqnSNAK3F8tvvWU44ukQqdTPEUwBSzAhBdlyZcTk31Xa4.x.m', 'admin', 'F1eulJJZpqmQ3hVBI26LVqE9pZHyb8VywVSjeG2v6rWlaG6Ju0Xswb55Y8ib', '2017-10-11 06:32:19', '2017-12-05 18:51:21'),
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
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `par_nombre` (`par_nombre`), ADD UNIQUE KEY `par_codigo` (`par_codigo`), ADD KEY `par_default` (`par_default`);

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
 ADD PRIMARY KEY (`id`), ADD KEY `requerimientos_ibfk_1` (`rec_nombre`), ADD KEY `requerimientos_ibfk_2` (`req_ingrediente`), ADD KEY `requerimientos_ibfk_3` (`req_default`);

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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT de la tabla `costofijos`
--
ALTER TABLE `costofijos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `producciona`
--
ALTER TABLE `producciona`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `produccionb`
--
ALTER TABLE `produccionb`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `produccionc`
--
ALTER TABLE `produccionc`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
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
ADD CONSTRAINT `requerimientos_ibfk_1` FOREIGN KEY (`rec_nombre`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `requerimientos_ibfk_2` FOREIGN KEY (`req_ingrediente`) REFERENCES `parametros` (`par_nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `requerimientos_ibfk_3` FOREIGN KEY (`req_default`) REFERENCES `parametros` (`par_default`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
