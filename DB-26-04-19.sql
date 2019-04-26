-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-04-2019 a las 06:42:07
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gavca`
--
CREATE DATABASE IF NOT EXISTS `gavca` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gavca`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aumentos`
--

CREATE TABLE `aumentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `aum_aumento` decimal(5,2) NOT NULL,
  `aum_descripcion` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `id` int(10) UNSIGNED NOT NULL,
  `ban_nombre` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`id`, `ban_nombre`, `created_at`, `updated_at`) VALUES
(1, 'Banco de Venezuela', '2018-01-14 21:37:16', '2018-02-19 17:05:56'),
(4, 'Venezolano de Crédito', '2018-01-14 21:42:04', '2018-01-14 21:42:04'),
(6, 'Banco Bicentenario', '2018-01-14 21:43:03', '2018-01-14 21:43:03'),
(8, 'Banco Banesco', '2018-01-14 21:44:59', '2018-01-14 21:44:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajabanco`
--

CREATE TABLE `cajabanco` (
  `id` int(10) UNSIGNED NOT NULL,
  `cb_entidad` varchar(255) NOT NULL,
  `cb_monto` decimal(25,4) DEFAULT NULL,
  `cb_compra_id` int(10) UNSIGNED DEFAULT NULL,
  `cb_venta_id` int(10) UNSIGNED DEFAULT NULL,
  `cb_debe_haber` enum('DEBE','HABER') DEFAULT NULL,
  `cb_fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cb_saldo` decimal(25,4) NOT NULL,
  `cb_concepto` varchar(255) DEFAULT NULL,
  `cb_activo` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajabanco`
--

INSERT INTO `cajabanco` (`id`, `cb_entidad`, `cb_monto`, `cb_compra_id`, `cb_venta_id`, `cb_debe_haber`, `cb_fecha`, `cb_saldo`, `cb_concepto`, `cb_activo`, `created_at`, `updated_at`) VALUES
(781, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-04-09 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-04-22 03:14:45', '2019-04-22 03:14:45'),
(782, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-04-10 04:00:00', '0.0000', 'Inicio de caja', 1, '2019-04-22 03:14:45', '2019-04-22 03:14:45'),
(783, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-04-09 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-04-22 03:14:45', '2019-04-22 03:14:45'),
(784, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-04-10 04:00:00', '0.0000', 'Inicio de caja', 1, '2019-04-22 03:14:46', '2019-04-22 03:14:46'),
(785, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-04-09 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-04-22 03:14:46', '2019-04-22 03:14:46'),
(786, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-04-10 04:00:00', '0.0000', 'Inicio de caja', 1, '2019-04-22 03:14:46', '2019-04-22 03:14:46'),
(787, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-04-09 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-04-22 03:14:46', '2019-04-22 03:14:46'),
(788, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-04-10 04:00:00', '0.0000', 'Inicio de caja', 1, '2019-04-22 03:14:46', '2019-04-22 03:14:46'),
(789, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-04-09 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-04-22 03:14:46', '2019-04-22 03:14:46'),
(790, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-04-10 04:00:00', '0.0000', 'Inicio de caja', 1, '2019-04-22 03:14:46', '2019-04-22 03:14:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cardexmp`
--

CREATE TABLE `cardexmp` (
  `id` int(10) UNSIGNED NOT NULL,
  `mp_codigo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comp_doc` varchar(255) DEFAULT NULL,
  `car_costo` decimal(25,4) DEFAULT NULL,
  `car_valor_anterior` decimal(25,4) NOT NULL,
  `car_valor_actual` decimal(25,4) NOT NULL,
  `car_alicuota` varchar(255) DEFAULT NULL,
  `car_iva` decimal(25,4) DEFAULT NULL,
  `car_compra_id` int(10) UNSIGNED DEFAULT NULL,
  `car_concepto` varchar(255) DEFAULT NULL,
  `car_fecha` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `cli_codigo` varchar(255) NOT NULL,
  `cli_nombre` varchar(255) NOT NULL,
  `cli_rif` varchar(255) NOT NULL,
  `cli_direccion` varchar(255) NOT NULL,
  `cli_contacto` varchar(255) NOT NULL,
  `cli_condiciones` varchar(255) NOT NULL,
  `cli_saldo` decimal(25,4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `cli_codigo`, `cli_nombre`, `cli_rif`, `cli_direccion`, `cli_contacto`, `cli_condiciones`, `cli_saldo`, `created_at`, `updated_at`) VALUES
(1, 'C00000', 'cliente 1', 'J3782462374', 'askjdhsakd', 'dajkshdjas asudhsaudh ', 'sdjjkhfjksd', '0.0000', '2018-01-11 20:34:13', '2019-04-16 21:12:51'),
(2, 'C00001', 'cliente dos', 'J62626512962', 'Centro Av.5 con Calle 15, Edif. Juan Ramos, Local 2', '04169856865', 'Contado', '0.0000', '2019-04-05 03:40:45', '2019-04-06 23:21:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(10) UNSIGNED NOT NULL,
  `comp_doc` varchar(255) NOT NULL,
  `comp_proveedor` varchar(255) NOT NULL,
  `comp_fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comp_monto` decimal(25,4) DEFAULT NULL,
  `comp_cred_cont` enum('contado','credito') DEFAULT NULL,
  `comp_entidad` varchar(255) DEFAULT NULL,
  `comp_activo` int(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costofijos`
--

CREATE TABLE `costofijos` (
  `id` int(10) UNSIGNED NOT NULL,
  `cf_concepto` varchar(255) NOT NULL,
  `cf_montomes` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `costofijos`
--

INSERT INTO `costofijos` (`id`, `cf_concepto`, `cf_montomes`, `created_at`, `updated_at`) VALUES
(1, 'ALQUILER PLANTA MOCOTIES', '60000.00', '2017-10-22 09:41:45', '2017-11-23 21:33:13'),
(2, 'ALQUILER DEPÓSITO Y OFICINA', '100000.00', '2017-10-22 09:44:40', '2017-11-23 21:33:33'),
(3, 'SUELDOS  ADMINISTRATIVOS', '1947082.36', '2017-10-22 09:44:54', '2017-11-07 05:14:10'),
(4, 'HONORARIOS CONTADOR', '60000.00', '2017-10-22 09:45:06', '2017-11-23 21:33:46'),
(5, 'HONORARIOS ABOGADOS (ACTAS)', '8332.33', '2017-10-22 09:45:21', '2017-11-07 05:14:21'),
(6, 'SISTEMA DE ALARMA (SISTEL)', '2.00', '2017-10-22 09:45:34', '2017-11-07 05:14:27'),
(7, 'SUELDO MARINO ROJAS', '325542.00', '2017-10-22 09:45:48', '2017-11-07 05:14:32'),
(9, 'HONORARIOS ASESOSRÍA EN SEGURIDAD INDUSTRIAL', '12002.00', '2017-11-01 05:17:16', '2017-11-07 05:14:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentasxcobrar`
--

CREATE TABLE `cuentasxcobrar` (
  `id` int(10) UNSIGNED NOT NULL,
  `cta_cli_codigo` varchar(255) NOT NULL,
  `cta_monto` decimal(25,4) DEFAULT NULL,
  `cta_concepto` varchar(255) DEFAULT NULL,
  `cta_venta_id` int(10) UNSIGNED DEFAULT NULL,
  `cta_pagada` int(1) DEFAULT NULL,
  `cta_entidad` varchar(255) NOT NULL,
  `cta_fecha` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentasxpagar`
--

CREATE TABLE `cuentasxpagar` (
  `id` int(10) UNSIGNED NOT NULL,
  `cta_prov_codigo` varchar(255) NOT NULL,
  `cta_monto` decimal(25,4) DEFAULT NULL,
  `cta_concepto` varchar(255) DEFAULT NULL,
  `cta_compra_id` int(10) UNSIGNED DEFAULT NULL,
  `cta_entidad` varchar(255) DEFAULT NULL,
  `cta_pagada` int(1) DEFAULT NULL,
  `cta_fecha` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependencias`
--

CREATE TABLE `dependencias` (
  `id` int(10) UNSIGNED NOT NULL,
  `dep_padre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dep_hijo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dep_produccion` int(10) UNSIGNED DEFAULT NULL,
  `requerimiento` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dependencias`
--

INSERT INTO `dependencias` (`id`, `dep_padre`, `dep_hijo`, `dep_produccion`, `requerimiento`, `created_at`, `updated_at`) VALUES
(3, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'ANTIPASTO ATÚN (FRASCO 470G)', NULL, 4606, '2018-03-23 17:31:56', '2019-04-17 01:58:07'),
(4, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PICADO BLANDO ANTIPASTO (kilo)', NULL, 12, '2019-02-14 10:39:00', '2019-04-17 23:49:41'),
(5, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PICADO DURO ANTIPASTO (kilo)', NULL, 12, '2019-02-14 10:39:16', '2019-04-17 23:49:41'),
(7, 'receta prueba B', 'Receta prueba A', NULL, 10, '2019-02-14 16:16:46', '2019-04-14 22:04:17'),
(8, 'receta prueba c', 'receta prueba B', NULL, 88, '2019-04-12 00:12:44', '2019-04-15 16:54:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `rec_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ing_ingrediente` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ing_default` int(1) NOT NULL DEFAULT '0',
  `ing_ratio` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `rec_nombre`, `ing_ingrediente`, `ing_default`, `ing_ratio`, `created_at`, `updated_at`) VALUES
(41, 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', 0, 1, '2017-12-28 20:02:03', '2017-12-28 20:02:03'),
(42, 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', 0, 1, '2017-12-28 20:02:20', '2017-12-28 20:02:20'),
(43, 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', 0, 1, '2017-12-28 20:02:34', '2017-12-28 20:02:34'),
(44, 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', 0, 1, '2017-12-28 20:03:14', '2017-12-28 20:03:14'),
(45, 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', 0, 1, '2017-12-28 22:43:03', '2017-12-28 22:43:03'),
(46, 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', 0, 1, '2017-12-28 22:43:14', '2017-12-28 22:43:14'),
(47, 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', 0, 1, '2017-12-28 22:43:31', '2017-12-28 22:43:31'),
(48, 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', 0, 1, '2017-12-28 22:43:52', '2017-12-28 22:43:52'),
(49, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', 0, 1, '2017-12-28 22:49:27', '2017-12-28 22:49:27'),
(50, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', 0, 1, '2017-12-28 22:49:44', '2017-12-28 22:49:44'),
(51, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', 0, 1, '2017-12-28 22:49:49', '2017-12-28 22:49:49'),
(52, 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', 0, 1, '2017-12-28 22:54:50', '2017-12-28 22:54:50'),
(53, 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', 0, 1, '2017-12-28 22:54:57', '2017-12-28 22:54:57'),
(54, 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', 0, 1, '2017-12-28 22:55:05', '2017-12-28 22:55:05'),
(55, 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', 0, 1, '2017-12-28 22:56:03', '2017-12-28 22:56:03'),
(56, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', 0, 1, '2017-12-28 22:57:28', '2017-12-28 22:57:28'),
(59, 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', 0, 1, '2017-12-28 23:00:16', '2017-12-28 23:00:16'),
(60, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', 0, 1, '2017-12-28 23:23:53', '2017-12-28 23:23:53'),
(61, 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', 0, 1, '2017-12-28 23:23:58', '2017-12-28 23:23:58'),
(62, 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', 0, 1, '2017-12-28 23:24:06', '2017-12-28 23:24:06'),
(63, 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', 0, 1, '2017-12-28 23:24:12', '2017-12-28 23:24:12'),
(64, 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', 0, 1, '2017-12-28 23:24:18', '2017-12-28 23:24:18'),
(65, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', 0, 1, '2017-12-28 23:24:23', '2017-12-28 23:24:23'),
(66, 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', 0, 1, '2017-12-28 23:24:30', '2017-12-28 23:24:30'),
(68, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', 0, 1, '2018-01-11 20:37:36', '2018-01-11 20:37:36'),
(70, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', 0, 1, '2018-03-23 18:00:25', '2018-03-23 18:00:25'),
(71, 'Receta prueba A', 'ACEITE', 0, 1, '2018-03-24 10:36:48', '2018-03-24 10:36:48'),
(84, 'receta prueba B', 'TAPA 63mm, 500cc, TWIST BLANCA', 1, 2, '2018-03-24 11:54:25', '2018-03-24 11:54:25'),
(86, 'receta prueba c', 'ACEITE', 0, 1, '2019-04-06 10:34:23', '2019-04-06 10:34:23'),
(95, 'Receta ejemplo PA', 'ACEITE', 1, 3, '2019-04-15 20:05:57', '2019-04-15 20:05:57'),
(96, 'Receta ejemplo PA', 'AGUA', 1, 10, '2019-04-15 20:06:10', '2019-04-15 20:06:10'),
(97, 'Receta ejemplo PA', 'ALCOHOL', 0, 1, '2019-04-15 20:06:17', '2019-04-15 20:06:17'),
(98, 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', 1, 1, '2019-04-15 21:04:36', '2019-04-15 21:04:36'),
(99, 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', 1, 1, '2019-04-15 21:04:49', '2019-04-15 21:04:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiasprimas`
--

CREATE TABLE `materiasprimas` (
  `id` int(10) UNSIGNED NOT NULL,
  `mp_codigo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mp_cantidad` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
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

CREATE TABLE `miscelaneos` (
  `id` int(10) UNSIGNED NOT NULL,
  `tru_cant` decimal(10,2) NOT NULL,
  `tru_cost_unit` decimal(10,2) NOT NULL,
  `tru_kilo` decimal(10,2) NOT NULL,
  `gas_porc_util` decimal(10,2) NOT NULL,
  `gas_cost_bomb` decimal(10,2) NOT NULL,
  `std_x_frasco` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `miscelaneos`
--

INSERT INTO `miscelaneos` (`id`, `tru_cant`, `tru_cost_unit`, `tru_kilo`, `gas_porc_util`, `gas_cost_bomb`, `std_x_frasco`, `created_at`, `updated_at`) VALUES
(1, '102.00', '10002.00', '22.23', '62.00', '10002.00', '475.85', '2017-10-11 04:00:00', '2017-11-07 01:13:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `id` int(10) UNSIGNED NOT NULL,
  `par_codigo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `par_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `par_unidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `par_costo` decimal(25,4) DEFAULT NULL,
  `par_observacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `par_cost_updated` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `par_codigo`, `par_nombre`, `par_unidad`, `par_costo`, `par_observacion`, `par_cost_updated`, `created_at`, `updated_at`) VALUES
(98, 'MI00000', 'ACEITE', 'LITRO', '30000.0000', 'ACTUALIZADO AL 02/11/2017', '2018-01-11 22:15:23', '2017-12-03 02:17:39', '2019-04-13 14:25:49'),
(99, 'MI00001', 'ACEITUNAS', 'KILO', '500000.0000', 'ACTUALIZADO AL 30/11/2017 ESPECULATIVO', NULL, '2017-12-03 02:19:23', '2018-03-27 05:13:55'),
(100, 'MP00000', 'AJOPORRO', 'KILO', '45000.0000', 'ACTUALIZADO AL 29/11201', NULL, '2017-12-03 02:24:43', '2017-12-03 02:24:43'),
(101, 'MI00002', 'ÁCIDO CÍTRICO', 'KILO', '9000.0000', 'ACTUALIZADO AL 22/02/2017', NULL, '2017-12-03 02:26:53', '2017-12-10 01:19:27'),
(102, 'MP00001', 'ALBAHACA', 'KILO', '4000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-03 02:35:18', '2017-12-03 02:35:18'),
(103, 'MI00003', 'ALCOHOL', 'LITRO', '3139.0000', 'ACTUALIZADO AL 25/01/2017', NULL, '2017-12-03 02:39:43', '2017-12-05 01:56:12'),
(104, 'MI00004', 'ALMIDÓN DE MAÍZ (MAICINA) ', 'KILO', '55555.5600', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-03 02:43:57', '2017-12-03 02:43:57'),
(105, 'MI00005', 'ATÚN ENLATADO', 'KILO', '86981.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-03 21:19:18', '2017-12-03 21:19:18'),
(106, 'MP00002', 'ATÚN FRESCO', 'KILO', '0.0000', '', NULL, '2017-12-03 21:22:12', '2017-12-03 21:22:12'),
(107, 'MI00006', 'AZÚCAR', 'KILO', '13600.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-03 21:24:14', '2017-12-03 21:24:14'),
(108, 'MI00007', 'BANDEJA CARTÓN 12x500cc', 'UNIDAD', '500.0000', 'COSTO ESPECULATIVO', NULL, '2017-12-03 21:29:49', '2017-12-03 21:29:49'),
(109, 'MI00008', 'BANDEJA CARTÓN 12x300cc', 'UNIDAD', '500.0000', 'COSTO ESPECULATIVO', NULL, '2017-12-03 21:31:42', '2017-12-03 21:31:42'),
(110, 'MI00009', 'BANDEJA CARTÓN 6x300cc', 'UNIDAD', '300.0000', 'COSTO ESPECULATIVO', NULL, '2017-12-03 21:32:42', '2017-12-03 21:32:42'),
(111, 'MI00010', 'BANDEJA CARTÓN 24x200cc', 'UNIDAD', '600.0000', 'COSTO ESPECULATIVO', NULL, '2017-12-03 21:34:19', '2017-12-03 21:34:19'),
(113, 'MP00003', 'CEBOLLA', 'KILO', '30000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-03 21:45:26', '2017-12-03 21:45:26'),
(117, 'MP00005', 'VAINITA', 'KILO', '6000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-05 01:49:07', '2017-12-05 01:49:07'),
(118, 'MP00006', 'ZANAHORIA ', 'KILO', '6400.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-05 01:51:43', '2017-12-05 01:51:43'),
(119, 'MP00007', 'PIMENTÓN', 'KILO', '9550.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-05 01:52:27', '2017-12-05 01:52:27'),
(120, 'MP00008', 'COLIFLOR', 'KILO', '6000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-05 01:53:19', '2017-12-05 01:53:19'),
(121, 'MP00009', 'CÉLERI (APIO ESPAÑA)', 'KILO', '4500.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-05 01:54:09', '2017-12-05 01:54:09'),
(122, 'MP00010', 'CEBOLLÍN', 'KILO', '2500.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-05 01:54:34', '2017-12-05 01:54:34'),
(123, 'MI00011', 'SAL', 'KILO', '10000.0000', 'PRECIO INVENTADO', NULL, '2017-12-10 22:41:38', '2017-12-10 22:41:38'),
(124, 'MI00012', 'GAS', '1% DE LA CARGA', '381.8200', '', '2017-12-28 23:07:07', '2017-12-10 22:43:21', '2017-12-28 23:07:07'),
(125, 'MI00013', 'FRASCO 500CC', 'UNIDAD', '3000.0000', 'COSTO INVENTADO', NULL, '2017-12-10 22:45:39', '2017-12-12 18:59:01'),
(126, 'MI00014', 'PRESINTO FRASCO 500cc', 'UNIDAD', '1000.0000', 'COSTO INVENTADO', NULL, '2017-12-10 22:47:12', '2017-12-12 18:59:16'),
(127, 'MI00015', 'ETIQUETA ANTIPASTO ATÚN 470G', 'UNIDAD', '2500.0000', 'PRECIO INVENTADO', NULL, '2017-12-10 22:48:47', '2017-12-12 18:59:24'),
(128, '', 'PECTINA', 'KILO', '3800000.0000', 'TA MUY CARO', NULL, '2017-12-12 19:18:40', '2017-12-12 19:18:40'),
(129, 'MI00016', 'SALSA DE TOMATE', 'KILO', '157000.0000', '', NULL, '2017-12-28 22:54:15', '2017-12-28 22:54:15'),
(130, 'MI00017', 'VINAGRE', 'LITRO', '7700.0000', '', '2018-01-11 20:30:04', '2017-12-28 22:55:52', '2018-01-11 20:30:04'),
(131, 'MI00018', 'PIMIENTA', 'GRAMOS', '1000.0000', '', NULL, '2017-12-28 22:57:16', '2017-12-28 22:57:16'),
(132, 'MI00019', 'TAPA 63mm, 500cc, TWIST BLANCA', 'UNIDAD', '661.5000', '', NULL, '2017-12-28 22:59:34', '2017-12-28 22:59:34'),
(133, 'MI00020', 'ELECTRICIDAD', 'KW/H', '0.0000', '', NULL, '2017-12-28 23:07:55', '2017-12-28 23:07:55'),
(134, 'MI00021', 'AGUA', 'UNIT. ESTANDAR', '0.0000', '', NULL, '2017-12-28 23:16:04', '2017-12-28 23:16:04'),
(135, 'MI00022', 'DETERGENTE PARA PISOS', 'LITROS', '1000.0000', '', NULL, '2017-12-28 23:17:15', '2017-12-28 23:17:15'),
(136, 'MI00023', 'DETERGENTE PARA VAJILLAS', 'LITRO', '2875.0000', '', NULL, '2017-12-28 23:19:59', '2017-12-28 23:19:59'),
(137, 'MI00024', 'GUANTES DE LATEX REUSABLES', 'PAR', '2000.0000', '', NULL, '2017-12-28 23:21:49', '2017-12-28 23:21:49'),
(138, 'MI00025', 'BOLSA DE BASURA', 'UNIDAD', '2000.0000', '', NULL, '2017-12-28 23:22:31', '2017-12-28 23:22:31'),
(139, 'MI00026', 'ALCAPARRAS', 'KILO', '1000000.0000', '', NULL, '2018-01-11 22:27:09', '2018-01-11 22:27:09'),
(140, 'MI00027', 'PLASTICO TERMOENCOJIBLE', 'GRAMOS', '10000.0000', '', NULL, '2018-01-11 20:37:19', '2018-01-11 20:37:19'),
(141, 'MP00004', 'Durazno', 'Kilo', '50000.0000', '', NULL, '2018-02-12 20:59:40', '2018-02-12 20:59:40'),
(142, 'MP00011', 'Guanabana', 'Kilo', '0.0000', '', NULL, '2018-02-13 11:07:02', '2018-02-13 11:07:02'),
(143, 'MP00012', 'Uva', 'KILO', '100000.0000', '', NULL, '2018-02-13 14:31:50', '2018-02-13 14:31:50'),
(145, 'MP00029', 'Pasas', 'KILO', '76000.0000', 'COSTO ESPECULATIVO', NULL, '2019-04-13 14:07:26', '2019-04-13 14:07:26'),
(153, 'MP00030', 'producto de prueba 1', 'unidad', '3746273.0000', 'perecedero', NULL, '2019-04-15 21:32:45', '2019-04-15 21:32:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `id` int(10) UNSIGNED NOT NULL,
  `pro_fecha` date NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_etapa` varchar(5) NOT NULL,
  `pro_produccion` int(11) NOT NULL,
  `pro_disponible` int(11) NOT NULL,
  `pro_costo` decimal(25,4) DEFAULT NULL,
  `pro_mano_obra` decimal(25,4) NOT NULL,
  `pro_lote` int(10) UNSIGNED DEFAULT NULL,
  `pro_concepto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producciona`
--

CREATE TABLE `producciona` (
  `id` int(10) UNSIGNED NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccionb`
--

CREATE TABLE `produccionb` (
  `id` int(10) UNSIGNED NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccionc`
--

CREATE TABLE `produccionc` (
  `id` int(10) UNSIGNED NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccionmes`
--

CREATE TABLE `produccionmes` (
  `id` int(10) UNSIGNED NOT NULL,
  `produccion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccionmes`
--

INSERT INTO `produccionmes` (`id`, `produccion`, `created_at`, `updated_at`) VALUES
(1, 5281, '2017-10-11 08:00:00', '2019-04-17 23:54:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE `proveedors` (
  `id` int(10) UNSIGNED NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `prov_codigo`, `prov_nombre`, `prov_rif`, `prov_direccion`, `prov_contacto`, `prov_condiciones`, `prov_retencion`, `prov_saldo`, `prov_cred_o_cont`, `created_at`, `updated_at`) VALUES
(2, 'P00000', 'Proveedor', 'J287327', 'ashda', 'sajhda', 'asjdhas', 0, '0.0000', 'credito', '2017-12-04 22:57:53', '2019-04-13 14:16:25'),
(3, 'P00002', 'ahdgasyh', 'jhsdhjas', 'hsgdha', 'hasgdhasg', 'ahsdgas', 0, '0.0000', 'contado', '2017-12-12 19:14:19', '2019-04-06 11:50:29'),
(4, 'P00003', 'proveedor cinco', 'j-23345567-2', 'la calle', 'ramón', '15 dias', 0, '0.0000', 'contado', '2017-12-24 18:40:01', '2018-03-23 13:47:31'),
(5, 'P00004', 'pablo iglesia', 'j-33333333-3', 'san pablo', 'pablo', 'ninguna', 0, '0.0000', 'contado', '2017-12-30 18:26:26', '2019-04-17 23:47:00'),
(6, 'P00005', 'pepe', 'rif de pepe', 'dirección de pepe', 'pepe', 'pepe condithion', 0, '0.0000', 'credito', '2018-01-11 20:08:54', '2018-02-25 06:11:52'),
(7, 'P00006', 'GATO', 'RIF GATO', 'DIRECCION GATO', 'SR GATO', '123', 0, '0.0000', 'credito', '2018-01-11 23:11:57', '2019-04-09 21:38:59'),
(8, 'P00001', 'Repartos Orientales', 'JR6566512545', 'El junquito, kilometro 12, galpón 312', '0414-1452263', '', 0, '0.0000', 'contado', '2019-04-05 03:28:33', '2019-04-17 01:12:07'),
(9, 'P00007', 'septimo proveedor', 'J4389754389', 'asjhdajh ausdhsahdas sdjsahdjashd', '04143767273', '', 0, '0.0000', 'contado', '2019-04-05 07:17:55', '2019-04-09 20:26:52'),
(10, 'P00008', 'CORPOELEC', 'J87483248', 'Centro, Calle 25 entre Av. 3 y 4', '02745687656', '', 0, '0.0000', 'contado', '2019-04-06 07:50:48', '2019-04-06 07:50:48'),
(11, 'P00009', 'Bus Gas', 'J43857485', 'Mérida, Centro, Av. 5, entre calles 17 y 18', '02749487538', '', 0, '0.0000', 'contado', '2019-04-06 07:52:48', '2019-04-06 07:52:48'),
(12, 'P00010', 'Aguas de Mérida', 'J9485738457', 'Av. Los Proceres, calle Los Tinajos, Galpón 2-33', '02744857423', '', 0, '0.0000', 'credito', '2019-04-06 07:55:13', '2019-04-06 07:55:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id` int(10) UNSIGNED NOT NULL,
  `rec_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rec_activo` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `rec_proc` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `rec_unidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `rec_nombre`, `rec_activo`, `rec_proc`, `rec_unidad`, `created_at`, `updated_at`) VALUES
(8, 'PICADO BLANDO ANTIPASTO (kilo)', 'si', 'PA', 'KILO', '2017-12-28 20:01:26', '2018-01-11 21:14:24'),
(9, 'PICADO DURO ANTIPASTO (kilo)', 'si', 'PA', 'KILO', '2017-12-28 22:42:44', '2018-01-11 21:14:32'),
(10, 'ANTIPASTO ATÚN (FRASCO 470G)', 'si', 'PB', 'FRASCO 470G', '2017-12-28 22:47:09', '2018-01-11 21:14:52'),
(11, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'si', 'PC', 'CAJA X 12', '2018-01-11 20:35:54', '2018-01-11 20:35:54'),
(12, 'Receta prueba A', 'si', 'PA', 'KILO', '2018-03-24 10:36:41', '2018-03-24 10:36:41'),
(13, 'receta prueba B', 'si', 'PB', 'KILO', '2018-03-24 10:37:13', '2018-03-24 10:37:13'),
(14, 'receta prueba c', 'si', 'PC', 'KILO', '2019-02-14 16:15:24', '2019-04-18 05:13:56'),
(15, 'Receta ejemplo PA', 'si', 'PA', 'Unidad', '2019-04-15 19:49:31', '2019-04-15 19:49:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimientos`
--

CREATE TABLE `requerimientos` (
  `id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `salarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `sal_mensual` decimal(25,4) NOT NULL,
  `unidad_tributaria` int(11) NOT NULL,
  `cant_cesta_ticket` int(11) NOT NULL,
  `salario_integral` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `salarios`
--

INSERT INTO `salarios` (`id`, `sal_mensual`, `unidad_tributaria`, `cant_cesta_ticket`, `salario_integral`, `created_at`, `updated_at`) VALUES
(1, '4251.4000', 300, 21, '17623.6700', NULL, '2019-04-13 23:35:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldocaja`
--

CREATE TABLE `saldocaja` (
  `id` int(10) UNSIGNED NOT NULL,
  `sc_entidad` varchar(255) NOT NULL,
  `sc_saldo` decimal(25,4) NOT NULL,
  `sc_fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `totalesventas`
--

CREATE TABLE `totalesventas` (
  `id` int(10) UNSIGNED NOT NULL,
  `ven_factura` varchar(255) NOT NULL,
  `ven_total` decimal(25,4) NOT NULL,
  `ven_iva` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `privilegio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `privilegio`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Andres Vega', 'andres_vega93@hotmail.com', '$2y$10$4EmD12RT/GyTz47P8bz1l.WQ6OUr5NHCcxpTaTEnf2xEMlSIpvpFO', 'admin', 'oyrJZiarIs6L93rVnA2OLWKMsqRGNNn2I6gglJBLZwVjiw2TsNNlFc5cGfkv', '2017-10-11 10:32:19', '2019-04-22 03:23:05'),
(7, 'Carlos', 'carlosteno@gmail.com', '$2y$10$9uwn8GSSYhLxzaSZnhawBu8f0sqBvgRRYHu8yQpI7/pILxLjx.WVK', 'admin', 'J5RWbVZNO1TbIyVmsPepnHUyyXyAlu2mHBQJynPGuwBIS78Fk9JHVBByuSHT', '2017-10-14 15:48:38', '2018-02-12 20:24:56'),
(8, 'clarisa', 'clari98@hotmail.com', '$2y$10$3PdMuwN1QX5OiLW0jhYWWu/PGegeRyRjoaJUPHPq2Y1q6xAAB4mE6', 'tipo1', 'zAO1zjtBGQlmcdayMjHR1nmJNUplgialBYuYll11B5szT5wXC3AgHA9VwqdS', '2017-12-24 18:33:40', '2019-04-16 22:31:24'),
(9, 'Angélica', 'gavcamerida@gmail.com', '$2y$10$nmvuxdHxxHFRl2pckMARHeQJJ9sjxEV8kg1hLVfJoKvy1NWAbPYMu', 'tipo1', '77kYlLhRAezQrSQf7mP6XcnIPnp3LYiJpwGtJugWppnMSWr18XOL8VawZxlD', '2018-02-07 19:21:08', '2018-02-09 16:07:44'),
(10, 'test', 'mail@mail.com', '$2y$10$BRBmd.UL0KSAzwj6NrOtZOwa98fc/s0YIxD1Tb4lxvPNECw9ouEMK', 'admin', 'QiXg57ED46Vs4JHX9KkzjtTrEB4CsbHhmJdAf10pEGhrsGd11g3lEZJe0oHy', '2018-03-24 10:27:53', '2019-02-08 04:32:45'),
(11, 'Andres Eduardo Vega', 'aevega1991@gmail.com', '$2y$10$aGrbbUGzmxz83EsANiV3p.0h4mvH/qibcrKG6QzApTPlLqvwKIApi', 'admin', 'lN8TaKP7UZBtxHC5g6kWQS78CdzJHEVwVaYzjV35QJb6TePeNiec61Ehw87T', '2019-02-08 04:30:20', '2019-04-22 03:23:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(10) UNSIGNED NOT NULL,
  `cli_codigo` varchar(255) NOT NULL,
  `ven_fecha` date NOT NULL,
  `ven_factura` varchar(255) NOT NULL,
  `ven_condicion` varchar(255) NOT NULL,
  `ven_entidad` varchar(255) DEFAULT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ven_costo` decimal(25,4) NOT NULL,
  `ven_cantidad` int(10) NOT NULL,
  `ven_activo` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aumentos`
--
ALTER TABLE `aumentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cajabanco`
--
ALTER TABLE `cajabanco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cajabanco_fk1` (`cb_compra_id`),
  ADD KEY `cajabanco_fk2` (`cb_venta_id`);

--
-- Indices de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cardexmp_ibfk_1` (`mp_codigo`),
  ADD KEY `cardexmp_ibfk_2` (`comp_doc`),
  ADD KEY `cardexmp_ibfk_4` (`car_compra_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cli_codigo` (`cli_codigo`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comp_doc` (`comp_doc`),
  ADD KEY `compras_fk1` (`comp_proveedor`);

--
-- Indices de la tabla `costofijos`
--
ALTER TABLE `costofijos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuentasxcobrar`
--
ALTER TABLE `cuentasxcobrar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuentasxcobrar_fk2` (`cta_cli_codigo`),
  ADD KEY `cuentasxcobrar_fk1` (`cta_venta_id`);

--
-- Indices de la tabla `cuentasxpagar`
--
ALTER TABLE `cuentasxpagar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuentaxpagar_fk_1` (`cta_compra_id`),
  ADD KEY `cuentaxpagar_fk_2` (`cta_prov_codigo`);

--
-- Indices de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dependencias_ibfk_3` (`dep_padre`),
  ADD KEY `dependencias_ibfk_4` (`dep_hijo`),
  ADD KEY `dependencias_ibfk_2` (`dep_produccion`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ing_FK1` (`rec_nombre`),
  ADD KEY `ing_FK2` (`ing_ingrediente`);

--
-- Indices de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mp_codigo` (`mp_codigo`);

--
-- Indices de la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `par_nombre` (`par_nombre`),
  ADD UNIQUE KEY `par_codigo` (`par_codigo`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produccion_ibfk_1` (`rec_nombre`);

--
-- Indices de la tabla `producciona`
--
ALTER TABLE `producciona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producciona_ibfk_1` (`rec_nombre`);

--
-- Indices de la tabla `produccionb`
--
ALTER TABLE `produccionb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produccionb_ibfk_1` (`rec_nombre`);

--
-- Indices de la tabla `produccionc`
--
ALTER TABLE `produccionc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produccionc_ibfk_1` (`rec_nombre`);

--
-- Indices de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `prov_codigo` (`prov_codigo`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `recetas_rec_nombre_unique` (`rec_nombre`);

--
-- Indices de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `requerimientos_ibfk_1` (`rec_nombre`),
  ADD KEY `requerimientos_ibfk_2` (`req_ingrediente`);

--
-- Indices de la tabla `salarios`
--
ALTER TABLE `salarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `saldocaja`
--
ALTER TABLE `saldocaja`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `totalesventas`
--
ALTER TABLE `totalesventas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ven_factura` (`ven_factura`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventas_ibkf_2` (`ven_factura`),
  ADD KEY `ventas_ibkf_1` (`cli_codigo`),
  ADD KEY `ventas_ibkf_3` (`rec_nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aumentos`
--
ALTER TABLE `aumentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cajabanco`
--
ALTER TABLE `cajabanco`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=791;

--
-- AUTO_INCREMENT de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `costofijos`
--
ALTER TABLE `costofijos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cuentasxcobrar`
--
ALTER TABLE `cuentasxcobrar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentasxpagar`
--
ALTER TABLE `cuentasxpagar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producciona`
--
ALTER TABLE `producciona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `produccionb`
--
ALTER TABLE `produccionb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `produccionc`
--
ALTER TABLE `produccionc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salarios`
--
ALTER TABLE `salarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `saldocaja`
--
ALTER TABLE `saldocaja`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `totalesventas`
--
ALTER TABLE `totalesventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajabanco`
--
ALTER TABLE `cajabanco`
  ADD CONSTRAINT `cajabanco_fk1` FOREIGN KEY (`cb_compra_id`) REFERENCES `compras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajabanco_fk2` FOREIGN KEY (`cb_venta_id`) REFERENCES `totalesventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
  ADD CONSTRAINT `cardexmp_ibfk_1` FOREIGN KEY (`mp_codigo`) REFERENCES `materiasprimas` (`mp_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cardexmp_ibfk_3` FOREIGN KEY (`comp_doc`) REFERENCES `compras` (`comp_doc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cardexmp_ibfk_4` FOREIGN KEY (`car_compra_id`) REFERENCES `compras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_fk1` FOREIGN KEY (`comp_proveedor`) REFERENCES `proveedors` (`prov_codigo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuentasxcobrar`
--
ALTER TABLE `cuentasxcobrar`
  ADD CONSTRAINT `cuentasxcobrar_fk1` FOREIGN KEY (`cta_venta_id`) REFERENCES `totalesventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cuentasxcobrar_fk2` FOREIGN KEY (`cta_cli_codigo`) REFERENCES `clientes` (`cli_codigo`);

--
-- Filtros para la tabla `cuentasxpagar`
--
ALTER TABLE `cuentasxpagar`
  ADD CONSTRAINT `cuentaxpagar_fk_1` FOREIGN KEY (`cta_compra_id`) REFERENCES `compras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cuentaxpagar_fk_2` FOREIGN KEY (`cta_prov_codigo`) REFERENCES `proveedors` (`prov_codigo`);

--
-- Filtros para la tabla `dependencias`
--
ALTER TABLE `dependencias`
  ADD CONSTRAINT `dependencias_ibfk_3` FOREIGN KEY (`dep_padre`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dependencias_ibfk_4` FOREIGN KEY (`dep_hijo`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dependencias_ibfk_5` FOREIGN KEY (`dep_produccion`) REFERENCES `produccion` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

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
  ADD CONSTRAINT `requerimientos_ibfk_2` FOREIGN KEY (`req_ingrediente`) REFERENCES `ingredientes` (`ing_ingrediente`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibkf_1` FOREIGN KEY (`cli_codigo`) REFERENCES `clientes` (`cli_codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibkf_2` FOREIGN KEY (`ven_factura`) REFERENCES `totalesventas` (`ven_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibkf_3` FOREIGN KEY (`rec_nombre`) REFERENCES `produccionc` (`rec_nombre`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
