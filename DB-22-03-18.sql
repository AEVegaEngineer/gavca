-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-03-2018 a las 05:40:05
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
(1, 'De Venezuela', '2018-01-14 21:37:16', '2018-02-21 21:31:03'),
(4, 'Venezolano de Crédito', '2018-01-14 21:42:04', '2018-02-21 21:39:50'),
(6, 'Bicentenario', '2018-01-14 21:43:03', '2018-02-21 21:31:14'),
(8, 'Banesco', '2018-01-14 21:44:59', '2018-02-21 21:31:28');

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
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajabanco`
--

INSERT INTO `cajabanco` (`id`, `cb_entidad`, `cb_monto`, `cb_compra_id`, `cb_debe_haber`, `cb_fecha`, `cb_saldo`, `cb_concepto`, `cb_activo`, `created_at`, `updated_at`) VALUES
(116, 'Caja Chica', NULL, NULL, 'HABER', '2018-03-01 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-21 07:43:12', '2018-03-21 07:48:09'),
(118, 'De Venezuela', NULL, NULL, 'HABER', '2018-03-01 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-21 07:43:12', '2018-03-21 07:48:09'),
(120, 'Venezolano de Crédito', NULL, NULL, 'HABER', '2018-03-01 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-21 07:43:12', '2018-03-21 07:48:09'),
(122, 'Bicentenario', NULL, NULL, 'HABER', '2018-03-01 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-21 07:43:13', '2018-03-21 07:48:09'),
(124, 'Banesco', NULL, NULL, 'HABER', '2018-03-01 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-21 07:43:13', '2018-03-21 07:48:10'),
(125, 'Caja Chica', '38080.0000', 8, 'HABER', '2018-03-01 04:30:00', '-38080.0000', 'Compra', 0, '2018-03-21 07:44:23', '2018-03-21 07:48:09'),
(126, 'Caja Chica', '1232000.0000', 9, 'HABER', '2018-03-01 04:30:00', '-1270080.0000', 'Compra', 0, '2018-03-21 07:44:53', '2018-03-21 07:48:09'),
(127, 'Caja Chica', '1500000.0000', NULL, 'HABER', '2018-03-01 04:30:00', '-2770080.0000', 'Transferido hacia De Venezuela, transferencia 1234566777 pago fac 22222', 0, '2018-03-21 07:45:17', '2018-03-21 07:48:09'),
(128, 'De Venezuela', '1500000.0000', NULL, 'DEBE', '2018-03-01 04:30:00', '1500000.0000', 'Transferido desde Caja Chica, transferencia 1234566777 pago fac 22222', 0, '2018-03-21 07:45:18', '2018-03-21 07:48:09'),
(129, 'Caja Chica', NULL, NULL, 'HABER', '2018-03-02 04:30:00', '-2770080.0000', 'Inicio de caja', 0, '2018-03-21 07:48:09', '2018-03-22 01:18:34'),
(130, 'De Venezuela', NULL, NULL, 'HABER', '2018-03-02 04:30:00', '1500000.0000', 'Inicio de caja', 0, '2018-03-21 07:48:09', '2018-03-22 01:18:34'),
(131, 'Venezolano de Crédito', NULL, NULL, 'HABER', '2018-03-02 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-21 07:48:09', '2018-03-22 01:18:34'),
(132, 'Bicentenario', NULL, NULL, 'HABER', '2018-03-02 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-21 07:48:09', '2018-03-22 01:18:34'),
(133, 'Banesco', NULL, NULL, 'HABER', '2018-03-02 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-21 07:48:10', '2018-03-22 01:18:35'),
(135, 'Caja Chica', '5600000.0000', 11, 'HABER', '2018-03-02 04:30:00', '-5600000.0000', 'Compra', 0, '2018-03-21 08:35:35', '2018-03-22 01:18:34'),
(136, 'De Venezuela', '179200.0000', 13, 'HABER', '2018-03-02 04:30:00', '1320800.0000', 'Compra', 0, '2018-03-21 08:39:01', '2018-03-22 01:18:34'),
(137, 'Caja Chica', NULL, NULL, 'HABER', '2018-03-03 04:30:00', '-5600000.0000', 'Inicio de caja', 0, '2018-03-22 01:18:34', '2018-03-22 01:41:44'),
(138, 'De Venezuela', NULL, NULL, 'HABER', '2018-03-03 04:30:00', '1320800.0000', 'Inicio de caja', 0, '2018-03-22 01:18:34', '2018-03-22 01:41:44'),
(139, 'Venezolano de Crédito', NULL, NULL, 'HABER', '2018-03-03 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-22 01:18:34', '2018-03-22 01:41:44'),
(140, 'Bicentenario', NULL, NULL, 'HABER', '2018-03-03 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-22 01:18:35', '2018-03-22 01:41:44'),
(141, 'Banesco', NULL, NULL, 'HABER', '2018-03-03 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-22 01:18:35', '2018-03-22 01:41:44'),
(142, 'Caja Chica', '761600.0000', 14, 'HABER', '2018-03-03 04:30:00', '-6361600.0000', 'Compra', 0, '2018-03-22 01:19:17', '2018-03-22 01:41:44'),
(143, 'Caja Chica', '761600.0000', NULL, 'DEBE', '2018-03-03 04:30:00', '-5600000.0000', 'Reembolso por eliminación de compra bajo factura: 6 de fecha 2018-03-03', 0, '2018-03-22 01:23:24', '2018-03-22 01:41:44'),
(144, 'Caja Chica', NULL, NULL, 'HABER', '2018-03-04 04:30:00', '-5600000.0000', 'Inicio de caja', 0, '2018-03-22 01:41:44', '2018-03-22 02:01:40'),
(145, 'De Venezuela', NULL, NULL, 'HABER', '2018-03-04 04:30:00', '1320800.0000', 'Inicio de caja', 0, '2018-03-22 01:41:44', '2018-03-22 02:01:41'),
(146, 'Venezolano de Crédito', NULL, NULL, 'HABER', '2018-03-04 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-22 01:41:44', '2018-03-22 02:01:41'),
(147, 'Bicentenario', NULL, NULL, 'HABER', '2018-03-04 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-22 01:41:44', '2018-03-22 02:01:41'),
(148, 'Banesco', NULL, NULL, 'HABER', '2018-03-04 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-22 01:41:44', '2018-03-22 02:01:42'),
(149, 'Caja Chica', '5040000.0000', 15, 'HABER', '2018-03-04 04:30:00', '-10640000.0000', 'Compra', 0, '2018-03-22 01:42:35', '2018-03-22 02:01:40'),
(150, 'Caja Chica', '5040000.0000', NULL, 'DEBE', '2018-03-04 04:30:00', '-5600000.0000', 'Reembolso por eliminación de compra bajo factura: 6 de fecha 2018-03-04', 0, '2018-03-22 01:58:09', '2018-03-22 02:01:40'),
(151, 'Caja Chica', NULL, NULL, 'HABER', '2018-03-05 04:30:00', '-5600000.0000', 'Inicio de caja', 0, '2018-03-22 02:01:40', '2018-03-22 02:02:51'),
(152, 'De Venezuela', NULL, NULL, 'HABER', '2018-03-05 04:30:00', '1320800.0000', 'Inicio de caja', 0, '2018-03-22 02:01:41', '2018-03-22 02:02:51'),
(153, 'Venezolano de Crédito', NULL, NULL, 'HABER', '2018-03-05 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-22 02:01:41', '2018-03-22 02:02:51'),
(154, 'Bicentenario', NULL, NULL, 'HABER', '2018-03-05 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-22 02:01:41', '2018-03-22 02:02:51'),
(155, 'Banesco', NULL, NULL, 'HABER', '2018-03-05 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-22 02:01:42', '2018-03-22 02:02:51'),
(156, 'Caja Chica', '1904000.0000', 16, 'HABER', '2018-03-05 04:30:00', '-7504000.0000', 'Compra', 0, '2018-03-22 02:02:12', '2018-03-22 02:02:51'),
(157, 'Caja Chica', NULL, NULL, 'HABER', '2018-03-06 04:30:00', '-7504000.0000', 'Inicio de caja', 0, '2018-03-22 02:02:51', '2018-03-22 04:25:01'),
(158, 'De Venezuela', NULL, NULL, 'HABER', '2018-03-06 04:30:00', '1320800.0000', 'Inicio de caja', 0, '2018-03-22 02:02:51', '2018-03-22 04:25:01'),
(159, 'Venezolano de Crédito', NULL, NULL, 'HABER', '2018-03-06 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-22 02:02:51', '2018-03-22 04:25:01'),
(160, 'Bicentenario', NULL, NULL, 'HABER', '2018-03-06 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-22 02:02:51', '2018-03-22 04:25:02'),
(161, 'Banesco', NULL, NULL, 'HABER', '2018-03-06 04:30:00', '0.0000', 'Inicio de caja', 0, '2018-03-22 02:02:51', '2018-03-22 04:25:02'),
(162, 'Caja Chica', '7123200.0000', 17, 'HABER', '2018-03-06 04:30:00', '-13119710.1000', 'Compra', 0, '2018-03-22 02:12:17', '2018-03-22 04:25:01'),
(163, 'Caja Chica', '1014187.5100', NULL, 'DEBE', '2018-03-06 04:30:00', '-62489812.4900', 'Venta', 0, '2018-03-22 02:19:07', '2018-03-22 04:25:01'),
(164, 'Caja Chica', '56000000.0000', NULL, 'DEBE', '2018-03-06 04:30:00', '-6489812.4900', 'Reembolso por eliminación de compra bajo factura: 7 de fecha 2018-03-06', 0, '2018-03-22 02:19:25', '2018-03-22 04:25:01'),
(165, 'Caja Chica', '1176000.0000', 18, 'HABER', '2018-03-06 04:30:00', '-7665812.4900', 'Compra', 0, '2018-03-22 02:43:23', '2018-03-22 04:25:01'),
(166, 'Caja Chica', '1669302.3900', NULL, 'DEBE', '2018-03-06 04:30:00', '-5996510.1000', 'Venta', 0, '2018-03-22 02:46:08', '2018-03-22 04:25:01'),
(168, 'Caja Chica', NULL, NULL, 'HABER', '2018-03-07 04:30:00', '-5996510.1000', 'Inicio de caja', 1, '2018-03-22 04:25:01', '2018-03-22 04:25:01'),
(169, 'De Venezuela', NULL, NULL, 'HABER', '2018-03-07 04:30:00', '1320800.0000', 'Inicio de caja', 1, '2018-03-22 04:25:01', '2018-03-22 04:25:01'),
(170, 'Venezolano de Crédito', NULL, NULL, 'HABER', '2018-03-07 04:30:00', '0.0000', 'Inicio de caja', 1, '2018-03-22 04:25:01', '2018-03-22 04:25:01'),
(171, 'Bicentenario', NULL, NULL, 'HABER', '2018-03-07 04:30:00', '0.0000', 'Inicio de caja', 1, '2018-03-22 04:25:02', '2018-03-22 04:25:02'),
(172, 'Banesco', NULL, NULL, 'HABER', '2018-03-07 04:30:00', '0.0000', 'Inicio de caja', 1, '2018-03-22 04:25:02', '2018-03-22 04:25:02'),
(173, 'Caja Chica', '2520000.0000', 20, 'HABER', '2018-03-07 04:30:00', '-8516510.1000', 'Compra', 1, '2018-03-22 04:25:32', '2018-03-22 04:25:51'),
(174, 'Caja Chica', '1896268.8600', NULL, 'DEBE', '2018-03-07 04:30:00', '-6620241.2400', 'Venta', 1, '2018-03-22 04:26:29', '2018-03-22 04:26:29');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cardexmp`
--

