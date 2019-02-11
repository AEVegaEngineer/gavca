-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-01-2018 a las 18:15:23
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

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
(68, 'Caja Chica', '59642.5110', NULL, 'DEBE', '2018-01-03 04:00:00', '-214897.5330', 'Venta', 1, '2018-01-07 04:09:37', '2018-01-07 04:09:37');

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
  `car_compra_id` int(10) unsigned DEFAULT NULL,
  `car_concepto` varchar(255) DEFAULT NULL,
  `car_fecha` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cardexmp`
--

INSERT INTO `cardexmp` (`id`, `mp_codigo`, `comp_doc`, `car_costo`, `car_valor_anterior`, `car_valor_actual`, `car_compra_id`, `car_concepto`, `car_fecha`, `created_at`, `updated_at`) VALUES
(28, 'MI00002', '1', '9000.0000', '75.0000', '125.0000', 82, NULL, NULL, '2017-12-31 10:44:13', '2017-12-31 10:44:13'),
(29, 'MI00000', '1', '33000.0000', '99.0000', '149.0000', 82, NULL, NULL, '2017-12-31 10:44:13', '2017-12-31 10:44:13'),
(30, 'MI00001', '1', '500000.0000', '132.0000', '182.0000', 82, NULL, NULL, '2017-12-31 10:44:13', '2017-12-31 10:44:13'),
(31, 'MI00000', NULL, '0.0000', '49.0000', '24.0000', NULL, 'Producción de EJEMPLO RECETA A', NULL, '2017-12-31 11:09:44', '2017-12-31 11:09:44'),
(32, 'MI00001', NULL, '0.0000', '32.0000', '7.0000', NULL, 'Producción de EJEMPLO RECETA A', NULL, '2017-12-31 11:09:44', '2017-12-31 11:09:44'),
(33, 'MI00002', NULL, '0.0000', '25.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', NULL, '2017-12-31 11:09:44', '2017-12-31 11:09:44'),
(34, 'MI00000', '2', '33000.0000', '124.0000', '224.0000', 83, NULL, NULL, '2017-12-31 11:25:11', '2017-12-31 11:25:11'),
(35, 'MI00002', '2', '9000.0000', '0.0000', '100.0000', 83, NULL, NULL, '2017-12-31 11:25:11', '2017-12-31 11:25:11'),
(36, 'MI00001', '2', '500000.0000', '107.0000', '207.0000', 83, NULL, NULL, '2017-12-31 11:25:11', '2017-12-31 11:25:11'),
(37, 'MI00000', NULL, '0.0000', '124.0000', '24.0000', NULL, 'Producción de EJEMPLO RECETA A', NULL, '2017-12-31 11:57:25', '2017-12-31 11:57:25'),
(38, 'MI00001', NULL, '0.0000', '107.0000', '7.0000', NULL, 'Producción de EJEMPLO RECETA A', NULL, '2017-12-31 11:57:25', '2017-12-31 11:57:25'),
(39, 'MI00002', NULL, '0.0000', '100.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', NULL, '2017-12-31 11:57:26', '2017-12-31 11:57:26'),
(40, 'MI00002', '3', '9000.0000', '0.0000', '100.0000', 84, NULL, NULL, '2017-12-31 11:58:39', '2017-12-31 11:58:39'),
(41, 'MI00001', '3', '500000.0000', '7.0000', '107.0000', 84, NULL, NULL, '2017-12-31 11:58:39', '2017-12-31 11:58:39'),
(42, 'MI00000', '3', '33000.0000', '124.0000', '224.0000', 84, NULL, NULL, '2017-12-31 11:58:39', '2017-12-31 11:58:39'),
(43, 'MI00001', '4', '500000.0000', '7.0000', '107.0000', 85, NULL, NULL, '2017-12-31 12:00:02', '2017-12-31 12:00:02'),
(44, 'MI00000', NULL, '0.0000', '124.0000', '24.0000', NULL, 'Producción de EJEMPLO RECETA A', NULL, '2017-12-31 12:01:00', '2017-12-31 12:01:00'),
(45, 'MI00001', NULL, '0.0000', '107.0000', '7.0000', NULL, 'Producción de EJEMPLO RECETA A', NULL, '2017-12-31 12:01:00', '2017-12-31 12:01:00'),
(46, 'MI00002', NULL, '0.0000', '100.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', NULL, '2017-12-31 12:01:00', '2017-12-31 12:01:00'),
(47, 'MI00000', NULL, '0.0000', '24.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2017-12-06', '2017-12-31 12:04:14', '2017-12-31 12:04:14'),
(48, 'MI00001', NULL, '0.0000', '7.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2017-12-06', '2017-12-31 12:04:15', '2017-12-31 12:04:15'),
(49, 'MI00002', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2017-12-06', '2017-12-31 12:04:15', '2017-12-31 12:04:15'),
(50, 'MI00000', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2017-12-01', '2017-12-31 12:30:35', '2017-12-31 12:30:35'),
(51, 'MI00001', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2017-12-01', '2017-12-31 12:30:35', '2017-12-31 12:30:35'),
(52, 'MI00000', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-07', '2018-01-01 08:33:12', '2018-01-01 08:33:12'),
(53, 'MI00001', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-07', '2018-01-01 08:33:12', '2018-01-01 08:33:12'),
(54, 'MI00002', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-07', '2018-01-01 08:33:12', '2018-01-01 08:33:12'),
(55, 'MI00000', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-02', '2018-01-01 08:34:42', '2018-01-01 08:34:42'),
(56, 'MI00001', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-02', '2018-01-01 08:34:42', '2018-01-01 08:34:42'),
(57, 'MI00000', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-03', '2018-01-01 08:40:35', '2018-01-01 08:40:35'),
(58, 'MI00001', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-03', '2018-01-01 08:40:35', '2018-01-01 08:40:35'),
(59, 'MI00000', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-08', '2018-01-01 09:01:50', '2018-01-01 09:01:50'),
(60, 'MI00001', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-08', '2018-01-01 09:01:50', '2018-01-01 09:01:50'),
(61, 'MI00002', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-08', '2018-01-01 09:01:50', '2018-01-01 09:01:50'),
(62, 'MI00000', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-04', '2018-01-01 09:02:30', '2018-01-01 09:02:30'),
(63, 'MI00001', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-04', '2018-01-01 09:02:30', '2018-01-01 09:02:30'),
(64, 'MI00000', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-01', '2018-01-01 09:06:20', '2018-01-01 09:06:20'),
(65, 'MI00001', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-01', '2018-01-01 09:06:20', '2018-01-01 09:06:20'),
(66, 'MI00002', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-01', '2018-01-01 09:06:20', '2018-01-01 09:06:20'),
(67, 'MI00000', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-02', '2018-01-01 09:06:35', '2018-01-01 09:06:35'),
(68, 'MI00001', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-02', '2018-01-01 09:06:35', '2018-01-01 09:06:35'),
(69, 'MI00002', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA A', '2018-01-02', '2018-01-01 09:06:35', '2018-01-01 09:06:35'),
(70, 'MP00000', NULL, '0.0000', '1.0000', '1.0000', NULL, 'Producción de EJEMPLO RECETA A 2', '2018-01-01', '2018-01-01 09:32:24', '2018-01-01 09:32:24'),
(71, 'MP00001', NULL, '0.0000', '1.0000', '1.0000', NULL, 'Producción de EJEMPLO RECETA A 2', '2018-01-01', '2018-01-01 09:32:24', '2018-01-01 09:32:24'),
(72, 'MI00003', NULL, '0.0000', '1.0000', '1.0000', NULL, 'Producción de EJEMPLO RECETA A 2', '2018-01-01', '2018-01-01 09:32:24', '2018-01-01 09:32:24'),
(73, 'MP00000', NULL, '0.0000', '1.0000', '1.0000', NULL, 'Producción de EJEMPLO RECETA A 2', '2018-01-02', '2018-01-01 09:32:44', '2018-01-01 09:32:44'),
(74, 'MP00001', NULL, '0.0000', '1.0000', '1.0000', NULL, 'Producción de EJEMPLO RECETA A 2', '2018-01-02', '2018-01-01 09:32:44', '2018-01-01 09:32:44'),
(75, 'MI00003', NULL, '0.0000', '1.0000', '1.0000', NULL, 'Producción de EJEMPLO RECETA A 2', '2018-01-02', '2018-01-01 09:32:44', '2018-01-01 09:32:44'),
(76, 'MI00000', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-01', '2018-01-01 09:37:51', '2018-01-01 09:37:51'),
(77, 'MI00001', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-01', '2018-01-01 09:37:51', '2018-01-01 09:37:51'),
(78, 'MI00000', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-02', '2018-01-01 09:44:33', '2018-01-01 09:44:33'),
(79, 'MI00001', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-02', '2018-01-01 09:44:33', '2018-01-01 09:44:33'),
(80, 'MI00008', NULL, '0.0000', '20.0000', '20.0000', NULL, 'Producción de EJEMPLO RECETA C', '2018-01-01', '2018-01-01 09:55:55', '2018-01-01 09:55:55'),
(81, 'MI00000', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-03', '2018-01-01 14:18:32', '2018-01-01 14:18:32'),
(82, 'MI00001', NULL, '0.0000', '0.0000', '0.0000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-03', '2018-01-01 14:18:32', '2018-01-01 14:18:32'),
(100, 'MI00000', '18', '33000.0000', '115.0000', '116.0000', 110, NULL, NULL, '2018-01-04 10:58:56', '2018-01-04 10:58:56'),
(101, 'MI00000', '1', '33000.0000', '116.0000', '117.0000', 111, NULL, NULL, '2018-01-04 11:01:04', '2018-01-04 11:01:04'),
(102, 'MI00000', '1', '33000.0000', '117.0000', '118.0000', 111, NULL, NULL, '2018-01-04 11:02:10', '2018-01-04 11:02:10'),
(103, 'MI00002', '2', '9000.0000', '7.0000', '8.0000', 112, NULL, NULL, '2018-01-04 11:10:42', '2018-01-04 11:10:42'),
(104, 'MI00000', '3', '33000.0000', '118.0000', '119.0000', 113, NULL, NULL, '2018-01-04 11:14:21', '2018-01-04 11:14:21'),
(105, 'MI00000', '1', '33000.0000', '119.0000', '120.0000', 115, NULL, NULL, '2018-01-04 11:17:34', '2018-01-04 11:17:34'),
(106, 'MI00000', '2', '33000.0000', '120.0000', '121.0000', 116, NULL, NULL, '2018-01-04 11:31:19', '2018-01-04 11:31:19'),
(107, 'MI00000', '3', '33000.0000', '121.0000', '122.0000', 117, NULL, NULL, '2018-01-04 11:32:54', '2018-01-04 11:32:54'),
(108, 'MI00000', '4', '33000.0000', '122.0000', '123.0000', 118, NULL, NULL, '2018-01-04 11:34:30', '2018-01-04 11:34:30'),
(109, 'MI00000', '5', '33000.0000', '123.0000', '124.0000', 119, NULL, NULL, '2018-01-04 11:47:20', '2018-01-04 11:47:20'),
(110, 'MI00000', '6', '33000.0000', '124.0000', '125.0000', 120, NULL, NULL, '2018-01-04 12:23:12', '2018-01-04 12:23:12'),
(111, 'MI00003', '7', '3139.0000', '3.0000', '4.0000', 121, NULL, NULL, '2018-01-04 12:25:16', '2018-01-04 12:25:16'),
(112, 'MI00000', '8', '33000.0000', '125.0000', '126.0000', 122, NULL, NULL, '2018-01-04 12:43:11', '2018-01-04 12:43:11'),
(113, 'MI00002', '9', '9000.0000', '8.0000', '9.0000', 123, NULL, NULL, '2018-01-04 12:48:20', '2018-01-04 12:48:20'),
(114, 'MI00007', '10', '500.0000', '15.0000', '16.0000', 124, NULL, NULL, '2018-01-04 12:49:45', '2018-01-04 12:49:45'),
(115, 'MI00000', '11', '33000.0000', '126.0000', '127.0000', 130, NULL, NULL, '2018-01-05 18:57:25', '2018-01-05 18:57:25'),
(116, 'MI00001', '12', '500000.0000', '100.0000', '101.0000', 131, NULL, NULL, '2018-01-05 19:00:40', '2018-01-05 19:00:40'),
(117, 'MI00002', '13', '9000.0000', '9.0000', '10.0000', 132, NULL, NULL, '2018-01-05 19:03:56', '2018-01-05 19:03:56'),
(118, 'MI00003', '14', '3139.0000', '4.0000', '5.0000', 133, NULL, NULL, '2018-01-05 19:12:30', '2018-01-05 19:12:30'),
(119, 'MI00000', '15', '33000.0000', '127.0000', '128.0000', 141, NULL, NULL, '2018-01-05 19:34:53', '2018-01-05 19:34:53'),
(120, 'MI00000', '16', '33000.0000', '128.0000', '129.0000', 142, NULL, NULL, '2018-01-05 19:39:15', '2018-01-05 19:39:15'),
(121, 'MI00000', '17', '33000.0000', '130.0000', '131.0000', 143, NULL, NULL, '2018-01-05 19:44:13', '2018-01-05 19:44:13'),
(122, 'MI00002', '18', '9000.0000', '10.0000', '11.0000', 144, NULL, NULL, '2018-01-05 19:44:40', '2018-01-05 19:44:40'),
(123, 'MI00000', NULL, '0.0000', '130.0000', '120.0000', NULL, 'Producción de EJEMPLO 2', '2018-01-01', '2018-01-06 21:28:29', '2018-01-06 21:28:29'),
(124, 'MI00002', '19', '9000.0000', '11.0000', '12.0000', 145, NULL, NULL, '2018-01-11 16:32:31', '2018-01-11 16:32:31'),
(125, 'MI00000', '19', '33000.0000', '120.0000', '121.0000', 145, NULL, NULL, '2018-01-11 16:32:31', '2018-01-11 16:32:31');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `cli_codigo`, `cli_nombre`, `cli_rif`, `cli_direccion`, `cli_contacto`, `cli_condiciones`, `cli_saldo`, `created_at`, `updated_at`) VALUES
(4, 'cli1', 'cliente uno', 'J82173', 'sadjas', 'ajsdhj', 'akjsdha', '39761.6740', '2018-01-06 19:26:09', '2018-01-11 16:44:24');

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
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `comp_doc`, `comp_proveedor`, `comp_fecha`, `comp_monto`, `comp_cred_cont`, `created_at`, `updated_at`) VALUES
(115, '1', 'PROV01', '2018-01-04 11:16:54', '35970.0000', 'contado', '2018-01-04 11:17:24', '2018-01-04 11:17:34'),
(116, '2', 'PROV01', '2018-01-04 11:17:43', '35970.0000', 'contado', '2018-01-04 11:31:14', '2018-01-04 11:31:19'),
(117, '3', 'PROV01', '2018-01-04 11:32:35', '35970.0000', 'contado', '2018-01-04 11:32:48', '2018-01-04 11:32:54'),
(118, '4', 'PROV01', '2018-01-04 11:33:55', '35970.0000', 'contado', '2018-01-04 11:34:23', '2018-01-04 11:34:30'),
(119, '5', 'PROV01', '2018-01-04 11:46:59', '35970.0000', 'contado', '2018-01-04 11:47:14', '2018-01-04 11:47:19'),
(120, '6', 'PROV01', '2018-01-04 12:22:35', '35970.0000', 'contado', '2018-01-04 12:23:08', '2018-01-04 12:23:12'),
(121, '7', 'PROV01', '2018-01-04 12:23:31', '3421.5100', 'contado', '2018-01-04 12:24:59', '2018-01-04 12:25:16'),
(122, '8', 'PROV01', '2018-01-04 12:42:37', '35970.0000', 'contado', '2018-01-04 12:43:05', '2018-01-04 12:43:11'),
(123, '9', 'PROV01', '2018-01-04 12:47:59', '9810.0000', 'contado', '2018-01-04 12:48:14', '2018-01-04 12:48:20'),
(124, '10', 'PROV01', '2018-01-04 12:49:17', '545.0000', 'contado', '2018-01-04 12:49:28', '2018-01-04 12:49:45'),
(130, '11', 'PROV01', '2018-01-05 06:56:54', '35970.0000', 'contado', '2018-01-05 18:57:19', '2018-01-05 18:57:25'),
(131, '12', 'PROV01', '2018-01-05 07:00:17', '545000.0000', 'contado', '2018-01-05 19:00:33', '2018-01-05 19:00:40'),
(132, '13', 'PROV01', '2018-01-05 07:03:33', '9810.0000', 'contado', '2018-01-05 19:03:48', '2018-01-05 19:03:56'),
(133, '14', 'PROV01', '2018-01-05 07:12:16', '3421.5100', 'contado', '2018-01-05 19:12:24', '2018-01-05 19:12:30'),
(141, '15', 'PROV01', '2018-01-05 07:34:40', '35970.0000', 'contado', '2018-01-05 19:34:47', '2018-01-05 19:34:52'),
(142, '16', 'PROV01', '2018-01-05 07:38:59', '35970.0000', 'contado', '2018-01-05 19:39:11', '2018-01-05 19:39:15'),
(143, '17', 'PROV01', '2018-01-05 07:43:58', '35970.0000', 'contado', '2018-01-05 19:44:07', '2018-01-05 19:44:13'),
(144, '18', 'PROV01', '2018-01-05 07:44:19', '9810.0000', 'contado', '2018-01-05 19:44:29', '2018-01-05 19:44:40'),
(145, '19', 'PROV01', '2018-01-11 16:32:00', '45780.0000', 'credito', '2018-01-11 16:32:16', '2018-01-11 16:32:31');

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
  `cta_venta_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentasxcobrar`
--

INSERT INTO `cuentasxcobrar` (`id`, `cta_cli_codigo`, `cta_monto`, `cta_concepto`, `cta_venta_id`, `created_at`, `updated_at`) VALUES
(1, 'cli1', '19880.8370', 'Venta 2 de fecha 2018-01-02', 1, '2018-01-07 03:58:03', '2018-01-07 03:58:03'),
(2, 'cli1', '19880.8370', 'Venta 4 de fecha 2018-01-02', 7, '2018-01-11 16:44:24', '2018-01-11 16:44:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentasxpagar`
--

