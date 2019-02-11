-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2018 a las 18:14:12
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
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE IF NOT EXISTS `bancos` (
`id` int(10) unsigned NOT NULL,
  `ban_nombre` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`id`, `ban_nombre`, `created_at`, `updated_at`) VALUES
(1, 'Banco de Venezuela', '2018-01-14 21:37:16', '2018-01-14 21:37:16'),
(4, 'Venezolano de Crédito', '2018-01-14 21:42:04', '2018-01-14 21:42:04'),
(6, 'Banco Bicentenario', '2018-01-14 21:43:03', '2018-01-14 21:43:03'),
(8, 'Banco Banesco', '2018-01-14 21:44:59', '2018-01-14 21:44:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajabanco`
--

CREATE TABLE IF NOT EXISTS `cajabanco` (
`id` int(10) unsigned NOT NULL,
  `cb_entidad` varchar(255) NOT NULL,
  `cb_monto` decimal(25,4) DEFAULT NULL,
  `cb_compra_id` int(10) unsigned DEFAULT NULL,
  `cb_debe_haber` enum('DEBE','HABER') DEFAULT NULL,
  `cb_fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cb_saldo` decimal(25,4) NOT NULL,
  `cb_concepto` varchar(255) DEFAULT NULL,
  `cb_activo` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajabanco`
--

INSERT INTO `cajabanco` (`id`, `cb_entidad`, `cb_monto`, `cb_compra_id`, `cb_debe_haber`, `cb_fecha`, `cb_saldo`, `cb_concepto`, `cb_activo`, `created_at`, `updated_at`) VALUES
(14, 'Caja Chica', '35970.0000', 115, 'HABER', '2018-01-04 11:16:54', '35970.0000', NULL, 0, '2018-01-04 11:17:24', '2018-01-05 14:06:15'),
(15, 'Caja Chica', '35970.0000', 116, 'HABER', '2018-01-04 11:17:43', '71940.0000', NULL, 0, '2018-01-04 11:31:14', '2018-01-05 14:06:15'),
(16, 'Banco De Venezuela', '35970.0000', 117, 'HABER', '2018-01-04 11:32:35', '107910.0000', NULL, 1, '2018-01-04 11:32:48', '2018-01-04 11:32:54'),
(17, 'Banco De Venezuela', '35970.0000', 118, 'HABER', '2018-01-04 11:33:55', '143880.0000', NULL, 1, '2018-01-04 11:34:23', '2018-01-04 11:34:30'),
(18, 'Banco De Venezuela', '35970.0000', 119, 'HABER', '2018-01-04 11:46:59', '107910.0000', NULL, 1, '2018-01-04 11:47:14', '2018-01-04 11:47:20'),
(19, 'Banco Provincial', '35970.0000', 120, 'HABER', '2018-01-04 12:22:35', '71940.0000', NULL, 1, '2018-01-04 12:23:08', '2018-01-04 12:23:12'),
(20, 'Banco Provincial', '3421.5100', 121, 'HABER', '2018-01-04 12:23:31', '68518.4900', NULL, 1, '2018-01-04 12:24:59', '2018-01-04 12:25:16'),
(21, 'Banco Banesco', NULL, NULL, 'DEBE', '2018-01-04 11:32:35', '0.0000', 'Inicio de Caja', 1, '2018-01-04 11:32:48', '2018-01-04 11:32:54'),
(22, 'Banco Mercantil', NULL, NULL, 'DEBE', '2018-01-04 11:32:35', '0.0000', 'Inicio de Caja', 1, '2018-01-04 11:32:48', '2018-01-04 11:32:54'),
(23, 'Banco Banesco', '35970.0000', 122, 'HABER', '2018-01-04 12:42:37', '-35970.0000', NULL, 1, '2018-01-04 12:43:05', '2018-01-04 12:43:11'),
(24, 'Banco Banesco', '9810.0000', 123, 'HABER', '2018-01-04 12:45:37', '-45780.0000', 'Compra', 1, '2018-01-04 12:48:14', '2018-01-04 12:48:20'),
(25, 'Banco Banesco', '545.0000', 124, 'HABER', '2018-01-04 12:49:17', '-46325.0000', 'Compra', 1, '2018-01-04 12:49:28', '2018-01-04 12:49:45'),
(26, 'Caja Chica', NULL, NULL, 'DEBE', '2018-01-04 15:30:40', '71941.0000', 'Ajuste de Caja', 0, '2018-01-04 15:30:40', '2018-01-05 14:06:15'),
(27, 'Banco De Venezuela', NULL, NULL, 'DEBE', '2018-01-04 15:30:52', '107911.0000', 'Ajuste de Caja', 1, '2018-01-04 15:30:52', '2018-01-04 15:30:52'),
(28, 'Banco Provincial', NULL, NULL, 'DEBE', '2018-01-04 15:31:10', '68519.4900', 'Ajuste de Caja', 1, '2018-01-04 15:31:10', '2018-01-04 15:31:10'),
(29, 'Banco Banesco', NULL, NULL, 'DEBE', '2018-01-04 15:31:18', '-46326.0000', 'Ajuste de Caja', 1, '2018-01-04 15:31:18', '2018-01-04 15:31:18'),
(30, 'Banco Mercantil', NULL, NULL, 'DEBE', '2018-01-04 15:31:32', '1.0000', 'Ajuste de Caja', 1, '2018-01-04 15:31:32', '2018-01-04 15:31:32'),
(35, 'Caja Chica', NULL, NULL, 'HABER', '2018-01-05 07:00:17', '71941.0000', 'Inicio de caja', 1, '2018-01-05 19:00:33', '2018-01-05 19:00:33'),
(36, 'Caja Chica', '545000.0000', 131, 'HABER', '2018-01-05 07:00:17', '-473059.0000', 'Compra', 1, '2018-01-05 19:00:33', '2018-01-05 19:00:41'),
(37, 'Caja Chica', NULL, NULL, 'HABER', '2018-01-05 07:03:33', '71941.0000', 'Inicio de caja', 1, '2018-01-05 19:03:48', '2018-01-05 19:03:48'),
(38, 'Caja Chica', '9810.0000', 132, 'HABER', '2018-01-05 07:03:33', '62131.0000', 'Compra', 1, '2018-01-05 19:03:48', '2018-01-05 19:03:56'),
(39, 'Caja Chica', NULL, NULL, 'HABER', '2018-01-05 07:12:16', '71941.0000', 'Inicio de caja', 1, '2018-01-05 19:12:24', '2018-01-05 19:12:24'),
(40, 'Caja Chica', '3421.5100', 133, 'HABER', '2018-01-05 07:12:16', '68519.4900', 'Compra', 1, '2018-01-05 19:12:24', '2018-01-05 19:12:30'),
(41, 'Caja Chica', NULL, NULL, 'HABER', '2018-01-05 07:29:34', '71941.0000', 'Inicio de caja', 1, '2018-01-05 19:30:02', '2018-01-05 19:30:02'),
(42, 'Caja Chica', NULL, 136, 'HABER', '2018-01-05 07:29:34', '0.0000', 'Compra', 1, '2018-01-05 19:30:02', '2018-01-05 19:30:02'),
(43, 'Caja Chica', NULL, 140, 'HABER', '2018-01-05 07:30:43', '0.0000', 'Compra', 1, '2018-01-05 19:33:54', '2018-01-05 19:33:54'),
(44, 'Caja Chica', '35970.0000', 141, 'HABER', '2018-01-05 07:34:40', '-35970.0000', 'Compra', 1, '2018-01-05 19:34:47', '2018-01-05 19:34:53'),
(45, 'Caja Chica', '35970.0000', 142, 'HABER', '2018-01-05 07:38:59', '-71940.0000', 'Compra', 1, '2018-01-05 19:39:12', '2018-01-05 19:39:15'),
(46, 'Banco De Venezuela', NULL, NULL, 'HABER', '2018-01-05 07:43:58', '71941.0000', 'Inicio de caja', 0, '2018-01-05 19:44:07', '2018-01-07 14:21:17'),
(47, 'Banco De Venezuela', '35970.0000', 143, 'HABER', '2018-01-05 07:43:58', '35971.0000', 'Compra', 0, '2018-01-05 19:44:07', '2018-01-07 14:21:17'),
(48, 'Banco De Venezuela', '9810.0000', 144, 'HABER', '2018-01-05 07:44:19', '26161.0000', 'Compra', 0, '2018-01-05 19:44:29', '2018-01-07 14:21:17'),
(57, 'Banco De Venezuela', NULL, NULL, 'DEBE', '2018-01-05 04:00:00', '27000.0000', 'Ajuste de Caja', 0, '2018-01-06 17:25:37', '2018-01-07 14:21:17'),
(58, 'Banco de Venezuela', '20000.0000', NULL, 'HABER', '2018-01-05 04:00:00', '7000.0000', 'Transferido hacia Banco Provincial', 0, '2018-01-06 17:27:24', '2018-01-07 14:21:17'),
(59, 'Banco Provincial', '20000.0000', NULL, 'DEBE', '2018-01-05 04:00:00', '7000.0000', 'Transferido desde Banco de Venezuela', 1, '2018-01-06 17:27:24', '2018-01-06 17:27:24'),
(60, 'Banco de Venezuela', '20000.0000', NULL, 'HABER', '2018-01-05 04:00:00', '-13000.0000', 'Transferido hacia Banco Provincial', 0, '2018-01-06 17:29:14', '2018-01-07 14:21:17'),
(61, 'Banco Provincial', '20000.0000', NULL, 'DEBE', '2018-01-05 04:00:00', '-13000.0000', 'Transferido desde Banco de Venezuela', 1, '2018-01-06 17:29:14', '2018-01-06 17:29:14'),
(62, 'Banco de Venezuela', '10000.0000', NULL, 'HABER', '2018-01-05 04:00:00', '-23000.0000', 'Transferido hacia Banco Provincial', 0, '2018-01-06 18:30:02', '2018-01-07 14:21:17'),
(63, 'Banco Provincial', '10000.0000', NULL, 'DEBE', '2018-01-05 04:00:00', '-3000.0000', 'Transferido desde Banco de Venezuela', 1, '2018-01-06 18:30:02', '2018-01-06 18:30:02'),
(64, 'Caja Chica', '59642.5110', NULL, 'DEBE', '2018-01-03 04:00:00', '-95612.5110', 'Venta', 1, '2018-01-07 04:00:38', '2018-01-07 04:00:38'),
(65, 'Caja Chica', '59642.5110', NULL, 'DEBE', '2018-01-03 04:00:00', '-62642.5110', 'Venta', 1, '2018-01-07 04:01:51', '2018-01-07 04:01:51'),
(66, 'Caja Chica', '59642.5110', NULL, 'DEBE', '2018-01-03 04:00:00', '-155255.0220', 'Venta', 1, '2018-01-07 04:02:16', '2018-01-07 04:02:16'),
(67, 'Caja Chica', '59642.5110', NULL, 'DEBE', '2018-01-03 04:00:00', '-122285.0220', 'Venta', 1, '2018-01-07 04:03:44', '2018-01-07 04:03:44'),
(68, 'Caja Chica', '59642.5110', NULL, 'DEBE', '2018-01-03 04:00:00', '-214897.5330', 'Venta', 1, '2018-01-07 04:09:37', '2018-01-07 04:09:37'),
(71, 'Caja Chica', NULL, NULL, 'HABER', '2018-01-13 13:15:40', '71941.0000', 'Inicio de caja', 0, '2018-01-14 01:15:52', '2018-01-14 18:53:13'),
(72, 'Caja Chica', '596960.0000', 229, 'HABER', '2018-01-13 13:15:40', '-525019.0000', 'Compra', 0, '2018-01-14 01:15:52', '2018-01-14 18:53:13'),
(75, 'Caja Chica', '828531.6500', NULL, 'DEBE', '2018-01-13 04:00:00', '303512.6500', 'Venta', 0, '2018-01-14 18:16:24', '2018-01-14 18:53:13'),
(78, 'Caja Chica', NULL, NULL, 'HABER', '2018-01-14 04:00:00', '303512.6500', 'Inicio de caja', 1, '2018-01-14 18:53:13', '2018-01-14 18:53:13'),
(79, 'Caja Chica', '367956.2900', NULL, 'DEBE', '2018-01-14 04:00:00', '671468.9400', 'Venta', 1, '2018-01-14 23:33:29', '2018-01-14 23:33:29'),
(80, 'Banco de Venezuela', '183978.1400', NULL, 'DEBE', '2018-01-14 04:00:00', '183978.1400', 'Venta', 1, '2018-01-14 23:34:06', '2018-01-14 23:34:06'),
(81, 'Venezolano de Crédito', '183978.1400', NULL, 'DEBE', '2018-01-14 04:00:00', '183978.1400', 'Venta', 1, '2018-01-14 23:34:32', '2018-01-14 23:34:32'),
(82, 'Banco Bicentenario', '183978.1400', NULL, 'DEBE', '2018-01-14 04:00:00', '183978.1400', 'Venta', 1, '2018-01-14 23:34:59', '2018-01-14 23:34:59'),
(83, 'Banco Banesco', '183978.1400', NULL, 'DEBE', '2018-01-14 04:00:00', '183978.1400', 'Venta', 1, '2018-01-14 23:35:31', '2018-01-14 23:35:31'),
(84, 'Caja Chica', '91989.0700', NULL, 'DEBE', '2018-01-14 04:00:00', '763458.0100', 'Venta', 1, '2018-01-15 00:58:53', '2018-01-15 00:58:53'),
(85, 'Banco de Venezuela', '91989.0700', NULL, 'DEBE', '2018-01-14 04:00:00', '275967.2100', 'Venta', 1, '2018-01-15 00:59:12', '2018-01-15 00:59:12'),
(86, 'Banco de Venezuela', '183978.1400', NULL, 'DEBE', '2018-01-14 04:00:00', '459945.3500', 'Venta', 1, '2018-01-15 01:00:30', '2018-01-15 01:00:30'),
(87, 'Banco Banesco', '183978.1400', NULL, 'DEBE', '2018-01-14 04:00:00', '367956.2800', 'Venta', 1, '2018-01-15 01:00:55', '2018-01-15 01:00:55'),
(89, 'Banco de Venezuela', '10000000.0000', NULL, 'HABER', '2018-01-14 04:00:00', '-9540054.6500', 'Pago de deuda de proveedor PROV02', 1, '2018-01-15 03:11:51', '2018-01-15 03:11:51'),
(90, 'Caja Chica', '358880.0000', NULL, 'HABER', '2018-01-14 04:00:00', '404578.0100', 'Pago de deuda de proveedor PROV02', 1, '2018-01-17 01:49:29', '2018-01-17 01:49:29'),
(91, 'Caja Chica', '100000.0000', NULL, 'HABER', '2018-01-16 04:00:00', '-100000.0000', 'Pago de deuda de proveedor ', 1, '2018-01-17 03:44:52', '2018-01-17 03:44:52'),
(92, 'Caja Chica', '100000.0000', NULL, 'HABER', '2018-01-14 04:00:00', '304578.0100', 'Pago de deuda de proveedor ', 1, '2018-01-17 03:45:42', '2018-01-17 03:45:42'),
(93, 'Caja Chica', '100000.0000', NULL, 'DEBE', '2018-01-16 04:00:00', '0.0000', 'Cobro de deuda a cliente cli3', 1, '2018-01-17 03:48:30', '2018-01-17 03:48:30'),
(94, 'Caja Chica', '90000.0000', NULL, 'DEBE', '2018-01-16 04:00:00', '90000.0000', 'Cobro de deuda a cliente cli3', 1, '2018-01-17 04:01:50', '2018-01-17 04:01:50'),
(95, 'Caja Chica', '1000.0000', NULL, 'DEBE', '2018-01-16 04:00:00', '91000.0000', 'Cobro de deuda a cliente cli3', 1, '2018-01-17 04:20:25', '2018-01-17 04:20:25'),
(96, 'Caja Chica', '1000.0000', NULL, 'DEBE', '2018-01-16 04:00:00', '92000.0000', 'Cobro de deuda a cliente cli3', 1, '2018-01-17 04:21:36', '2018-01-17 04:21:36'),
(97, 'Caja Chica', '36960.0000', NULL, 'HABER', '2018-01-16 04:00:00', '55040.0000', 'Pago de deuda de proveedor PROV03', 1, '2018-01-17 04:29:34', '2018-01-17 04:29:34'),
(98, 'Banco de Venezuela', NULL, NULL, 'HABER', '2018-01-18 04:00:00', '71941.0000', 'Inicio de caja', 1, '2018-01-19 00:49:12', '2018-01-19 00:49:12'),
(99, 'Banco de Venezuela', '134378.7200', 234, 'HABER', '2018-01-18 04:00:00', '-62437.7200', 'Compra', 1, '2018-01-19 00:49:12', '2018-01-19 00:49:21'),
(100, 'Banco de Venezuela', '134378.7200', NULL, 'DEBE', '2018-01-18 04:00:00', '134378.7200', 'Reembolso por eliminación de compra', 1, '2018-01-19 01:29:14', '2018-01-19 01:29:14'),
(101, 'Banco de Venezuela', '134378.7200', NULL, 'HABER', '2018-01-18 04:00:00', '-134378.7200', 'Reactivación de compra', 1, '2018-01-19 02:40:34', '2018-01-19 02:40:34'),
(102, 'Banco de Venezuela', '134378.7200', NULL, 'HABER', '2018-01-18 04:00:00', '-134378.7200', 'Reactivación de compra', 1, '2018-01-19 02:45:16', '2018-01-19 02:45:16'),
(103, 'Banco de Venezuela', '134378.7200', NULL, 'DEBE', '2018-01-18 04:00:00', '134378.7200', 'Reembolso por eliminación de compra', 1, '2018-01-19 02:48:12', '2018-01-19 02:48:12'),
(104, 'Banco de Venezuela', '134378.7200', NULL, 'HABER', '2018-01-18 04:00:00', '-134378.7200', 'Reactivación de compra', 1, '2018-01-19 02:48:43', '2018-01-19 02:48:43'),
(105, 'Banco de Venezuela', '134378.7200', NULL, 'DEBE', '2018-01-18 04:00:00', '134378.7200', 'Reembolso por eliminación de compra', 1, '2018-01-19 02:49:19', '2018-01-19 02:49:19'),
(106, 'Banco de Venezuela', '134378.7200', NULL, 'HABER', '2018-01-18 04:00:00', '-134378.7200', 'Reactivación de compra', 1, '2018-01-19 02:55:31', '2018-01-19 02:55:31'),
(107, 'Banco de Venezuela', '134378.7200', NULL, 'DEBE', '2018-01-18 04:00:00', '206319.7200', 'Reembolso por eliminación de compra', 1, '2018-01-19 03:09:16', '2018-01-19 03:09:16'),
(108, 'Banco de Venezuela', '134378.7200', NULL, 'HABER', '2018-01-18 04:00:00', '-62437.7200', 'Reactivación de compra', 1, '2018-01-19 03:09:44', '2018-01-19 03:09:44'),
(109, 'Banco de Venezuela', '134378.7200', NULL, 'DEBE', '2018-01-18 04:00:00', '71941.0000', 'Reembolso por eliminación de compra', 1, '2018-01-19 03:11:39', '2018-01-19 03:11:39'),
(110, 'Banco de Venezuela', '134378.7200', NULL, 'HABER', '2018-01-18 04:00:00', '-62437.7200', 'Reactivación de compra', 1, '2018-01-19 03:11:43', '2018-01-19 03:11:43'),
(111, 'Banco de Venezuela', '134378.7200', NULL, 'DEBE', '2018-01-18 04:00:00', '71941.0000', 'Reembolso por eliminación de compra', 1, '2018-01-19 03:12:47', '2018-01-19 03:12:47'),
(112, 'Banco de Venezuela', '134378.7200', NULL, 'HABER', '2018-01-18 04:00:00', '-62437.7200', 'Reactivación de compra bajo factura: 9 de fecha 2018-01-18', 1, '2018-01-19 04:06:11', '2018-01-19 04:06:11'),
(113, 'Banco de Venezuela', '134378.7200', NULL, 'DEBE', '2018-01-18 04:00:00', '71941.0000', 'Reembolso por eliminación de compra bajo factura: 9 de fecha 2018-01-18', 1, '2018-01-19 04:07:59', '2018-01-19 04:07:59'),
(114, 'Banco de Venezuela', '134378.7200', NULL, 'HABER', '2018-01-18 04:00:00', '-62437.7200', 'Reactivación de compra bajo factura: 9 de fecha 2018-01-18', 1, '2018-01-19 04:20:47', '2018-01-19 04:20:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajachica`
--

CREATE TABLE IF NOT EXISTS `cajachica` (
`id` int(10) unsigned NOT NULL,
  `cc_monto` decimal(25,4) NOT NULL,
  `cc_compra_id` int(10) unsigned NOT NULL,
  `cc_debe_haber` enum('DEBE','HABER') NOT NULL,
  `cc_fecha` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cardexmp`
--

CREATE TABLE IF NOT EXISTS `cardexmp` (
`id` int(10) unsigned NOT NULL,
  `mp_codigo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comp_doc` varchar(255) DEFAULT NULL,
  `car_costo` decimal(25,4) NOT NULL,
  `car_valor_anterior` decimal(25,4) NOT NULL,
  `car_valor_actual` decimal(25,4) NOT NULL,
  `car_alicuota` varchar(255) NOT NULL,
  `car_iva` decimal(25,4) NOT NULL,
  `car_compra_id` int(10) unsigned DEFAULT NULL,
  `car_concepto` varchar(255) DEFAULT NULL,
  `car_fecha` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cardexmp`
--

INSERT INTO `cardexmp` (`id`, `mp_codigo`, `comp_doc`, `car_costo`, `car_valor_anterior`, `car_valor_actual`, `car_alicuota`, `car_iva`, `car_compra_id`, `car_concepto`, `car_fecha`, `created_at`, `updated_at`) VALUES
(154, 'MI00000', '1', '33000.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:31', '2018-01-13 20:43:31'),
(155, 'MI00001', '1', '500000.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:31', '2018-01-13 20:43:31'),
(156, 'MI00002', '1', '9000.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:31', '2018-01-13 20:43:31'),
(157, 'MI00003', '1', '3139.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:31', '2018-01-13 20:43:31'),
(158, 'MI00004', '1', '55555.5600', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:31', '2018-01-13 20:43:31'),
(159, 'MI00005', '1', '86981.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:31', '2018-01-13 20:43:31'),
(160, 'MI00006', '1', '13600.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:31', '2018-01-13 20:43:31'),
(161, 'MI00007', '1', '500.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(162, 'MI00008', '1', '500.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(163, 'MI00009', '1', '300.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(164, 'MI00010', '1', '600.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(165, 'MI00011', '1', '10000.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(166, 'MI00012', '1', '20000.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(167, 'MI00013', '1', '3000.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(168, 'MI00014', '1', '1000.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(169, 'MI00015', '1', '2500.0000', '0.0000', '100.0000', '0.0000', '0.0000', 163, NULL, NULL, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(170, 'MP00000', '2', '45000.0000', '0.0000', '1.0000', '0.0000', '0.0000', 225, NULL, NULL, '2018-01-14 00:39:54', '2018-01-14 00:39:54'),
(171, 'MP00001', '2', '4000.0000', '0.0000', '1.0000', '0.0000', '0.0000', 225, NULL, NULL, '2018-01-14 00:39:54', '2018-01-14 00:39:54'),
(172, 'MI00000', '3', '33000.0000', '100.0000', '101.0000', '12%', '3960.0000', 226, NULL, NULL, '2018-01-14 00:49:23', '2018-01-14 00:49:23'),
(173, 'MI00001', '3', '500000.0000', '100.0000', '101.0000', '12%', '60000.0000', 226, NULL, NULL, '2018-01-14 00:49:23', '2018-01-14 00:49:23'),
(174, 'MI00000', '4', '33000.0000', '101.0000', '102.0000', '12%', '3960.0000', 228, NULL, NULL, '2018-01-14 01:06:11', '2018-01-14 01:06:11'),
(175, 'MI00001', '4', '500000.0000', '101.0000', '102.0000', '12%', '60000.0000', 228, NULL, NULL, '2018-01-14 01:06:11', '2018-01-14 01:06:11'),
(176, 'MI00000', '5', '33000.0000', '102.0000', '103.0000', '12%', '3960.0000', 229, NULL, NULL, '2018-01-14 01:16:04', '2018-01-14 01:16:04'),
(177, 'MI00001', '5', '500000.0000', '102.0000', '103.0000', '12%', '60000.0000', 229, NULL, NULL, '2018-01-14 01:16:04', '2018-01-14 01:16:04'),
(178, 'MI00000', '6', '33000.0000', '103.0000', '203.0000', '12%', '396000.0000', 231, NULL, NULL, '2018-01-14 03:52:21', '2018-01-14 03:52:21'),
(179, 'MI00001', '6', '500000.0000', '103.0000', '113.0000', '12%', '600000.0000', 231, NULL, NULL, '2018-01-14 03:52:21', '2018-01-14 03:52:21'),
(180, 'MI00002', '6', '9000.0000', '100.0000', '200.0000', '12%', '108000.0000', 231, NULL, NULL, '2018-01-14 03:52:21', '2018-01-14 03:52:21'),
(181, 'MI00000', '7', '33000.0000', '203.0000', '204.0000', '12%', '3960.0000', 232, NULL, NULL, '2018-01-14 22:00:29', '2018-01-14 22:00:29'),
(182, 'MI00000', '8', '33000.0000', '204.0000', '205.0000', '12%', '3960.0000', 233, NULL, NULL, '2018-01-19 00:48:47', '2018-01-19 00:48:47'),
(183, 'MI00003', '8', '3139.0000', '100.0000', '101.0000', '12%', '376.6800', 233, NULL, NULL, '2018-01-19 00:48:47', '2018-01-19 00:48:47'),
(184, 'MI00000', '9', '33000.0000', '205.0000', '206.0000', '12%', '3960.0000', 234, NULL, NULL, '2018-01-19 00:49:21', '2018-01-19 00:49:21'),
(185, 'MI00005', '9', '86981.0000', '100.0000', '101.0000', '12%', '10437.7200', 234, NULL, NULL, '2018-01-19 00:49:21', '2018-01-19 00:49:21'),
(186, 'MI00000', '10', '33000.0000', '206.0000', '216.0000', '12%', '39600.0000', 235, NULL, NULL, '2018-01-19 04:30:39', '2018-01-19 04:30:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
`id` int(10) unsigned NOT NULL,
  `cli_codigo` varchar(255) NOT NULL,
  `cli_nombre` varchar(255) NOT NULL,
  `cli_rif` varchar(255) NOT NULL,
  `cli_direccion` varchar(255) NOT NULL,
  `cli_contacto` varchar(255) NOT NULL,
  `cli_condiciones` varchar(255) NOT NULL,
  `cli_saldo` decimal(25,4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `cli_codigo`, `cli_nombre`, `cli_rif`, `cli_direccion`, `cli_contacto`, `cli_condiciones`, `cli_saldo`, `created_at`, `updated_at`) VALUES
(4, 'cli1', 'cliente uno', 'J82173', 'sadjas', 'ajsdhj', 'akjsdha', '1879543.1040', '2018-01-06 19:26:09', '2018-01-16 05:11:08'),
(5, 'cli2', 'Cliente dos', 'J237462387', 'asdhasjdsh', 'kajsdhash', 'dashdash', '1839781.4300', '2018-01-16 05:03:02', '2018-01-16 05:32:59'),
(6, 'cli3', 'Cliente tres', 'J837438242', 'asjdhasjdhas', 'aksjdhakjhdsj', 'kjashdkjashd', '367956.2800', '2018-01-16 05:33:30', '2018-01-16 05:36:55');

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
  `comp_cred_cont` enum('contado','credito') DEFAULT NULL,
  `comp_entidad` varchar(255) DEFAULT NULL,
  `comp_activo` int(1) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `comp_doc`, `comp_proveedor`, `comp_fecha`, `comp_monto`, `comp_cred_cont`, `comp_entidad`, `comp_activo`, `created_at`, `updated_at`) VALUES
(163, '1', 'PROV01', '2018-01-13 08:41:15', '80624636.0400', 'credito', NULL, 1, '2018-01-13 20:41:24', '2018-01-13 20:43:31'),
(225, '2', 'PROV02', '2018-01-13 08:53:44', '54880.0000', 'credito', NULL, 1, '2018-01-14 00:38:34', '2018-01-14 00:39:54'),
(226, '3', 'PROV01', '2018-01-13 12:46:48', '596960.0000', 'credito', NULL, 1, '2018-01-14 00:47:15', '2018-01-14 00:49:23'),
(228, '4', 'PROV01', '2018-01-13 13:03:43', '596960.0000', 'contado', NULL, 1, '2018-01-14 01:05:15', '2018-01-14 01:06:11'),
(229, '5', 'PROV02', '2018-01-13 13:15:40', '596960.0000', 'contado', NULL, 1, '2018-01-14 01:15:52', '2018-01-14 01:16:04'),
(231, '6', 'PROV02', '2018-01-13 15:51:05', '10304000.0000', 'credito', NULL, 1, '2018-01-14 03:51:24', '2018-01-14 03:52:21'),
(232, '7', 'PROV03', '2018-01-14 09:59:47', '36960.0000', 'credito', NULL, 1, '2018-01-14 22:00:21', '2018-01-14 22:00:29'),
(233, '8', 'PROV01', '2018-01-18 04:00:00', '40475.6800', 'credito', NULL, 1, '2018-01-19 00:48:17', '2018-01-19 04:20:40'),
(234, '9', 'PROV04', '2018-01-18 04:00:00', '134378.7200', 'contado', 'Banco de Venezuela', 1, '2018-01-19 00:49:11', '2018-01-19 04:20:47'),
(235, '10', 'PROV04', '2018-01-19 04:00:00', '369600.0000', 'credito', NULL, 1, '2018-01-19 04:30:22', '2018-01-19 04:40:52');

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
-- Estructura de tabla para la tabla `cuentasxcobrar`
--

CREATE TABLE IF NOT EXISTS `cuentasxcobrar` (
`id` int(10) unsigned NOT NULL,
  `cta_cli_codigo` varchar(255) NOT NULL,
  `cta_monto` decimal(25,4) DEFAULT NULL,
  `cta_concepto` varchar(255) DEFAULT NULL,
  `cta_venta_id` int(10) unsigned DEFAULT NULL,
  `cta_pagada` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentasxcobrar`
--

INSERT INTO `cuentasxcobrar` (`id`, `cta_cli_codigo`, `cta_monto`, `cta_concepto`, `cta_venta_id`, `cta_pagada`, `created_at`, `updated_at`) VALUES
(1, 'cli1', '919890.7200', 'Venta 8 de fecha 2018-01-14', 11, NULL, '2018-01-14 18:15:19', '2018-01-14 18:15:19'),
(2, 'cli1', '367956.2900', 'Venta 10 de fecha 2018-01-14', 13, NULL, '2018-01-14 23:33:00', '2018-01-14 23:33:00'),
(3, 'cli1', '183978.1400', 'Venta de factura 16 de fecha 2018-01-14', 19, NULL, '2018-01-15 00:58:20', '2018-01-15 00:58:20'),
(4, 'cli1', '183978.1400', 'Venta de factura 21 de fecha 2018-01-16', 24, NULL, '2018-01-16 05:03:44', '2018-01-16 05:03:44'),
(5, 'cli1', '183978.1400', 'Venta de factura 22 de fecha 2018-01-16', 25, NULL, '2018-01-16 05:11:09', '2018-01-16 05:11:09'),
(6, 'cli2', '183978.1400', 'Venta de factura 23 de fecha 2018-01-16', 26, NULL, '2018-01-16 05:32:59', '2018-01-16 05:32:59'),
(7, 'cli3', '183978.1400', 'Venta de factura 24 de fecha 2018-01-16', 27, 1, '2018-01-16 05:33:55', '2018-01-17 04:21:36'),
(8, 'cli3', '183978.1400', 'Venta de factura 25 de fecha 2018-01-16', 28, NULL, '2018-01-16 05:36:55', '2018-01-16 05:36:55'),
(9, 'cli3', '100000.0000', 'Cobro de deuda', NULL, NULL, '2018-01-17 03:48:30', '2018-01-17 03:48:30'),
(10, 'cli3', '90000.0000', 'Cobro de deuda', NULL, NULL, '2018-01-17 04:01:50', '2018-01-17 04:01:50'),
(11, 'cli3', '1000.0000', 'Cobro de deuda', NULL, NULL, '2018-01-17 04:20:25', '2018-01-17 04:20:25'),
(12, 'cli3', '1000.0000', 'Cobro de deuda', NULL, NULL, '2018-01-17 04:21:36', '2018-01-17 04:21:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentasxpagar`
--

CREATE TABLE IF NOT EXISTS `cuentasxpagar` (
`id` int(10) unsigned NOT NULL,
  `cta_prov_codigo` varchar(255) NOT NULL,
  `cta_monto` decimal(25,4) DEFAULT NULL,
  `cta_concepto` varchar(255) DEFAULT NULL,
  `cta_compra_id` int(10) unsigned DEFAULT NULL,
  `cta_pagada` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentasxpagar`
--

INSERT INTO `cuentasxpagar` (`id`, `cta_prov_codigo`, `cta_monto`, `cta_concepto`, `cta_compra_id`, `cta_pagada`, `created_at`, `updated_at`) VALUES
(14, 'PROV01', '787556627.2000', 'Compra a crédito bajo factura: 1', 146, NULL, '2018-01-12 21:23:07', '2018-01-12 21:26:58'),
(15, 'PROV01', '40880000.0000', 'Compra a crédito bajo factura: 2', 147, NULL, '2018-01-12 21:28:01', '2018-01-12 21:28:29'),
(29, 'PROV01', '641525.5604', 'Compra a crédito bajo factura: 3', 161, NULL, '2018-01-13 20:06:47', '2018-01-13 20:17:35'),
(30, 'PROV01', '124205.5000', 'Compra a crédito bajo factura: 4', 162, NULL, '2018-01-13 20:22:29', '2018-01-13 20:23:26'),
(31, 'PROV01', '80624636.0400', 'Compra a crédito bajo factura: 1', 163, NULL, '2018-01-13 20:41:24', '2018-01-13 20:43:31'),
(93, 'PROV02', '54880.0000', 'Compra a crédito bajo factura: 2', 225, 1, '2018-01-14 00:38:34', '2018-01-17 01:49:29'),
(94, 'PROV01', '596960.0000', 'Compra a crédito bajo factura: 3', 226, NULL, '2018-01-14 00:47:15', '2018-01-14 00:49:23'),
(96, 'PROV02', '10304000.0000', 'Compra a crédito bajo factura: 6', 231, NULL, '2018-01-14 03:51:24', '2018-01-14 03:52:21'),
(97, 'PROV03', '36960.0000', 'Compra a crédito bajo factura: 7', 232, 1, '2018-01-14 22:00:21', '2018-01-17 04:29:34'),
(100, 'PROV02', '10000000.0000', 'Pago de deuda', NULL, NULL, '2018-01-15 03:11:51', '2018-01-15 03:11:51'),
(101, 'PROV02', '358880.0000', 'Pago de deuda', NULL, NULL, '2018-01-17 01:49:29', '2018-01-17 01:49:29'),
(102, 'PROV03', '36960.0000', 'Pago de deuda', NULL, NULL, '2018-01-17 04:29:34', '2018-01-17 04:29:34'),
(103, 'PROV01', '40475.6800', 'Compra a crédito bajo factura: 8 de fecha 2018-01-18', 233, NULL, '2018-01-19 00:48:17', '2018-01-19 00:48:46'),
(104, 'PROV01', '40475.6800', 'Reactivación de compra a crédito bajo factura: 8 de fecha 2018-01-18', 233, NULL, '2018-01-19 01:25:14', '2018-01-19 01:25:14'),
(105, 'PROV01', '40475.6800', 'Eliminación de compra a crédito bajo factura: 8 de fecha 2018-01-18', 233, NULL, '2018-01-19 04:19:43', '2018-01-19 04:19:43'),
(106, 'PROV01', '40475.6800', 'Reactivación de compra a crédito bajo factura: 8 de fecha 2018-01-18', 233, NULL, '2018-01-19 04:20:40', '2018-01-19 04:20:40'),
(107, 'PROV04', '369600.0000', 'Compra a crédito bajo factura: 10 de fecha 2018-01-19', 235, NULL, '2018-01-19 04:30:22', '2018-01-19 04:30:39'),
(108, 'PROV04', '369600.0000', 'Eliminación de compra a crédito bajo factura: 10 de fecha 2018-01-19', 235, NULL, '2018-01-19 04:40:46', '2018-01-19 04:40:46'),
(109, 'PROV04', '369600.0000', 'Reactivación de compra a crédito bajo factura: 10 de fecha 2018-01-19', 235, NULL, '2018-01-19 04:40:52', '2018-01-19 04:40:52');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dependencias`
--

INSERT INTO `dependencias` (`id`, `dep_padre`, `dep_hijo`, `dep_produccion`, `requerimiento`, `created_at`, `updated_at`) VALUES
(2, 'EJEMPLO RECETA B', 'EJEMPLO RECETA A', 18, 52, '2018-01-01 09:36:39', '2018-01-01 15:46:13'),
(3, 'EJEMPLO RECETA B', 'EJEMPLO RECETA A 2', 21, 52, '2018-01-01 09:36:42', '2018-01-01 15:46:13'),
(4, 'EJEMPLO RECETA C', 'EJEMPLO RECETA B', 32, 100, '2018-01-01 09:55:29', '2018-01-06 21:28:22'),
(5, 'EJEMPLO 2', 'EJEMPLO RECETA B', 32, 150, '2018-01-06 20:30:14', '2018-01-06 21:28:29');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `rec_nombre`, `ing_ingrediente`, `created_at`, `updated_at`) VALUES
(19, 'EJEMPLO RECETA A', 'ACEITE', '2017-12-17 08:40:09', '2017-12-17 08:40:09'),
(20, 'EJEMPLO RECETA A', 'ACEITUNAS', '2017-12-17 08:40:13', '2017-12-17 08:40:13'),
(21, 'EJEMPLO RECETA A', 'ÁCIDO CÍTRICO', '2017-12-17 08:40:15', '2017-12-17 08:40:15'),
(25, 'EJEMPLO RECETA B', 'ACEITE', '2017-12-18 08:18:56', '2017-12-18 08:18:56'),
(26, 'EJEMPLO RECETA B', 'ACEITUNAS', '2017-12-18 08:18:59', '2017-12-18 08:18:59'),
(27, 'EJEMPLO RECETA C', 'BANDEJA CARTÓN 12x300cc', '2017-12-27 06:54:56', '2017-12-27 06:54:56'),
(28, 'EJEMPLO RECETA A 2', 'AJOPORRO', '2018-01-01 09:06:58', '2018-01-01 09:06:58'),
(29, 'EJEMPLO RECETA A 2', 'ALBAHACA', '2018-01-01 09:07:02', '2018-01-01 09:07:02'),
(30, 'EJEMPLO RECETA A 2', 'ALCOHOL', '2018-01-01 09:07:05', '2018-01-01 09:07:05'),
(31, 'EJEMPLO 2', 'ACEITE', '2018-01-06 20:30:18', '2018-01-06 20:30:18');

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiasprimas`
--

INSERT INTO `materiasprimas` (`id`, `mp_codigo`, `mp_cantidad`, `created_at`, `updated_at`) VALUES
(38, 'MI00000', 216, '2018-01-13 20:43:31', '2018-01-19 04:40:52'),
(39, 'MI00001', 113, '2018-01-13 20:43:31', '2018-01-14 03:52:21'),
(40, 'MI00002', 200, '2018-01-13 20:43:31', '2018-01-14 03:52:21'),
(41, 'MI00003', 101, '2018-01-13 20:43:31', '2018-01-19 04:20:40'),
(42, 'MI00004', 100, '2018-01-13 20:43:31', '2018-01-13 20:43:31'),
(43, 'MI00005', 101, '2018-01-13 20:43:31', '2018-01-19 04:20:47'),
(44, 'MI00006', 100, '2018-01-13 20:43:31', '2018-01-13 20:43:31'),
(45, 'MI00007', 100, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(46, 'MI00008', 100, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(47, 'MI00009', 100, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(48, 'MI00010', 100, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(49, 'MI00011', 100, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(50, 'MI00012', 100, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(51, 'MI00013', 100, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(52, 'MI00014', 100, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(53, 'MI00015', 100, '2018-01-13 20:43:32', '2018-01-13 20:43:32'),
(54, 'MP00000', 1, '2018-01-14 00:39:54', '2018-01-14 00:39:54'),
(55, 'MP00001', 1, '2018-01-14 00:39:54', '2018-01-14 00:39:54');

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
  `par_ratio` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `par_codigo`, `par_nombre`, `par_unidad`, `par_costo`, `par_observacion`, `par_cost_updated`, `par_default`, `par_ratio`, `created_at`, `updated_at`) VALUES
(98, 'MI00000', 'ACEITE', 'LITRO', '33000.0000', 'ACTUALIZADO AL 02/11/2017', '2017-12-29 13:08:38', 0, NULL, '2017-12-02 22:17:39', '2017-12-29 13:08:38'),
(99, 'MI00001', 'ACEITUNAS', 'KILO', '500000.0000', 'ACTUALIZADO AL 30/11/2017 ESPECULATIVO', '2017-12-18 11:04:23', 0, NULL, '2017-12-02 22:19:23', '2017-12-18 11:04:23'),
(100, 'MP00000', 'AJOPORRO', 'KILO', '45000.0000', 'ACTUALIZADO AL 29/11201', NULL, 0, NULL, '2017-12-02 22:24:43', '2017-12-02 22:24:43'),
(101, 'MI00002', 'ÁCIDO CÍTRICO', 'KILO', '9000.0000', 'ACTUALIZADO AL 22/02/2017', NULL, 0, NULL, '2017-12-02 22:26:53', '2017-12-09 21:19:27'),
(102, 'MP00001', 'ALBAHACA', 'KILO', '4000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-02 22:35:18', '2017-12-02 22:35:18'),
(103, 'MI00003', 'ALCOHOL', 'LITRO', '3139.0000', 'ACTUALIZADO AL 25/01/2017', NULL, 0, NULL, '2017-12-02 22:39:43', '2017-12-04 21:56:12'),
(104, 'MI00004', 'ALMIDÓN DE MAÍZ (MAICINA) ', 'KILO', '55555.5600', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-02 22:43:57', '2017-12-29 13:10:39'),
(105, 'MI00005', 'ATÚN ENLATADO', 'KILO', '86981.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-03 17:19:18', '2017-12-03 17:19:18'),
(106, 'MP00002', 'ATÚN FRESCO', 'KILO', '0.0000', '', NULL, 0, NULL, '2017-12-03 17:22:12', '2017-12-03 17:22:12'),
(107, 'MI00006', 'AZÚCAR', 'KILO', '13600.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-03 17:24:14', '2017-12-03 17:24:14'),
(108, 'MI00007', 'BANDEJA CARTÓN 12x500cc', 'UNIDAD', '500.0000', 'COSTO ESPECULATIVO', NULL, 0, NULL, '2017-12-03 17:29:49', '2017-12-03 17:29:49'),
(109, 'MI00008', 'BANDEJA CARTÓN 12x300cc', 'UNIDAD', '500.0000', 'COSTO ESPECULATIVO', NULL, 1, 10, '2017-12-03 17:31:42', '2017-12-30 06:58:32'),
(110, 'MI00009', 'BANDEJA CARTÓN 6x300cc', 'UNIDAD', '300.0000', 'COSTO ESPECULATIVO', NULL, 1, 20, '2017-12-03 17:32:42', '2017-12-30 07:01:17'),
(111, 'MI00010', 'BANDEJA CARTÓN 24x200cc', 'UNIDAD', '600.0000', 'COSTO ESPECULATIVO', NULL, 1, 5, '2017-12-03 17:34:19', '2017-12-30 06:59:33'),
(113, 'MP00003', 'CEBOLLA', 'KILO', '30000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-03 17:45:26', '2017-12-03 17:45:26'),
(117, 'MP00005', 'VAINITA', 'KILO', '6000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-04 21:49:07', '2017-12-04 21:49:07'),
(118, 'MP00006', 'ZANAHORIA ', 'KILO', '6400.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-04 21:51:43', '2017-12-04 21:51:43'),
(119, 'MP00007', 'PIMENTÓN', 'KILO', '9550.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-04 21:52:27', '2017-12-04 21:52:27'),
(120, 'MP00008', 'COLIFLOR', 'KILO', '6000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-04 21:53:19', '2017-12-04 21:53:19'),
(121, 'MP00009', 'CÉLERI (APIO ESPAÑA)', 'KILO', '4500.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-04 21:54:09', '2017-12-04 21:54:09'),
(122, 'MP00010', 'CEBOLLÍN', 'KILO', '2500.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-04 21:54:34', '2017-12-04 21:54:34'),
(123, 'MI00011', 'SAL', 'KILO', '10000.0000', 'PRECIO INVENTADO', NULL, 0, NULL, '2017-12-10 18:41:38', '2017-12-10 18:41:38'),
(124, 'MI00012', 'GAS', '% DE LA CARGA', '20000.0000', '', NULL, 0, NULL, '2017-12-10 18:43:21', '2017-12-10 18:43:21'),
(125, 'MI00013', 'FRASCO 500CC', 'UNIDAD', '3000.0000', 'COSTO INVENTADO', NULL, 1, NULL, '2017-12-10 18:45:39', '2017-12-15 23:09:45'),
(126, 'MI00014', 'PRESINTO FRASCO 500cc', 'UNIDAD', '1000.0000', 'COSTO INVENTADO', NULL, 1, NULL, '2017-12-10 18:47:12', '2017-12-15 23:09:55'),
(127, 'MI00015', 'ETIQUETA ANTIPASTO ATÚN 470G', 'UNIDAD', '2500.0000', 'PRECIO INVENTADO', NULL, 1, NULL, '2017-12-10 18:48:47', '2017-12-15 23:10:07');

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
  `pro_lote` int(10) unsigned DEFAULT NULL,
  `pro_concepto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id`, `pro_fecha`, `rec_nombre`, `pro_etapa`, `pro_produccion`, `pro_costo`, `pro_mano_obra`, `pro_lote`, `pro_concepto`, `created_at`, `updated_at`) VALUES
(17, '2018-01-01', 'EJEMPLO RECETA A', 'PA', 101, '594.8700', '2.5000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-01 09:06:20', '2018-01-01 15:49:46'),
(18, '2018-01-02', 'EJEMPLO RECETA A', 'PA', 102, '590.5900', '2.5000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-01 09:06:35', '2018-01-01 15:53:36'),
(20, '2018-01-01', 'EJEMPLO RECETA A 2', 'PA', 101, '594.8700', '2.5000', NULL, 'Producción de EJEMPLO RECETA A 2', '2018-01-01 09:32:24', '2018-01-01 15:49:43'),
(21, '2018-01-02', 'EJEMPLO RECETA A 2', 'PA', 102, '590.5900', '2.5000', NULL, 'Producción de EJEMPLO RECETA A 2', '2018-01-01 09:32:44', '2018-01-01 15:50:01'),
(22, '2018-01-01', 'EJEMPLO RECETA A', 'PA', 203, '594.8700', '2.5000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-01 09:37:51', '2018-01-01 15:49:46'),
(23, '2018-01-01', 'EJEMPLO RECETA A 2', 'PA', 304, '594.8700', '2.5000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-01 09:37:51', '2018-01-01 15:49:43'),
(24, '2018-01-01', 'EJEMPLO RECETA B', 'PB', 100, '1213.4500', '2.5000', 1, 'Producción de EJEMPLO RECETA B', '2018-01-01 09:37:51', '2018-01-01 15:49:39'),
(25, '2018-01-02', 'EJEMPLO RECETA A', 'PA', 50, '590.5900', '2.5000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-01 09:44:33', '2018-01-01 15:53:36'),
(26, '2018-01-02', 'EJEMPLO RECETA A 2', 'PA', 50, '590.5900', '2.5000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-01 09:44:33', '2018-01-01 15:50:01'),
(27, '2018-01-02', 'EJEMPLO RECETA B', 'PB', 100, '1213.4500', '2.5000', 2, 'Producción de EJEMPLO RECETA B', '2018-01-01 09:44:33', '2018-01-15 03:33:07'),
(28, '2018-01-01', 'EJEMPLO RECETA B', 'PB', 100, '1213.4500', '2.5000', NULL, 'Producción de EJEMPLO RECETA C', '2018-01-01 09:55:54', '2018-01-01 15:49:39'),
(29, '2018-01-01', 'EJEMPLO RECETA C', 'PC', 100, '1812.6800', '2.5000', NULL, 'Producción de EJEMPLO RECETA C', '2018-01-01 09:55:54', '2018-01-01 15:49:37'),
(30, '2018-01-03', 'EJEMPLO RECETA A', 'PA', 50, NULL, '2.5000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-01 14:18:31', '2018-01-01 14:18:31'),
(31, '2018-01-03', 'EJEMPLO RECETA A 2', 'PA', 50, NULL, '2.5000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-01 14:18:31', '2018-01-01 14:18:31'),
(32, '2018-01-03', 'EJEMPLO RECETA B', 'PB', 100, '11961.5700', '3.0000', 3, 'Producción de EJEMPLO RECETA B', '2018-01-01 14:18:31', '2018-01-18 03:04:13'),
(33, '2018-01-01', 'EJEMPLO RECETA B', 'PB', 150, NULL, '3.0000', NULL, 'Producción de EJEMPLO 2', '2018-01-06 21:28:29', '2018-01-06 21:28:29'),
(34, '2018-01-01', 'EJEMPLO 2', 'PC', 150, '14613.9400', '2.5000', NULL, 'Producción de EJEMPLO 2', '2018-01-06 21:28:29', '2018-01-06 21:28:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producciona`
--

INSERT INTO `producciona` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(2, 'EJEMPLO RECETA A', 53, '2018-01-01 09:06:19', '2018-01-01 14:18:31'),
(3, 'EJEMPLO RECETA A 2', 154, '2018-01-01 09:16:26', '2018-01-01 14:18:31');

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
(2, 'EJEMPLO RECETA B', 53, '2018-01-01 09:37:51', '2018-01-06 21:28:29');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccionc`
--

INSERT INTO `produccionc` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(1, 'EJEMPLO RECETA C', 30, '2018-01-01 09:55:54', '2018-01-16 05:36:55'),
(2, 'EJEMPLO 2', 30, '2018-01-06 21:28:29', '2018-01-16 05:36:55');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `prov_codigo`, `prov_nombre`, `prov_rif`, `prov_direccion`, `prov_contacto`, `prov_condiciones`, `prov_retencion`, `prov_saldo`, `prov_cred_o_cont`, `created_at`, `updated_at`) VALUES
(2, 'PROV01', 'Proveedor', 'J287327', 'ashda', 'sajhda', 'asjdhas', 1, '914463279.9804', 'credito', '2017-12-04 18:57:53', '2018-01-19 00:48:46'),
(3, 'PROV02', 'Segundo Proveedor', 'J837642', 'ashdgasdgs', 'ashdhasdash', 'ajshdgahdgs', 0, '10358880.0000', 'credito', '2018-01-13 20:53:17', '2018-01-14 03:52:21'),
(4, 'PROV03', 'Tercer Proveedor', 'J983748237', 'jshdkash', 'kasdhasdsakj', '', 0, '36960.0000', 'credito', '2018-01-14 03:02:19', '2018-01-14 22:00:29'),
(5, 'PROV04', 'Cuarto Proveedor', 'J839748324', 'ashgdjgdjahjh', 'shdgajhdgsh', '', 0, '369600.0000', 'credito', '2018-01-14 03:12:26', '2018-01-19 04:30:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE IF NOT EXISTS `recetas` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rec_activo` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `rec_proc` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `rec_unidad` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `rec_nombre`, `rec_activo`, `rec_proc`, `rec_unidad`, `created_at`, `updated_at`) VALUES
(5, 'EJEMPLO RECETA A', 'si', 'PA', 'KILOS', '2017-12-17 08:35:09', '2017-12-17 08:35:09'),
(7, 'EJEMPLO RECETA B', 'si', 'PB', 'LITROS', '2017-12-17 08:35:37', '2017-12-26 10:41:03'),
(8, 'EJEMPLO RECETA C', 'si', 'PC', 'KILOS', '2017-12-27 06:54:37', '2017-12-29 10:59:44'),
(10, 'EJEMPLO RECETA A 2', 'si', 'PA', 'UNIDAD', '2017-12-30 11:32:12', '2017-12-30 11:32:12'),
(11, 'EJEMPLO 2', 'si', 'PC', 'Litros', '2018-01-06 20:30:07', '2018-01-06 20:30:07');

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
  `req_ratio` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requerimientos`
--

INSERT INTO `requerimientos` (`id`, `req_fecha`, `rec_nombre`, `req_ingrediente`, `req_total`, `req_default`, `req_ratio`, `created_at`, `updated_at`) VALUES
(48, '2018-01-01', 'EJEMPLO RECETA A', 'ACEITE', '0.0000', 0, NULL, '2018-01-01 09:06:16', '2018-01-01 09:06:20'),
(49, '2018-01-01', 'EJEMPLO RECETA A', 'ACEITUNAS', '0.0000', 0, NULL, '2018-01-01 09:06:16', '2018-01-01 09:06:20'),
(50, '2018-01-01', 'EJEMPLO RECETA A', 'ÁCIDO CÍTRICO', '0.0000', 0, NULL, '2018-01-01 09:06:16', '2018-01-01 09:06:20'),
(51, '2018-01-02', 'EJEMPLO RECETA A', 'ACEITE', '0.0000', 0, NULL, '2018-01-01 09:06:32', '2018-01-01 09:06:35'),
(52, '2018-01-02', 'EJEMPLO RECETA A', 'ACEITUNAS', '0.0000', 0, NULL, '2018-01-01 09:06:32', '2018-01-01 09:06:35'),
(53, '2018-01-02', 'EJEMPLO RECETA A', 'ÁCIDO CÍTRICO', '0.0000', 0, NULL, '2018-01-01 09:06:33', '2018-01-01 09:06:35'),
(54, '2018-01-01', 'EJEMPLO RECETA A 2', 'AJOPORRO', '0.0000', 0, NULL, '2018-01-01 09:07:21', '2018-01-01 09:32:24'),
(55, '2018-01-01', 'EJEMPLO RECETA A 2', 'ALBAHACA', '0.0000', 0, NULL, '2018-01-01 09:07:21', '2018-01-01 09:32:24'),
(56, '2018-01-01', 'EJEMPLO RECETA A 2', 'ALCOHOL', '0.0000', 0, NULL, '2018-01-01 09:07:21', '2018-01-01 09:32:24'),
(57, '2018-01-02', 'EJEMPLO RECETA A 2', 'AJOPORRO', '0.0000', 0, NULL, '2018-01-01 09:32:41', '2018-01-01 09:32:44'),
(58, '2018-01-02', 'EJEMPLO RECETA A 2', 'ALBAHACA', '0.0000', 0, NULL, '2018-01-01 09:32:41', '2018-01-01 09:32:44'),
(59, '2018-01-02', 'EJEMPLO RECETA A 2', 'ALCOHOL', '0.0000', 0, NULL, '2018-01-01 09:32:41', '2018-01-01 09:32:44'),
(60, '2018-01-01', 'EJEMPLO RECETA B', 'ACEITE', '0.0000', 0, NULL, '2018-01-01 09:37:41', '2018-01-01 09:37:51'),
(61, '2018-01-01', 'EJEMPLO RECETA B', 'ACEITUNAS', '0.0000', 0, NULL, '2018-01-01 09:37:41', '2018-01-01 09:37:51'),
(62, '2018-01-02', 'EJEMPLO RECETA B', 'ACEITE', '0.0000', 0, NULL, '2018-01-01 09:44:29', '2018-01-01 09:44:33'),
(63, '2018-01-02', 'EJEMPLO RECETA B', 'ACEITUNAS', '0.0000', 0, NULL, '2018-01-01 09:44:29', '2018-01-01 09:44:33'),
(64, '2018-01-01', 'EJEMPLO RECETA C', 'BANDEJA CARTÓN 12x300cc', '0.0000', 1, 10, '2018-01-01 09:55:42', '2018-01-01 09:55:55'),
(65, '2018-01-03', 'EJEMPLO RECETA B', 'ACEITE', '2.0000', 0, NULL, '2018-01-01 14:18:23', '2018-01-01 15:46:13'),
(66, '2018-01-03', 'EJEMPLO RECETA B', 'ACEITUNAS', '2.0000', 0, NULL, '2018-01-01 14:18:23', '2018-01-01 15:46:13'),
(67, '2018-01-01', 'EJEMPLO 2', 'ACEITE', '10.0000', 0, NULL, '2018-01-06 21:28:22', '2018-01-06 21:28:29');

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
(1, '4251.4000', 300, 21, '17623.6700', NULL, '2018-01-15 02:12:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saldocaja`
--

CREATE TABLE IF NOT EXISTS `saldocaja` (
`id` int(10) unsigned NOT NULL,
  `sc_entidad` varchar(255) NOT NULL,
  `sc_saldo` decimal(25,4) NOT NULL,
  `sc_fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `saldocaja`
--

INSERT INTO `saldocaja` (`id`, `sc_entidad`, `sc_saldo`, `sc_fecha`, `created_at`, `updated_at`) VALUES
(1, 'Caja Chica', '71941.0000', '2018-01-04 04:00:00', '2018-01-05 14:06:15', '2018-01-05 14:06:15'),
(2, 'Banco de Venezuela', '-23000.0000', '2018-01-05 04:00:00', '2018-01-07 14:21:17', '2018-01-07 14:21:17'),
(7, 'Caja Chica', '303512.6500', '2018-01-13 04:00:00', '2018-01-14 18:53:13', '2018-01-14 18:53:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `totalesventas`
--

CREATE TABLE IF NOT EXISTS `totalesventas` (
`id` int(10) unsigned NOT NULL,
  `ven_factura` varchar(255) NOT NULL,
  `ven_total` decimal(25,4) NOT NULL,
  `ven_iva` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `totalesventas`
--

INSERT INTO `totalesventas` (`id`, `ven_factura`, `ven_total`, `ven_iva`, `created_at`, `updated_at`) VALUES
(1, '2', '19880.8370', 9, '2018-01-07 03:58:03', '2018-01-07 03:58:03'),
(6, '3', '59642.5110', 9, '2018-01-07 04:03:44', '2018-01-07 04:03:44'),
(7, '4', '19880.8370', 9, '2018-01-11 16:44:24', '2018-01-11 16:44:24'),
(8, '5', '3099612.0288', 12, '2018-01-14 01:20:00', '2018-01-14 01:20:00'),
(9, '6', '2854238.0384', 12, '2018-01-14 16:40:59', '2018-01-14 16:40:59'),
(10, '7', '2651217.8784', 12, '2018-01-14 16:53:07', '2018-01-14 16:53:07'),
(11, '8', '919890.7200', 12, '2018-01-14 18:15:18', '2018-01-14 18:15:18'),
(12, '9', '828531.6500', 12, '2018-01-14 18:16:24', '2018-01-14 18:16:24'),
(13, '10', '367956.2900', 12, '2018-01-14 23:33:00', '2018-01-14 23:33:00'),
(14, '11', '367956.2900', 12, '2018-01-14 23:33:29', '2018-01-14 23:33:29'),
(15, '12', '183978.1400', 12, '2018-01-14 23:34:06', '2018-01-14 23:34:06'),
(16, '13', '183978.1400', 12, '2018-01-14 23:34:31', '2018-01-14 23:34:31'),
(17, '14', '183978.1400', 12, '2018-01-14 23:34:59', '2018-01-14 23:34:59'),
(18, '15', '183978.1400', 12, '2018-01-14 23:35:31', '2018-01-14 23:35:31'),
(19, '16', '183978.1400', 12, '2018-01-15 00:58:20', '2018-01-15 00:58:20'),
(20, '17', '91989.0700', 12, '2018-01-15 00:58:53', '2018-01-15 00:58:53'),
(21, '18', '91989.0700', 12, '2018-01-15 00:59:12', '2018-01-15 00:59:12'),
(22, '19', '183978.1400', 12, '2018-01-15 01:00:30', '2018-01-15 01:00:30'),
(23, '20', '183978.1400', 12, '2018-01-15 01:00:55', '2018-01-15 01:00:55'),
(24, '21', '183978.1400', 12, '2018-01-16 05:03:44', '2018-01-16 05:03:44'),
(25, '22', '183978.1400', 12, '2018-01-16 05:11:08', '2018-01-16 05:11:08'),
(26, '23', '183978.1400', 12, '2018-01-16 05:32:59', '2018-01-16 05:32:59'),
(27, '24', '183978.1400', 12, '2018-01-16 05:33:54', '2018-01-16 05:33:54'),
(28, '25', '183978.1400', 12, '2018-01-16 05:36:55', '2018-01-16 05:36:55');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `privilegio`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Andres Vega', 'andres_vega93@hotmail.com', '$2y$10$9EhJlqnSNAK3F8tvvWU44ukQqdTPEUwBSzAhBdlyZcTk31Xa4.x.m', 'admin', 'jpsyeiBpSqfhWrat2AqZzqjTg24PNO8YqP5D4Wc2g6JkIBgeQhqOAhb5sHic', '2017-10-11 06:32:19', '2017-12-29 08:29:32'),
(8, 'Test', 'test@test.com', '$2y$10$zyMzFM/Jj/Kq4SmQqKDNCuDYdSASTWfkdQllbz9KT6BFdZqCeuQdC', 'tipo1', 'gTbGwNTkO2vw1hFUH0ZqOt2BLYawWulVbF1QnYvlGgDYcfrJxmhIKivgCvyN', '2017-12-29 08:27:41', '2017-12-29 14:27:07'),
(9, 'Test2', 'test2@test.com', '$2y$10$orRbmJYwlBDrzSDtSZx.QOW4xtw1iZNjGoduItxVoD854YrsJmSLO', 'tipo2', NULL, '2017-12-29 08:28:01', '2017-12-29 08:28:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE IF NOT EXISTS `ventas` (
`id` int(10) unsigned NOT NULL,
  `cli_codigo` varchar(255) NOT NULL,
  `ven_fecha` date NOT NULL,
  `ven_factura` varchar(255) NOT NULL,
  `ven_condicion` varchar(255) NOT NULL,
  `ven_entidad` varchar(255) DEFAULT NULL,
  `rec_nombre` varchar(255) NOT NULL,
  `ven_costo` decimal(25,4) NOT NULL,
  `ven_cantidad` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `cli_codigo`, `ven_fecha`, `ven_factura`, `ven_condicion`, `ven_entidad`, `rec_nombre`, `ven_costo`, `ven_cantidad`, `created_at`, `updated_at`) VALUES
(3, 'cli1', '2018-01-01', '1', 'credito', NULL, 'EJEMPLO 2', '14613.9400', 11, '2018-01-06 22:40:13', '2018-01-06 22:40:13'),
(8, 'cli1', '2018-01-01', '1', 'credito', NULL, 'EJEMPLO RECETA C', '1812.6800', 1, '2018-01-06 23:57:29', '2018-01-06 23:57:29'),
(11, 'cli1', '2018-01-02', '2', 'credito', NULL, 'EJEMPLO RECETA C', '1812.6800', 1, '2018-01-07 03:58:03', '2018-01-07 03:58:03'),
(12, 'cli1', '2018-01-02', '2', 'credito', NULL, 'EJEMPLO 2', '14613.9400', 1, '2018-01-07 03:58:03', '2018-01-07 03:58:03'),
(21, 'cli1', '2018-01-03', '3', 'contado', NULL, 'EJEMPLO RECETA C', '1812.6800', 3, '2018-01-07 04:03:44', '2018-01-07 04:03:44'),
(22, 'cli1', '2018-01-03', '3', 'contado', NULL, 'EJEMPLO 2', '14613.9400', 3, '2018-01-07 04:03:44', '2018-01-07 04:03:44'),
(23, 'cli1', '2018-01-02', '4', 'credito', NULL, 'EJEMPLO RECETA C', '1812.6800', 1, '2018-01-11 16:44:24', '2018-01-11 16:44:24'),
(24, 'cli1', '2018-01-02', '4', 'credito', NULL, 'EJEMPLO 2', '14613.9400', 1, '2018-01-11 16:44:24', '2018-01-11 16:44:24'),
(25, 'cli1', '2018-01-13', '5', 'contado', NULL, 'EJEMPLO RECETA C', '1812.6800', 78, '2018-01-14 01:20:00', '2018-01-14 01:20:00'),
(26, 'cli1', '2018-01-13', '5', 'contado', NULL, 'EJEMPLO 2', '14613.9400', 128, '2018-01-14 01:20:00', '2018-01-14 01:20:00'),
(27, 'cli1', '2018-01-13', '6', 'contado', NULL, 'EJEMPLO RECETA C', '1812.6800', 100, '2018-01-14 16:40:59', '2018-01-14 16:40:59'),
(28, 'cli1', '2018-01-13', '6', 'contado', NULL, 'EJEMPLO 2', '14613.9400', 100, '2018-01-14 16:40:59', '2018-01-14 16:40:59'),
(29, 'cli1', '2018-01-13', '7', 'contado', NULL, 'EJEMPLO RECETA C', '1812.6800', 100, '2018-01-14 16:53:07', '2018-01-14 16:53:07'),
(30, 'cli1', '2018-01-13', '7', 'contado', NULL, 'EJEMPLO 2', '14613.9400', 100, '2018-01-14 16:53:07', '2018-01-14 16:53:07'),
(31, 'cli1', '2018-01-14', '8', 'credito', NULL, 'EJEMPLO RECETA C', '1812.6800', 50, '2018-01-14 18:15:18', '2018-01-14 18:15:18'),
(32, 'cli1', '2018-01-14', '8', 'credito', NULL, 'EJEMPLO 2', '14613.9400', 50, '2018-01-14 18:15:18', '2018-01-14 18:15:18'),
(33, 'cli1', '2018-01-13', '9', 'contado', NULL, 'EJEMPLO RECETA C', '1812.6800', 50, '2018-01-14 18:16:24', '2018-01-14 18:16:24'),
(34, 'cli1', '2018-01-13', '9', 'contado', NULL, 'EJEMPLO 2', '14613.9400', 50, '2018-01-14 18:16:24', '2018-01-14 18:16:24'),
(35, 'cli1', '2018-01-14', '10', 'credito', NULL, 'EJEMPLO RECETA C', '1812.6800', 20, '2018-01-14 23:33:00', '2018-01-14 23:33:00'),
(36, 'cli1', '2018-01-14', '10', 'credito', NULL, 'EJEMPLO 2', '14613.9400', 20, '2018-01-14 23:33:00', '2018-01-14 23:33:00'),
(37, 'cli1', '2018-01-14', '11', 'contado', NULL, 'EJEMPLO RECETA C', '1812.6800', 20, '2018-01-14 23:33:29', '2018-01-14 23:33:29'),
(38, 'cli1', '2018-01-14', '11', 'contado', NULL, 'EJEMPLO 2', '14613.9400', 20, '2018-01-14 23:33:29', '2018-01-14 23:33:29'),
(39, 'cli1', '2018-01-14', '12', 'contado', NULL, 'EJEMPLO RECETA C', '1812.6800', 10, '2018-01-14 23:34:06', '2018-01-14 23:34:06'),
(40, 'cli1', '2018-01-14', '12', 'contado', NULL, 'EJEMPLO 2', '14613.9400', 10, '2018-01-14 23:34:06', '2018-01-14 23:34:06'),
(41, 'cli1', '2018-01-14', '13', 'contado', NULL, 'EJEMPLO RECETA C', '1812.6800', 10, '2018-01-14 23:34:31', '2018-01-14 23:34:31'),
(42, 'cli1', '2018-01-14', '13', 'contado', NULL, 'EJEMPLO 2', '14613.9400', 10, '2018-01-14 23:34:31', '2018-01-14 23:34:31'),
(43, 'cli1', '2018-01-14', '14', 'contado', NULL, 'EJEMPLO RECETA C', '1812.6800', 10, '2018-01-14 23:34:58', '2018-01-14 23:34:58'),
(44, 'cli1', '2018-01-14', '14', 'contado', NULL, 'EJEMPLO 2', '14613.9400', 10, '2018-01-14 23:34:58', '2018-01-14 23:34:58'),
(45, 'cli1', '2018-01-14', '15', 'contado', NULL, 'EJEMPLO RECETA C', '1812.6800', 10, '2018-01-14 23:35:31', '2018-01-14 23:35:31'),
(46, 'cli1', '2018-01-14', '15', 'contado', NULL, 'EJEMPLO 2', '14613.9400', 10, '2018-01-14 23:35:31', '2018-01-14 23:35:31'),
(47, 'cli1', '2018-01-14', '16', 'credito', NULL, 'EJEMPLO RECETA C', '1812.6800', 10, '2018-01-15 00:58:19', '2018-01-15 00:58:19'),
(48, 'cli1', '2018-01-14', '16', 'credito', NULL, 'EJEMPLO 2', '14613.9400', 10, '2018-01-15 00:58:19', '2018-01-15 00:58:19'),
(49, 'cli1', '2018-01-14', '17', 'contado', NULL, 'EJEMPLO RECETA C', '1812.6800', 5, '2018-01-15 00:58:53', '2018-01-15 00:58:53'),
(50, 'cli1', '2018-01-14', '17', 'contado', NULL, 'EJEMPLO 2', '14613.9400', 5, '2018-01-15 00:58:53', '2018-01-15 00:58:53'),
(51, 'cli1', '2018-01-14', '18', 'contado', NULL, 'EJEMPLO RECETA C', '1812.6800', 5, '2018-01-15 00:59:12', '2018-01-15 00:59:12'),
(52, 'cli1', '2018-01-14', '18', 'contado', NULL, 'EJEMPLO 2', '14613.9400', 5, '2018-01-15 00:59:12', '2018-01-15 00:59:12'),
(53, 'cli1', '2018-01-14', '19', 'contado', 'Banco de Venezuela', 'EJEMPLO RECETA C', '1812.6800', 10, '2018-01-15 01:00:30', '2018-01-15 01:00:30'),
(54, 'cli1', '2018-01-14', '19', 'contado', 'Banco de Venezuela', 'EJEMPLO 2', '14613.9400', 10, '2018-01-15 01:00:30', '2018-01-15 01:00:30'),
(55, 'cli1', '2018-01-14', '20', 'contado', 'Banco Banesco', 'EJEMPLO RECETA C', '1812.6800', 10, '2018-01-15 01:00:55', '2018-01-15 01:00:55'),
(56, 'cli1', '2018-01-14', '20', 'contado', 'Banco Banesco', 'EJEMPLO 2', '14613.9400', 10, '2018-01-15 01:00:55', '2018-01-15 01:00:55'),
(57, 'cli1', '2018-01-16', '21', 'credito', 'Caja Chica', 'EJEMPLO RECETA C', '1812.6800', 10, '2018-01-16 05:03:44', '2018-01-16 05:03:44'),
(58, 'cli1', '2018-01-16', '21', 'credito', 'Caja Chica', 'EJEMPLO 2', '14613.9400', 10, '2018-01-16 05:03:44', '2018-01-16 05:03:44'),
(59, 'cli1', '2018-01-16', '22', 'credito', 'Caja Chica', 'EJEMPLO RECETA C', '1812.6800', 10, '2018-01-16 05:11:08', '2018-01-16 05:11:08'),
(60, 'cli1', '2018-01-16', '22', 'credito', 'Caja Chica', 'EJEMPLO 2', '14613.9400', 10, '2018-01-16 05:11:08', '2018-01-16 05:11:08'),
(61, 'cli2', '2018-01-16', '23', 'credito', 'Caja Chica', 'EJEMPLO RECETA C', '1812.6800', 10, '2018-01-16 05:32:59', '2018-01-16 05:32:59'),
(62, 'cli2', '2018-01-16', '23', 'credito', 'Caja Chica', 'EJEMPLO 2', '14613.9400', 10, '2018-01-16 05:32:59', '2018-01-16 05:32:59'),
(63, 'cli3', '2018-01-16', '24', 'credito', 'Caja Chica', 'EJEMPLO RECETA C', '1812.6800', 10, '2018-01-16 05:33:54', '2018-01-16 05:33:54'),
(64, 'cli3', '2018-01-16', '24', 'credito', 'Caja Chica', 'EJEMPLO 2', '14613.9400', 10, '2018-01-16 05:33:54', '2018-01-16 05:33:54'),
(65, 'cli3', '2018-01-16', '25', 'credito', 'Caja Chica', 'EJEMPLO RECETA C', '1812.6800', 10, '2018-01-16 05:36:55', '2018-01-16 05:36:55'),
(66, 'cli3', '2018-01-16', '25', 'credito', 'Caja Chica', 'EJEMPLO 2', '14613.9400', 10, '2018-01-16 05:36:55', '2018-01-16 05:36:55');

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
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cajachica`
--
ALTER TABLE `cajachica`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
 ADD PRIMARY KEY (`id`), ADD KEY `cardexmp_ibfk_1` (`mp_codigo`), ADD KEY `cardexmp_ibfk_2` (`comp_doc`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `cli_codigo` (`cli_codigo`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `costofijos`
--
ALTER TABLE `costofijos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuentasxcobrar`
--
ALTER TABLE `cuentasxcobrar`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuentasxpagar`
--
ALTER TABLE `cuentasxpagar`
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
-- Indices de la tabla `saldocaja`
--
ALTER TABLE `saldocaja`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `totalesventas`
--
ALTER TABLE `totalesventas`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aumentos`
--
ALTER TABLE `aumentos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `cajabanco`
--
ALTER TABLE `cajabanco`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT de la tabla `cajachica`
--
ALTER TABLE `cajachica`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=236;
--
-- AUTO_INCREMENT de la tabla `costofijos`
--
ALTER TABLE `costofijos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `cuentasxcobrar`
--
ALTER TABLE `cuentasxcobrar`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `cuentasxpagar`
--
ALTER TABLE `cuentasxpagar`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `producciona`
--
ALTER TABLE `producciona`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `produccionb`
--
ALTER TABLE `produccionb`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `produccionc`
--
ALTER TABLE `produccionc`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT de la tabla `salarios`
--
ALTER TABLE `salarios`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `saldocaja`
--
ALTER TABLE `saldocaja`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `totalesventas`
--
ALTER TABLE `totalesventas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=67;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
ADD CONSTRAINT `cardexmp_ibfk_1` FOREIGN KEY (`mp_codigo`) REFERENCES `parametros` (`par_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

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