INSERT INTO `cardexmp` (`id`, `mp_codigo`, `comp_doc`, `car_costo`, `car_valor_anterior`, `car_valor_actual`, `car_alicuota`, `car_iva`, `car_compra_id`, `car_concepto`, `car_fecha`, `created_at`, `updated_at`) VALUES
(11, 'MI00000', '1', '34000.0000', '0.0000', '1.0000', '12%', '4080.0000', 8, NULL, NULL, '2018-03-21 07:44:29', '2018-03-21 07:44:29'),
(12, 'MI00001', '2', '550000.0000', '0.0000', '2.0000', '12%', '132000.0000', 9, NULL, NULL, '2018-03-21 07:44:59', '2018-03-21 07:44:59'),
(13, 'MP00011', NULL, '0.0000', '100.0000', '50.0000', '', '0.0000', NULL, 'Producción de MEDIAS GUAYABAS', '2018-03-01', '2018-03-21 08:20:18', '2018-03-21 08:20:18'),
(14, 'MP00011', '3', '50000.0000', '50.0000', '150.0000', '12%', '600000.0000', 11, NULL, NULL, '2018-03-21 08:35:59', '2018-03-21 08:35:59'),
(15, 'MP00011', NULL, '0.0000', '150.0000', '100.0000', '', '0.0000', NULL, 'Producción de MEDIAS GUAYABAS', '2018-03-02', '2018-03-21 08:36:31', '2018-03-21 08:36:31'),
(16, 'MI00006', '4', '13600.0000', '0.0000', '50.0000', '12%', '81600.0000', 12, NULL, NULL, '2018-03-21 08:38:11', '2018-03-21 08:38:11'),
(17, 'MI00006', NULL, '0.0000', '50.0000', '20.0000', '', '0.0000', NULL, 'Producción de CASCOS DE GUAYABA (FRASCO 515G)', '2018-03-02', '2018-03-21 08:38:30', '2018-03-21 08:38:30'),
(18, 'MI00028', '5', '2000.0000', '0.0000', '80.0000', '12%', '19200.0000', 13, NULL, NULL, '2018-03-21 08:39:15', '2018-03-21 08:39:15'),
(19, 'MI00028', NULL, '0.0000', '80.0000', '32.0000', '', '0.0000', NULL, 'Producción de CASCOS DE GUAYABA (FRASCO 515G X 12)', '2018-03-02', '2018-03-21 08:40:53', '2018-03-21 08:40:53'),
(20, 'MI00006', '6', '13600.0000', '20.0000', '70.0000', '12%', '81600.0000', 14, NULL, NULL, '2018-03-22 01:19:27', '2018-03-22 01:19:27'),
(21, 'MP00000', '6', '45000.0000', '0.0000', '100.0000', '12%', '540000.0000', 15, NULL, NULL, '2018-03-22 01:42:50', '2018-03-22 01:42:50'),
(22, 'MI00000', '6', '34000.0000', '1.0000', '51.0000', '12%', '204000.0000', 16, NULL, NULL, '2018-03-22 02:02:20', '2018-03-22 02:02:20'),
(23, 'MI00026', '7', '1000000.0000', '0.0000', '50.0000', '12%', '6000000.0000', 17, NULL, NULL, '2018-03-22 02:12:25', '2018-03-22 02:12:25'),
(24, 'MI00007', '8', '500.0000', '0.0000', '100.0000', '12%', '6000.0000', 18, NULL, NULL, '2018-03-22 02:43:39', '2018-03-22 02:43:39'),
(25, 'MI00027', '8', '10000.0000', '0.0000', '100.0000', '12%', '120000.0000', 18, NULL, NULL, '2018-03-22 02:43:39', '2018-03-22 02:43:39'),
(26, 'MI00007', NULL, '0.0000', '100.0000', '50.0000', '', '0.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2018-03-06', '2018-03-22 02:44:39', '2018-03-22 02:44:39'),
(27, 'MI00027', NULL, '0.0000', '100.0000', '50.0000', '', '0.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2018-03-06', '2018-03-22 02:44:39', '2018-03-22 02:44:39'),
(28, 'MP00011', '7', '50000.0000', '100.0000', '200.0000', '12%', '600000.0000', 17, NULL, NULL, '2018-03-22 03:33:29', '2018-03-22 03:33:29'),
(29, 'MI00006', '7', '13600.0000', '20.0000', '120.0000', '12%', '163200.0000', 17, NULL, NULL, '2018-03-22 03:33:29', '2018-03-22 03:33:29'),
(30, 'MP00011', NULL, '0.0000', '200.0000', '150.0000', '', '0.0000', NULL, 'Producción de MEDIAS GUAYABAS', '2018-03-06', '2018-03-22 03:34:29', '2018-03-22 03:34:29'),
(31, 'MI00006', NULL, '0.0000', '120.0000', '70.0000', '', '0.0000', NULL, 'Producción de CASCOS DE GUAYABA (FRASCO 515G)', '2018-03-06', '2018-03-22 03:34:55', '2018-03-22 03:34:55'),
(32, 'MI00028', NULL, '0.0000', '32.0000', '22.0000', '', '0.0000', NULL, 'Producción de CASCOS DE GUAYABA (FRASCO 515G X 12)', '2018-03-06', '2018-03-22 03:37:33', '2018-03-22 03:37:33'),
(33, 'MP00000', '9', '45000.0000', '0.0000', '50.0000', '12%', '270000.0000', 20, NULL, NULL, '2018-03-22 04:25:51', '2018-03-22 04:25:51');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `cli_codigo`, `cli_nombre`, `cli_rif`, `cli_direccion`, `cli_contacto`, `cli_condiciones`, `cli_saldo`, `created_at`, `updated_at`) VALUES
(1, 'CLIENTE1', 'cliente 1', 'J3782462374', 'askjdhsakd', 'dajkshdjas asudhsaudh ', 'sdjjkhfjksd', '2568224.5100', '2018-01-11 20:34:13', '2018-03-22 02:58:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `comp_doc`, `comp_proveedor`, `comp_fecha`, `comp_monto`, `comp_cred_cont`, `comp_entidad`, `comp_activo`, `created_at`, `updated_at`) VALUES
(8, '1', 'P00000', '2018-03-01 04:30:00', '38080.0000', 'contado', 'Caja Chica', 1, '2018-03-21 07:44:23', '2018-03-21 07:44:28'),
(9, '2', 'P00002', '2018-03-01 04:30:00', '1232000.0000', 'contado', 'Caja Chica', 1, '2018-03-21 07:44:53', '2018-03-21 07:44:59'),
(11, '3', 'PROV01', '2018-03-02 04:30:00', '5600000.0000', 'contado', 'Caja Chica', 1, '2018-03-21 08:35:35', '2018-03-21 08:35:59'),
(12, '4', 'pepe', '2018-03-02 04:30:00', '761600.0000', 'credito', 'Compra a Crédito', 1, '2018-03-21 08:37:58', '2018-03-21 08:38:10'),
(13, '5', 'PROV5', '2018-03-02 04:30:00', '179200.0000', 'contado', 'De Venezuela', 1, '2018-03-21 08:39:01', '2018-03-21 08:39:14'),
(14, '6', 'P00000', '2018-03-03 04:30:00', '761600.0000', 'contado', 'Caja Chica', 0, '2018-03-22 01:19:17', '2018-03-22 01:23:24'),
(15, '6', 'PROV2', '2018-03-04 04:30:00', '5040000.0000', 'contado', 'Caja Chica', 0, '2018-03-22 01:42:34', '2018-03-22 01:58:09'),
(16, '6', 'P03', '2018-03-05 04:30:00', '1904000.0000', 'contado', 'Caja Chica', 1, '2018-03-22 02:02:12', '2018-03-22 02:02:20'),
(17, '7', 'PROV5', '2018-03-06 04:30:00', '7123200.0000', 'contado', 'Caja Chica', 0, '2018-03-22 02:12:17', '2018-03-22 03:33:29'),
(18, '8', 'P00000', '2018-03-06 04:30:00', '1176000.0000', 'contado', 'Caja Chica', 1, '2018-03-22 02:43:23', '2018-03-22 02:43:39'),
(20, '9', 'p', '2018-03-07 04:30:00', '2520000.0000', 'contado', 'Caja Chica', 1, '2018-03-22 04:25:31', '2018-03-22 04:25:51');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentasxcobrar`
--

INSERT INTO `cuentasxcobrar` (`id`, `cta_cli_codigo`, `cta_monto`, `cta_concepto`, `cta_venta_id`, `cta_pagada`, `created_at`, `updated_at`) VALUES
(1, 'CLIENTE1', '2568224.5100', 'Venta de factura 3 de fecha 2018-03-06', 3, NULL, '2018-03-22 02:58:21', '2018-03-22 02:58:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentasxpagar`
--

INSERT INTO `cuentasxpagar` (`id`, `cta_prov_codigo`, `cta_monto`, `cta_concepto`, `cta_compra_id`, `cta_pagada`, `created_at`, `updated_at`) VALUES
(3, 'pepe', '761600.0000', 'Compra a crédito bajo factura: 4 de fecha 2018-03-02', 12, NULL, '2018-03-21 08:37:59', '2018-03-21 08:38:11');

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
(3, 'CASCOS DE GUAYABA (FRASCO 515G)', 'MEDIAS GUAYABAS', 7, 100, '2018-03-21 08:37:12', '2018-03-22 03:34:54'),
(4, 'CASCOS DE GUAYABA (FRASCO 515G X 12)', 'CASCOS DE GUAYABA (FRASCO 515G)', 15, 48, '2018-03-21 08:38:40', '2018-03-22 03:37:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(68, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '2018-01-11 20:37:36', '2018-01-11 20:37:36'),
(69, 'MEDIAS GUAYABAS', 'GUAYABA', '2018-03-21 15:00:30', '2018-03-21 15:00:30'),
(70, 'CASCOS DE GUAYABA (FRASCO 515G)', 'AZÚCAR', '2018-03-21 15:03:45', '2018-03-21 15:03:45'),
(71, 'CASCOS DE GUAYABA (FRASCO 515G X 12)', 'Etiqueta Casco de Guayaba (515G)', '2018-03-21 15:12:49', '2018-03-21 15:12:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiasprimas`
--

CREATE TABLE IF NOT EXISTS `materiasprimas` (
`id` int(10) unsigned NOT NULL,
  `mp_codigo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mp_cantidad` decimal(25,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiasprimas`
--

INSERT INTO `materiasprimas` (`id`, `mp_codigo`, `mp_cantidad`, `created_at`, `updated_at`) VALUES
(10, 'MI00000', '51.00', '2018-03-21 07:44:29', '2018-03-22 02:02:20'),
(11, 'MI00001', '2.00', '2018-03-21 07:44:59', '2018-03-21 07:44:59'),
(12, 'MP00011', '150.00', '2018-03-21 08:20:00', '2018-03-22 03:34:30'),
(13, 'MI00006', '70.00', '2018-03-21 08:38:11', '2018-03-22 03:34:55'),
(14, 'MI00028', '22.00', '2018-03-21 08:39:15', '2018-03-22 03:37:33'),
(15, 'MP00000', '50.00', '2018-03-22 01:42:50', '2018-03-22 04:25:51'),
(16, 'MI00026', '0.00', '2018-03-22 02:12:25', '2018-03-22 02:19:25'),
(17, 'MI00007', '50.00', '2018-03-22 02:43:39', '2018-03-22 02:44:39'),
(18, 'MI00027', '50.00', '2018-03-22 02:43:39', '2018-03-22 02:44:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `par_codigo`, `par_nombre`, `par_unidad`, `par_costo`, `par_observacion`, `par_cost_updated`, `par_default`, `par_ratio`, `created_at`, `updated_at`) VALUES
(98, 'MI00000', 'ACEITE', 'LITRO', '34000.0000', 'ACTUALIZADO AL 02/11/2017', '2018-01-11 22:15:23', 0, NULL, '2017-12-03 02:17:39', '2018-01-11 22:15:23'),
(99, 'MI00001', 'ACEITUNAS', 'KILO', '550000.0000', 'ACTUALIZADO AL 30/11/2017 ESPECULATIVO', '2018-02-23 15:16:14', 0, 0, '2017-12-03 02:19:23', '2018-02-23 15:16:14'),
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
(140, 'MI00027', 'PLASTICO TERMOENCOJIBLE', 'GRAMOS', '10000.0000', '', NULL, 0, 0, '2018-01-11 20:37:19', '2018-01-11 20:37:19'),
(141, 'MP00004', 'Durazno', 'Kilo', '50000.0000', '', NULL, 0, NULL, '2018-02-12 20:59:40', '2018-02-12 20:59:40'),
(142, 'MP00011', 'GUAYABA', 'KILO', '50000.0000', '', NULL, 0, NULL, '2018-02-27 17:27:41', '2018-02-27 17:27:41'),
(143, 'MP00012', 'MITADES DE GUAYABA', 'KG', '1000.0000', 'PRODUCTO INTERMEDIO A', NULL, 0, 0, '2018-03-07 21:11:20', '2018-03-07 21:11:20'),
(144, 'MI00028', 'Etiqueta Casco de Guayaba (515G)', 'Unidad', '2000.0000', '', NULL, 1, 12, '2018-03-21 15:12:35', '2018-03-21 15:12:35');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id`, `pro_fecha`, `rec_nombre`, `pro_etapa`, `pro_produccion`, `pro_costo`, `pro_mano_obra`, `pro_lote`, `pro_concepto`, `created_at`, `updated_at`) VALUES
(6, '2018-03-01', 'MEDIAS GUAYABAS', 'PA', 100, '25599.2400', '2.5000', NULL, 'Producción de MEDIAS GUAYABAS', '2018-03-21 08:20:17', '2018-03-22 01:16:53'),
(7, '2018-03-02', 'MEDIAS GUAYABAS', 'PA', 100, '25599.2400', '2.5000', NULL, 'Producción de MEDIAS GUAYABAS', '2018-03-21 08:36:30', '2018-03-21 08:54:05'),
(8, '2018-03-02', 'MEDIAS GUAYABAS', 'PA', 50, '25599.2400', '2.5000', NULL, 'Producción de CASCOS DE GUAYABA (FRASCO 515G)', '2018-03-21 08:38:30', '2018-03-21 08:54:05'),
(9, '2018-03-02', 'CASCOS DE GUAYABA (FRASCO 515G)', 'PB', 50, '60398.3100', '2.5000', 1, 'Producción de CASCOS DE GUAYABA (FRASCO 515G)', '2018-03-21 08:38:30', '2018-03-22 03:37:03'),
(10, '2018-03-02', 'CASCOS DE GUAYABA (FRASCO 515G)', 'PB', 48, '60398.3100', '2.5000', NULL, 'Producción de CASCOS DE GUAYABA (FRASCO 515G X 12)', '2018-03-21 08:40:53', '2018-03-22 03:37:03'),
(11, '2018-03-02', 'CASCOS DE GUAYABA (FRASCO 515G X 12)', 'PC', 4, '452762.2800', '2.5000', NULL, 'Producción de CASCOS DE GUAYABA (FRASCO 515G X 12)', '2018-03-21 08:40:53', '2018-03-22 01:17:03'),
(12, '2018-03-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 100, '5849.2400', '2.5000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2018-03-22 02:44:39', '2018-03-22 02:44:40'),
(13, '2018-03-06', 'MEDIAS GUAYABAS', 'PA', 100, '25599.2400', '2.5000', NULL, 'Producción de MEDIAS GUAYABAS', '2018-03-22 03:34:29', '2018-03-22 03:34:30'),
(14, '2018-03-06', 'MEDIAS GUAYABAS', 'PA', 100, NULL, '2.5000', NULL, 'Producción de CASCOS DE GUAYABA (FRASCO 515G)', '2018-03-22 03:34:54', '2018-03-22 03:34:54'),
(15, '2018-03-06', 'CASCOS DE GUAYABA (FRASCO 515G)', 'PB', 100, '32998.4800', '2.5000', 2, 'Producción de CASCOS DE GUAYABA (FRASCO 515G)', '2018-03-22 03:34:55', '2018-03-22 03:34:55'),
(16, '2018-03-06', 'CASCOS DE GUAYABA (FRASCO 515G)', 'PB', 48, NULL, '2.5000', NULL, 'Producción de CASCOS DE GUAYABA (FRASCO 515G X 12)', '2018-03-22 03:37:33', '2018-03-22 03:37:33'),
(17, '2018-03-06', 'CASCOS DE GUAYABA (FRASCO 515G X 12)', 'PC', 100, '16638.5100', '2.5000', NULL, 'Producción de CASCOS DE GUAYABA (FRASCO 515G X 12)', '2018-03-22 03:37:33', '2018-03-22 03:37:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producciona`
--

CREATE TABLE IF NOT EXISTS `producciona` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` decimal(25,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producciona`
--

INSERT INTO `producciona` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(2, 'MEDIAS GUAYABAS', '150.00', '2018-03-21 08:20:17', '2018-03-22 03:34:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccionb`
--

CREATE TABLE IF NOT EXISTS `produccionb` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` decimal(25,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccionb`
--

INSERT INTO `produccionb` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(2, 'CASCOS DE GUAYABA (FRASCO 515G)', '54.00', '2018-03-21 08:38:30', '2018-03-22 03:37:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccionc`
--

CREATE TABLE IF NOT EXISTS `produccionc` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` decimal(25,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccionc`
--

INSERT INTO `produccionc` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(2, 'CASCOS DE GUAYABA (FRASCO 515G X 12)', '5.00', '2018-03-21 08:40:53', '2018-03-22 04:26:28'),
(3, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '0.00', '2018-03-22 02:44:39', '2018-03-22 04:26:29');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `prov_codigo`, `prov_nombre`, `prov_rif`, `prov_direccion`, `prov_contacto`, `prov_condiciones`, `prov_retencion`, `prov_saldo`, `prov_cred_o_cont`, `created_at`, `updated_at`) VALUES
(2, 'PROV01', 'Proveedor', 'J287327', 'ashda', 'sajhda', 'asjdhas', 1, '0.0000', 'credito', '2017-12-04 22:57:53', '2018-03-21 15:49:41'),
(3, 'PROV1', 'ahdgasyh', 'jhsdhjas', 'hsgdha', 'hasgdhasg', 'ahsdgas', 0, '0.0000', 'contado', '2017-12-12 19:14:19', '2018-02-23 18:15:38'),
(4, 'PROV5', 'proveedor cinco', 'j-23345567-2', 'la calle', 'ramón', '15 dias', 0, '0.0000', 'contado', '2017-12-24 18:40:01', '2018-03-21 15:50:18'),
(5, 'p', 'pablo iglesia', 'j-33333333-3', 'san pablo', 'pablo', 'ninguna', 1, '0.0000', 'contado', '2017-12-30 18:26:26', '2017-12-30 18:26:26'),
(6, 'pepe', 'pepe', 'rif de pepe', 'dirección de pepe', 'pepe', 'pepe condithion', 1, '761600.0000', 'credito', '2018-01-11 20:08:54', '2018-03-21 08:38:11'),
(7, 'GATO', 'GATO', 'RIF GATO', 'DIRECCION GATO', 'SR GATO', '123', 1, '0.0000', 'credito', '2018-01-11 23:11:57', '2018-01-11 23:19:26'),
(8, 'PROV2', 'JACINTO NONA BLANCA ', 'J-12121212-5', 'EJIDO', 'PANCHO ', 'ATIENDE LOS SABADOS A LA UNA', 0, '0.0000', 'credito', '2018-02-22 20:43:33', '2018-02-22 20:43:33'),
(9, 'P03', 'NURARTE DE LISETH EPINOZA SALAS', 'V-162013480', 'AV LAS AMÉRICAS, EDF. MERCADO PRINCIPAL. PISO 1, LOCAL 86', 'XXXX ', 'XXXX ', 0, '0.0000', 'contado', '2018-02-23 16:03:02', '2018-02-23 16:03:02'),
(10, 'P00000', 'JESÚS PÉREZ', 'V-130012145545545644564', 'MERIDA', 'X', 'X', 0, '0.0000', 'credito', '2018-02-27 17:24:28', '2018-03-06 17:49:42'),
(11, 'P00001', 'CENTRAL AZUCARERO LA PASTORA', 'J-12345678-3', 'TRUJILLO SECTOR AGUA VIVA, EN EL KILÓMETRO 50. MAS ALLÁ DEL PUESTO DE VIGILANCIA DE LA GUARDIA NACIONAL BOLIVARIANA DE VENEZUELA CHAVEZ VIVE Y LA PATRIA SIGUE', 'X', 'X', 0, '0.0000', 'credito', '2018-02-27 17:42:14', '2018-03-07 19:48:41'),
(12, 'P00002', 'proveedor de prueba 1', 'J82734673', 'esta es una direccion de prueba', '37842834638', '', 0, '0.0000', 'credito', '2018-03-19 18:55:33', '2018-03-19 18:55:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `rec_nombre`, `rec_activo`, `rec_proc`, `rec_unidad`, `created_at`, `updated_at`) VALUES
(8, 'PICADO BLANDO ANTIPASTO (kilo)', 'si', 'PA', 'KILO', '2017-12-28 20:01:26', '2018-01-11 21:14:24'),
(9, 'PICADO DURO ANTIPASTO (kilo)', 'si', 'PA', 'KILO', '2017-12-28 22:42:44', '2018-01-11 21:14:32'),
(10, 'ANTIPASTO ATÚN (FRASCO 470G)', 'si', 'PB', 'FRASCO 470G', '2017-12-28 22:47:09', '2018-01-11 21:14:52'),
(11, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'si', 'PC', 'CAJA X 12', '2018-01-11 20:35:54', '2018-01-11 20:35:54'),
(12, 'MEDIAS GUAYABAS', 'si', 'PA', 'KILO', '2018-03-21 15:00:19', '2018-03-21 15:00:19'),
(13, 'CASCOS DE GUAYABA (FRASCO 515G)', 'si', 'PB', 'KILO', '2018-03-21 15:01:35', '2018-03-21 15:03:20'),
(14, 'CASCOS DE GUAYABA (FRASCO 515G X 12)', 'si', 'PC', 'UNIDAD', '2018-03-21 15:05:19', '2018-03-21 15:05:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requerimientos`
--

INSERT INTO `requerimientos` (`id`, `req_fecha`, `rec_nombre`, `req_ingrediente`, `req_total`, `req_default`, `req_ratio`, `created_at`, `updated_at`) VALUES
(4, '2018-03-01', 'MEDIAS GUAYABAS', 'GUAYABA', '50.0000', 0, NULL, '2018-03-21 08:19:36', '2018-03-21 08:20:17'),
(5, '2018-03-02', 'MEDIAS GUAYABAS', 'GUAYABA', '50.0000', 0, NULL, '2018-03-21 08:36:21', '2018-03-21 08:36:30'),
(6, '2018-03-02', 'CASCOS DE GUAYABA (FRASCO 515G)', 'AZÚCAR', '30.0000', 0, NULL, '2018-03-21 08:36:57', '2018-03-21 08:38:30'),
(7, '2018-03-02', 'CASCOS DE GUAYABA (FRASCO 515G X 12)', 'Etiqueta Casco de Guayaba (515G)', '48.0000', 1, 12, '2018-03-21 08:40:09', '2018-03-21 08:40:53'),
(8, '2018-03-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '50.0000', 0, NULL, '2018-03-22 02:44:34', '2018-03-22 02:44:39'),
(9, '2018-03-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '50.0000', 0, 0, '2018-03-22 02:44:34', '2018-03-22 02:44:39'),
(10, '2018-03-06', 'MEDIAS GUAYABAS', 'GUAYABA', '50.0000', 0, NULL, '2018-03-22 03:34:25', '2018-03-22 03:34:29'),
(11, '2018-03-06', 'CASCOS DE GUAYABA (FRASCO 515G)', 'AZÚCAR', '50.0000', 0, NULL, '2018-03-22 03:34:37', '2018-03-22 03:34:55'),
(12, '2018-03-06', 'CASCOS DE GUAYABA (FRASCO 515G X 12)', 'Etiqueta Casco de Guayaba (515G)', '10.0000', 1, 12, '2018-03-22 03:37:30', '2018-03-22 03:37:33');

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
(1, '4251.4000', 300, 21, '17623.6700', NULL, '2018-02-16 14:57:58');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `saldocaja`
--

INSERT INTO `saldocaja` (`id`, `sc_entidad`, `sc_saldo`, `sc_fecha`, `created_at`, `updated_at`) VALUES
(1, 'Caja Chica', '-2770080.0000', '2018-03-01 04:30:00', '2018-03-21 07:48:09', '2018-03-21 07:48:09'),
(2, 'De Venezuela', '1500000.0000', '2018-03-01 04:30:00', '2018-03-21 07:48:09', '2018-03-21 07:48:09'),
(3, 'Venezolano de Crédito', '0.0000', '2018-03-01 04:30:00', '2018-03-21 07:48:09', '2018-03-21 07:48:09'),
(4, 'Bicentenario', '0.0000', '2018-03-01 04:30:00', '2018-03-21 07:48:09', '2018-03-21 07:48:09'),
(5, 'Banesco', '0.0000', '2018-03-01 04:30:00', '2018-03-21 07:48:10', '2018-03-21 07:48:10'),
(6, 'Caja Chica', '-5600000.0000', '2018-03-02 04:30:00', '2018-03-22 01:18:34', '2018-03-22 01:18:34'),
(7, 'De Venezuela', '1320800.0000', '2018-03-02 04:30:00', '2018-03-22 01:18:34', '2018-03-22 01:18:34'),
(8, 'Venezolano de Crédito', '0.0000', '2018-03-02 04:30:00', '2018-03-22 01:18:34', '2018-03-22 01:18:34'),
(9, 'Bicentenario', '0.0000', '2018-03-02 04:30:00', '2018-03-22 01:18:34', '2018-03-22 01:18:34'),
(10, 'Banesco', '0.0000', '2018-03-02 04:30:00', '2018-03-22 01:18:35', '2018-03-22 01:18:35'),
(11, 'Caja Chica', '-5600000.0000', '2018-03-03 04:30:00', '2018-03-22 01:41:44', '2018-03-22 01:41:44'),
(12, 'De Venezuela', '1320800.0000', '2018-03-03 04:30:00', '2018-03-22 01:41:44', '2018-03-22 01:41:44'),
(13, 'Venezolano de Crédito', '0.0000', '2018-03-03 04:30:00', '2018-03-22 01:41:44', '2018-03-22 01:41:44'),
(14, 'Bicentenario', '0.0000', '2018-03-03 04:30:00', '2018-03-22 01:41:44', '2018-03-22 01:41:44'),
(15, 'Banesco', '0.0000', '2018-03-03 04:30:00', '2018-03-22 01:41:44', '2018-03-22 01:41:44'),
(16, 'Caja Chica', '-5600000.0000', '2018-03-04 04:30:00', '2018-03-22 02:01:40', '2018-03-22 02:01:40'),
(17, 'De Venezuela', '1320800.0000', '2018-03-04 04:30:00', '2018-03-22 02:01:41', '2018-03-22 02:01:41'),
(18, 'Venezolano de Crédito', '0.0000', '2018-03-04 04:30:00', '2018-03-22 02:01:41', '2018-03-22 02:01:41'),
(19, 'Bicentenario', '0.0000', '2018-03-04 04:30:00', '2018-03-22 02:01:41', '2018-03-22 02:01:41'),
(20, 'Banesco', '0.0000', '2018-03-04 04:30:00', '2018-03-22 02:01:42', '2018-03-22 02:01:42'),
(21, 'Caja Chica', '-7504000.0000', '2018-03-05 04:30:00', '2018-03-22 02:02:51', '2018-03-22 02:02:51'),
(22, 'De Venezuela', '1320800.0000', '2018-03-05 04:30:00', '2018-03-22 02:02:51', '2018-03-22 02:02:51'),
(23, 'Venezolano de Crédito', '0.0000', '2018-03-05 04:30:00', '2018-03-22 02:02:51', '2018-03-22 02:02:51'),
(24, 'Bicentenario', '0.0000', '2018-03-05 04:30:00', '2018-03-22 02:02:51', '2018-03-22 02:02:51'),
(25, 'Banesco', '0.0000', '2018-03-05 04:30:00', '2018-03-22 02:02:51', '2018-03-22 02:02:51'),
(26, 'Caja Chica', '-5996510.1000', '2018-03-06 04:30:00', '2018-03-22 04:25:01', '2018-03-22 04:25:01'),
(27, 'De Venezuela', '1320800.0000', '2018-03-06 04:30:00', '2018-03-22 04:25:01', '2018-03-22 04:25:01'),
(28, 'Venezolano de Crédito', '0.0000', '2018-03-06 04:30:00', '2018-03-22 04:25:01', '2018-03-22 04:25:01'),
(29, 'Bicentenario', '0.0000', '2018-03-06 04:30:00', '2018-03-22 04:25:02', '2018-03-22 04:25:02'),
(30, 'Banesco', '0.0000', '2018-03-06 04:30:00', '2018-03-22 04:25:02', '2018-03-22 04:25:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `totalesventas`
--

INSERT INTO `totalesventas` (`id`, `ven_factura`, `ven_total`, `ven_iva`, `created_at`, `updated_at`) VALUES
(1, '1', '1014187.5100', 12, '2018-03-22 02:19:07', '2018-03-22 02:19:07'),
(2, '2', '1669302.3900', 12, '2018-03-22 02:46:08', '2018-03-22 02:46:08'),
(3, '3', '2568224.5100', 12, '2018-03-22 02:58:21', '2018-03-22 02:58:21'),
(4, '4', '1896268.8600', 12, '2018-03-22 04:26:29', '2018-03-22 04:26:29');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `privilegio`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Andres Vega', 'andres_vega93@hotmail.com', '$2y$10$kWHth3fkZm66MPt5SDCbpeG2ir569rgLsBOfbjzb0kKN9HBaTv8vm', 'admin', 'aOjYBmy5KoXiS440YaAL8Z9mXsXGk7ICnZ0zUEhhK7UinuO38aUPM7dDrAQ4', '2017-10-11 10:32:19', '2018-03-21 14:32:21'),
(7, 'Carlos', 'carlosteno@gmail.com', '$2y$10$9uwn8GSSYhLxzaSZnhawBu8f0sqBvgRRYHu8yQpI7/pILxLjx.WVK', 'admin', 'CAA2xM1nHdP5GgKz4JiaXQFi9wc0Xl0tHRKymn0uoBa0FdrqkPtzzqfYRFQq', '2017-10-14 15:48:38', '2018-03-20 16:27:56'),
(8, 'clarisa', 'clari98@hotmail.com', '$2y$10$3PdMuwN1QX5OiLW0jhYWWu/PGegeRyRjoaJUPHPq2Y1q6xAAB4mE6', 'tipo1', 'sk09HQ3E7rCTz9jBNE068u81GIOfXFJJM4UxIQJa4uo7vIKsO1ys2Ld7EX6l', '2017-12-24 18:33:40', '2018-02-16 17:08:22'),
(9, 'Angélica', 'gavcamerida@gmail.com', '$2y$10$nmvuxdHxxHFRl2pckMARHeQJJ9sjxEV8kg1hLVfJoKvy1NWAbPYMu', 'tipo1', 'o69XroeYtom8DvD54c5Wit2nA2GfEt8o7pQIonGiwuABmBeKXougswzB8Rg4', '2018-02-07 19:21:08', '2018-02-23 16:17:11'),
(10, 'VISITANTE', 'A@A', '$2y$10$Nd2gLF6jGBzBePDsYO.LUOklE3etCh3VUMIiPnddzk0oEjGAryg4y', 'tipo2', 'jhccejl00XpEAFcAlwkqencXKy2rMHOvewAYnwQfERgWFx6QAzwO19ecXaOi', '2018-02-09 16:09:14', '2018-02-17 16:23:39');

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
  `ven_activo` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `cli_codigo`, `ven_fecha`, `ven_factura`, `ven_condicion`, `ven_entidad`, `rec_nombre`, `ven_costo`, `ven_cantidad`, `ven_activo`, `created_at`, `updated_at`) VALUES
(1, 'CLIENTE1', '2018-03-06', '1', 'contado', 'Caja Chica', 'CASCOS DE GUAYABA (FRASCO 515G X 12)', '452762.2800', 2, 1, '2018-03-22 02:19:06', '2018-03-22 02:19:06'),
(2, 'CLIENTE1', '2018-03-06', '2', 'contado', 'Caja Chica', 'CASCOS DE GUAYABA (FRASCO 515G X 12)', '452762.2800', 2, 1, '2018-03-22 02:46:07', '2018-03-22 02:46:07'),
(3, 'CLIENTE1', '2018-03-06', '2', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '5849.2400', 100, 1, '2018-03-22 02:46:08', '2018-03-22 02:46:08'),
(4, 'CLIENTE1', '2018-03-06', '3', 'credito', 'Caja Chica', 'CASCOS DE GUAYABA (FRASCO 515G X 12)', '452762.2800', 5, 1, '2018-03-22 02:58:21', '2018-03-22 02:58:21'),
(5, 'CLIENTE1', '2018-03-06', '3', 'credito', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '5849.2400', 5, 1, '2018-03-22 02:58:21', '2018-03-22 02:58:21'),
(6, 'CLIENTE1', '2018-03-07', '4', 'contado', 'Caja Chica', 'CASCOS DE GUAYABA (FRASCO 515G X 12)', '16638.5100', 100, 1, '2018-03-22 04:26:28', '2018-03-22 04:26:28'),
(7, 'CLIENTE1', '2018-03-07', '4', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '5849.2400', 5, 1, '2018-03-22 04:26:28', '2018-03-22 04:26:28');

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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=175;
--
-- AUTO_INCREMENT de la tabla `cajachica`
--
ALTER TABLE `cajachica`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `costofijos`
--
ALTER TABLE `costofijos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `cuentasxcobrar`
--
ALTER TABLE `cuentasxcobrar`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cuentasxpagar`
--
ALTER TABLE `cuentasxpagar`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `producciona`
--
ALTER TABLE `producciona`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `produccionb`
--
ALTER TABLE `produccionb`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `produccionc`
--
ALTER TABLE `produccionc`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `salarios`
--
ALTER TABLE `salarios`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `saldocaja`
--
ALTER TABLE `saldocaja`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `totalesventas`
--
ALTER TABLE `totalesventas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
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