CREATE TABLE IF NOT EXISTS `cuentasxpagar` (
`id` int(10) unsigned NOT NULL,
  `cta_prov_codigo` varchar(255) NOT NULL,
  `cta_monto` decimal(25,4) DEFAULT NULL,
  `cta_concepto` varchar(255) DEFAULT NULL,
  `cta_compra_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentasxpagar`
--

INSERT INTO `cuentasxpagar` (`id`, `cta_prov_codigo`, `cta_monto`, `cta_concepto`, `cta_compra_id`, `created_at`, `updated_at`) VALUES
(3, 'PROV01', '49050.0000', 'Compra a crédito bajo factura: 6', 90, '2018-01-02 14:28:49', '2018-01-02 14:28:56'),
(4, 'PROV01', '2725000.0000', 'Compra a crédito bajo factura: 7', 91, '2018-01-02 14:46:10', '2018-01-02 14:46:18'),
(12, 'PROV01', '582060.0000', 'Compra a crédito bajo factura: 8', 99, '2018-01-03 14:58:01', '2018-01-03 16:16:11'),
(13, 'PROV01', '45780.0000', 'Compra a crédito bajo factura: 19', 145, '2018-01-11 16:32:16', '2018-01-11 16:32:31');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiasprimas`
--

INSERT INTO `materiasprimas` (`id`, `mp_codigo`, `mp_cantidad`, `created_at`, `updated_at`) VALUES
(1, 'MI00001', 101, '2017-12-10 04:57:46', '2018-01-05 19:00:40'),
(3, 'MI00008', 20, '2017-12-26 06:36:15', '2018-01-01 09:55:55'),
(4, 'MI00007', 16, '2017-12-26 06:36:15', '2018-01-04 12:49:45'),
(5, 'MI00009', 10, '2017-12-26 06:36:15', '2017-12-26 06:36:15'),
(6, 'MI00010', 5, '2017-12-26 06:36:15', '2017-12-26 06:36:15'),
(12, 'MI00000', 121, '2017-12-27 05:56:26', '2018-01-11 16:32:31'),
(13, 'MI00002', 12, '2017-12-30 09:36:43', '2018-01-11 16:32:31'),
(17, 'MI00006', 3, '2017-12-30 12:23:08', '2018-01-04 10:20:52'),
(18, 'MP00000', 1, '2018-01-01 09:31:57', '2018-01-01 09:32:44'),
(19, 'MP00001', 1, '2018-01-01 09:31:57', '2018-01-01 09:32:44'),
(20, 'MI00003', 5, '2018-01-01 09:31:57', '2018-01-05 19:12:30'),
(21, 'MI00011', 1, '2018-01-04 10:16:28', '2018-01-04 10:16:28'),
(22, 'MI00012', 2, '2018-01-04 10:38:14', '2018-01-04 10:38:14');

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
(27, '2018-01-02', 'EJEMPLO RECETA B', 'PB', 100, '1213.4500', '2.5000', 2, 'Producción de EJEMPLO RECETA B', '2018-01-01 09:44:33', '2018-01-01 15:49:27'),
(28, '2018-01-01', 'EJEMPLO RECETA B', 'PB', 100, '1213.4500', '2.5000', NULL, 'Producción de EJEMPLO RECETA C', '2018-01-01 09:55:54', '2018-01-01 15:49:39'),
(29, '2018-01-01', 'EJEMPLO RECETA C', 'PC', 100, '1812.6800', '2.5000', NULL, 'Producción de EJEMPLO RECETA C', '2018-01-01 09:55:54', '2018-01-01 15:49:37'),
(30, '2018-01-03', 'EJEMPLO RECETA A', 'PA', 50, NULL, '2.5000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-01 14:18:31', '2018-01-01 14:18:31'),
(31, '2018-01-03', 'EJEMPLO RECETA A 2', 'PA', 50, NULL, '2.5000', NULL, 'Producción de EJEMPLO RECETA B', '2018-01-01 14:18:31', '2018-01-01 14:18:31'),
(32, '2018-01-03', 'EJEMPLO RECETA B', 'PB', 100, '11961.5700', '3.0000', 3, 'Producción de EJEMPLO RECETA B', '2018-01-01 14:18:31', '2018-01-02 15:04:55'),
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
(1, 'EJEMPLO RECETA C', 78, '2018-01-01 09:55:54', '2018-01-11 16:44:24'),
(2, 'EJEMPLO 2', 128, '2018-01-06 21:28:29', '2018-01-11 16:44:24');

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
(2, 'PROV01', 'Proveedor', 'J287327', 'ashda', 'sajhda', 'asjdhas', 1, '3401890.0000', 'credito', '2017-12-04 18:57:53', '2018-01-11 16:32:31');

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
(1, '4251.4000', 300, 21, '17623.6700', NULL, '2018-01-02 15:07:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `saldocaja`
--

INSERT INTO `saldocaja` (`id`, `sc_entidad`, `sc_saldo`, `sc_fecha`, `created_at`, `updated_at`) VALUES
(1, 'Caja Chica', '71941.0000', '2018-01-04 04:00:00', '2018-01-05 14:06:15', '2018-01-05 14:06:15'),
(2, 'Banco de Venezuela', '-23000.0000', '2018-01-05 04:00:00', '2018-01-07 14:21:17', '2018-01-07 14:21:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `totalesventas`
--

INSERT INTO `totalesventas` (`id`, `ven_factura`, `ven_total`, `ven_iva`, `created_at`, `updated_at`) VALUES
(1, '2', '19880.8370', 9, '2018-01-07 03:58:03', '2018-01-07 03:58:03'),
(6, '3', '59642.5110', 9, '2018-01-07 04:03:44', '2018-01-07 04:03:44'),
(7, '4', '19880.8370', 9, '2018-01-11 16:44:24', '2018-01-11 16:44:24');

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
(7, 'Carlos', 'carlos@gmail.com', '$2y$10$9uwn8GSSYhLxzaSZnhawBu8f0sqBvgRRYHu8yQpI7/pILxLjx.WVK', 'admin', 'ExDDv98oudjXWskR26I5QkbOewRumyiGCLZaTQBmdyb3lGKsrBn48aPYmSTp', '2017-10-14 11:48:38', '2017-10-26 20:57:23'),
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
  `rec_nombre` varchar(255) NOT NULL,
  `ven_costo` decimal(25,4) NOT NULL,
  `ven_cantidad` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `cli_codigo`, `ven_fecha`, `ven_factura`, `ven_condicion`, `rec_nombre`, `ven_costo`, `ven_cantidad`, `created_at`, `updated_at`) VALUES
(3, 'cli1', '2018-01-01', '1', 'credito', 'EJEMPLO 2', '14613.9400', 11, '2018-01-06 22:40:13', '2018-01-06 22:40:13'),
(8, 'cli1', '2018-01-01', '1', 'credito', 'EJEMPLO RECETA C', '1812.6800', 1, '2018-01-06 23:57:29', '2018-01-06 23:57:29'),
(11, 'cli1', '2018-01-02', '2', 'credito', 'EJEMPLO RECETA C', '1812.6800', 1, '2018-01-07 03:58:03', '2018-01-07 03:58:03'),
(12, 'cli1', '2018-01-02', '2', 'credito', 'EJEMPLO 2', '14613.9400', 1, '2018-01-07 03:58:03', '2018-01-07 03:58:03'),
(21, 'cli1', '2018-01-03', '3', 'contado', 'EJEMPLO RECETA C', '1812.6800', 3, '2018-01-07 04:03:44', '2018-01-07 04:03:44'),
(22, 'cli1', '2018-01-03', '3', 'contado', 'EJEMPLO 2', '14613.9400', 3, '2018-01-07 04:03:44', '2018-01-07 04:03:44'),
(23, 'cli1', '2018-01-02', '4', 'credito', 'EJEMPLO RECETA C', '1812.6800', 1, '2018-01-11 16:44:24', '2018-01-11 16:44:24'),
(24, 'cli1', '2018-01-02', '4', 'credito', 'EJEMPLO 2', '14613.9400', 1, '2018-01-11 16:44:24', '2018-01-11 16:44:24');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aumentos`
--
ALTER TABLE `aumentos`
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
-- AUTO_INCREMENT de la tabla `cajabanco`
--
ALTER TABLE `cajabanco`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT de la tabla `cajachica`
--
ALTER TABLE `cajachica`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT de la tabla `costofijos`
--
ALTER TABLE `costofijos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `cuentasxcobrar`
--
ALTER TABLE `cuentasxcobrar`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `cuentasxpagar`
--
ALTER TABLE `cuentasxpagar`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `totalesventas`
--
ALTER TABLE `totalesventas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
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
