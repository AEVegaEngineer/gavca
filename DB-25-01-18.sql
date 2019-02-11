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

INSERT INTO `cardexmp` (`id`, `mp_codigo`, `comp_doc`, `car_costo`, `car_valor_anterior`, `car_valor_actual`, `car_compra_id`, `car_concepto`, `car_fecha`, `created_at`, `updated_at`) VALUES
(126, 'MI00001', '2', '500000.0000', '22.0000', '23.0000', 146, NULL, NULL, '2018-01-11 19:54:45', '2018-01-11 19:54:45'),
(127, 'MP00000', '3', '45000.0000', '1000.0000', '2000.0000', 148, NULL, NULL, '2018-01-11 20:42:59', '2018-01-11 20:42:59'),
(128, 'MP00003', '3', '30000.0000', '0.0000', '1000.0000', 148, NULL, NULL, '2018-01-11 20:42:59', '2018-01-11 20:42:59'),
(129, 'MP00010', '3', '2500.0000', '0.0000', '1000.0000', 148, NULL, NULL, '2018-01-11 20:42:59', '2018-01-11 20:42:59'),
(130, 'MP00009', '3', '4500.0000', '0.0000', '1000.0000', 148, NULL, NULL, '2018-01-11 20:43:00', '2018-01-11 20:43:00'),
(131, 'MP00008', '4', '6000.0000', '1000.0000', '2000.0000', 149, NULL, NULL, '2018-01-11 20:44:24', '2018-01-11 20:44:24'),
(132, 'MP00005', '4', '6000.0000', '0.0000', '1000.0000', 149, NULL, NULL, '2018-01-11 20:44:24', '2018-01-11 20:44:24'),
(133, 'MP00007', '4', '9550.0000', '0.0000', '1000.0000', 149, NULL, NULL, '2018-01-11 20:44:25', '2018-01-11 20:44:25'),
(134, 'MP00006', '4', '6400.0000', '1000.0000', '2000.0000', 149, NULL, NULL, '2018-01-11 20:44:26', '2018-01-11 20:44:26'),
(135, 'MI00005', '5', '86981.0000', '1000.0000', '2000.0000', 150, NULL, NULL, '2018-01-11 20:47:39', '2018-01-11 20:47:39'),
(136, 'MI00001', '5', '500000.0000', '23.0000', '1023.0000', 150, NULL, NULL, '2018-01-11 20:47:39', '2018-01-11 20:47:39'),
(137, 'MI00016', '5', '157000.0000', '25.0000', '1025.0000', 150, NULL, NULL, '2018-01-11 20:47:39', '2018-01-11 20:47:39'),
(138, 'MI00006', '5', '13600.0000', '350.0000', '1350.0000', 150, NULL, NULL, '2018-01-11 20:47:40', '2018-01-11 20:47:40'),
(139, 'MI00011', '5', '10000.0000', '500.0000', '1500.0000', 150, NULL, NULL, '2018-01-11 20:47:41', '2018-01-11 20:47:41'),
(140, 'MI00017', '5', '7700.0000', '0.0000', '1000.0000', 150, NULL, NULL, '2018-01-11 20:47:41', '2018-01-11 20:47:41'),
(141, 'MI00013', '5', '3000.0000', '1000.0000', '2000.0000', 150, NULL, NULL, '2018-01-11 20:47:42', '2018-01-11 20:47:42'),
(142, 'MI00019', '5', '661.5000', '1000.0000', '2000.0000', 150, NULL, NULL, '2018-01-11 20:47:42', '2018-01-11 20:47:42'),
(143, 'MI00012', '5', '381.8200', '0.0000', '1000.0000', 150, NULL, NULL, '2018-01-11 20:47:42', '2018-01-11 20:47:42'),
(144, 'MP00003', '7', '30000.0000', '0.0000', '1000.0000', 151, NULL, NULL, '2018-01-11 20:53:14', '2018-01-11 20:53:14'),
(145, 'MP00009', '8', '4500.0000', '0.0000', '1000.0000', 152, NULL, NULL, '2018-01-11 20:54:54', '2018-01-11 20:54:54'),
(146, 'MP00000', NULL, '0.0000', '1000.0000', '900.0000', NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2018-01-01', '2018-01-11 20:57:38', '2018-01-11 20:57:38'),
(147, 'MP00003', NULL, '0.0000', '1000.0000', '900.0000', NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2018-01-01', '2018-01-11 20:57:38', '2018-01-11 20:57:38'),
(148, 'MP00010', NULL, '0.0000', '1000.0000', '900.0000', NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2018-01-01', '2018-01-11 20:57:38', '2018-01-11 20:57:38'),
(149, 'MP00009', NULL, '0.0000', '1000.0000', '900.0000', NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2018-01-01', '2018-01-11 20:57:39', '2018-01-11 20:57:39'),
(150, 'MP00005', '9', '6000.0000', '1000.0000', '2000.0000', 153, NULL, NULL, '2018-01-11 21:00:46', '2018-01-11 21:00:46'),
(151, 'MP00008', NULL, '0.0000', '1000.0000', '900.0000', NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2018-01-03', '2018-01-11 21:01:34', '2018-01-11 21:01:34'),
(152, 'MP00005', NULL, '0.0000', '1000.0000', '900.0000', NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2018-01-03', '2018-01-11 21:01:35', '2018-01-11 21:01:35'),
(153, 'MP00006', NULL, '0.0000', '1000.0000', '900.0000', NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2018-01-03', '2018-01-11 21:01:35', '2018-01-11 21:01:35'),
(154, 'MP00007', NULL, '0.0000', '1000.0000', '900.0000', NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2018-01-03', '2018-01-11 21:01:35', '2018-01-11 21:01:35'),
(155, 'MI00005', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:51', '2018-01-11 21:13:51'),
(156, 'MI00000', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:52', '2018-01-11 21:13:52'),
(157, 'MI00001', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:52', '2018-01-11 21:13:52'),
(158, 'MI00016', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:52', '2018-01-11 21:13:52'),
(159, 'MI00006', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:52', '2018-01-11 21:13:52'),
(160, 'MI00011', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:52', '2018-01-11 21:13:52'),
(161, 'MI00017', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:52', '2018-01-11 21:13:52'),
(162, 'MI00018', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:52', '2018-01-11 21:13:52'),
(163, 'MI00013', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:53', '2018-01-11 21:13:53'),
(164, 'MI00019', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:53', '2018-01-11 21:13:53'),
(165, 'MI00012', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:53', '2018-01-11 21:13:53'),
(166, 'MI00020', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:53', '2018-01-11 21:13:53'),
(167, 'MI00021', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:53', '2018-01-11 21:13:53'),
(168, 'MI00024', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:53', '2018-01-11 21:13:53'),
(169, 'MI00022', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:53', '2018-01-11 21:13:53'),
(170, 'MI00023', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:53', '2018-01-11 21:13:53'),
(171, 'MI00003', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:54', '2018-01-11 21:13:54'),
(172, 'MI00025', NULL, '0.0000', '1000.0000', '980.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-04', '2018-01-11 21:13:54', '2018-01-11 21:13:54'),
(173, 'MI00007', NULL, '0.0000', '1000.0000', '990.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2018-01-01', '2018-01-11 21:18:27', '2018-01-11 21:18:27'),
(174, 'MI00027', NULL, '0.0000', '1000.0000', '990.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2018-01-01', '2018-01-11 21:18:27', '2018-01-11 21:18:27'),
(175, 'MI00005', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:27', '2018-01-11 21:24:27'),
(176, 'MI00000', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:27', '2018-01-11 21:24:27'),
(177, 'MI00001', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:27', '2018-01-11 21:24:27'),
(178, 'MI00016', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:27', '2018-01-11 21:24:27'),
(179, 'MI00006', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:27', '2018-01-11 21:24:27'),
(180, 'MI00011', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:27', '2018-01-11 21:24:27'),
(181, 'MI00017', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:27', '2018-01-11 21:24:27'),
(182, 'MI00018', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:28', '2018-01-11 21:24:28'),
(183, 'MI00013', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:28', '2018-01-11 21:24:28'),
(184, 'MI00019', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:28', '2018-01-11 21:24:28'),
(185, 'MI00012', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:28', '2018-01-11 21:24:28'),
(186, 'MI00020', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:29', '2018-01-11 21:24:29'),
(187, 'MI00021', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:29', '2018-01-11 21:24:29'),
(188, 'MI00024', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:29', '2018-01-11 21:24:29'),
(189, 'MI00022', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:30', '2018-01-11 21:24:30'),
(190, 'MI00023', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:30', '2018-01-11 21:24:30'),
(191, 'MI00003', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:30', '2018-01-11 21:24:30'),
(192, 'MI00025', NULL, '0.0000', '980.0000', '960.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-02', '2018-01-11 21:24:30', '2018-01-11 21:24:30'),
(193, 'MI00007', NULL, '0.0000', '990.0000', '980.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2018-01-06', '2018-01-11 21:27:34', '2018-01-11 21:27:34'),
(194, 'MI00027', NULL, '0.0000', '990.0000', '980.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2018-01-06', '2018-01-11 21:27:34', '2018-01-11 21:27:34');


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
(1, 'CLIENTE1', 'cliente 1', 'J3782462374', 'askjdhsakd', 'dajkshdjas asudhsaudh ', 'sdjjkhfjksd', '13128090.7520', '2018-01-11 20:34:13', '2018-01-11 21:29:39');

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

INSERT INTO `compras` (`id`, `comp_doc`, `comp_proveedor`, `comp_fecha`, `comp_monto`, `comp_cred_cont`, `created_at`, `updated_at`) VALUES
(146, '2', 'PROV1', '2018-01-11 07:54:22', '545000.0000', 'credito', '2018-01-11 19:54:39', '2018-01-11 19:54:44'),
(148, '3', 'PROV1', '2018-01-11 08:40:25', '89380000.0000', 'credito', '2018-01-11 20:41:04', '2018-01-11 20:42:59'),
(149, '4', 'PROV1', '2018-01-11 08:43:06', '30465500.0000', 'credito', '2018-01-11 20:43:37', '2018-01-11 20:44:24'),
(151, '7', 'PROV1', '2018-01-11 08:52:49', '32700000.0000', 'credito', '2018-01-11 20:53:02', '2018-01-11 20:53:14'),
(152, '8', 'PROV1', '2018-01-11 08:54:27', '4905000.0000', 'credito', '2018-01-11 20:54:40', '2018-01-11 20:54:54'),
(153, '9', 'PROV1', '2018-01-11 09:00:14', '6540000.0000', 'credito', '2018-01-11 21:00:28', '2018-01-11 21:00:46');

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

INSERT INTO `cuentasxcobrar` (`id`, `cta_cli_codigo`, `cta_monto`, `cta_concepto`, `cta_venta_id`, `created_at`, `updated_at`) VALUES
(1, 'CLIENTE1', '13128090.7520', 'Venta 1 de fecha 2018-01-01', 1, '2018-01-11 21:29:39', '2018-01-11 21:29:39');-- --------------------------------------------------------

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

INSERT INTO `cuentasxpagar` (`id`, `cta_prov_codigo`, `cta_monto`, `cta_concepto`, `cta_compra_id`, `created_at`, `updated_at`) VALUES
(1, 'PROV1', '0.0000', 'Compra a crédito bajo factura: 121212', 68, '2018-01-06 21:06:55', '2018-01-06 21:06:55'),
(2, 'PROV1', '0.0000', 'Compra a crédito bajo factura: 123456789', 2, '2018-01-11 19:57:17', '2018-01-11 20:00:20'),
(3, 'pepe', '0.0000', 'Compra a crédito bajo factura: 55555555', 4, '2018-01-11 20:11:17', '2018-01-11 20:16:20'),
(4, 'PROV5', '0.0000', 'Compra a crédito bajo factura: 4444444', 5, '2018-01-11 20:23:29', '2018-01-11 20:23:29'),
(5, 'PROV5', '0.0000', 'Compra a crédito bajo factura: 4444444', 6, '2018-01-11 20:24:25', '2018-01-11 20:24:25'),
(6, 'PROV5', '0.0000', 'Compra a crédito bajo factura: 4444444', 7, '2018-01-11 20:35:40', '2018-01-11 20:35:40'),
(7, 'PROV1', '0.0000', 'Compra a crédito bajo factura: 1', 8, '2018-01-11 22:14:25', '2018-01-11 22:17:30'),
(8, 'PROV1', '0.0000', 'Compra a crédito bajo factura: 2', 9, '2018-01-11 22:17:53', '2018-01-11 22:17:53'),
(9, 'GATO', '4569600.0000', 'Compra a crédito bajo factura: 44444444', 10, '2018-01-11 23:18:45', '2018-01-11 23:19:26'),
(14, 'PROV1', '545000.0000', 'Compra a crédito bajo factura: 2', 146, '2018-01-11 19:54:39', '2018-01-11 19:54:45'),
(15, 'PROV1', '89380000.0000', 'Compra a crédito bajo factura: 3', 148, '2018-01-11 20:41:04', '2018-01-11 20:42:59'),
(16, 'PROV1', '30465500.0000', 'Compra a crédito bajo factura: 4', 149, '2018-01-11 20:43:38', '2018-01-11 20:44:24'),
(17, 'PROV1', '850553508.8000', 'Compra a crédito bajo factura: 5', 150, '2018-01-11 20:45:12', '2018-01-11 20:47:39'),
(18, 'PROV1', '32700000.0000', 'Compra a crédito bajo factura: 7', 151, '2018-01-11 20:53:02', '2018-01-11 20:53:15'),
(19, 'PROV1', '4905000.0000', 'Compra a crédito bajo factura: 8', 152, '2018-01-11 20:54:40', '2018-01-11 20:54:54'),
(20, 'PROV1', '6540000.0000', 'Compra a crédito bajo factura: 9', 153, '2018-01-11 21:00:28', '2018-01-11 21:00:47');
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
(1, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'ANTIPASTO ATÚN (FRASCO 470G)', 5, 100, '2018-01-11 20:36:04', '2018-01-11 21:27:33'),
(2, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PICADO DURO ANTIPASTO (kilo)', 2, 50, '2018-01-11 20:38:21', '2018-01-11 21:24:26'),
(3, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PICADO BLANDO ANTIPASTO (kilo)', 1, 50, '2018-01-11 21:02:40', '2018-01-11 21:24:26');

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
(41, 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', '2017-12-28 20:02:03', '2017-12-28 20:02:03'),
(42, 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', '2017-12-28 20:02:20', '2017-12-28 20:02:20'),
(43, 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', '2017-12-28 20:02:34', '2017-12-28 20:02:34'),
(44, 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', '2017-12-28 20:03:14', '2017-12-28 20:03:14'),
(45, 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', '2017-12-28 22:43:03', '2017-12-28 22:43:03'),
(46, 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', '2017-12-28 22:43:14', '2017-12-28 22:43:14'),
(47, 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', '2017-12-28 22:43:31', '2017-12-28 22:43:31'),
(48, 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', '2017-12-28 22:43:52', '2017-12-28 22:43:52'),
(49, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', '2017-12-28 22:49:27', '2017-12-28 22:49:27'),
(50, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', '2017-12-28 22:49:44', '2017-12-28 22:49:44'),
(51, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', '2017-12-28 22:49:49', '2017-12-28 22:49:49'),
(52, 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', '2017-12-28 22:54:50', '2017-12-28 22:54:50'),
(53, 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', '2017-12-28 22:54:57', '2017-12-28 22:54:57'),
(54, 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', '2017-12-28 22:55:05', '2017-12-28 22:55:05'),
(55, 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', '2017-12-28 22:56:03', '2017-12-28 22:56:03'),
(56, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', '2017-12-28 22:57:28', '2017-12-28 22:57:28'),
(57, 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', '2017-12-28 22:57:34', '2017-12-28 22:57:34'),
(58, 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', '2017-12-28 23:00:10', '2017-12-28 23:00:10'),
(59, 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', '2017-12-28 23:00:16', '2017-12-28 23:00:16'),
(60, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', '2017-12-28 23:23:53', '2017-12-28 23:23:53'),
(61, 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', '2017-12-28 23:23:58', '2017-12-28 23:23:58'),
(62, 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', '2017-12-28 23:24:06', '2017-12-28 23:24:06'),
(63, 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', '2017-12-28 23:24:12', '2017-12-28 23:24:12'),
(64, 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', '2017-12-28 23:24:18', '2017-12-28 23:24:18'),
(65, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', '2017-12-28 23:24:23', '2017-12-28 23:24:23'),
(66, 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', '2017-12-28 23:24:30', '2017-12-28 23:24:30'),
(67, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '2018-01-11 20:36:26', '2018-01-11 20:36:26'),
(68, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '2018-01-11 20:37:36', '2018-01-11 20:37:36');



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
(1, 'MI00001', 960, '2017-12-10 08:57:46', '2018-01-11 21:24:27'),
(2, 'MI00000', 960, '2017-12-10 08:57:46', '2018-01-11 21:24:27'),
(3, '', 10, '2017-12-12 19:19:20', '2017-12-12 19:19:20'),
(4, 'MI00002', 105, '2017-12-12 19:19:20', '2018-01-11 19:59:50'),
(5, 'MI00006', 960, '2017-12-24 19:19:36', '2018-01-11 21:24:27'),
(7, 'MI00013', 960, '2017-12-24 19:19:37', '2018-01-11 21:24:28'),
(8, 'MI00011', 960, '2018-01-11 19:59:50', '2018-01-11 21:24:27'),
(9, 'MI00016', 960, '2018-01-11 20:16:20', '2018-01-11 21:24:27'),
(10, 'MP00000', 900, '2018-01-11 20:42:59', '2018-01-11 20:57:38'),
(11, 'MP00010', 900, '2018-01-11 20:42:59', '2018-01-11 20:57:39'),
(12, 'MP00008', 900, '2018-01-11 20:44:24', '2018-01-11 21:01:35'),
(13, 'MP00006', 900, '2018-01-11 20:44:25', '2018-01-11 21:01:35'),
(14, 'MP00007', 900, '2018-01-11 20:44:25', '2018-01-11 21:01:35'),
(15, 'MI00005', 960, '2018-01-11 20:47:39', '2018-01-11 21:24:27'),
(16, 'MI00017', 960, '2018-01-11 20:47:41', '2018-01-11 21:24:28'),
(17, 'MI00018', 960, '2018-01-11 20:47:42', '2018-01-11 21:24:28'),
(18, 'MI00019', 960, '2018-01-11 20:47:42', '2018-01-11 21:24:28'),
(19, 'MI00012', 960, '2018-01-11 20:47:43', '2018-01-11 21:24:29'),
(20, 'MP00003', 900, '2018-01-11 20:53:14', '2018-01-11 20:57:38'),
(21, 'MP00009', 900, '2018-01-11 20:54:54', '2018-01-11 20:57:39'),
(22, 'MP00005', 900, '2018-01-11 21:00:46', '2018-01-11 21:01:35'),
(23, 'MI00020', 960, '2018-01-11 21:12:33', '2018-01-11 21:24:29'),
(24, 'MI00021', 960, '2018-01-11 21:12:33', '2018-01-11 21:24:29'),
(25, 'MI00024', 960, '2018-01-11 21:12:33', '2018-01-11 21:24:30'),
(26, 'MI00022', 960, '2018-01-11 21:12:33', '2018-01-11 21:24:30'),
(27, 'MI00023', 960, '2018-01-11 21:12:33', '2018-01-11 21:24:30'),
(28, 'MI00003', 960, '2018-01-11 21:12:34', '2018-01-11 21:24:30'),
(29, 'MI00025', 960, '2018-01-11 21:12:34', '2018-01-11 21:24:30'),
(30, 'MI00007', 980, '2018-01-11 21:16:48', '2018-01-11 21:27:34'),
(31, 'MI00027', 980, '2018-01-11 21:17:29', '2018-01-11 21:27:34');


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
(98, 'MI00000', 'ACEITE', 'LITRO', '34000.0000', 'ACTUALIZADO AL 02/11/2017', '2018-01-11 22:15:23', 0, NULL, '2017-12-03 02:17:39', '2018-01-11 22:15:23'),
(99, 'MI00001', 'ACEITUNAS', 'KILO', '500000.0000', 'ACTUALIZADO AL 30/11/2017 ESPECULATIVO', NULL, 0, NULL, '2017-12-03 02:19:23', '2017-12-10 08:42:16'),
(100, 'MP00000', 'AJOPORRO', 'KILO', '45000.0000', 'ACTUALIZADO AL 29/11201', NULL, 0, NULL, '2017-12-03 02:24:43', '2017-12-03 02:24:43'),
(101, 'MI00002', 'ÁCIDO CÍTRICO', 'KILO', '9000.0000', 'ACTUALIZADO AL 22/02/2017', NULL, 0, NULL, '2017-12-03 02:26:53', '2017-12-10 01:19:27'),
(102, 'MP00001', 'ALBAHACA', 'KILO', '4000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-03 02:35:18', '2017-12-03 02:35:18'),
(103, 'MI00003', 'ALCOHOL', 'LITRO', '3139.0000', 'ACTUALIZADO AL 25/01/2017', NULL, 0, NULL, '2017-12-03 02:39:43', '2017-12-05 01:56:12'),
(104, 'MI00004', 'ALMIDÓN DE MAÍZ (MAICINA) ', 'KILO', '55555.5600', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-03 02:43:57', '2017-12-03 02:43:57'),
(105, 'MI00005', 'ATÚN ENLATADO', 'KILO', '86981.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-03 21:19:18', '2017-12-03 21:19:18'),
(106, 'MP00002', 'ATÚN FRESCO', 'KILO', '0.0000', '', NULL, 0, NULL, '2017-12-03 21:22:12', '2017-12-03 21:22:12'),
(107, 'MI00006', 'AZÚCAR', 'KILO', '13600.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-03 21:24:14', '2017-12-03 21:24:14'),
(108, 'MI00007', 'BANDEJA CARTÓN 12x500cc', 'UNIDAD', '500.0000', 'COSTO ESPECULATIVO', NULL, 0, NULL, '2017-12-03 21:29:49', '2017-12-03 21:29:49'),
(109, 'MI00008', 'BANDEJA CARTÓN 12x300cc', 'UNIDAD', '500.0000', 'COSTO ESPECULATIVO', NULL, 0, NULL, '2017-12-03 21:31:42', '2017-12-03 21:31:42'),
(110, 'MI00009', 'BANDEJA CARTÓN 6x300cc', 'UNIDAD', '300.0000', 'COSTO ESPECULATIVO', NULL, 0, NULL, '2017-12-03 21:32:42', '2017-12-03 21:32:42'),
(111, 'MI00010', 'BANDEJA CARTÓN 24x200cc', 'UNIDAD', '600.0000', 'COSTO ESPECULATIVO', NULL, 0, NULL, '2017-12-03 21:34:19', '2017-12-03 21:34:19'),
(113, 'MP00003', 'CEBOLLA', 'KILO', '30000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-03 21:45:26', '2017-12-03 21:45:26'),
(117, 'MP00005', 'VAINITA', 'KILO', '6000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-05 01:49:07', '2017-12-05 01:49:07'),
(118, 'MP00006', 'ZANAHORIA ', 'KILO', '6400.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-05 01:51:43', '2017-12-05 01:51:43'),
(119, 'MP00007', 'PIMENTÓN', 'KILO', '9550.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-05 01:52:27', '2017-12-05 01:52:27'),
(120, 'MP00008', 'COLIFLOR', 'KILO', '6000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-05 01:53:19', '2017-12-05 01:53:19'),
(121, 'MP00009', 'CÉLERI (APIO ESPAÑA)', 'KILO', '4500.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-05 01:54:09', '2017-12-05 01:54:09'),
(122, 'MP00010', 'CEBOLLÍN', 'KILO', '2500.0000', 'ACTUALIZADO AL 29/11/2017', NULL, 0, NULL, '2017-12-05 01:54:34', '2017-12-05 01:54:34'),
(123, 'MI00011', 'SAL', 'KILO', '10000.0000', 'PRECIO INVENTADO', NULL, 0, NULL, '2017-12-10 22:41:38', '2017-12-10 22:41:38'),
(124, 'MI00012', 'GAS', '1% DE LA CARGA', '381.8200', '', '2017-12-28 23:07:07', 0, NULL, '2017-12-10 22:43:21', '2017-12-28 23:07:07'),
(125, 'MI00013', 'FRASCO 500CC', 'UNIDAD', '3000.0000', 'COSTO INVENTADO', NULL, 1, NULL, '2017-12-10 22:45:39', '2017-12-12 18:59:01'),
(126, 'MI00014', 'PRESINTO FRASCO 500cc', 'UNIDAD', '1000.0000', 'COSTO INVENTADO', NULL, 1, NULL, '2017-12-10 22:47:12', '2017-12-12 18:59:16'),
(127, 'MI00015', 'ETIQUETA ANTIPASTO ATÚN 470G', 'UNIDAD', '2500.0000', 'PRECIO INVENTADO', NULL, 1, NULL, '2017-12-10 22:48:47', '2017-12-12 18:59:24'),
(128, '', 'PECTINA', 'KILO', '3800000.0000', 'TA MUY CARO', NULL, 0, NULL, '2017-12-12 19:18:40', '2017-12-12 19:18:40'),
(129, 'MI00016', 'SALSA DE TOMATE', 'KILO', '157000.0000', '', NULL, 0, NULL, '2017-12-28 22:54:15', '2017-12-28 22:54:15'),
(130, 'MI00017', 'VINAGRE', 'LITRO', '7700.0000', '', '2018-01-11 20:30:04', 0, NULL, '2017-12-28 22:55:52', '2018-01-11 20:30:04'),
(131, 'MI00018', 'PIMIENTA', 'GRAMOS', '1000.0000', '', NULL, 0, NULL, '2017-12-28 22:57:16', '2017-12-28 22:57:16'),
(132, 'MI00019', 'TAPA 63mm, 500cc, TWIST BLANCA', 'UNIDAD', '661.5000', '', NULL, 1, NULL, '2017-12-28 22:59:34', '2017-12-28 22:59:34'),
(133, 'MI00020', 'ELECTRICIDAD', 'KW/H', '0.0000', '', NULL, 0, NULL, '2017-12-28 23:07:55', '2017-12-28 23:07:55'),
(134, 'MI00021', 'AGUA', 'UNIT. ESTANDAR', '0.0000', '', NULL, 0, NULL, '2017-12-28 23:16:04', '2017-12-28 23:16:04'),
(135, 'MI00022', 'DETERGENTE PARA PISOS', 'LITROS', '1000.0000', '', NULL, 0, NULL, '2017-12-28 23:17:15', '2017-12-28 23:17:15'),
(136, 'MI00023', 'DETERGENTE PARA VAJILLAS', 'LITRO', '2875.0000', '', NULL, 0, NULL, '2017-12-28 23:19:59', '2017-12-28 23:19:59'),
(137, 'MI00024', 'GUANTES DE LATEX REUSABLES', 'PAR', '2000.0000', '', NULL, 0, NULL, '2017-12-28 23:21:49', '2017-12-28 23:21:49'),
(138, 'MI00025', 'BOLSA DE BASURA', 'UNIDAD', '2000.0000', '', NULL, 0, NULL, '2017-12-28 23:22:31', '2017-12-28 23:22:31'),
(139, 'MI00026', 'ALCAPARRAS', 'KILO', '1000000.0000', '', NULL, 0, NULL, '2018-01-11 22:27:09', '2018-01-11 22:27:09'),
(140, 'MI00027', 'PLASTICO TERMOENCOJIBLE', 'GRAMOS', '10000.0000', '', NULL, 0, 0, '2018-01-11 20:37:19', '2018-01-11 20:37:19');

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
(1, '2018-01-01', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 100, '83216.7900', '2.5000', NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2018-01-11 20:57:38', '2018-01-11 20:57:39'),
(2, '2018-01-03', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 100, '29166.7900', '2.5000', NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2018-01-11 21:01:34', '2018-01-11 21:01:35'),
(3, '2018-01-04', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 50, NULL, '2.5000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-11 21:13:51', '2018-01-11 21:13:51'),
(4, '2018-01-04', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 50, NULL, '2.5000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-11 21:13:51', '2018-01-11 21:13:51'),
(5, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 120, '185423.3100', '2.5000', 1, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-11 21:13:51', '2018-01-11 21:15:18'),
(6, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 120, NULL, '2.5000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2018-01-11 21:18:26', '2018-01-11 21:18:26'),
(7, '2018-01-01', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 10, '2246319.8800', '2.5000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2018-01-11 21:18:27', '2018-01-11 21:18:28'),
(8, '2018-01-02', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 50, NULL, '2.5000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-11 21:24:26', '2018-01-11 21:24:26'),
(9, '2018-01-02', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 50, NULL, '2.5000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-11 21:24:26', '2018-01-11 21:24:26'),
(10, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 100, '222476.2500', '2.5000', 2, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2018-01-11 21:24:26', '2018-01-11 21:24:31'),
(11, '2018-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 100, NULL, '2.5000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2018-01-11 21:27:34', '2018-01-11 21:27:34'),
(12, '2018-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 8, '2344301.9200', '2.5000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2018-01-11 21:27:34', '2018-01-11 21:27:35');

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
(1, 'PICADO BLANDO ANTIPASTO (kilo)', 0, '2018-01-11 20:57:38', '2018-01-11 21:24:26'),
(2, 'PICADO DURO ANTIPASTO (kilo)', 0, '2018-01-11 21:01:34', '2018-01-11 21:24:26');

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
(1, 'ANTIPASTO ATÚN (FRASCO 470G)', 0, '2018-01-11 21:13:51', '2018-01-11 21:27:34');


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
(1, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 13, '2018-01-11 21:18:27', '2018-01-11 21:29:38');

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
(2, 'PROV01', 'Proveedor', 'J287327', 'ashda', 'sajhda', 'asjdhas', 1, '0.0000', 'credito', '2017-12-04 22:57:53', '2017-12-04 22:57:53'),
(3, 'PROV1', 'ahdgasyh', 'jhsdhjas', 'hsgdha', 'hasgdhasg', 'ahsdgas', 0, '1032393008.8000', 'contado', '2017-12-12 19:14:19', '2018-01-11 21:00:47'),
(4, 'PROV5', 'proveedor cinco', 'j-23345567-2', 'la calle', 'ramón', '15 dias', 0, '0.0000', 'contado', '2017-12-24 18:40:01', '2017-12-24 18:40:01'),
(5, 'p', 'pablo iglesia', 'j-33333333-3', 'san pablo', 'pablo', 'ninguna', 1, '0.0000', 'contado', '2017-12-30 18:26:26', '2017-12-30 18:26:26'),
(6, 'pepe', 'pepe', 'rif de pepe', 'dirección de pepe', 'pepe', 'pepe condithion', 1, '0.0000', 'credito', '2018-01-11 20:08:54', '2018-01-11 20:16:20'),
(7, 'GATO', 'GATO', 'RIF GATO', 'DIRECCION GATO', 'SR GATO', '123', 1, '4569600.0000', 'credito', '2018-01-11 23:11:57', '2018-01-11 23:19:26');


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
(8, 'PICADO BLANDO ANTIPASTO (kilo)', 'si', 'PA', 'KILO', '2017-12-28 20:01:26', '2018-01-11 21:14:24'),
(9, 'PICADO DURO ANTIPASTO (kilo)', 'si', 'PA', 'KILO', '2017-12-28 22:42:44', '2018-01-11 21:14:32'),
(10, 'ANTIPASTO ATÚN (FRASCO 470G)', 'si', 'PB', 'FRASCO 470G', '2017-12-28 22:47:09', '2018-01-11 21:14:52'),
(11, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'si', 'PC', 'CAJA X 12', '2018-01-11 20:35:54', '2018-01-11 20:35:54');


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
(27, '2017-11-28', 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', '7.0000', 0, NULL, '2017-12-28 20:14:22', '2017-12-28 22:37:49'),
(28, '2017-11-28', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', '7.0000', 0, NULL, '2017-12-28 20:14:22', '2017-12-28 22:37:49'),
(29, '2017-11-28', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', '7.0000', 0, NULL, '2017-12-28 20:14:22', '2017-12-28 22:37:49'),
(30, '2017-11-28', 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', '7.0000', 0, NULL, '2017-12-28 20:14:22', '2017-12-28 22:37:49'),
(31, '2017-12-28', 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', '30.0000', 0, NULL, '2017-12-28 23:29:43', '2017-12-28 23:30:07'),
(32, '2017-12-28', 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', '30.0000', 0, NULL, '2017-12-28 23:29:43', '2017-12-28 23:30:07'),
(33, '2017-12-28', 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', '30.0000', 0, NULL, '2017-12-28 23:29:43', '2017-12-28 23:30:07'),
(34, '2017-12-28', 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', '30.0000', 0, NULL, '2017-12-28 23:29:43', '2017-12-28 23:30:07'),
(35, '2017-12-29', 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', '45.0000', 0, NULL, '2017-12-28 23:33:01', '2017-12-28 23:34:18'),
(36, '2017-12-29', 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', '0.0000', 0, NULL, '2017-12-28 23:33:02', '2017-12-28 23:34:18'),
(37, '2017-12-29', 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', '0.0000', 0, NULL, '2017-12-28 23:33:02', '2017-12-28 23:34:18'),
(38, '2017-12-29', 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', '0.0000', 0, NULL, '2017-12-28 23:33:02', '2017-12-28 23:34:18'),
(39, '2017-12-29', 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', NULL, 0, NULL, '2017-12-29 17:15:07', '2017-12-29 17:15:07'),
(40, '2017-12-29', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', NULL, 0, NULL, '2017-12-29 17:15:07', '2017-12-29 17:15:07'),
(41, '2017-12-29', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', NULL, 0, NULL, '2017-12-29 17:15:07', '2017-12-29 17:15:07'),
(42, '2017-12-29', 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', NULL, 0, NULL, '2017-12-29 17:15:07', '2017-12-29 17:15:07'),
(43, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', '10.0000', 0, NULL, '2017-12-29 17:19:08', '2017-12-29 17:19:27'),
(44, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', '0.0000', 0, NULL, '2017-12-29 17:19:08', '2017-12-29 17:19:27'),
(45, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', '0.0000', 0, NULL, '2017-12-29 17:19:08', '2017-12-29 17:19:27'),
(46, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', '0.0000', 0, NULL, '2017-12-29 17:19:08', '2017-12-29 17:19:27'),
(47, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', '0.0000', 0, NULL, '2017-12-29 17:19:08', '2017-12-29 17:19:27'),
(48, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', '0.0000', 0, NULL, '2017-12-29 17:19:08', '2017-12-29 17:19:27'),
(49, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', '0.0000', 0, NULL, '2017-12-29 17:19:08', '2017-12-29 17:19:27'),
(50, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', '0.0000', 0, NULL, '2017-12-29 17:19:08', '2017-12-29 17:19:27'),
(51, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', '200.0000', 1, NULL, '2017-12-29 17:19:08', '2017-12-29 17:19:27'),
(52, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', '200.0000', 1, NULL, '2017-12-29 17:19:08', '2017-12-29 17:19:27'),
(53, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', '0.0000', 0, NULL, '2017-12-29 17:19:09', '2017-12-29 17:19:27'),
(54, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', '0.0000', 0, NULL, '2017-12-29 17:19:09', '2017-12-29 17:19:27'),
(55, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', '0.0000', 0, NULL, '2017-12-29 17:19:09', '2017-12-29 17:19:27'),
(56, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', '0.0000', 0, NULL, '2017-12-29 17:19:09', '2017-12-29 17:19:27'),
(57, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', '0.0000', 0, NULL, '2017-12-29 17:19:09', '2017-12-29 17:19:27'),
(58, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', '0.0000', 0, NULL, '2017-12-29 17:19:09', '2017-12-29 17:19:27'),
(59, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', '0.0000', 0, NULL, '2017-12-29 17:19:09', '2017-12-29 17:19:27'),
(60, '2017-12-29', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', '0.0000', 0, NULL, '2017-12-29 17:19:09', '2017-12-29 17:19:27'),
(61, '2018-01-01', 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', '100.0000', 0, NULL, '2018-01-11 20:39:22', '2018-01-11 20:57:38'),
(62, '2018-01-01', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', '100.0000', 0, NULL, '2018-01-11 20:39:22', '2018-01-11 20:57:38'),
(63, '2018-01-01', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', '100.0000', 0, NULL, '2018-01-11 20:39:22', '2018-01-11 20:57:38'),
(64, '2018-01-01', 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', '100.0000', 0, NULL, '2018-01-11 20:39:22', '2018-01-11 20:57:39'),
(65, '2018-01-02', 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', NULL, 0, NULL, '2018-01-11 20:58:15', '2018-01-11 20:58:15'),
(66, '2018-01-02', 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', NULL, 0, NULL, '2018-01-11 20:58:15', '2018-01-11 20:58:15'),
(67, '2018-01-02', 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', NULL, 0, NULL, '2018-01-11 20:58:15', '2018-01-11 20:58:15'),
(68, '2018-01-02', 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', NULL, 0, NULL, '2018-01-11 20:58:15', '2018-01-11 20:58:15'),
(69, '2018-01-03', 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', '100.0000', 0, NULL, '2018-01-11 21:01:27', '2018-01-11 21:01:34'),
(70, '2018-01-03', 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', '100.0000', 0, NULL, '2018-01-11 21:01:27', '2018-01-11 21:01:35'),
(71, '2018-01-03', 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', '100.0000', 0, NULL, '2018-01-11 21:01:27', '2018-01-11 21:01:35'),
(72, '2018-01-03', 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', '100.0000', 0, NULL, '2018-01-11 21:01:28', '2018-01-11 21:01:35'),
(73, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(74, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(75, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(76, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(77, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(78, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(79, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(80, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(81, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', NULL, 1, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(82, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', NULL, 1, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(83, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(84, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(85, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(86, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(87, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(88, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', NULL, 0, NULL, '2018-01-11 21:02:23', '2018-01-11 21:02:23'),
(89, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', NULL, 0, NULL, '2018-01-11 21:02:24', '2018-01-11 21:02:24'),
(90, '2018-01-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', NULL, 0, NULL, '2018-01-11 21:02:24', '2018-01-11 21:02:24'),
(91, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', '20.0000', 0, NULL, '2018-01-11 21:13:00', '2018-01-11 21:13:51'),
(92, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', '20.0000', 0, NULL, '2018-01-11 21:13:00', '2018-01-11 21:13:51'),
(93, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', '20.0000', 0, NULL, '2018-01-11 21:13:00', '2018-01-11 21:13:52'),
(94, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', '20.0000', 0, NULL, '2018-01-11 21:13:00', '2018-01-11 21:13:52'),
(95, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', '20.0000', 0, NULL, '2018-01-11 21:13:00', '2018-01-11 21:13:52'),
(96, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', '20.0000', 0, NULL, '2018-01-11 21:13:00', '2018-01-11 21:13:52'),
(97, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', '20.0000', 0, NULL, '2018-01-11 21:13:00', '2018-01-11 21:13:52'),
(98, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', '20.0000', 0, NULL, '2018-01-11 21:13:00', '2018-01-11 21:13:52'),
(99, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', '20.0000', 1, NULL, '2018-01-11 21:13:00', '2018-01-11 21:13:52'),
(100, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', '20.0000', 1, NULL, '2018-01-11 21:13:00', '2018-01-11 21:13:53'),
(101, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', '20.0000', 0, NULL, '2018-01-11 21:13:00', '2018-01-11 21:13:53'),
(102, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', '20.0000', 0, NULL, '2018-01-11 21:13:01', '2018-01-11 21:13:53'),
(103, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', '20.0000', 0, NULL, '2018-01-11 21:13:01', '2018-01-11 21:13:53'),
(104, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', '20.0000', 0, NULL, '2018-01-11 21:13:01', '2018-01-11 21:13:53'),
(105, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', '20.0000', 0, NULL, '2018-01-11 21:13:01', '2018-01-11 21:13:53'),
(106, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', '20.0000', 0, NULL, '2018-01-11 21:13:01', '2018-01-11 21:13:53'),
(107, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', '20.0000', 0, NULL, '2018-01-11 21:13:01', '2018-01-11 21:13:53'),
(108, '2018-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', '20.0000', 0, NULL, '2018-01-11 21:13:01', '2018-01-11 21:13:54'),
(109, '2018-01-01', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '10.0000', 0, NULL, '2018-01-11 21:16:06', '2018-01-11 21:18:27'),
(110, '2018-01-01', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '10.0000', 0, 0, '2018-01-11 21:16:06', '2018-01-11 21:18:27'),
(111, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:26'),
(112, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:27'),
(113, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:27'),
(114, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:27'),
(115, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:27'),
(116, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:27'),
(117, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:27'),
(118, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:28'),
(119, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', '20.0000', 1, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:28'),
(120, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', '20.0000', 1, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:28'),
(121, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:28'),
(122, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:29'),
(123, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:29'),
(124, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:29'),
(125, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:30'),
(126, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:30'),
(127, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:30'),
(128, '2018-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', '20.0000', 0, NULL, '2018-01-11 21:23:53', '2018-01-11 21:24:30'),
(129, '2018-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '10.0000', 0, NULL, '2018-01-11 21:26:15', '2018-01-11 21:27:34'),
(130, '2018-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '10.0000', 0, 0, '2018-01-11 21:26:15', '2018-01-11 21:27:34');
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
(1, 'Andres Vega', 'andres_vega93@hotmail.com', '$2y$10$9EhJlqnSNAK3F8tvvWU44ukQqdTPEUwBSzAhBdlyZcTk31Xa4.x.m', 'admin', 'F1eulJJZpqmQ3hVBI26LVqE9pZHyb8VywVSjeG2v6rWlaG6Ju0Xswb55Y8ib', '2017-10-11 10:32:19', '2017-12-05 22:51:21'),
(7, 'Carlos', 'carlosteno@gmail.com', '$2y$10$9uwn8GSSYhLxzaSZnhawBu8f0sqBvgRRYHu8yQpI7/pILxLjx.WVK', 'admin', 'vH16x2CchlvK3aBqvCZGhHMTFtc91YRtEk7uRF33ep2eZsJMhu7YYi2DR57n', '2017-10-14 15:48:38', '2017-12-24 19:25:10'),
(8, 'clarisa', 'clari98@hotmail.com', '$2y$10$3PdMuwN1QX5OiLW0jhYWWu/PGegeRyRjoaJUPHPq2Y1q6xAAB4mE6', 'tipo1', NULL, '2017-12-24 18:33:40', '2018-01-06 20:32:12');

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
