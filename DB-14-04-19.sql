-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2019 a las 02:40:51
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
(268, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-02-14 10:11:39', '2019-02-14 10:28:33'),
(270, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-02-14 10:11:40', '2019-02-14 10:28:33'),
(272, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-02-14 10:11:40', '2019-02-14 10:28:33'),
(274, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-02-14 10:11:40', '2019-02-14 10:28:34'),
(276, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-02-14 10:11:40', '2019-02-14 10:28:34'),
(277, 'Caja Chica', '20000000.0000', NULL, NULL, 'DEBE', '2019-01-01 04:00:00', '20000000.0000', 'Entrada generada: Deposito directo a caja', 0, '2019-02-14 10:17:10', '2019-02-14 10:28:33'),
(278, 'Banco de Venezuela', '100000000.0000', NULL, NULL, 'DEBE', '2019-01-01 04:00:00', '100000000.0000', 'Entrada generada: Crédito a BDV aprobado y debitado', 0, '2019-02-14 10:17:58', '2019-02-14 10:28:33'),
(279, 'Banco de Venezuela', '50000000.0000', NULL, NULL, 'HABER', '2019-01-01 04:00:00', '50000000.0000', 'Transferido hacia Caja Chica, Retiro para el pago de materia prima 01/01/2019', 0, '2019-02-14 10:18:54', '2019-02-14 10:28:33'),
(280, 'Caja Chica', '50000000.0000', NULL, NULL, 'DEBE', '2019-01-01 04:00:00', '70000000.0000', 'Transferido desde Banco de Venezuela, Retiro para el pago de materia prima 01/01/2019', 0, '2019-02-14 10:18:54', '2019-02-14 10:28:33'),
(281, 'Caja Chica', '918400.0000', 58, NULL, 'HABER', '2019-01-01 04:00:00', '69081600.0000', 'Compra', 0, '2019-02-14 10:20:00', '2019-02-14 10:28:33'),
(282, 'Caja Chica', '2755200.0000', 60, NULL, 'HABER', '2019-01-01 04:00:00', '66326400.0000', 'Compra', 0, '2019-02-14 10:24:03', '2019-02-14 10:28:33'),
(283, 'Banco de Venezuela', '918400.0000', NULL, NULL, 'HABER', '2019-01-01 04:00:00', '49081600.0000', 'Pago de deuda de proveedor P00000', 0, '2019-02-14 10:27:34', '2019-02-14 10:28:33'),
(284, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-01 04:00:00', '66326400.0000', 'Cierre de caja', 0, '2019-02-14 10:28:33', '2019-02-14 10:28:33'),
(285, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-02 04:00:00', '66326400.0000', 'Inicio de caja', 0, '2019-02-14 10:28:33', '2019-02-14 15:28:52'),
(286, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-01 04:00:00', '49081600.0000', 'Cierre de caja', 0, '2019-02-14 10:28:33', '2019-02-14 10:28:33'),
(287, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-02 04:00:00', '49081600.0000', 'Inicio de caja', 0, '2019-02-14 10:28:33', '2019-02-14 15:28:52'),
(288, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-01 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-02-14 10:28:33', '2019-02-14 10:28:33'),
(289, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-02 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-02-14 10:28:33', '2019-02-14 15:28:53'),
(290, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-01 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-02-14 10:28:34', '2019-02-14 10:28:34'),
(291, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-02 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-02-14 10:28:34', '2019-02-14 15:28:53'),
(292, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-01 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-02-14 10:28:34', '2019-02-14 10:28:34'),
(293, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-02 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-02-14 10:28:34', '2019-02-14 15:28:53'),
(294, 'Caja Chica', '346640.0000', 61, NULL, 'HABER', '2019-01-02 04:00:00', '65979760.0000', 'Compra', 0, '2019-02-14 10:40:01', '2019-02-14 15:28:52'),
(295, 'Banco de Venezuela', '46246945.9200', 63, NULL, 'HABER', '2019-01-02 04:00:00', '2834654.0800', 'Compra', 0, '2019-02-14 10:51:07', '2019-02-14 15:28:52'),
(296, 'Banco de Venezuela', '2313763.7400', NULL, 1, 'DEBE', '2019-01-02 04:00:00', '5148417.8200', 'Venta', 0, '2019-02-14 11:18:30', '2019-02-14 15:28:52'),
(297, 'Caja Chica', '578440.9300', NULL, 2, 'DEBE', '2019-01-02 04:00:00', '66558200.9300', 'Venta', 0, '2019-02-14 12:42:28', '2019-02-14 15:28:52'),
(298, 'Venezolano de Crédito', '578440.9300', NULL, 3, 'DEBE', '2019-01-02 04:00:00', '578440.9300', 'Venta', 0, '2019-02-14 12:43:06', '2019-02-14 15:28:53'),
(302, 'Venezolano de Crédito', '578440.9300', NULL, NULL, 'HABER', '2019-01-02 04:00:00', '-578440.9300', 'Reembolso por eliminación de venta bajo factura: 3435498484986 de fecha 2019-01-02', 0, '2019-02-14 13:46:50', '2019-02-14 15:28:53'),
(303, 'Venezolano de Crédito', '578440.9300', NULL, NULL, 'HABER', '2019-01-02 04:00:00', '-1156881.8600', 'Reembolso por eliminación de venta bajo factura: 3435498484986 de fecha 2019-01-02', 0, '2019-02-14 13:51:03', '2019-02-14 15:28:53'),
(304, 'Caja Chica', '578440.9300', NULL, 4, 'DEBE', '2019-01-02 04:00:00', '67136641.8600', 'Venta', 0, '2019-02-14 13:54:31', '2019-02-14 15:28:52'),
(305, 'Caja Chica', '578440.9300', NULL, NULL, 'HABER', '2019-01-02 04:00:00', '66558200.9300', 'Reembolso por eliminación de venta bajo factura: 43785634875643 de fecha 2019-01-02', 0, '2019-02-14 13:57:10', '2019-02-14 15:28:52'),
(306, 'Caja Chica', '578440.9300', NULL, 5, 'DEBE', '2019-01-02 04:00:00', '67136641.8600', 'Venta', 0, '2019-02-14 14:40:45', '2019-02-14 15:28:52'),
(307, 'Caja Chica', '578440.9300', NULL, NULL, 'HABER', '2019-01-02 04:00:00', '66558200.9300', 'Reembolso por eliminación de venta bajo factura: 5468464656513 de fecha 2019-01-02', 0, '2019-02-14 14:40:54', '2019-02-14 15:28:52'),
(308, 'Caja Chica', '0.0000', NULL, 6, 'DEBE', '2019-01-02 04:00:00', '66558200.9300', 'Venta', 0, '2019-02-14 15:02:19', '2019-02-14 15:28:52'),
(309, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-02 04:00:00', '66558200.9300', 'Cierre de caja', 0, '2019-02-14 15:28:52', '2019-02-14 15:28:52'),
(310, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-03 04:00:00', '66558200.9300', 'Inicio de caja', 0, '2019-02-14 15:28:52', '2019-03-25 09:42:00'),
(311, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-02 04:00:00', '5148417.8200', 'Cierre de caja', 0, '2019-02-14 15:28:52', '2019-02-14 15:28:52'),
(312, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-03 04:00:00', '5148417.8200', 'Inicio de caja', 0, '2019-02-14 15:28:52', '2019-03-25 09:42:00'),
(313, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-02 04:00:00', '-1156881.8600', 'Cierre de caja', 0, '2019-02-14 15:28:53', '2019-02-14 15:28:53'),
(314, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-03 04:00:00', '-1156881.8600', 'Inicio de caja', 0, '2019-02-14 15:28:53', '2019-03-25 09:42:01'),
(315, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-02 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-02-14 15:28:53', '2019-02-14 15:28:53'),
(316, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-03 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-02-14 15:28:53', '2019-03-25 09:42:01'),
(317, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-02 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-02-14 15:28:53', '2019-02-14 15:28:53'),
(318, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-03 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-02-14 15:28:53', '2019-03-25 09:42:01'),
(319, 'Caja Chica', '204797.4900', NULL, 7, 'DEBE', '2019-01-03 04:00:00', '66762998.4200', 'Venta', 0, '2019-02-14 16:26:40', '2019-03-25 09:42:00'),
(320, 'Venezolano de Crédito', '3247257.7200', NULL, 8, 'DEBE', '2019-01-03 04:00:00', '2090375.8600', 'Venta', 0, '2019-02-14 23:57:15', '2019-03-25 09:42:01'),
(321, 'Caja Chica', '151485662.7200', 65, NULL, 'HABER', '2019-01-03 04:00:00', '-84722664.3000', 'Compra', 0, '2019-02-15 00:05:11', '2019-03-25 09:42:00'),
(322, 'Caja Chica', '193200.0000', 66, NULL, 'HABER', '2019-01-03 04:00:00', '-84915864.3000', 'Compra', 0, '2019-02-15 00:28:42', '2019-03-25 09:42:00'),
(323, 'Caja Chica', '193200.0000', NULL, NULL, 'DEBE', '2019-01-03 04:00:00', '-84722664.3000', 'Reembolso por eliminación de compra bajo factura: 654653516521 de fecha 2019-01-03', 0, '2019-02-15 00:29:09', '2019-03-25 09:42:00'),
(324, 'Caja Chica', '918400.0000', NULL, NULL, 'HABER', '2019-01-03 04:00:00', '-85641064.3000', 'Pago de deuda de proveedor P00000', 0, '2019-02-15 00:33:58', '2019-03-25 09:42:00'),
(325, 'Venezolano de Crédito', '1176000.0000', NULL, NULL, 'HABER', '2019-01-03 04:00:00', '914375.8600', 'Pago de deuda de proveedor P00002', 0, '2019-02-15 00:34:48', '2019-03-25 09:42:01'),
(326, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-03 04:00:00', '-85641064.3000', 'Cierre de caja', 0, '2019-03-25 09:42:00', '2019-03-25 09:42:00'),
(327, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-04 04:00:00', '-85641064.3000', 'Inicio de caja', 0, '2019-03-25 09:42:00', '2019-04-03 05:58:17'),
(328, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-03 04:00:00', '5148417.8200', 'Cierre de caja', 0, '2019-03-25 09:42:00', '2019-03-25 09:42:00'),
(329, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-04 04:00:00', '5148417.8200', 'Inicio de caja', 0, '2019-03-25 09:42:00', '2019-04-03 05:58:17'),
(330, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-03 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-03-25 09:42:01', '2019-03-25 09:42:01'),
(331, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-04 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-03-25 09:42:01', '2019-04-03 05:58:17'),
(332, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-03 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-03-25 09:42:01', '2019-03-25 09:42:01'),
(333, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-04 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-03-25 09:42:01', '2019-04-03 05:58:18'),
(334, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-03 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-03-25 09:42:01', '2019-03-25 09:42:01'),
(335, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-04 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-03-25 09:42:01', '2019-04-03 05:58:18'),
(336, 'Banco de Venezuela', '98379209.4200', NULL, 9, 'DEBE', '2019-01-04 04:00:00', '103527627.2400', 'Venta', 0, '2019-03-25 09:55:57', '2019-04-03 05:58:17'),
(337, 'Banco de Venezuela', '90000000.0000', NULL, NULL, 'HABER', '2019-01-04 04:00:00', '13527627.2400', 'Transferido hacia Caja Chica, Transferencia para flujo de caja', 0, '2019-03-25 09:56:47', '2019-04-03 05:58:17'),
(338, 'Caja Chica', '90000000.0000', NULL, NULL, 'DEBE', '2019-01-04 04:00:00', '4358935.7000', 'Transferido desde Banco de Venezuela, Transferencia para flujo de caja', 0, '2019-03-25 09:56:47', '2019-04-03 05:58:17'),
(339, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-04 04:00:00', '4358935.7000', 'Cierre de caja', 0, '2019-04-03 05:58:17', '2019-04-03 05:58:17'),
(340, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-05 04:00:00', '4358935.7000', 'Inicio de caja', 0, '2019-04-03 05:58:17', '2019-04-05 03:18:47'),
(341, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-04 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-03 05:58:17', '2019-04-03 05:58:17'),
(342, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-05 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-03 05:58:17', '2019-04-05 03:18:47'),
(343, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-04 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-03 05:58:17', '2019-04-03 05:58:17'),
(344, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-05 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-03 05:58:18', '2019-04-05 03:18:48'),
(345, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-04 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-03 05:58:18', '2019-04-03 05:58:18'),
(346, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-05 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-03 05:58:18', '2019-04-05 03:18:48'),
(347, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-04 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-03 05:58:18', '2019-04-03 05:58:18'),
(348, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-05 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-03 05:58:18', '2019-04-05 03:18:48'),
(349, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-05 04:00:00', '4358935.7000', 'Cierre de caja', 0, '2019-04-05 03:18:47', '2019-04-05 03:18:47'),
(350, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-06 04:00:00', '4358935.7000', 'Inicio de caja', 0, '2019-04-05 03:18:47', '2019-04-06 07:33:58'),
(351, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-05 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-05 03:18:48', '2019-04-05 03:18:48'),
(352, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-06 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-05 03:18:48', '2019-04-06 07:33:58'),
(353, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-05 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-05 03:18:48', '2019-04-05 03:18:48'),
(354, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-06 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-05 03:18:48', '2019-04-06 07:33:59'),
(355, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-05 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-05 03:18:48', '2019-04-05 03:18:48'),
(356, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-06 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-05 03:18:48', '2019-04-06 07:33:59'),
(357, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-05 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-05 03:18:48', '2019-04-05 03:18:48'),
(358, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-06 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-05 03:18:48', '2019-04-06 07:33:59'),
(359, 'Caja Chica', '1120000.0000', 75, NULL, 'HABER', '2019-01-06 04:00:00', '3238935.7000', 'Compra', 0, '2019-04-05 03:34:59', '2019-04-06 07:33:58'),
(360, 'Caja Chica', '2688000.0000', NULL, 10, 'DEBE', '2019-01-06 04:00:00', '5926935.7000', 'Venta', 0, '2019-04-05 03:57:27', '2019-04-06 07:33:58'),
(361, 'Caja Chica', '2688000.0000', NULL, 12, 'DEBE', '2019-01-06 04:00:00', '8614935.7000', 'Venta', 0, '2019-04-05 04:28:06', '2019-04-06 07:33:58'),
(362, 'Caja Chica', '1344000.0000', NULL, 13, 'DEBE', '2019-01-06 04:00:00', '9958935.7000', 'Venta', 0, '2019-04-05 04:29:51', '2019-04-06 07:33:58'),
(363, 'Caja Chica', '4032000.0000', NULL, 14, 'DEBE', '2019-01-06 04:00:00', '13990935.7000', 'Venta', 0, '2019-04-05 04:31:51', '2019-04-06 07:33:58'),
(364, 'Caja Chica', '2688000.0000', NULL, 15, 'DEBE', '2019-01-06 04:00:00', '16678935.7000', 'Venta', 0, '2019-04-05 05:12:52', '2019-04-06 07:33:58'),
(365, 'Caja Chica', '2688000.0000', NULL, 16, 'DEBE', '2019-01-06 04:00:00', '19366935.7000', 'Venta', 0, '2019-04-05 18:25:52', '2019-04-06 07:33:58'),
(366, 'Caja Chica', '7560000.0000', 76, NULL, 'HABER', '2019-01-06 04:00:00', '11806935.7000', 'Compra', 0, '2019-04-05 18:37:50', '2019-04-06 07:33:58'),
(367, 'Caja Chica', '4146520.0000', 77, NULL, 'HABER', '2019-01-06 04:00:00', '7660415.7000', 'Compra', 0, '2019-04-05 18:45:47', '2019-04-06 07:33:58'),
(368, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-06 04:00:00', '7660415.7000', 'Cierre de caja', 0, '2019-04-06 07:33:58', '2019-04-06 07:33:58'),
(369, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-07 04:00:00', '7660415.7000', 'Inicio de caja', 0, '2019-04-06 07:33:58', '2019-04-06 08:41:19'),
(370, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-06 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 07:33:58', '2019-04-06 07:33:58'),
(371, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-07 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 07:33:59', '2019-04-06 08:41:20'),
(372, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-06 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 07:33:59', '2019-04-06 07:33:59'),
(373, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-07 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 07:33:59', '2019-04-06 08:41:20'),
(374, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-06 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 07:33:59', '2019-04-06 07:33:59'),
(375, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-07 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 07:33:59', '2019-04-06 08:41:20'),
(376, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-06 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 07:33:59', '2019-04-06 07:33:59'),
(377, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-07 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 07:33:59', '2019-04-06 08:41:20'),
(379, 'Caja Chica', '0.0000', 81, NULL, 'HABER', '2019-01-07 04:00:00', '7660415.7000', 'Compra', 0, '2019-04-06 07:51:03', '2019-04-06 08:41:19'),
(380, 'Caja Chica', '85527.6800', 82, NULL, 'HABER', '2019-01-07 04:00:00', '7574888.0200', 'Compra', 0, '2019-04-06 07:53:00', '2019-04-06 08:41:19'),
(381, 'Caja Chica', '0.0000', 83, NULL, 'HABER', '2019-01-07 04:00:00', '7574888.0200', 'Compra', 0, '2019-04-06 07:55:21', '2019-04-06 08:41:19'),
(382, 'Caja Chica', '703360.0000', 84, NULL, 'HABER', '2019-01-07 04:00:00', '6871528.0200', 'Compra', 0, '2019-04-06 07:57:42', '2019-04-06 08:41:19'),
(383, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-07 04:00:00', '6871528.0200', 'Cierre de caja', 0, '2019-04-06 08:41:20', '2019-04-06 08:41:20'),
(384, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-08 04:00:00', '6871528.0200', 'Inicio de caja', 0, '2019-04-06 08:41:20', '2019-04-06 08:45:31'),
(385, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-07 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 08:41:20', '2019-04-06 08:41:20'),
(386, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-08 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 08:41:20', '2019-04-06 08:45:31'),
(387, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-07 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 08:41:20', '2019-04-06 08:41:20'),
(388, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-08 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 08:41:20', '2019-04-06 08:45:31'),
(389, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-07 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 08:41:20', '2019-04-06 08:41:20'),
(390, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-08 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 08:41:20', '2019-04-06 08:45:31'),
(391, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-07 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 08:41:20', '2019-04-06 08:41:20'),
(392, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-08 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 08:41:20', '2019-04-06 08:45:31'),
(393, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-08 04:00:00', '6871528.0200', 'Cierre de caja', 0, '2019-04-06 08:45:31', '2019-04-06 08:45:31'),
(394, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-09 04:00:00', '6871528.0200', 'Inicio de caja', 0, '2019-04-06 08:45:31', '2019-04-06 08:50:09'),
(395, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-08 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 08:45:31', '2019-04-06 08:45:31'),
(396, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-09 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 08:45:31', '2019-04-06 08:50:09'),
(397, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-08 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 08:45:31', '2019-04-06 08:45:31'),
(398, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-09 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 08:45:31', '2019-04-06 08:50:09'),
(399, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-08 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 08:45:31', '2019-04-06 08:45:31'),
(400, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-09 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 08:45:31', '2019-04-06 08:50:09'),
(401, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-08 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 08:45:32', '2019-04-06 08:45:32'),
(402, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-09 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 08:45:32', '2019-04-06 08:50:09'),
(403, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-09 04:00:00', '6871528.0200', 'Cierre de caja', 0, '2019-04-06 08:50:09', '2019-04-06 08:50:09'),
(404, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-10 04:00:00', '6871528.0200', 'Inicio de caja', 0, '2019-04-06 08:50:09', '2019-04-06 09:06:44'),
(405, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-09 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 08:50:09', '2019-04-06 08:50:09'),
(406, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-10 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 08:50:09', '2019-04-06 09:06:44'),
(407, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-09 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 08:50:09', '2019-04-06 08:50:09'),
(408, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-10 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 08:50:09', '2019-04-06 09:06:45'),
(409, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-09 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 08:50:09', '2019-04-06 08:50:09'),
(410, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-10 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 08:50:09', '2019-04-06 09:06:45'),
(411, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-09 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 08:50:09', '2019-04-06 08:50:09'),
(412, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-10 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 08:50:10', '2019-04-06 09:06:45'),
(413, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-10 04:00:00', '6871528.0200', 'Cierre de caja', 0, '2019-04-06 09:06:44', '2019-04-06 09:06:44'),
(414, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-11 04:00:00', '6871528.0200', 'Inicio de caja', 0, '2019-04-06 09:06:44', '2019-04-06 09:16:09'),
(415, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-10 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 09:06:45', '2019-04-06 09:06:45'),
(416, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-11 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 09:06:45', '2019-04-06 09:16:10'),
(417, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-10 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 09:06:45', '2019-04-06 09:06:45'),
(418, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-11 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 09:06:45', '2019-04-06 09:16:10'),
(419, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-10 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 09:06:45', '2019-04-06 09:06:45'),
(420, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-11 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 09:06:45', '2019-04-06 09:16:10'),
(421, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-10 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 09:06:45', '2019-04-06 09:06:45'),
(422, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-11 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 09:06:45', '2019-04-06 09:16:10'),
(423, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-11 04:00:00', '6871528.0200', 'Cierre de caja', 0, '2019-04-06 09:16:10', '2019-04-06 09:16:10'),
(424, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-12 04:00:00', '6871528.0200', 'Inicio de caja', 0, '2019-04-06 09:16:10', '2019-04-06 11:46:11'),
(425, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-11 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 09:16:10', '2019-04-06 09:16:10'),
(426, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-12 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 09:16:10', '2019-04-06 11:46:12'),
(427, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-11 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 09:16:10', '2019-04-06 09:16:10'),
(428, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-12 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 09:16:10', '2019-04-06 11:46:12'),
(429, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-11 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 09:16:10', '2019-04-06 09:16:10'),
(430, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-12 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 09:16:10', '2019-04-06 11:46:12'),
(431, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-11 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 09:16:10', '2019-04-06 09:16:10'),
(432, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-12 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 09:16:10', '2019-04-06 11:46:12'),
(433, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-12 04:00:00', '6871528.0200', 'Cierre de caja', 0, '2019-04-06 11:46:11', '2019-04-06 11:46:11'),
(434, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-13 04:00:00', '6871528.0200', 'Inicio de caja', 0, '2019-04-06 11:46:11', '2019-04-06 11:49:00'),
(435, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-12 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 11:46:12', '2019-04-06 11:46:12'),
(436, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-13 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 11:46:12', '2019-04-06 11:49:01'),
(437, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-12 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 11:46:12', '2019-04-06 11:46:12'),
(438, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-13 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 11:46:12', '2019-04-06 11:49:01'),
(439, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-12 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 11:46:12', '2019-04-06 11:46:12'),
(440, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-13 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 11:46:12', '2019-04-06 11:49:01'),
(441, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-12 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 11:46:12', '2019-04-06 11:46:12'),
(442, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-13 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 11:46:12', '2019-04-06 11:49:01'),
(443, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-13 04:00:00', '6871528.0200', 'Cierre de caja', 0, '2019-04-06 11:49:01', '2019-04-06 11:49:01'),
(444, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-14 04:00:00', '6871528.0200', 'Inicio de caja', 0, '2019-04-06 11:49:01', '2019-04-06 11:52:30'),
(445, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-13 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 11:49:01', '2019-04-06 11:49:01'),
(446, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-14 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 11:49:01', '2019-04-06 11:52:30'),
(447, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-13 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 11:49:01', '2019-04-06 11:49:01'),
(448, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-14 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 11:49:01', '2019-04-06 11:52:31'),
(449, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-13 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 11:49:01', '2019-04-06 11:49:01'),
(450, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-14 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 11:49:01', '2019-04-06 11:52:31'),
(451, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-13 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 11:49:01', '2019-04-06 11:49:01'),
(452, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-14 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 11:49:01', '2019-04-06 11:52:31'),
(453, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-14 04:00:00', '6871528.0200', 'Cierre de caja', 0, '2019-04-06 11:52:30', '2019-04-06 11:52:30'),
(454, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-15 04:00:00', '6871528.0200', 'Inicio de caja', 0, '2019-04-06 11:52:30', '2019-04-06 11:56:23'),
(455, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-14 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 11:52:30', '2019-04-06 11:52:30'),
(456, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-15 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 11:52:31', '2019-04-06 11:56:23'),
(457, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-14 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 11:52:31', '2019-04-06 11:52:31'),
(458, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-15 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 11:52:31', '2019-04-06 11:56:24'),
(459, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-14 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 11:52:31', '2019-04-06 11:52:31'),
(460, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-15 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 11:52:31', '2019-04-06 11:56:24'),
(461, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-14 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 11:52:31', '2019-04-06 11:52:31'),
(462, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-15 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 11:52:31', '2019-04-06 11:56:24'),
(463, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-15 04:00:00', '6871528.0200', 'Cierre de caja', 0, '2019-04-06 11:56:23', '2019-04-06 11:56:23'),
(464, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-16 04:00:00', '6871528.0200', 'Inicio de caja', 0, '2019-04-06 11:56:23', '2019-04-06 12:01:21'),
(465, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-15 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 11:56:24', '2019-04-06 11:56:24'),
(466, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-16 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 11:56:24', '2019-04-06 12:01:21'),
(467, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-15 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 11:56:24', '2019-04-06 11:56:24'),
(468, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-16 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 11:56:24', '2019-04-06 12:01:22'),
(469, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-15 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 11:56:24', '2019-04-06 11:56:24'),
(470, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-16 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 11:56:24', '2019-04-06 12:01:22'),
(471, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-15 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 11:56:24', '2019-04-06 11:56:24'),
(472, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-16 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 11:56:24', '2019-04-06 12:01:22'),
(473, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-16 04:00:00', '6871528.0200', 'Cierre de caja', 0, '2019-04-06 12:01:21', '2019-04-06 12:01:21'),
(474, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-17 04:00:00', '6871528.0200', 'Inicio de caja', 0, '2019-04-06 12:01:21', '2019-04-06 12:18:29'),
(475, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-16 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 12:01:22', '2019-04-06 12:01:22'),
(476, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-17 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 12:01:22', '2019-04-06 12:18:29'),
(477, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-16 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 12:01:22', '2019-04-06 12:01:22'),
(478, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-17 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 12:01:22', '2019-04-06 12:18:30'),
(479, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-16 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 12:01:22', '2019-04-06 12:01:22'),
(480, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-17 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 12:01:22', '2019-04-06 12:18:30'),
(481, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-16 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 12:01:22', '2019-04-06 12:01:22'),
(482, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-17 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 12:01:22', '2019-04-06 12:18:30'),
(483, 'Caja Chica', '167133440.6000', NULL, 17, 'DEBE', '2019-01-17 04:00:00', '174004968.6200', 'Venta', 0, '2019-04-06 12:07:03', '2019-04-06 12:18:29'),
(484, 'Caja Chica', '646800.0000', 86, NULL, 'HABER', '2019-01-17 04:00:00', '173358168.6200', 'Compra', 0, '2019-04-06 12:17:43', '2019-04-06 12:18:29'),
(485, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-17 04:00:00', '173358168.6200', 'Cierre de caja', 0, '2019-04-06 12:18:29', '2019-04-06 12:18:29'),
(486, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-18 04:00:00', '173358168.6200', 'Inicio de caja', 0, '2019-04-06 12:18:29', '2019-04-06 23:12:41'),
(487, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-17 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 12:18:29', '2019-04-06 12:18:29'),
(488, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-18 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 12:18:29', '2019-04-06 23:12:41'),
(489, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-17 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 12:18:30', '2019-04-06 12:18:30'),
(490, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-18 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 12:18:30', '2019-04-06 23:12:41'),
(491, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-17 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 12:18:30', '2019-04-06 12:18:30'),
(492, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-18 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 12:18:30', '2019-04-06 23:12:42'),
(493, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-17 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 12:18:30', '2019-04-06 12:18:30'),
(494, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-18 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 12:18:30', '2019-04-06 23:12:42'),
(495, 'Caja Chica', '3864000.0000', 87, NULL, 'HABER', '2019-01-18 04:00:00', '169494168.6200', 'Compra', 0, '2019-04-06 23:02:19', '2019-04-06 23:12:41'),
(496, 'Caja Chica', '375200.0000', 88, NULL, 'HABER', '2019-01-18 04:00:00', '169118968.6200', 'Compra', 0, '2019-04-06 23:07:31', '2019-04-06 23:12:41'),
(497, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-18 04:00:00', '169118968.6200', 'Cierre de caja', 0, '2019-04-06 23:12:41', '2019-04-06 23:12:41'),
(498, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-19 04:00:00', '169118968.6200', 'Inicio de caja', 0, '2019-04-06 23:12:41', '2019-04-09 05:41:50'),
(499, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-18 04:00:00', '13527627.2400', 'Cierre de caja', 0, '2019-04-06 23:12:41', '2019-04-06 23:12:41'),
(500, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-19 04:00:00', '13527627.2400', 'Inicio de caja', 0, '2019-04-06 23:12:41', '2019-04-09 05:41:50'),
(501, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-18 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-06 23:12:42', '2019-04-06 23:12:42'),
(502, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-19 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-06 23:12:42', '2019-04-09 05:41:50'),
(503, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-18 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 23:12:42', '2019-04-06 23:12:42'),
(504, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-19 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 23:12:42', '2019-04-09 05:41:50'),
(505, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-18 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-06 23:12:42', '2019-04-06 23:12:42'),
(506, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-19 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-06 23:12:42', '2019-04-09 05:41:50'),
(507, 'Caja Chica', '73347.1200', 89, NULL, 'HABER', '2019-01-19 04:00:00', '169045621.5000', 'Compra', 0, '2019-04-06 23:18:04', '2019-04-09 05:41:50'),
(508, 'Caja Chica', '3786720.0000', 90, NULL, 'HABER', '2019-01-19 04:00:00', '165258901.5000', 'Compra', 0, '2019-04-06 23:19:08', '2019-04-09 05:41:50'),
(509, 'Banco de Venezuela', '31046400.0000', NULL, NULL, 'DEBE', '2019-01-19 04:00:00', '44574027.2400', 'Cobro de deuda a cliente C00001', 0, '2019-04-06 23:24:18', '2019-04-09 05:41:50'),
(510, 'Caja Chica', '38680129.4880', NULL, NULL, 'HABER', '2019-01-19 04:00:00', '126578772.0120', 'Pago de deuda de proveedor P00007', 0, '2019-04-06 23:26:40', '2019-04-09 05:41:50'),
(511, 'Caja Chica', '6157200.0000', NULL, NULL, 'HABER', '2019-01-19 04:00:00', '120421572.0120', 'Pago de deuda de proveedor P00000', 0, '2019-04-06 23:27:21', '2019-04-09 05:41:50'),
(512, 'Caja Chica', '2800000.0000', NULL, NULL, 'HABER', '2019-01-19 04:00:00', '117621572.0120', 'Pago de deuda de proveedor P00002', 0, '2019-04-06 23:27:53', '2019-04-09 05:41:50'),
(513, 'Caja Chica', '1558334.4000', NULL, NULL, 'HABER', '2019-01-19 04:00:00', '116063237.6120', 'Pago de deuda de proveedor P00006', 0, '2019-04-06 23:28:32', '2019-04-09 05:41:50'),
(514, 'Caja Chica', '11592000.0000', 91, NULL, 'HABER', '2019-01-19 04:00:00', '104471237.6120', 'Compra', 0, '2019-04-09 05:39:35', '2019-04-09 05:41:50'),
(515, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-19 04:00:00', '104471237.6120', 'Cierre de caja', 0, '2019-04-09 05:41:50', '2019-04-09 05:41:50'),
(516, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-20 04:00:00', '104471237.6120', 'Inicio de caja', 0, '2019-04-09 05:41:50', '2019-04-09 21:15:19'),
(517, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-19 04:00:00', '44574027.2400', 'Cierre de caja', 0, '2019-04-09 05:41:50', '2019-04-09 05:41:50'),
(518, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-20 04:00:00', '44574027.2400', 'Inicio de caja', 0, '2019-04-09 05:41:50', '2019-04-09 21:15:19'),
(519, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-19 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-09 05:41:50', '2019-04-09 05:41:50'),
(520, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-20 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-09 05:41:50', '2019-04-09 21:15:19'),
(521, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-19 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-09 05:41:50', '2019-04-09 05:41:50'),
(522, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-20 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-09 05:41:50', '2019-04-09 21:15:19'),
(523, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-19 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-09 05:41:50', '2019-04-09 05:41:50'),
(524, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-20 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-09 05:41:51', '2019-04-09 21:15:19'),
(525, 'Caja Chica', '222264.0000', 92, NULL, 'HABER', '2019-01-20 04:00:00', '104248973.6120', 'Compra', 0, '2019-04-09 05:57:17', '2019-04-09 21:15:19'),
(526, 'Caja Chica', '11592000.0000', 93, NULL, 'HABER', '2019-01-20 04:00:00', '92656973.6120', 'Compra', 0, '2019-04-09 05:58:59', '2019-04-09 21:15:19'),
(527, 'Caja Chica', '0.0000', NULL, 19, 'DEBE', '2019-01-20 04:00:00', '92656973.6120', 'Venta', 0, '2019-04-09 06:54:41', '2019-04-09 21:15:19'),
(528, 'Caja Chica', '15456000.0000', NULL, 20, 'DEBE', '2019-01-20 04:00:00', '108112973.6120', 'Venta', 0, '2019-04-09 08:24:13', '2019-04-09 21:15:19'),
(529, 'Caja Chica', '103488000.0000', NULL, NULL, 'DEBE', '2019-01-20 04:00:00', '211600973.6120', 'Entrada generada: Ingreso por venta no registrada por bug', 0, '2019-04-09 20:23:15', '2019-04-09 21:15:19'),
(530, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-20 04:00:00', '211600973.6120', 'Cierre de caja', 0, '2019-04-09 21:15:19', '2019-04-09 21:15:19'),
(531, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-21 04:00:00', '211600973.6120', 'Inicio de caja', 0, '2019-04-09 21:15:19', '2019-04-11 23:32:10'),
(532, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-20 04:00:00', '44574027.2400', 'Cierre de caja', 0, '2019-04-09 21:15:19', '2019-04-09 21:15:19'),
(533, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-21 04:00:00', '44574027.2400', 'Inicio de caja', 0, '2019-04-09 21:15:19', '2019-04-11 23:32:10'),
(534, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-20 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-09 21:15:19', '2019-04-09 21:15:19'),
(535, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-21 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-09 21:15:19', '2019-04-11 23:32:10'),
(536, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-20 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-09 21:15:19', '2019-04-09 21:15:19'),
(537, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-21 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-09 21:15:19', '2019-04-11 23:32:11'),
(538, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-20 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-09 21:15:19', '2019-04-09 21:15:19'),
(539, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-21 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-09 21:15:19', '2019-04-11 23:32:11'),
(540, 'Caja Chica', '100000000.0000', NULL, NULL, 'HABER', '2019-01-21 04:00:00', '111600973.6120', 'Pago de deuda de proveedor P00001', 0, '2019-04-09 21:16:07', '2019-04-11 23:32:10'),
(541, 'Caja Chica', '50000000.0000', NULL, NULL, 'HABER', '2019-01-21 04:00:00', '61600973.6120', 'Pago de deuda de proveedor P00007', 0, '2019-04-09 21:17:33', '2019-04-11 23:32:10'),
(542, 'Caja Chica', '140000.0000', 96, NULL, 'HABER', '2019-01-21 04:00:00', '61460973.6120', 'Compra', 0, '2019-04-09 21:25:09', '2019-04-11 23:32:10'),
(543, 'Caja Chica', '85527.6800', 97, NULL, 'HABER', '2019-01-21 04:00:00', '61375445.9320', 'Compra', 0, '2019-04-09 21:32:11', '2019-04-11 23:32:10'),
(544, 'Banco de Venezuela', '295431867.2760', NULL, 21, 'DEBE', '2019-01-21 04:00:00', '340005894.5160', 'Venta', 0, '2019-04-11 02:39:18', '2019-04-11 23:32:10'),
(545, 'Caja Chica', '1.0000', NULL, NULL, 'DEBE', '2019-01-21 04:00:00', '61375446.9320', 'Entrada generada: Entrada de Prueba', 0, '2019-04-11 02:47:29', '2019-04-11 23:32:10'),
(546, 'Caja Chica', '1.0000', NULL, NULL, 'HABER', '2019-01-21 04:00:00', '61375445.9320', 'Salida generada: salida de prueba', 0, '2019-04-11 02:50:41', '2019-04-11 23:32:10'),
(547, 'Caja Chica', '2.0000', NULL, NULL, 'DEBE', '2019-01-21 04:00:00', '61375447.9320', 'Entrada generada: segunda entrada de prueba', 0, '2019-04-11 02:51:14', '2019-04-11 23:32:10'),
(548, 'Caja Chica', '40000000.0000', NULL, NULL, 'HABER', '2019-01-21 04:00:00', '21375447.9320', 'Transferido hacia Banco de Venezuela, Deposito para pago a proveedores', 0, '2019-04-11 02:54:34', '2019-04-11 23:32:10'),
(549, 'Banco de Venezuela', '40000000.0000', NULL, NULL, 'DEBE', '2019-01-21 04:00:00', '380005894.5160', 'Transferido desde Caja Chica, Deposito para pago a proveedores', 0, '2019-04-11 02:54:35', '2019-04-11 23:32:10'),
(550, 'Caja Chica', '200000000.0000', NULL, NULL, 'HABER', '2019-01-21 04:00:00', '-178624552.0680', 'Pago de deuda de proveedor P00001', 0, '2019-04-11 03:00:44', '2019-04-11 23:32:10'),
(551, 'Banco de Venezuela', '200000000.0000', NULL, NULL, 'HABER', '2019-01-21 04:00:00', '180005894.5160', 'Transferido hacia Caja Chica, ajuste por pago a proveedor', 0, '2019-04-11 03:02:17', '2019-04-11 23:32:10'),
(552, 'Caja Chica', '200000000.0000', NULL, NULL, 'DEBE', '2019-01-21 04:00:00', '21375447.9320', 'Transferido desde Banco de Venezuela, ajuste por pago a proveedor', 0, '2019-04-11 03:02:17', '2019-04-11 23:32:10'),
(553, 'Banco de Venezuela', '50000000.0000', NULL, NULL, 'HABER', '2019-01-21 04:00:00', '130005894.5160', 'Pago de deuda de proveedor P00006', 0, '2019-04-11 03:02:50', '2019-04-11 23:32:10'),
(554, 'Banco de Venezuela', '50000000.0000', NULL, NULL, 'HABER', '2019-01-21 04:00:00', '80005894.5160', 'Pago de deuda de proveedor P00001', 0, '2019-04-11 03:03:25', '2019-04-11 23:32:10'),
(555, 'Banco de Venezuela', '50000000.0000', NULL, NULL, 'HABER', '2019-01-21 04:00:00', '30005894.5160', 'Pago de deuda de proveedor P00007', 0, '2019-04-11 03:04:07', '2019-04-11 23:32:10'),
(556, 'Caja Chica', '20000000.0000', NULL, NULL, 'HABER', '2019-01-21 04:00:00', '1375447.9320', 'Transferido hacia Banco de Venezuela, Transferencia para abono de proveedor', 0, '2019-04-11 23:16:35', '2019-04-11 23:32:10'),
(557, 'Banco de Venezuela', '20000000.0000', NULL, NULL, 'DEBE', '2019-01-21 04:00:00', '50005894.5160', 'Transferido desde Caja Chica, Transferencia para abono de proveedor', 0, '2019-04-11 23:16:35', '2019-04-11 23:32:10'),
(558, 'Banco de Venezuela', '72441600.0000', NULL, NULL, 'DEBE', '2019-01-21 04:00:00', '122447494.5160', 'Cobro de deuda a cliente C00001', 0, '2019-04-11 23:27:56', '2019-04-11 23:32:10'),
(559, 'Banco de Venezuela', '58333120.0000', NULL, NULL, 'HABER', '2019-01-21 04:00:00', '64114374.5160', 'Pago de deuda de proveedor P00006', 0, '2019-04-11 23:31:15', '2019-04-11 23:32:10'),
(560, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-21 04:00:00', '1375447.9320', 'Cierre de caja', 0, '2019-04-11 23:32:10', '2019-04-11 23:32:10'),
(561, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-22 04:00:00', '1375447.9320', 'Inicio de caja', 0, '2019-04-11 23:32:10', '2019-04-12 20:08:58'),
(562, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-21 04:00:00', '64114374.5160', 'Cierre de caja', 0, '2019-04-11 23:32:10', '2019-04-11 23:32:10'),
(563, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-22 04:00:00', '64114374.5160', 'Inicio de caja', 0, '2019-04-11 23:32:10', '2019-04-12 20:08:59'),
(564, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-21 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-11 23:32:10', '2019-04-11 23:32:10'),
(565, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-22 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-11 23:32:11', '2019-04-12 20:08:59'),
(566, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-21 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-11 23:32:11', '2019-04-11 23:32:11'),
(567, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-22 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-11 23:32:11', '2019-04-12 20:08:59'),
(568, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-21 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-11 23:32:11', '2019-04-11 23:32:11'),
(569, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-22 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-11 23:32:11', '2019-04-12 20:08:59'),
(570, 'Banco de Venezuela', '193200.0000', 99, NULL, 'HABER', '2019-01-22 04:00:00', '63921174.5160', 'Compra', 0, '2019-04-11 23:42:41', '2019-04-12 20:08:59'),
(571, 'Banco de Venezuela', '16749698.1840', NULL, NULL, 'DEBE', '2019-01-22 04:00:00', '80670872.7000', 'Cobro de deuda a cliente C00000', 0, '2019-04-12 02:32:28', '2019-04-12 20:08:59'),
(572, 'Banco de Venezuela', '15074729.0000', NULL, NULL, 'DEBE', '2019-01-22 04:00:00', '95745601.7000', 'Cobro de deuda a cliente C00000', 0, '2019-04-12 19:02:11', '2019-04-12 20:08:59'),
(588, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-22 04:00:00', '95745601.7000', 'Cierre de caja', 0, '2019-04-12 20:08:59', '2019-04-12 20:08:59'),
(589, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-23 04:00:00', '95745601.7000', 'Inicio de caja', 0, '2019-04-12 20:08:59', '2019-04-12 21:00:57'),
(590, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-22 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-12 20:08:59', '2019-04-12 20:08:59'),
(591, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-23 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-12 20:08:59', '2019-04-12 21:00:57'),
(592, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-22 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-12 20:08:59', '2019-04-12 20:08:59'),
(593, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-23 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-12 20:08:59', '2019-04-12 21:00:57'),
(594, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-22 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-12 20:08:59', '2019-04-12 20:08:59'),
(595, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-23 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-12 20:09:00', '2019-04-12 21:00:57'),
(597, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-22 04:00:00', '1375447.9320', 'Cierre de caja', 0, '2019-04-11 23:32:10', '2019-04-12 20:08:58'),
(598, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-23 04:00:00', '1375447.9320', 'Inicio de caja', 0, '2019-04-11 23:32:10', '2019-04-12 21:00:56'),
(599, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-23 04:00:00', '1375447.9320', 'Cierre de caja', 0, '2019-04-12 21:00:57', '2019-04-12 21:00:57'),
(600, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-24 04:00:00', '1375447.9320', 'Inicio de caja', 0, '2019-04-12 21:00:57', '2019-04-13 15:16:46');
INSERT INTO `cajabanco` (`id`, `cb_entidad`, `cb_monto`, `cb_compra_id`, `cb_venta_id`, `cb_debe_haber`, `cb_fecha`, `cb_saldo`, `cb_concepto`, `cb_activo`, `created_at`, `updated_at`) VALUES
(601, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-23 04:00:00', '95745601.7000', 'Cierre de caja', 0, '2019-04-12 21:00:57', '2019-04-12 21:00:57'),
(602, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-24 04:00:00', '95745601.7000', 'Inicio de caja', 0, '2019-04-12 21:00:57', '2019-04-13 15:16:46'),
(603, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-23 04:00:00', '914375.8600', 'Cierre de caja', 0, '2019-04-12 21:00:57', '2019-04-12 21:00:57'),
(604, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-24 04:00:00', '914375.8600', 'Inicio de caja', 0, '2019-04-12 21:00:57', '2019-04-13 15:16:46'),
(605, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-23 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-12 21:00:57', '2019-04-12 21:00:57'),
(606, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-24 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-12 21:00:57', '2019-04-13 15:16:46'),
(607, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-23 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-12 21:00:57', '2019-04-12 21:00:57'),
(608, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-24 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-12 21:00:57', '2019-04-13 15:16:46'),
(609, 'Caja Chica', '724080.0000', 99, NULL, 'HABER', '2019-01-24 04:00:00', '651367.9320', 'Compra', 0, '2019-04-13 01:40:04', '2019-04-13 15:16:46'),
(610, 'Banco de Venezuela', '84448.0000', 100, NULL, 'HABER', '2019-01-24 04:00:00', '1290999.9320', 'Compra', 0, '2019-04-13 01:51:14', '2019-04-13 15:16:46'),
(611, 'Banco de Venezuela', '94370158.0000', NULL, NULL, 'DEBE', '2019-01-24 04:00:00', '95661157.9320', 'Entrada generada: Bugfix de compras', 0, '2019-04-13 03:24:25', '2019-04-13 15:16:46'),
(613, 'Banco de Venezuela', '38640.0000', 103, NULL, 'HABER', '2019-01-24 04:00:00', '95622517.9320', 'Compra', 0, '2019-04-13 03:41:32', '2019-04-13 15:16:46'),
(614, 'Venezolano de Crédito', '78400.0000', 104, NULL, 'HABER', '2019-01-24 04:00:00', '835975.8600', 'Compra', 0, '2019-04-13 03:55:10', '2019-04-13 15:16:46'),
(615, 'Banco de Venezuela', '33600.0000', 107, NULL, 'HABER', '2019-01-24 04:00:00', '95588917.9320', 'Compra', 0, '2019-04-13 14:25:49', '2019-04-13 15:16:46'),
(616, 'Banco de Venezuela', '53248.1600', 108, NULL, 'HABER', '2019-01-24 04:00:00', '95535669.7720', 'Compra', 0, '2019-04-13 14:43:41', '2019-04-13 15:16:46'),
(617, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-24 04:00:00', '651367.9320', 'Cierre de caja', 0, '2019-04-13 15:16:46', '2019-04-13 15:16:46'),
(618, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-25 04:00:00', '651367.9320', 'Inicio de caja', 0, '2019-04-13 15:16:46', '2019-04-14 03:17:42'),
(619, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-24 04:00:00', '95535669.7720', 'Cierre de caja', 0, '2019-04-13 15:16:46', '2019-04-13 15:16:46'),
(620, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-25 04:00:00', '95535669.7720', 'Inicio de caja', 0, '2019-04-13 15:16:46', '2019-04-14 03:17:42'),
(621, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-24 04:00:00', '835975.8600', 'Cierre de caja', 0, '2019-04-13 15:16:46', '2019-04-13 15:16:46'),
(622, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-25 04:00:00', '835975.8600', 'Inicio de caja', 0, '2019-04-13 15:16:46', '2019-04-14 03:17:42'),
(623, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-24 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-13 15:16:46', '2019-04-13 15:16:46'),
(624, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-25 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-13 15:16:46', '2019-04-14 03:17:43'),
(625, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-24 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-13 15:16:46', '2019-04-13 15:16:46'),
(626, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-25 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-13 15:16:46', '2019-04-14 03:17:43'),
(627, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-25 04:00:00', '651367.9320', 'Cierre de caja', 0, '2019-04-14 03:17:42', '2019-04-14 03:17:42'),
(628, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-26 04:00:00', '651367.9320', 'Inicio de caja', 0, '2019-04-14 03:17:42', '2019-04-14 03:31:02'),
(629, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-25 04:00:00', '95535669.7720', 'Cierre de caja', 0, '2019-04-14 03:17:42', '2019-04-14 03:17:42'),
(630, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-26 04:00:00', '95535669.7720', 'Inicio de caja', 0, '2019-04-14 03:17:42', '2019-04-14 03:31:02'),
(631, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-25 04:00:00', '835975.8600', 'Cierre de caja', 0, '2019-04-14 03:17:43', '2019-04-14 03:17:43'),
(632, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-26 04:00:00', '835975.8600', 'Inicio de caja', 0, '2019-04-14 03:17:43', '2019-04-14 03:31:02'),
(633, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-25 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 03:17:43', '2019-04-14 03:17:43'),
(634, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-26 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-14 03:17:43', '2019-04-14 03:31:02'),
(635, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-25 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 03:17:43', '2019-04-14 03:17:43'),
(636, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-26 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-14 03:17:43', '2019-04-14 03:31:03'),
(637, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-26 04:00:00', '651367.9320', 'Cierre de caja', 0, '2019-04-14 03:31:02', '2019-04-14 03:31:02'),
(638, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-27 04:00:00', '651367.9320', 'Inicio de caja', 0, '2019-04-14 03:31:02', '2019-04-14 03:47:35'),
(639, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-26 04:00:00', '95535669.7720', 'Cierre de caja', 0, '2019-04-14 03:31:02', '2019-04-14 03:31:02'),
(640, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-27 04:00:00', '95535669.7720', 'Inicio de caja', 0, '2019-04-14 03:31:02', '2019-04-14 03:47:35'),
(641, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-26 04:00:00', '835975.8600', 'Cierre de caja', 0, '2019-04-14 03:31:02', '2019-04-14 03:31:02'),
(642, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-27 04:00:00', '835975.8600', 'Inicio de caja', 0, '2019-04-14 03:31:02', '2019-04-14 03:47:35'),
(643, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-26 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 03:31:03', '2019-04-14 03:31:03'),
(644, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-27 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-14 03:31:03', '2019-04-14 03:47:35'),
(645, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-26 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 03:31:03', '2019-04-14 03:31:03'),
(646, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-27 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-14 03:31:03', '2019-04-14 03:47:36'),
(647, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-27 04:00:00', '651367.9320', 'Cierre de caja', 0, '2019-04-14 03:47:35', '2019-04-14 03:47:35'),
(648, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-28 04:00:00', '651367.9320', 'Inicio de caja', 0, '2019-04-14 03:47:35', '2019-04-14 04:16:32'),
(649, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-27 04:00:00', '95535669.7720', 'Cierre de caja', 0, '2019-04-14 03:47:35', '2019-04-14 03:47:35'),
(650, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-28 04:00:00', '95535669.7720', 'Inicio de caja', 0, '2019-04-14 03:47:35', '2019-04-14 04:16:32'),
(651, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-27 04:00:00', '835975.8600', 'Cierre de caja', 0, '2019-04-14 03:47:35', '2019-04-14 03:47:35'),
(652, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-28 04:00:00', '835975.8600', 'Inicio de caja', 0, '2019-04-14 03:47:35', '2019-04-14 04:16:33'),
(653, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-27 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 03:47:36', '2019-04-14 03:47:36'),
(654, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-28 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-14 03:47:36', '2019-04-14 04:16:33'),
(655, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-27 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 03:47:36', '2019-04-14 03:47:36'),
(656, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-28 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-14 03:47:36', '2019-04-14 04:16:33'),
(657, 'Banco de Venezuela', '6720000.0000', 109, NULL, 'HABER', '2019-01-28 04:00:00', '88815669.7720', 'Compra', 0, '2019-04-14 03:55:53', '2019-04-14 04:16:32'),
(658, 'Banco de Venezuela', '8285160.3015', NULL, 23, 'DEBE', '2019-01-28 04:00:00', '97100830.0735', 'Venta', 0, '2019-04-14 04:01:23', '2019-04-14 04:16:32'),
(659, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-28 04:00:00', '651367.9320', 'Cierre de caja', 0, '2019-04-14 04:16:32', '2019-04-14 04:16:32'),
(660, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-29 04:00:00', '651367.9320', 'Inicio de caja', 0, '2019-04-14 04:16:32', '2019-04-14 16:35:44'),
(661, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-28 04:00:00', '97100830.0735', 'Cierre de caja', 0, '2019-04-14 04:16:32', '2019-04-14 04:16:32'),
(662, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-29 04:00:00', '97100830.0735', 'Inicio de caja', 0, '2019-04-14 04:16:32', '2019-04-14 16:35:44'),
(663, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-28 04:00:00', '835975.8600', 'Cierre de caja', 0, '2019-04-14 04:16:33', '2019-04-14 04:16:33'),
(664, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-29 04:00:00', '835975.8600', 'Inicio de caja', 0, '2019-04-14 04:16:33', '2019-04-14 16:35:44'),
(665, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-28 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 04:16:33', '2019-04-14 04:16:33'),
(666, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-29 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-14 04:16:33', '2019-04-14 16:35:44'),
(667, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-28 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 04:16:33', '2019-04-14 04:16:33'),
(668, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-29 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-14 04:16:33', '2019-04-14 16:35:44'),
(669, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-29 04:00:00', '651367.9320', 'Cierre de caja', 0, '2019-04-14 16:35:44', '2019-04-14 16:35:44'),
(670, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-30 04:00:00', '651367.9320', 'Inicio de caja', 0, '2019-04-14 16:35:44', '2019-04-14 17:00:55'),
(671, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-29 04:00:00', '97100830.0735', 'Cierre de caja', 0, '2019-04-14 16:35:44', '2019-04-14 16:35:44'),
(672, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-30 04:00:00', '97100830.0735', 'Inicio de caja', 0, '2019-04-14 16:35:44', '2019-04-14 17:00:56'),
(673, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-29 04:00:00', '835975.8600', 'Cierre de caja', 0, '2019-04-14 16:35:44', '2019-04-14 16:35:44'),
(674, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-30 04:00:00', '835975.8600', 'Inicio de caja', 0, '2019-04-14 16:35:44', '2019-04-14 17:00:56'),
(675, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-29 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 16:35:44', '2019-04-14 16:35:44'),
(676, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-30 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-14 16:35:44', '2019-04-14 17:00:56'),
(677, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-29 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 16:35:45', '2019-04-14 16:35:45'),
(678, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-30 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-14 16:35:45', '2019-04-14 17:00:56'),
(679, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-30 04:00:00', '651367.9320', 'Cierre de caja', 0, '2019-04-14 17:00:55', '2019-04-14 17:00:55'),
(680, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-31 04:00:00', '651367.9320', 'Inicio de caja', 0, '2019-04-14 17:00:55', '2019-04-14 22:02:57'),
(681, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-30 04:00:00', '97100830.0735', 'Cierre de caja', 0, '2019-04-14 17:00:56', '2019-04-14 17:00:56'),
(682, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-31 04:00:00', '97100830.0735', 'Inicio de caja', 0, '2019-04-14 17:00:56', '2019-04-14 22:02:57'),
(683, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-30 04:00:00', '835975.8600', 'Cierre de caja', 0, '2019-04-14 17:00:56', '2019-04-14 17:00:56'),
(684, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-31 04:00:00', '835975.8600', 'Inicio de caja', 0, '2019-04-14 17:00:56', '2019-04-14 22:02:57'),
(685, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-30 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 17:00:56', '2019-04-14 17:00:56'),
(686, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-31 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-14 17:00:56', '2019-04-14 22:02:57'),
(687, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-30 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 17:00:56', '2019-04-14 17:00:56'),
(688, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-31 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-04-14 17:00:56', '2019-04-14 22:02:58'),
(689, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-01-31 04:00:00', '651367.9320', 'Cierre de caja', 0, '2019-04-14 22:02:57', '2019-04-14 22:02:57'),
(690, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-02-01 04:00:00', '651367.9320', 'Inicio de caja', 1, '2019-04-14 22:02:57', '2019-04-14 22:02:57'),
(691, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-01-31 04:00:00', '97100830.0735', 'Cierre de caja', 0, '2019-04-14 22:02:57', '2019-04-14 22:02:57'),
(692, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-02-01 04:00:00', '97100830.0735', 'Inicio de caja', 1, '2019-04-14 22:02:57', '2019-04-14 22:02:57'),
(693, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-01-31 04:00:00', '835975.8600', 'Cierre de caja', 0, '2019-04-14 22:02:57', '2019-04-14 22:02:57'),
(694, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-02-01 04:00:00', '835975.8600', 'Inicio de caja', 1, '2019-04-14 22:02:57', '2019-04-14 22:02:57'),
(695, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-01-31 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 22:02:57', '2019-04-14 22:02:57'),
(696, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-02-01 04:00:00', '0.0000', 'Inicio de caja', 1, '2019-04-14 22:02:58', '2019-04-14 22:02:58'),
(697, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-01-31 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-04-14 22:02:58', '2019-04-14 22:02:58'),
(698, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-02-01 04:00:00', '0.0000', 'Inicio de caja', 1, '2019-04-14 22:02:58', '2019-04-14 22:02:58'),
(699, 'Banco de Venezuela', '3360000.0000', 110, NULL, 'HABER', '2019-02-01 04:00:00', '93740830.0735', 'Compra', 1, '2019-04-14 22:03:35', '2019-04-14 22:03:35'),
(700, 'Banco de Venezuela', '3360000.0000', 111, NULL, 'HABER', '2019-02-01 04:00:00', '90380830.0735', 'Compra', 1, '2019-04-14 22:11:16', '2019-04-14 22:11:16');

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

--
-- Volcado de datos para la tabla `cardexmp`
--

INSERT INTO `cardexmp` (`id`, `mp_codigo`, `comp_doc`, `car_costo`, `car_valor_anterior`, `car_valor_actual`, `car_alicuota`, `car_iva`, `car_compra_id`, `car_concepto`, `car_fecha`, `created_at`, `updated_at`) VALUES
(52, 'MP00000', '1542469134615', '45000.0000', '0.0000', '10.0000', '12%', '54000.0000', 58, NULL, NULL, '2019-02-14 10:20:34', '2019-02-14 10:20:34'),
(53, 'MP00003', '1542469134615', '30000.0000', '0.0000', '10.0000', '12%', '36000.0000', 58, NULL, NULL, '2019-02-14 10:20:34', '2019-02-14 10:20:34'),
(54, 'MP00010', '1542469134615', '2500.0000', '0.0000', '10.0000', '12%', '3000.0000', 58, NULL, NULL, '2019-02-14 10:20:34', '2019-02-14 10:20:34'),
(55, 'MP00009', '1542469134615', '4500.0000', '0.0000', '10.0000', '12%', '5400.0000', 58, NULL, NULL, '2019-02-14 10:20:34', '2019-02-14 10:20:34'),
(56, 'MP00000', '246456516145', '45000.0000', '10.0000', '30.0000', '12%', '108000.0000', 59, NULL, NULL, '2019-02-14 10:22:37', '2019-02-14 10:22:37'),
(57, 'MP00003', '246456516145', '30000.0000', '10.0000', '30.0000', '12%', '72000.0000', 59, NULL, NULL, '2019-02-14 10:22:37', '2019-02-14 10:22:37'),
(58, 'MP00010', '246456516145', '2500.0000', '10.0000', '30.0000', '12%', '6000.0000', 59, NULL, NULL, '2019-02-14 10:22:38', '2019-02-14 10:22:38'),
(59, 'MP00009', '246456516145', '4500.0000', '10.0000', '30.0000', '12%', '10800.0000', 59, NULL, NULL, '2019-02-14 10:22:38', '2019-02-14 10:22:38'),
(60, 'MP00000', '33565654564', '45000.0000', '30.0000', '60.0000', '12%', '162000.0000', 60, NULL, NULL, '2019-02-14 10:24:25', '2019-02-14 10:24:25'),
(61, 'MP00003', '33565654564', '30000.0000', '30.0000', '60.0000', '12%', '108000.0000', 60, NULL, NULL, '2019-02-14 10:24:25', '2019-02-14 10:24:25'),
(62, 'MP00010', '33565654564', '2500.0000', '30.0000', '60.0000', '12%', '9000.0000', 60, NULL, NULL, '2019-02-14 10:24:25', '2019-02-14 10:24:25'),
(63, 'MP00009', '33565654564', '4500.0000', '30.0000', '60.0000', '12%', '16200.0000', 60, NULL, NULL, '2019-02-14 10:24:25', '2019-02-14 10:24:25'),
(64, 'MP00008', '47563847564', '6000.0000', '0.0000', '15.0000', '12%', '10800.0000', 61, NULL, NULL, '2019-02-14 10:40:34', '2019-02-14 10:40:34'),
(65, 'MP00005', '47563847564', '6000.0000', '0.0000', '10.0000', '12%', '7200.0000', 61, NULL, NULL, '2019-02-14 10:40:34', '2019-02-14 10:40:34'),
(66, 'MP00006', '47563847564', '6400.0000', '0.0000', '10.0000', '12%', '7680.0000', 61, NULL, NULL, '2019-02-14 10:40:35', '2019-02-14 10:40:35'),
(67, 'MP00007', '47563847564', '9550.0000', '0.0000', '10.0000', '12%', '11460.0000', 61, NULL, NULL, '2019-02-14 10:40:35', '2019-02-14 10:40:35'),
(68, 'MP00000', NULL, NULL, '60.0000', '58.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-02', '2019-02-14 10:41:45', '2019-02-14 10:41:45'),
(69, 'MP00003', NULL, NULL, '60.0000', '58.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-02', '2019-02-14 10:41:46', '2019-02-14 10:41:46'),
(70, 'MP00010', NULL, NULL, '60.0000', '58.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-02', '2019-02-14 10:41:46', '2019-02-14 10:41:46'),
(71, 'MP00009', NULL, NULL, '60.0000', '58.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-02', '2019-02-14 10:41:46', '2019-02-14 10:41:46'),
(72, 'MP00008', NULL, NULL, '15.0000', '5.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-02', '2019-02-14 10:45:13', '2019-02-14 10:45:13'),
(73, 'MP00005', NULL, NULL, '10.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-02', '2019-02-14 10:45:13', '2019-02-14 10:45:13'),
(74, 'MP00006', NULL, NULL, '10.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-02', '2019-02-14 10:45:14', '2019-02-14 10:45:14'),
(75, 'MP00007', NULL, NULL, '10.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-02', '2019-02-14 10:45:14', '2019-02-14 10:45:14'),
(76, 'MI00005', '545846468468', '86981.0000', '0.0000', '50.0000', '12%', '521886.0000', 63, NULL, NULL, '2019-02-14 10:59:43', '2019-02-14 10:59:43'),
(77, 'MI00000', '545846468468', '34500.0000', '0.0000', '50.0000', '12%', '207000.0000', 63, NULL, NULL, '2019-02-14 10:59:44', '2019-02-14 10:59:44'),
(78, 'MI00001', '545846468468', '500000.0000', '0.0000', '50.0000', '12%', '3000000.0000', 63, NULL, NULL, '2019-02-14 10:59:44', '2019-02-14 10:59:44'),
(79, 'MI00016', '545846468468', '157000.0000', '0.0000', '50.0000', '12%', '942000.0000', 63, NULL, NULL, '2019-02-14 10:59:44', '2019-02-14 10:59:44'),
(80, 'MI00006', '545846468468', '13600.0000', '0.0000', '50.0000', '12%', '81600.0000', 63, NULL, NULL, '2019-02-14 10:59:44', '2019-02-14 10:59:44'),
(81, 'MI00011', '545846468468', '10000.0000', '0.0000', '50.0000', '12%', '60000.0000', 63, NULL, NULL, '2019-02-14 10:59:44', '2019-02-14 10:59:44'),
(82, 'MI00017', '545846468468', '7700.0000', '0.0000', '50.0000', '12%', '46200.0000', 63, NULL, NULL, '2019-02-14 10:59:44', '2019-02-14 10:59:44'),
(83, 'MI00018', '545846468468', '1000.0000', '0.0000', '50.0000', '12%', '6000.0000', 63, NULL, NULL, '2019-02-14 10:59:44', '2019-02-14 10:59:44'),
(84, 'MI00013', '545846468468', '3000.0000', '0.0000', '50.0000', '12%', '18000.0000', 63, NULL, NULL, '2019-02-14 10:59:45', '2019-02-14 10:59:45'),
(85, 'MI00019', '545846468468', '661.5000', '0.0000', '50.0000', '12%', '3969.0000', 63, NULL, NULL, '2019-02-14 10:59:45', '2019-02-14 10:59:45'),
(86, 'MI00012', '545846468468', '381.8200', '0.0000', '50.0000', '12%', '2290.9200', 63, NULL, NULL, '2019-02-14 10:59:45', '2019-02-14 10:59:45'),
(87, 'MI00020', '545846468468', '0.0000', '0.0000', '50.0000', '12%', '0.0000', 63, NULL, NULL, '2019-02-14 10:59:45', '2019-02-14 10:59:45'),
(88, 'MI00021', '545846468468', '0.0000', '0.0000', '50.0000', '12%', '0.0000', 63, NULL, NULL, '2019-02-14 10:59:45', '2019-02-14 10:59:45'),
(89, 'MI00024', '545846468468', '2000.0000', '0.0000', '50.0000', '12%', '12000.0000', 63, NULL, NULL, '2019-02-14 10:59:45', '2019-02-14 10:59:45'),
(90, 'MI00022', '545846468468', '1000.0000', '0.0000', '50.0000', '12%', '6000.0000', 63, NULL, NULL, '2019-02-14 10:59:46', '2019-02-14 10:59:46'),
(91, 'MI00023', '545846468468', '2875.0000', '0.0000', '50.0000', '12%', '17250.0000', 63, NULL, NULL, '2019-02-14 10:59:46', '2019-02-14 10:59:46'),
(92, 'MI00003', '545846468468', '3139.0000', '0.0000', '50.0000', '12%', '18834.0000', 63, NULL, NULL, '2019-02-14 10:59:46', '2019-02-14 10:59:46'),
(93, 'MI00025', '545846468468', '2000.0000', '0.0000', '50.0000', '12%', '12000.0000', 63, NULL, NULL, '2019-02-14 10:59:46', '2019-02-14 10:59:46'),
(94, 'MI00005', NULL, NULL, '50.0000', '48.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:28', '2019-02-14 11:03:28'),
(95, 'MI00000', NULL, NULL, '50.0000', '47.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:28', '2019-02-14 11:03:28'),
(96, 'MI00001', NULL, NULL, '50.0000', '45.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:29', '2019-02-14 11:03:29'),
(97, 'MI00016', NULL, NULL, '50.0000', '46.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:29', '2019-02-14 11:03:29'),
(98, 'MI00006', NULL, NULL, '50.0000', '47.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:29', '2019-02-14 11:03:29'),
(99, 'MI00011', NULL, NULL, '50.0000', '48.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:29', '2019-02-14 11:03:29'),
(100, 'MI00017', NULL, NULL, '50.0000', '46.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:29', '2019-02-14 11:03:29'),
(101, 'MI00018', NULL, NULL, '50.0000', '48.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:29', '2019-02-14 11:03:29'),
(102, 'MI00013', NULL, NULL, '50.0000', '47.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:30', '2019-02-14 11:03:30'),
(103, 'MI00019', NULL, NULL, '50.0000', '45.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:30', '2019-02-14 11:03:30'),
(104, 'MI00012', NULL, NULL, '50.0000', '46.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:30', '2019-02-14 11:03:30'),
(105, 'MI00020', NULL, NULL, '50.0000', '47.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:31', '2019-02-14 11:03:31'),
(106, 'MI00021', NULL, NULL, '50.0000', '46.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:31', '2019-02-14 11:03:31'),
(107, 'MI00024', NULL, NULL, '50.0000', '45.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:31', '2019-02-14 11:03:31'),
(108, 'MI00022', NULL, NULL, '50.0000', '46.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:31', '2019-02-14 11:03:31'),
(109, 'MI00023', NULL, NULL, '50.0000', '47.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:32', '2019-02-14 11:03:32'),
(110, 'MI00003', NULL, NULL, '50.0000', '45.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:32', '2019-02-14 11:03:32'),
(111, 'MI00025', NULL, NULL, '50.0000', '48.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-02', '2019-02-14 11:03:32', '2019-02-14 11:03:32'),
(112, 'MI00027', '9686954646', '10000.0000', '0.0000', '100.0000', '12%', '120000.0000', 64, NULL, NULL, '2019-02-14 11:05:22', '2019-02-14 11:05:22'),
(113, 'MI00007', '9686954646', '500.0000', '0.0000', '100.0000', '12%', '6000.0000', 64, NULL, NULL, '2019-02-14 11:05:22', '2019-02-14 11:05:22'),
(114, 'MI00027', NULL, NULL, '100.0000', '50.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-02', '2019-02-14 11:16:17', '2019-02-14 11:16:17'),
(115, 'MI00007', NULL, NULL, '100.0000', '92.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-02', '2019-02-14 11:16:17', '2019-02-14 11:16:17'),
(116, 'MI00027', NULL, NULL, '50.0000', '48.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-03', '2019-02-14 15:30:13', '2019-02-14 15:30:13'),
(117, 'MI00007', NULL, NULL, '92.0000', '90.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-03', '2019-02-14 15:30:13', '2019-02-14 15:30:13'),
(118, 'MI00000', NULL, NULL, '47.0000', '46.0000', NULL, NULL, NULL, 'Producción de Receta prueba A', '2019-01-03', '2019-02-14 16:16:24', '2019-02-14 16:16:24'),
(119, 'MI00019', NULL, NULL, '45.0000', '44.0000', NULL, NULL, NULL, 'Producción de receta prueba B', '2019-01-03', '2019-02-14 16:17:26', '2019-02-14 16:17:26'),
(120, 'MI00000', NULL, NULL, '46.0000', '45.0000', NULL, NULL, NULL, 'Producción de receta prueba c', '2019-01-03', '2019-02-14 16:19:43', '2019-02-14 16:19:43'),
(121, 'MI00000', '654625461613519', '34500.0000', '45.0000', '145.0000', '12%', '414000.0000', 65, NULL, NULL, '2019-02-15 00:07:55', '2019-02-15 00:07:55'),
(122, 'MI00002', '654625461613519', '9000.0000', '0.0000', '100.0000', '12%', '108000.0000', 65, NULL, NULL, '2019-02-15 00:07:55', '2019-02-15 00:07:55'),
(123, 'MI00021', '654625461613519', '0.0000', '46.0000', '146.0000', '12%', '0.0000', 65, NULL, NULL, '2019-02-15 00:07:55', '2019-02-15 00:07:55'),
(124, 'MP00000', '654625461613519', '45000.0000', '58.0000', '158.0000', '12%', '540000.0000', 65, NULL, NULL, '2019-02-15 00:07:55', '2019-02-15 00:07:55'),
(125, 'MP00001', '654625461613519', '4000.0000', '0.0000', '100.0000', '12%', '48000.0000', 65, NULL, NULL, '2019-02-15 00:07:55', '2019-02-15 00:07:55'),
(126, 'MI00026', '654625461613519', '1000000.0000', '0.0000', '100.0000', '12%', '12000000.0000', 65, NULL, NULL, '2019-02-15 00:07:55', '2019-02-15 00:07:55'),
(127, 'MI00003', '654625461613519', '3139.0000', '45.0000', '145.0000', '12%', '37668.0000', 65, NULL, NULL, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(128, 'MI00004', '654625461613519', '55555.5600', '0.0000', '100.0000', '12%', '666666.7200', 65, NULL, NULL, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(129, 'MI00005', '654625461613519', '86981.0000', '48.0000', '148.0000', '12%', '1043772.0000', 65, NULL, NULL, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(130, 'MP00002', '654625461613519', '0.0000', '0.0000', '100.0000', '12%', '0.0000', 65, NULL, NULL, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(131, 'MI00006', '654625461613519', '13600.0000', '47.0000', '147.0000', '12%', '163200.0000', 65, NULL, NULL, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(132, 'MI00008', '654625461613519', '500.0000', '0.0000', '100.0000', '12%', '6000.0000', 65, NULL, NULL, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(133, 'MI00007', '654625461613519', '500.0000', '90.0000', '190.0000', '12%', '6000.0000', 65, NULL, NULL, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(134, 'MI00010', '654625461613519', '600.0000', '0.0000', '100.0000', '12%', '7200.0000', 65, NULL, NULL, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(135, 'MI00009', '654625461613519', '300.0000', '0.0000', '100.0000', '12%', '3600.0000', 65, NULL, NULL, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(136, 'MI00025', '654625461613519', '2000.0000', '48.0000', '148.0000', '12%', '24000.0000', 65, NULL, NULL, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(137, 'MP00003', '654625461613519', '30000.0000', '58.0000', '158.0000', '12%', '360000.0000', 65, NULL, NULL, '2019-02-15 00:07:57', '2019-02-15 00:07:57'),
(138, 'MP00010', '654625461613519', '2500.0000', '58.0000', '158.0000', '12%', '30000.0000', 65, NULL, NULL, '2019-02-15 00:07:57', '2019-02-15 00:07:57'),
(139, 'MP00009', '654625461613519', '4500.0000', '58.0000', '158.0000', '12%', '54000.0000', 65, NULL, NULL, '2019-02-15 00:07:57', '2019-02-15 00:07:57'),
(140, 'MP00008', '654625461613519', '6000.0000', '5.0000', '105.0000', '12%', '72000.0000', 65, NULL, NULL, '2019-02-15 00:07:57', '2019-02-15 00:07:57'),
(141, 'MI00022', '654625461613519', '1000.0000', '46.0000', '146.0000', '12%', '12000.0000', 65, NULL, NULL, '2019-02-15 00:07:57', '2019-02-15 00:07:57'),
(142, 'MI00023', '654625461613519', '2875.0000', '47.0000', '147.0000', '12%', '34500.0000', 65, NULL, NULL, '2019-02-15 00:07:57', '2019-02-15 00:07:57'),
(143, 'MP00004', '654625461613519', '50000.0000', '0.0000', '100.0000', '12%', '600000.0000', 65, NULL, NULL, '2019-02-15 00:07:57', '2019-02-15 00:07:57'),
(144, 'MI00000', '654653516521', '34500.0000', '145.0000', '150.0000', '12%', '20700.0000', 66, NULL, NULL, '2019-02-15 00:28:47', '2019-02-15 00:28:47'),
(145, 'MP00000', NULL, NULL, '10.0000', '5.0000', NULL, NULL, NULL, 'Ajuste - 5 kilos dañados', '2019-03-25', '2019-03-25 09:08:47', '2019-03-25 09:08:47'),
(146, 'MP00000', '5466549151851', '45000.0000', '5.0000', '55.0000', '12%', '270000.0000', 73, NULL, NULL, '2019-03-25 09:34:54', '2019-03-25 09:34:54'),
(147, 'MP00003', '5466549151851', '30000.0000', '158.0000', '208.0000', '12%', '180000.0000', 73, NULL, NULL, '2019-03-25 09:34:54', '2019-03-25 09:34:54'),
(148, 'MP00010', '5466549151851', '2500.0000', '158.0000', '208.0000', '12%', '15000.0000', 73, NULL, NULL, '2019-03-25 09:34:54', '2019-03-25 09:34:54'),
(149, 'MP00009', '5466549151851', '4500.0000', '158.0000', '208.0000', '12%', '27000.0000', 73, NULL, NULL, '2019-03-25 09:34:54', '2019-03-25 09:34:54'),
(150, 'MP00008', '5466549151851', '6000.0000', '105.0000', '155.0000', '12%', '36000.0000', 73, NULL, NULL, '2019-03-25 09:34:54', '2019-03-25 09:34:54'),
(151, 'MP00005', '5466549151851', '6000.0000', '0.0000', '50.0000', '12%', '36000.0000', 73, NULL, NULL, '2019-03-25 09:34:54', '2019-03-25 09:34:54'),
(152, 'MP00006', '5466549151851', '6400.0000', '0.0000', '50.0000', '12%', '38400.0000', 73, NULL, NULL, '2019-03-25 09:34:54', '2019-03-25 09:34:54'),
(153, 'MP00007', '5466549151851', '9550.0000', '0.0000', '50.0000', '12%', '57300.0000', 73, NULL, NULL, '2019-03-25 09:34:55', '2019-03-25 09:34:55'),
(154, 'MP00000', NULL, NULL, '55.0000', '15.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-03', '2019-03-25 09:37:05', '2019-03-25 09:37:05'),
(155, 'MP00003', NULL, NULL, '208.0000', '168.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-03', '2019-03-25 09:37:05', '2019-03-25 09:37:05'),
(156, 'MP00010', NULL, NULL, '208.0000', '168.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-03', '2019-03-25 09:37:05', '2019-03-25 09:37:05'),
(157, 'MP00009', NULL, NULL, '208.0000', '168.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-03', '2019-03-25 09:37:06', '2019-03-25 09:37:06'),
(158, 'MP00008', NULL, NULL, '155.0000', '115.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-03', '2019-03-25 09:37:56', '2019-03-25 09:37:56'),
(159, 'MP00005', NULL, NULL, '50.0000', '10.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-03', '2019-03-25 09:37:56', '2019-03-25 09:37:56'),
(160, 'MP00006', NULL, NULL, '50.0000', '10.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-03', '2019-03-25 09:37:57', '2019-03-25 09:37:57'),
(161, 'MP00007', NULL, NULL, '50.0000', '10.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-03', '2019-03-25 09:37:57', '2019-03-25 09:37:57'),
(162, 'MI00005', NULL, NULL, '148.0000', '128.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:48', '2019-03-25 09:43:48'),
(163, 'MI00000', NULL, NULL, '145.0000', '125.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:49', '2019-03-25 09:43:49'),
(164, 'MI00001', NULL, NULL, '45.0000', '25.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:49', '2019-03-25 09:43:49'),
(165, 'MI00016', NULL, NULL, '46.0000', '26.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:49', '2019-03-25 09:43:49'),
(166, 'MI00006', NULL, NULL, '147.0000', '127.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:49', '2019-03-25 09:43:49'),
(167, 'MI00011', NULL, NULL, '48.0000', '28.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:49', '2019-03-25 09:43:49'),
(168, 'MI00017', NULL, NULL, '46.0000', '26.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:50', '2019-03-25 09:43:50'),
(169, 'MI00018', NULL, NULL, '48.0000', '28.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:50', '2019-03-25 09:43:50'),
(170, 'MI00013', NULL, NULL, '47.0000', '27.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:50', '2019-03-25 09:43:50'),
(171, 'MI00019', NULL, NULL, '44.0000', '24.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:50', '2019-03-25 09:43:50'),
(172, 'MI00012', NULL, NULL, '46.0000', '26.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:50', '2019-03-25 09:43:50'),
(173, 'MI00020', NULL, NULL, '47.0000', '27.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:51', '2019-03-25 09:43:51'),
(174, 'MI00021', NULL, NULL, '146.0000', '126.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:51', '2019-03-25 09:43:51'),
(175, 'MI00024', NULL, NULL, '45.0000', '25.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:51', '2019-03-25 09:43:51'),
(176, 'MI00022', NULL, NULL, '146.0000', '126.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:51', '2019-03-25 09:43:51'),
(177, 'MI00023', NULL, NULL, '147.0000', '127.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:52', '2019-03-25 09:43:52'),
(178, 'MI00003', NULL, NULL, '145.0000', '125.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:52', '2019-03-25 09:43:52'),
(179, 'MI00025', NULL, NULL, '148.0000', '128.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-04', '2019-03-25 09:43:52', '2019-03-25 09:43:52'),
(180, 'MI00027', '65646546515', '10000.0000', '48.0000', '88.0000', '12%', '48000.0000', 74, NULL, NULL, '2019-03-25 09:51:23', '2019-03-25 09:51:23'),
(181, 'MI00027', NULL, NULL, '88.0000', '5.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-04', '2019-03-25 09:52:43', '2019-03-25 09:52:43'),
(182, 'MI00007', NULL, NULL, '190.0000', '107.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-04', '2019-03-25 09:52:44', '2019-03-25 09:52:44'),
(183, 'MI00005', NULL, NULL, '128.0000', '123.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:32', '2019-04-03 05:59:32'),
(184, 'MI00000', NULL, NULL, '125.0000', '121.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:32', '2019-04-03 05:59:32'),
(185, 'MI00001', NULL, NULL, '25.0000', '22.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:32', '2019-04-03 05:59:32'),
(186, 'MI00016', NULL, NULL, '26.0000', '24.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:32', '2019-04-03 05:59:32'),
(187, 'MI00006', NULL, NULL, '127.0000', '121.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:32', '2019-04-03 05:59:32'),
(188, 'MI00011', NULL, NULL, '28.0000', '26.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:32', '2019-04-03 05:59:32'),
(189, 'MI00017', NULL, NULL, '26.0000', '23.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:33', '2019-04-03 05:59:33'),
(190, 'MI00018', NULL, NULL, '28.0000', '25.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:33', '2019-04-03 05:59:33'),
(191, 'MI00013', NULL, NULL, '27.0000', '24.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:33', '2019-04-03 05:59:33'),
(192, 'MI00019', NULL, NULL, '24.0000', '22.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:33', '2019-04-03 05:59:33'),
(193, 'MI00012', NULL, NULL, '26.0000', '25.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:33', '2019-04-03 05:59:33'),
(194, 'MI00020', NULL, NULL, '27.0000', '25.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:33', '2019-04-03 05:59:33'),
(195, 'MI00021', NULL, NULL, '126.0000', '123.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:33', '2019-04-03 05:59:33'),
(196, 'MI00024', NULL, NULL, '25.0000', '24.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:34', '2019-04-03 05:59:34'),
(197, 'MI00022', NULL, NULL, '126.0000', '124.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:34', '2019-04-03 05:59:34'),
(198, 'MI00023', NULL, NULL, '127.0000', '126.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:34', '2019-04-03 05:59:34'),
(199, 'MI00003', NULL, NULL, '125.0000', '123.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:34', '2019-04-03 05:59:34'),
(200, 'MI00025', NULL, NULL, '128.0000', '126.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-05', '2019-04-03 05:59:34', '2019-04-03 05:59:34'),
(201, 'MI00027', '56555168413515', '10000.0000', '5.0000', '105.0000', '12%', '120000.0000', 75, NULL, NULL, '2019-04-05 03:35:42', '2019-04-05 03:35:42'),
(202, 'MI00027', NULL, NULL, '105.0000', '97.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-06', '2019-04-05 03:36:33', '2019-04-05 03:36:33'),
(203, 'MI00007', NULL, NULL, '107.0000', '99.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-06', '2019-04-05 03:36:33', '2019-04-05 03:36:33'),
(204, 'MP00000', '827328382329', '45000.0000', '15.0000', '165.0000', '12%', '810000.0000', 76, NULL, NULL, '2019-04-05 18:38:06', '2019-04-05 18:38:06'),
(205, 'MP00000', NULL, NULL, '165.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-06', '2019-04-05 18:41:30', '2019-04-05 18:41:30'),
(206, 'MP00003', NULL, NULL, '168.0000', '3.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-06', '2019-04-05 18:41:30', '2019-04-05 18:41:30'),
(207, 'MP00010', NULL, NULL, '168.0000', '3.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-06', '2019-04-05 18:41:30', '2019-04-05 18:41:30'),
(208, 'MP00009', NULL, NULL, '168.0000', '3.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-06', '2019-04-05 18:41:30', '2019-04-05 18:41:30'),
(209, 'MP00008', '661616516515', '6000.0000', '115.0000', '165.0000', '12%', '36000.0000', 77, NULL, NULL, '2019-04-05 18:47:05', '2019-04-05 18:47:05'),
(210, 'MP00005', '661616516515', '6000.0000', '10.0000', '165.0000', '12%', '111600.0000', 77, NULL, NULL, '2019-04-05 18:47:05', '2019-04-05 18:47:05'),
(211, 'MP00006', '661616516515', '6400.0000', '10.0000', '165.0000', '12%', '119040.0000', 77, NULL, NULL, '2019-04-05 18:47:05', '2019-04-05 18:47:05'),
(212, 'MP00007', '661616516515', '9550.0000', '10.0000', '165.0000', '12%', '177630.0000', 77, NULL, NULL, '2019-04-05 18:47:05', '2019-04-05 18:47:05'),
(213, 'MP00008', NULL, NULL, '165.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-06', '2019-04-05 18:48:26', '2019-04-05 18:48:26'),
(214, 'MP00005', NULL, NULL, '165.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-06', '2019-04-05 18:48:26', '2019-04-05 18:48:26'),
(215, 'MP00006', NULL, NULL, '165.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-06', '2019-04-05 18:48:27', '2019-04-05 18:48:27'),
(216, 'MP00007', NULL, NULL, '165.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-06', '2019-04-05 18:48:27', '2019-04-05 18:48:27'),
(217, 'MI00019', '743746287468', '661.5000', '22.0000', '402.0000', '12%', '30164.4000', 78, NULL, NULL, '2019-04-05 19:04:40', '2019-04-05 19:04:40'),
(218, 'MI00013', '743746287468', '3000.0000', '24.0000', '404.0000', '12%', '136800.0000', 78, NULL, NULL, '2019-04-05 19:04:40', '2019-04-05 19:04:40'),
(219, 'MI00005', '9376423723324', '86981.0000', '123.0000', '750.0000', '12%', '6544450.4400', 80, NULL, NULL, '2019-04-06 07:46:39', '2019-04-06 07:46:39'),
(220, 'MI00000', '9376423723324', '34500.0000', '121.0000', '200.0000', '12%', '327060.0000', 80, NULL, NULL, '2019-04-06 07:46:40', '2019-04-06 07:46:40'),
(221, 'MI00001', '9376423723324', '500000.0000', '22.0000', '50.0000', '12%', '1680000.0000', 80, NULL, NULL, '2019-04-06 07:46:40', '2019-04-06 07:46:40'),
(222, 'MI00016', '9376423723324', '157000.0000', '24.0000', '196.0000', '12%', '3240480.0000', 80, NULL, NULL, '2019-04-06 07:46:40', '2019-04-06 07:46:40'),
(223, 'MI00011', '9376423723324', '10000.0000', '26.0000', '100.0000', '12%', '88800.0000', 80, NULL, NULL, '2019-04-06 07:46:40', '2019-04-06 07:46:40'),
(224, 'MI00017', '9376423723324', '7700.0000', '23.0000', '100.0000', '12%', '71148.0000', 80, NULL, NULL, '2019-04-06 07:46:40', '2019-04-06 07:46:40'),
(225, 'MI00018', '9376423723324', '1000.0000', '25.0000', '50.0000', '12%', '3000.0000', 80, NULL, NULL, '2019-04-06 07:46:40', '2019-04-06 07:46:40'),
(226, 'MI00013', '9376423723324', '3000.0000', '404.0000', '4608.0000', '12%', '1513440.0000', 80, NULL, NULL, '2019-04-06 07:46:40', '2019-04-06 07:46:40'),
(227, 'MI00019', '9376423723324', '661.5000', '402.0000', '4606.0000', '12%', '333713.5200', 80, NULL, NULL, '2019-04-06 07:46:40', '2019-04-06 07:46:40'),
(228, 'MI00024', '9376423723324', '2000.0000', '24.0000', '74.0000', '12%', '12000.0000', 80, NULL, NULL, '2019-04-06 07:46:40', '2019-04-06 07:46:40'),
(229, 'MI00022', '9376423723324', '1000.0000', '124.0000', '126.0000', '12%', '240.0000', 80, NULL, NULL, '2019-04-06 07:46:40', '2019-04-06 07:46:40'),
(230, 'MI00020', '495834957834', '0.0000', '25.0000', '1000024.0000', '12%', '0.0000', 81, NULL, NULL, '2019-04-06 07:51:22', '2019-04-06 07:51:22'),
(231, 'MI00012', '58437583454', '381.8200', '25.0000', '225.0000', '12%', '9163.6800', 82, NULL, NULL, '2019-04-06 07:53:20', '2019-04-06 07:53:20'),
(232, 'MI00021', '75367853845', '0.0000', '123.0000', '1000122.0000', '12%', '0.0000', 83, NULL, NULL, '2019-04-06 07:55:39', '2019-04-06 07:55:39'),
(233, 'MI00016', '7857657578', '157000.0000', '196.0000', '200.0000', '12%', '75360.0000', 84, NULL, NULL, '2019-04-06 07:57:55', '2019-04-06 07:57:55'),
(234, 'MI00005', NULL, NULL, '750.0000', '0.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:14', '2019-04-06 07:59:14'),
(235, 'MI00000', NULL, NULL, '200.0000', '0.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:15', '2019-04-06 07:59:15'),
(236, 'MI00001', NULL, NULL, '50.0000', '0.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:15', '2019-04-06 07:59:15'),
(237, 'MI00016', NULL, NULL, '200.0000', '0.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:15', '2019-04-06 07:59:15'),
(238, 'MI00006', NULL, NULL, '121.0000', '21.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:15', '2019-04-06 07:59:15'),
(239, 'MI00011', NULL, NULL, '100.0000', '0.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:15', '2019-04-06 07:59:15'),
(240, 'MI00017', NULL, NULL, '100.0000', '0.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:15', '2019-04-06 07:59:15'),
(241, 'MI00018', NULL, NULL, '50.0000', '0.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:16', '2019-04-06 07:59:16'),
(242, 'MI00013', NULL, NULL, '4608.0000', '2.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:16', '2019-04-06 07:59:16'),
(243, 'MI00019', NULL, NULL, '4606.0000', '0.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:16', '2019-04-06 07:59:16'),
(244, 'MI00012', NULL, NULL, '225.0000', '125.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:16', '2019-04-06 07:59:16'),
(245, 'MI00020', NULL, NULL, '1000024.0000', '999924.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:16', '2019-04-06 07:59:16'),
(246, 'MI00021', NULL, NULL, '1000122.0000', '1000022.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:16', '2019-04-06 07:59:16'),
(247, 'MI00024', NULL, NULL, '74.0000', '24.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:17', '2019-04-06 07:59:17'),
(248, 'MI00022', NULL, NULL, '126.0000', '124.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:17', '2019-04-06 07:59:17'),
(249, 'MI00023', NULL, NULL, '126.0000', '116.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:17', '2019-04-06 07:59:17'),
(250, 'MI00003', NULL, NULL, '123.0000', '121.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:17', '2019-04-06 07:59:17'),
(251, 'MI00025', NULL, NULL, '126.0000', '26.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-07', '2019-04-06 07:59:17', '2019-04-06 07:59:17'),
(252, 'MI00027', NULL, NULL, '97.0000', '77.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-07', '2019-04-06 08:39:59', '2019-04-06 08:39:59'),
(253, 'MI00007', NULL, NULL, '99.0000', '79.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-07', '2019-04-06 08:39:59', '2019-04-06 08:39:59'),
(254, 'MI00027', NULL, NULL, '77.0000', '57.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-08', '2019-04-06 08:41:51', '2019-04-06 08:41:51'),
(255, 'MI00007', NULL, NULL, '79.0000', '59.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-08', '2019-04-06 08:41:51', '2019-04-06 08:41:51'),
(256, 'MI00027', NULL, NULL, '57.0000', '47.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-09', '2019-04-06 08:46:09', '2019-04-06 08:46:09'),
(257, 'MI00007', NULL, NULL, '59.0000', '49.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-09', '2019-04-06 08:46:09', '2019-04-06 08:46:09'),
(258, 'MI00027', NULL, NULL, '47.0000', '37.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-10', '2019-04-06 08:50:32', '2019-04-06 08:50:32'),
(259, 'MI00007', NULL, NULL, '49.0000', '39.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-10', '2019-04-06 08:50:32', '2019-04-06 08:50:32'),
(260, 'MI00027', NULL, NULL, '37.0000', '27.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-11', '2019-04-06 09:07:46', '2019-04-06 09:07:46'),
(261, 'MI00007', NULL, NULL, '39.0000', '29.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-11', '2019-04-06 09:07:46', '2019-04-06 09:07:46'),
(262, 'MI00027', NULL, NULL, '27.0000', '12.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-12', '2019-04-06 09:16:34', '2019-04-06 09:16:34'),
(263, 'MI00007', NULL, NULL, '29.0000', '14.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-12', '2019-04-06 09:16:34', '2019-04-06 09:16:34'),
(264, 'MI00027', NULL, NULL, '12.0000', '2.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-13', '2019-04-06 11:47:03', '2019-04-06 11:47:03'),
(265, 'MI00007', NULL, NULL, '14.0000', '4.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-13', '2019-04-06 11:47:04', '2019-04-06 11:47:04'),
(266, 'MI00027', '546516150315', '10000.0000', '2.0000', '202.0000', '12%', '240000.0000', 85, NULL, NULL, '2019-04-06 11:50:29', '2019-04-06 11:50:29'),
(267, 'MI00007', '546516150315', '500.0000', '4.0000', '204.0000', '12%', '12000.0000', 85, NULL, NULL, '2019-04-06 11:50:30', '2019-04-06 11:50:30'),
(268, 'MI00027', NULL, NULL, '202.0000', '192.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-14', '2019-04-06 11:50:59', '2019-04-06 11:50:59'),
(269, 'MI00007', NULL, NULL, '204.0000', '194.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-14', '2019-04-06 11:50:59', '2019-04-06 11:50:59'),
(270, 'MI00027', NULL, NULL, '192.0000', '182.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-15', '2019-04-06 11:52:48', '2019-04-06 11:52:48'),
(271, 'MI00007', NULL, NULL, '194.0000', '184.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-15', '2019-04-06 11:52:48', '2019-04-06 11:52:48'),
(272, 'MI00027', NULL, NULL, '182.0000', '172.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-16', '2019-04-06 11:56:50', '2019-04-06 11:56:50'),
(273, 'MI00007', NULL, NULL, '184.0000', '174.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-16', '2019-04-06 11:56:50', '2019-04-06 11:56:50'),
(274, 'MI00027', NULL, NULL, '172.0000', '47.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-17', '2019-04-06 12:01:55', '2019-04-06 12:01:55'),
(275, 'MI00007', NULL, NULL, '174.0000', '49.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-17', '2019-04-06 12:01:55', '2019-04-06 12:01:55'),
(276, 'MI00007', '845148616516818', '500.0000', '49.0000', '104.0000', '12%', '3300.0000', 86, NULL, NULL, '2019-04-06 12:18:20', '2019-04-06 12:18:20'),
(277, 'MI00027', '845148616516818', '10000.0000', '47.0000', '102.0000', '12%', '66000.0000', 86, NULL, NULL, '2019-04-06 12:18:20', '2019-04-06 12:18:20'),
(278, 'MI00027', NULL, NULL, '102.0000', '2.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-18', '2019-04-06 12:19:11', '2019-04-06 12:19:11'),
(279, 'MI00007', NULL, NULL, '104.0000', '4.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-18', '2019-04-06 12:19:12', '2019-04-06 12:19:12'),
(280, 'MI00000', '54685614682', '34500.0000', '0.0000', '100.0000', '12%', '414000.0000', 87, NULL, NULL, '2019-04-06 23:02:27', '2019-04-06 23:02:27'),
(281, 'MI00000', NULL, NULL, '100.0000', '1.0000', NULL, NULL, NULL, 'Producción de receta prueba c', '2019-01-18', '2019-04-06 23:02:43', '2019-04-06 23:02:43'),
(282, 'MI00027', '98757384573', '10000.0000', '2.0000', '34.0000', '12%', '38400.0000', 88, NULL, NULL, '2019-04-06 23:08:11', '2019-04-06 23:08:11'),
(283, 'MI00007', '98757384573', '500.0000', '4.0000', '34.0000', '12%', '1800.0000', 88, NULL, NULL, '2019-04-06 23:08:11', '2019-04-06 23:08:11'),
(284, 'MI00027', NULL, NULL, '34.0000', '0.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-19', '2019-04-06 23:14:53', '2019-04-06 23:14:53'),
(285, 'MI00007', NULL, NULL, '34.0000', '0.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-19', '2019-04-06 23:14:53', '2019-04-06 23:14:53'),
(286, 'MI00019', '54468468816318', '661.5000', '0.0000', '99.0000', '12%', '7858.6200', 89, NULL, NULL, '2019-04-06 23:18:20', '2019-04-06 23:18:20'),
(287, 'MI00019', NULL, NULL, '99.0000', '0.0000', NULL, NULL, NULL, 'Producción de receta prueba B', '2019-01-19', '2019-04-06 23:18:43', '2019-04-06 23:18:43'),
(288, 'MI00000', '354895131864', '34500.0000', '1.0000', '99.0000', '12%', '405720.0000', 90, NULL, NULL, '2019-04-06 23:19:13', '2019-04-06 23:19:13'),
(289, 'MI00000', NULL, NULL, '99.0000', '0.0000', NULL, NULL, NULL, 'Producción de receta prueba c', '2019-01-19', '2019-04-06 23:20:03', '2019-04-06 23:20:03'),
(290, 'MI00000', '7836487246', '34500.0000', '0.0000', '300.0000', '12%', '1242000.0000', 91, NULL, NULL, '2019-04-09 05:40:04', '2019-04-09 05:40:04'),
(291, 'MI00000', NULL, NULL, '300.0000', '0.0000', NULL, NULL, NULL, 'Producción de Receta prueba A', '2019-01-20', '2019-04-09 05:56:14', '2019-04-09 05:56:14'),
(292, 'MI00019', '38747836473', '661.5000', '0.0000', '300.0000', '12%', '23814.0000', 92, NULL, NULL, '2019-04-09 05:57:28', '2019-04-09 05:57:28'),
(293, 'MI00019', NULL, NULL, '300.0000', '0.0000', NULL, NULL, NULL, 'Producción de receta prueba B', '2019-01-20', '2019-04-09 05:57:39', '2019-04-09 05:57:39'),
(294, 'MI00000', '732617273271637', '34500.0000', '0.0000', '300.0000', '12%', '1242000.0000', 93, NULL, NULL, '2019-04-09 05:59:05', '2019-04-09 05:59:05'),
(295, 'MI00000', NULL, NULL, '300.0000', '0.0000', NULL, NULL, NULL, 'Producción de receta prueba c', '2019-01-20', '2019-04-09 05:59:11', '2019-04-09 05:59:11'),
(296, 'MP00000', '312732327326', '45000.0000', '0.0000', '500.0000', '12%', '2700000.0000', 94, NULL, NULL, '2019-04-09 20:26:52', '2019-04-09 20:26:52'),
(297, 'MP00003', '312732327326', '30000.0000', '3.0000', '503.0000', '12%', '1800000.0000', 94, NULL, NULL, '2019-04-09 20:26:52', '2019-04-09 20:26:52'),
(298, 'MP00010', '312732327326', '2500.0000', '3.0000', '503.0000', '12%', '150000.0000', 94, NULL, NULL, '2019-04-09 20:26:52', '2019-04-09 20:26:52'),
(299, 'MP00009', '312732327326', '4500.0000', '3.0000', '503.0000', '12%', '270000.0000', 94, NULL, NULL, '2019-04-09 20:26:52', '2019-04-09 20:26:52'),
(300, 'MP00008', '312732327326', '6000.0000', '0.0000', '500.0000', '12%', '360000.0000', 94, NULL, NULL, '2019-04-09 20:26:52', '2019-04-09 20:26:52'),
(301, 'MP00005', '312732327326', '6000.0000', '0.0000', '500.0000', '12%', '360000.0000', 94, NULL, NULL, '2019-04-09 20:26:52', '2019-04-09 20:26:52'),
(302, 'MP00006', '312732327326', '6400.0000', '0.0000', '500.0000', '12%', '384000.0000', 94, NULL, NULL, '2019-04-09 20:26:52', '2019-04-09 20:26:52'),
(303, 'MP00007', '312732327326', '9550.0000', '0.0000', '500.0000', '12%', '573000.0000', 94, NULL, NULL, '2019-04-09 20:26:52', '2019-04-09 20:26:52'),
(304, 'MP00000', NULL, NULL, '500.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-20', '2019-04-09 20:35:56', '2019-04-09 20:35:56'),
(305, 'MP00003', NULL, NULL, '503.0000', '3.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-20', '2019-04-09 20:35:56', '2019-04-09 20:35:56'),
(306, 'MP00010', NULL, NULL, '503.0000', '3.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-20', '2019-04-09 20:35:56', '2019-04-09 20:35:56'),
(307, 'MP00009', NULL, NULL, '503.0000', '3.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-01-20', '2019-04-09 20:35:56', '2019-04-09 20:35:56'),
(308, 'MP00008', NULL, NULL, '500.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-20', '2019-04-09 20:36:36', '2019-04-09 20:36:36'),
(309, 'MP00005', NULL, NULL, '500.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-20', '2019-04-09 20:36:36', '2019-04-09 20:36:36'),
(310, 'MP00006', NULL, NULL, '500.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-20', '2019-04-09 20:36:37', '2019-04-09 20:36:37'),
(311, 'MP00007', NULL, NULL, '500.0000', '0.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-01-20', '2019-04-09 20:36:37', '2019-04-09 20:36:37'),
(312, 'MI00005', '73864748376423764', '86981.0000', '0.0000', '1700.0000', '12%', '17744124.0000', 95, NULL, NULL, '2019-04-09 20:47:13', '2019-04-09 20:47:13'),
(313, 'MI00000', '73864748376423764', '34500.0000', '0.0000', '500.0000', '12%', '2070000.0000', 95, NULL, NULL, '2019-04-09 20:47:13', '2019-04-09 20:47:13'),
(314, 'MI00001', '73864748376423764', '500000.0000', '0.0000', '120.0000', '12%', '7200000.0000', 95, NULL, NULL, '2019-04-09 20:47:14', '2019-04-09 20:47:14'),
(315, 'MI00016', '73864748376423764', '157000.0000', '0.0000', '500.0000', '12%', '9420000.0000', 95, NULL, NULL, '2019-04-09 20:47:14', '2019-04-09 20:47:14'),
(316, 'MI00006', '73864748376423764', '13600.0000', '21.0000', '271.0000', '12%', '408000.0000', 95, NULL, NULL, '2019-04-09 20:47:14', '2019-04-09 20:47:14'),
(317, 'MI00011', '73864748376423764', '10000.0000', '0.0000', '250.0000', '12%', '300000.0000', 95, NULL, NULL, '2019-04-09 20:47:14', '2019-04-09 20:47:14'),
(318, 'MI00017', '73864748376423764', '7700.0000', '0.0000', '250.0000', '12%', '231000.0000', 95, NULL, NULL, '2019-04-09 20:47:14', '2019-04-09 20:47:14'),
(319, 'MI00013', '73864748376423764', '3000.0000', '2.0000', '11517.0000', '12%', '4145400.0000', 95, NULL, NULL, '2019-04-09 20:47:14', '2019-04-09 20:47:14'),
(320, 'MI00019', '73864748376423764', '661.5000', '0.0000', '11515.0000', '12%', '914060.7000', 95, NULL, NULL, '2019-04-09 20:47:14', '2019-04-09 20:47:14'),
(321, 'MI00020', '73864748376423764', '0.0000', '999924.0000', '1000174.0000', '12%', '0.0000', 95, NULL, NULL, '2019-04-09 20:47:14', '2019-04-09 20:47:14'),
(322, 'MI00021', '73864748376423764', '0.0000', '1000022.0000', '1000272.0000', '12%', '0.0000', 95, NULL, NULL, '2019-04-09 20:47:15', '2019-04-09 20:47:15'),
(323, 'MI00024', '73864748376423764', '2000.0000', '24.0000', '144.0000', '12%', '28800.0000', 95, NULL, NULL, '2019-04-09 20:47:15', '2019-04-09 20:47:15'),
(324, 'MI00022', '73864748376423764', '1000.0000', '124.0000', '129.0000', '12%', '600.0000', 95, NULL, NULL, '2019-04-09 20:47:15', '2019-04-09 20:47:15'),
(325, 'MI00023', '73864748376423764', '2875.0000', '116.0000', '141.0000', '12%', '8625.0000', 95, NULL, NULL, '2019-04-09 20:47:15', '2019-04-09 20:47:15'),
(326, 'MI00003', '73864748376423764', '3139.0000', '121.0000', '126.0000', '12%', '1883.4000', 95, NULL, NULL, '2019-04-09 20:47:15', '2019-04-09 20:47:15'),
(327, 'MI00025', '73864748376423764', '2000.0000', '26.0000', '276.0000', '12%', '60000.0000', 95, NULL, NULL, '2019-04-09 20:47:15', '2019-04-09 20:47:15'),
(328, 'MI00005', NULL, NULL, '1700.0000', '200.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-20', '2019-04-09 20:55:10', '2019-04-09 20:55:10'),
(329, 'MI00018', '84654378653784654', '1000.0000', '0.0000', '125.0000', '12%', '15000.0000', 96, NULL, NULL, '2019-04-09 21:25:51', '2019-04-09 21:25:51'),
(330, 'MI00012', '4733784623781982378', '381.8200', '125.0000', '325.0000', '12%', '9163.6800', 97, NULL, NULL, '2019-04-09 21:32:22', '2019-04-09 21:32:22'),
(331, 'MI00005', NULL, NULL, '1700.0000', '200.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:09', '2019-04-09 21:34:09'),
(332, 'MI00000', NULL, NULL, '500.0000', '100.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:09', '2019-04-09 21:34:09'),
(333, 'MI00001', NULL, NULL, '120.0000', '20.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:09', '2019-04-09 21:34:09'),
(334, 'MI00016', NULL, NULL, '500.0000', '100.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:09', '2019-04-09 21:34:09'),
(335, 'MI00006', NULL, NULL, '271.0000', '71.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:09', '2019-04-09 21:34:09'),
(336, 'MI00011', NULL, NULL, '250.0000', '50.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:09', '2019-04-09 21:34:09'),
(337, 'MI00017', NULL, NULL, '250.0000', '50.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:09', '2019-04-09 21:34:09'),
(338, 'MI00018', NULL, NULL, '125.0000', '25.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:10', '2019-04-09 21:34:10'),
(339, 'MI00013', NULL, NULL, '11517.0000', '2305.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:10', '2019-04-09 21:34:10'),
(340, 'MI00019', NULL, NULL, '11515.0000', '2303.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:10', '2019-04-09 21:34:10'),
(341, 'MI00012', NULL, NULL, '325.0000', '125.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:10', '2019-04-09 21:34:10'),
(342, 'MI00020', NULL, NULL, '1000174.0000', '999974.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:10', '2019-04-09 21:34:10'),
(343, 'MI00021', NULL, NULL, '1000272.0000', '1000072.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:10', '2019-04-09 21:34:10'),
(344, 'MI00024', NULL, NULL, '144.0000', '44.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:10', '2019-04-09 21:34:10'),
(345, 'MI00022', NULL, NULL, '129.0000', '125.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:10', '2019-04-09 21:34:10'),
(346, 'MI00023', NULL, NULL, '141.0000', '121.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:10', '2019-04-09 21:34:10'),
(347, 'MI00003', NULL, NULL, '126.0000', '122.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:11', '2019-04-09 21:34:11'),
(348, 'MI00025', NULL, NULL, '276.0000', '76.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-01-21', '2019-04-09 21:34:11', '2019-04-09 21:34:11'),
(349, 'MI00027', '8374834837421312', '10000.0000', '0.0000', '9212.0000', '12%', '11054400.0000', 98, NULL, NULL, '2019-04-09 21:38:59', '2019-04-09 21:38:59'),
(350, 'MI00007', '8374834837421312', '500.0000', '0.0000', '9212.0000', '12%', '552720.0000', 98, NULL, NULL, '2019-04-09 21:38:59', '2019-04-09 21:38:59'),
(351, 'MI00027', NULL, NULL, '9212.0000', '0.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-21', '2019-04-09 21:39:07', '2019-04-09 21:39:07'),
(352, 'MI00007', NULL, NULL, '9212.0000', '0.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-01-21', '2019-04-09 21:39:07', '2019-04-09 21:39:07');
INSERT INTO `cardexmp` (`id`, `mp_codigo`, `comp_doc`, `car_costo`, `car_valor_anterior`, `car_valor_actual`, `car_alicuota`, `car_iva`, `car_compra_id`, `car_concepto`, `car_fecha`, `created_at`, `updated_at`) VALUES
(353, 'MI00000', '1233746374', '34500.0000', '100.0000', '105.0000', '12%', '20700.0000', 99, NULL, NULL, '2019-04-11 23:42:48', '2019-04-11 23:42:48'),
(355, 'MP00008', '387497246347364', '6000.0000', '0.0000', '1.0000', '12%', '720.0000', 100, NULL, NULL, '2019-04-13 01:51:14', '2019-04-13 01:51:14'),
(356, 'MP00005', '387497246347364', '6000.0000', '0.0000', '2.0000', '12%', '1440.0000', 100, NULL, NULL, '2019-04-13 01:51:14', '2019-04-13 01:51:14'),
(357, 'MP00006', '387497246347364', '6400.0000', '0.0000', '3.0000', '12%', '2304.0000', 100, NULL, NULL, '2019-04-13 01:51:15', '2019-04-13 01:51:15'),
(358, 'MP00007', '387497246347364', '9550.0000', '0.0000', '4.0000', '12%', '4584.0000', 100, NULL, NULL, '2019-04-13 01:51:15', '2019-04-13 01:51:15'),
(359, 'MI00000', '32748736473', '34500.0000', '105.0000', '106.0000', '12%', '4140.0000', 102, NULL, NULL, '2019-04-13 03:32:07', '2019-04-13 03:32:07'),
(360, 'MI00002', '32748736473', '9000.0000', '100.0000', '102.0000', '12%', '2160.0000', 102, NULL, NULL, '2019-04-13 03:32:07', '2019-04-13 03:32:07'),
(361, 'MI00000', '278346274', '34500.0000', '106.0000', '107.0000', '12%', '4140.0000', 103, NULL, NULL, '2019-04-13 03:41:32', '2019-04-13 03:41:32'),
(362, 'MP00003', '54666251856', '30000.0000', '3.0000', '5.0000', '12%', '7200.0000', 104, NULL, NULL, '2019-04-13 03:55:10', '2019-04-13 03:55:10'),
(363, 'MP00010', '54666251856', '2500.0000', '3.0000', '7.0000', '12%', '1200.0000', 104, NULL, NULL, '2019-04-13 03:55:10', '2019-04-13 03:55:10'),
(364, 'MI00000', '65665184618861861', '34500.0000', '107.0000', '108.0000', '12%', '4140.0000', 105, NULL, NULL, '2019-04-13 04:17:01', '2019-04-13 04:17:01'),
(365, 'MP00000', '65665184618861861', '45000.0000', '0.0000', '2.0000', '12%', '10800.0000', 105, NULL, NULL, '2019-04-13 04:17:01', '2019-04-13 04:17:01'),
(366, 'MP00030', '372467463742834', '50000.0000', '0.0000', '1.0000', '12%', '6000.0000', 106, NULL, NULL, '2019-04-13 14:16:25', '2019-04-13 14:16:25'),
(367, 'MI00000', '3784632746734', '30000.0000', '108.0000', '109.0000', '12%', '3600.0000', 107, NULL, NULL, '2019-04-13 14:25:49', '2019-04-13 14:25:49'),
(368, 'MP00031', '7364747424', '47543.0000', '0.0000', '1.0000', '12%', '5705.1600', 108, NULL, NULL, '2019-04-13 14:43:41', '2019-04-13 14:43:41'),
(369, 'MI00000', NULL, NULL, '109.0000', '108.0000', NULL, NULL, NULL, 'Ajuste - Un litro perdido por derrame', '2019-04-13', '2019-04-13 23:52:27', '2019-04-13 23:52:27'),
(370, 'MI00000', NULL, NULL, '108.0000', '93.0000', NULL, NULL, NULL, 'Producción de Receta prueba A', '2019-01-25', '2019-04-14 02:09:10', '2019-04-14 02:09:10'),
(371, 'MI00019', NULL, NULL, '2303.0000', '2289.0000', NULL, NULL, NULL, 'Producción de receta prueba B', '2019-01-25', '2019-04-14 02:09:55', '2019-04-14 02:09:55'),
(372, 'MI00000', NULL, NULL, '93.0000', '81.0000', NULL, NULL, NULL, 'Producción de receta prueba c', '2019-01-25', '2019-04-14 02:10:35', '2019-04-14 02:10:35'),
(373, 'MI00000', NULL, NULL, '81.0000', '71.0000', NULL, NULL, NULL, 'Producción de Receta prueba A', '2019-01-26', '2019-04-14 03:18:30', '2019-04-14 03:18:30'),
(374, 'MI00019', NULL, NULL, '2289.0000', '2287.0000', NULL, NULL, NULL, 'Producción de receta prueba B', '2019-01-26', '2019-04-14 03:21:05', '2019-04-14 03:21:05'),
(375, 'MI00000', NULL, NULL, '71.0000', '1.0000', NULL, NULL, NULL, 'Producción de Receta prueba A', '2019-01-27', '2019-04-14 03:31:38', '2019-04-14 03:31:38'),
(376, 'MI00019', NULL, NULL, '2287.0000', '2282.0000', NULL, NULL, NULL, 'Producción de receta prueba B', '2019-01-27', '2019-04-14 03:34:50', '2019-04-14 03:34:50'),
(377, 'MI00019', NULL, NULL, '2282.0000', '2280.0000', NULL, NULL, NULL, 'Producción de receta prueba B', '2019-01-28', '2019-04-14 03:50:40', '2019-04-14 03:50:40'),
(378, 'MI00000', '55651381684698186', '30000.0000', '1.0000', '201.0000', '12%', '720000.0000', 109, NULL, NULL, '2019-04-14 03:55:53', '2019-04-14 03:55:53'),
(379, 'MI00000', NULL, NULL, '201.0000', '190.0000', NULL, NULL, NULL, 'Producción de receta prueba c', '2019-01-28', '2019-04-14 03:56:55', '2019-04-14 03:56:55'),
(380, 'MI00019', NULL, NULL, '2280.0000', '2208.0000', NULL, NULL, NULL, 'Producción de receta prueba B', '2019-01-29', '2019-04-14 04:17:05', '2019-04-14 04:17:05'),
(381, 'MI00000', NULL, NULL, '190.0000', '118.0000', NULL, NULL, NULL, 'Producción de receta prueba c', '2019-01-29', '2019-04-14 04:17:57', '2019-04-14 04:17:57'),
(382, 'MI00000', NULL, NULL, '118.0000', '18.0000', NULL, NULL, NULL, 'Producción de Receta prueba A', '2019-01-29', '2019-04-14 16:34:58', '2019-04-14 16:34:58'),
(383, 'MI00019', NULL, NULL, '2208.0000', '2108.0000', NULL, NULL, NULL, 'Producción de receta prueba B', '2019-01-30', '2019-04-14 16:36:03', '2019-04-14 16:36:03'),
(384, 'MI00000', NULL, NULL, '18.0000', '15.0000', NULL, NULL, NULL, 'Producción de Receta prueba A', '2019-01-30', '2019-04-14 16:52:23', '2019-04-14 16:52:23'),
(385, 'MI00000', NULL, NULL, '15.0000', '12.0000', NULL, NULL, NULL, 'Producción de Receta prueba A', '2019-01-30', '2019-04-14 16:57:34', '2019-04-14 16:57:34'),
(386, 'MI00000', NULL, NULL, '12.0000', '9.0000', NULL, NULL, NULL, 'Producción de Receta prueba A', '2019-01-30', '2019-04-14 16:58:49', '2019-04-14 16:58:49'),
(387, 'MI00000', NULL, NULL, '9.0000', '6.0000', NULL, NULL, NULL, 'Producción de Receta prueba A', '2019-01-31', '2019-04-14 17:01:09', '2019-04-14 17:01:09'),
(388, 'MI00019', NULL, NULL, '2108.0000', '2105.0000', NULL, NULL, NULL, 'Producción de receta prueba B', '2019-01-31', '2019-04-14 17:02:08', '2019-04-14 17:02:08'),
(389, 'MI00000', '548988498984984', '30000.0000', '6.0000', '106.0000', '12%', '360000.0000', 110, NULL, NULL, '2019-04-14 22:03:35', '2019-04-14 22:03:35'),
(390, 'MI00000', NULL, NULL, '106.0000', '96.0000', NULL, NULL, NULL, 'Producción de Receta prueba A', '2019-02-01', '2019-04-14 22:03:52', '2019-04-14 22:03:52'),
(391, 'MI00019', NULL, NULL, '2105.0000', '2095.0000', NULL, NULL, NULL, 'Producción de receta prueba B', '2019-02-01', '2019-04-14 22:04:17', '2019-04-14 22:04:17'),
(392, 'MI00000', '48756347267238', '30000.0000', '96.0000', '196.0000', '12%', '360000.0000', 111, NULL, NULL, '2019-04-14 22:11:16', '2019-04-14 22:11:16'),
(393, 'MI00000', NULL, NULL, '196.0000', '96.0000', NULL, NULL, NULL, 'Producción de receta prueba c', '2019-02-01', '2019-04-14 22:11:22', '2019-04-14 22:11:22');

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
(1, 'C00000', 'cliente 1', 'J3782462374', 'askjdhsakd', 'dajkshdjas asudhsaudh ', 'sdjjkhfjksd', '167496989.1840', '2018-01-11 20:34:13', '2019-04-11 23:50:31'),
(2, 'C00001', 'cliente dos', 'J62626512962', 'Centro Av.5 con Calle 15, Edif. Juan Ramos, Local 2', '04169856865', 'Contado', '103488000.0000', '2019-04-05 03:40:45', '2019-04-06 23:21:19');

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

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `comp_doc`, `comp_proveedor`, `comp_fecha`, `comp_monto`, `comp_cred_cont`, `comp_entidad`, `comp_activo`, `created_at`, `updated_at`) VALUES
(58, '1542469134615', 'P00000', '2019-01-01 04:00:00', '918400.0000', 'contado', 'Caja Chica', 1, '2019-02-14 10:20:00', '2019-02-14 10:20:34'),
(59, '246456516145', 'P00000', '2019-01-01 04:00:00', '1836800.0000', 'credito', 'Compra a Crédito', 1, '2019-02-14 10:22:15', '2019-02-14 10:22:37'),
(60, '33565654564', 'P00000', '2019-01-01 04:00:00', '2755200.0000', 'contado', 'Caja Chica', 1, '2019-02-14 10:24:03', '2019-02-14 10:24:25'),
(61, '47563847564', 'P00002', '2019-01-02 04:00:00', '346640.0000', 'contado', 'Caja Chica', 1, '2019-02-14 10:40:00', '2019-02-14 10:40:34'),
(63, '545846468468', 'P00003', '2019-01-02 04:00:00', '46246945.9200', 'contado', 'Banco de Venezuela', 1, '2019-02-14 10:51:06', '2019-02-14 10:59:43'),
(64, '9686954646', 'P00002', '2019-01-02 04:00:00', '1176000.0000', 'credito', 'Compra a Crédito', 1, '2019-02-14 11:04:41', '2019-02-14 11:05:22'),
(65, '654625461613519', 'P00000', '2019-01-03 04:00:00', '151485662.7200', 'contado', 'Caja Chica', 1, '2019-02-15 00:05:11', '2019-02-15 00:07:55'),
(66, '654653516521', 'P00000', '2019-01-03 04:00:00', '193200.0000', 'contado', 'Caja Chica', 0, '2019-02-15 00:28:42', '2019-02-15 00:29:09'),
(73, '5466549151851', 'P00000', '2019-01-03 04:00:00', '6157200.0000', 'credito', 'Compra a Crédito', 1, '2019-03-25 09:32:30', '2019-03-25 09:34:54'),
(74, '65646546515', 'P00002', '2019-01-04 04:00:00', '448000.0000', 'credito', 'Compra a Crédito', 1, '2019-03-25 09:51:03', '2019-03-25 09:51:23'),
(75, '56555168413515', 'P00001', '2019-01-06 04:00:00', '1120000.0000', 'contado', 'Caja Chica', 1, '2019-04-05 03:34:59', '2019-04-05 03:35:42'),
(76, '827328382329', 'P00003', '2019-01-06 04:00:00', '7560000.0000', 'contado', 'Caja Chica', 1, '2019-04-05 18:37:50', '2019-04-05 18:38:05'),
(77, '661616516515', 'P00004', '2019-01-06 04:00:00', '4146520.0000', 'contado', 'Caja Chica', 1, '2019-04-05 18:45:46', '2019-04-05 18:47:05'),
(78, '743746287468', 'P00006', '2019-01-06 04:00:00', '1558334.4000', 'credito', 'Compra a Crédito', 1, '2019-04-05 19:03:51', '2019-04-05 19:04:39'),
(80, '9376423723324', 'P00007', '2019-01-07 04:00:00', '128933764.9600', 'credito', 'Compra a Crédito', 1, '2019-04-06 07:41:14', '2019-04-06 07:46:39'),
(81, '495834957834', 'P00008', '2019-01-07 04:00:00', '0.0000', 'contado', 'Caja Chica', 1, '2019-04-06 07:51:03', '2019-04-06 07:51:22'),
(82, '58437583454', 'P00009', '2019-01-07 04:00:00', '85527.6800', 'contado', 'Caja Chica', 1, '2019-04-06 07:52:59', '2019-04-06 07:53:20'),
(83, '75367853845', 'P00010', '2019-01-07 04:00:00', '0.0000', 'contado', 'Caja Chica', 1, '2019-04-06 07:55:21', '2019-04-06 07:55:39'),
(84, '7857657578', 'P00007', '2019-01-07 04:00:00', '703360.0000', 'contado', 'Caja Chica', 1, '2019-04-06 07:57:42', '2019-04-06 07:57:55'),
(85, '546516150315', 'P00002', '2019-01-14 04:00:00', '2352000.0000', 'credito', 'Compra a Crédito', 1, '2019-04-06 11:49:55', '2019-04-06 11:50:29'),
(86, '845148616516818', 'P00002', '2019-01-17 04:00:00', '646800.0000', 'contado', 'Caja Chica', 1, '2019-04-06 12:17:43', '2019-04-06 12:18:19'),
(87, '54685614682', 'P00000', '2019-01-18 04:00:00', '3864000.0000', 'contado', 'Caja Chica', 1, '2019-04-06 23:02:19', '2019-04-06 23:02:27'),
(88, '98757384573', 'P00002', '2019-01-18 04:00:00', '375200.0000', 'contado', 'Caja Chica', 1, '2019-04-06 23:07:30', '2019-04-06 23:08:11'),
(89, '54468468816318', 'P00000', '2019-01-19 04:00:00', '73347.1200', 'contado', 'Caja Chica', 1, '2019-04-06 23:18:04', '2019-04-06 23:18:20'),
(90, '354895131864', 'P00000', '2019-01-19 04:00:00', '3786720.0000', 'contado', 'Caja Chica', 1, '2019-04-06 23:19:07', '2019-04-06 23:19:13'),
(91, '7836487246', 'P00000', '2019-01-19 04:00:00', '11592000.0000', 'contado', 'Caja Chica', 1, '2019-04-09 05:39:35', '2019-04-09 05:40:04'),
(92, '38747836473', 'P00000', '2019-01-20 04:00:00', '222264.0000', 'contado', 'Caja Chica', 1, '2019-04-09 05:57:16', '2019-04-09 05:57:28'),
(93, '732617273271637', 'P00000', '2019-01-20 04:00:00', '11592000.0000', 'contado', 'Caja Chica', 1, '2019-04-09 05:58:59', '2019-04-09 05:59:04'),
(94, '312732327326', 'P00007', '2019-01-20 04:00:00', '61572000.0000', 'credito', 'Compra a Crédito', 1, '2019-04-09 20:25:46', '2019-04-09 20:26:52'),
(95, '73864748376423764', 'P00001', '2019-01-20 04:00:00', '396969935.6000', 'credito', 'Compra a Crédito', 1, '2019-04-09 20:38:35', '2019-04-09 20:47:13'),
(96, '84654378653784654', 'P00001', '2019-01-21 04:00:00', '140000.0000', 'contado', 'Caja Chica', 1, '2019-04-09 21:25:09', '2019-04-09 21:25:51'),
(97, '4733784623781982378', 'P00009', '2019-01-21 04:00:00', '85527.6800', 'contado', 'Caja Chica', 1, '2019-04-09 21:32:11', '2019-04-09 21:32:22'),
(98, '8374834837421312', 'P00006', '2019-01-21 04:00:00', '108333120.0000', 'credito', 'Compra a Crédito', 1, '2019-04-09 21:38:24', '2019-04-09 21:38:59'),
(99, '1233746374', 'P00000', '2019-01-22 04:00:00', '193200.0000', 'contado', 'Banco de Venezuela', 1, '2019-04-11 23:42:41', '2019-04-11 23:42:48'),
(100, '387497246347364', 'P00005', '2019-01-24 04:00:00', '84448.0000', 'contado', NULL, 1, '2019-04-13 01:51:14', '2019-04-13 01:51:14'),
(101, '7463874637467', 'P00004', '2019-01-24 04:00:00', '1158640.0000', 'contado', NULL, 1, '2019-04-13 03:30:54', '2019-04-13 03:30:54'),
(102, '32748736473', 'P00003', '2019-01-24 04:00:00', '58800.0000', 'contado', NULL, 1, '2019-04-13 03:32:07', '2019-04-13 03:32:07'),
(103, '278346274', 'P00000', '2019-01-24 04:00:00', '38640.0000', 'contado', NULL, 1, '2019-04-13 03:41:32', '2019-04-13 03:41:32'),
(104, '54666251856', 'P00003', '2019-01-24 04:00:00', '78400.0000', 'contado', NULL, 1, '2019-04-13 03:55:10', '2019-04-13 03:55:10'),
(105, '65665184618861861', 'P00000', '2019-01-24 04:00:00', '139440.0000', 'credito', NULL, 1, '2019-04-13 04:17:01', '2019-04-13 04:17:01'),
(106, '372467463742834', 'P00000', '2019-01-24 04:00:00', '56000.0000', 'credito', NULL, 1, '2019-04-13 14:16:25', '2019-04-13 14:16:25'),
(107, '3784632746734', 'P00000', '2019-01-24 04:00:00', '33600.0000', 'contado', NULL, 1, '2019-04-13 14:25:49', '2019-04-13 14:25:49'),
(108, '7364747424', 'P00000', '2019-01-24 04:00:00', '53248.1600', 'contado', NULL, 1, '2019-04-13 14:43:41', '2019-04-13 14:43:41'),
(109, '55651381684698186', 'P00000', '2019-01-28 04:00:00', '6720000.0000', 'contado', NULL, 1, '2019-04-14 03:55:53', '2019-04-14 03:55:53'),
(110, '548988498984984', 'P00000', '2019-02-01 04:00:00', '3360000.0000', 'contado', NULL, 1, '2019-04-14 22:03:35', '2019-04-14 22:03:35'),
(111, '48756347267238', 'P00000', '2019-02-01 04:00:00', '3360000.0000', 'contado', NULL, 1, '2019-04-14 22:11:16', '2019-04-14 22:11:16');

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

--
-- Volcado de datos para la tabla `cuentasxcobrar`
--

INSERT INTO `cuentasxcobrar` (`id`, `cta_cli_codigo`, `cta_monto`, `cta_concepto`, `cta_venta_id`, `cta_pagada`, `cta_entidad`, `cta_fecha`, `created_at`, `updated_at`) VALUES
(1, 'C00001', '103488000.0000', 'Venta de factura 549864894651864 de fecha 2019-01-19', 18, NULL, '', NULL, '2019-04-06 23:21:19', '2019-04-06 23:21:19'),
(2, 'C00001', '31046400.0000', 'Cobro de deuda - Abono del 30% de la deuda', NULL, NULL, '', NULL, '2019-04-06 23:24:18', '2019-04-06 23:24:18'),
(3, 'C00001', '72441600.0000', 'Cobro de deuda - Cobra de toda la deuda', NULL, NULL, '', NULL, '2019-04-11 23:27:56', '2019-04-11 23:27:56'),
(4, 'C00000', '167496989.1840', 'Venta de factura 8475843758574398 de fecha 2019-01-22', 22, NULL, '', NULL, '2019-04-11 23:50:31', '2019-04-11 23:50:31'),
(5, 'C00000', '16749698.1840', 'Cobro de deuda - Cobro de 10% de la deuda', NULL, NULL, '', NULL, '2019-04-12 02:32:28', '2019-04-12 02:32:28'),
(6, 'C00000', '15074729.0000', 'Cobro de deuda - Cobro de 10% de la deuda restante', NULL, NULL, 'Banco de Venezuela', '2019-01-22 04:00:00', '2019-04-12 19:02:11', '2019-04-12 19:02:11');

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

--
-- Volcado de datos para la tabla `cuentasxpagar`
--

INSERT INTO `cuentasxpagar` (`id`, `cta_prov_codigo`, `cta_monto`, `cta_concepto`, `cta_compra_id`, `cta_entidad`, `cta_pagada`, `cta_fecha`, `created_at`, `updated_at`) VALUES
(23, 'P00000', '1836800.0000', 'Compra a crédito bajo factura: 246456516145 de fecha 2019-01-01', 59, NULL, 1, NULL, '2019-02-14 10:22:15', '2019-04-06 23:27:21'),
(24, 'P00000', '918400.0000', 'Pago de deuda - Pago de la mitad de la deuda actual', NULL, 'Banco de Venezuela', NULL, '2019-01-01 04:00:00', '2019-02-14 10:27:35', '2019-02-14 10:27:35'),
(26, 'P00002', '1176000.0000', 'Compra a crédito bajo factura: 9686954646 de fecha 2019-01-02', 64, NULL, 1, NULL, '2019-02-14 11:04:41', '2019-04-06 23:27:53'),
(27, 'P00000', '918400.0000', 'Pago de deuda - Pago de deuda', NULL, 'Caja Chica', NULL, '2019-01-03 04:00:00', '2019-02-15 00:33:58', '2019-02-15 00:33:58'),
(28, 'P00002', '1176000.0000', 'Pago de deuda - Pago completo de deuda', NULL, 'Venezolano de Crédito', NULL, '2019-01-03 04:00:00', '2019-02-15 00:34:48', '2019-02-15 00:34:48'),
(35, 'P00000', '6157200.0000', 'Compra a crédito bajo factura: 5466549151851 de fecha 2019-01-03', 73, NULL, 1, NULL, '2019-03-25 09:32:30', '2019-04-06 23:27:21'),
(36, 'P00002', '448000.0000', 'Compra a crédito bajo factura: 65646546515 de fecha 2019-01-04', 74, NULL, 1, NULL, '2019-03-25 09:51:03', '2019-04-06 23:27:53'),
(37, 'P00006', '1558334.4000', 'Compra a crédito bajo factura: 743746287468 de fecha 2019-01-06', 78, NULL, 1, NULL, '2019-04-05 19:03:51', '2019-04-11 23:31:15'),
(38, 'P00007', '128933764.9600', 'Compra a crédito bajo factura: 9376423723324 de fecha 2019-01-07', 80, NULL, 1, NULL, '2019-04-06 07:41:14', '2019-04-11 03:04:08'),
(39, 'P00002', '2352000.0000', 'Compra a crédito bajo factura: 546516150315 de fecha 2019-01-14', 85, NULL, 1, NULL, '2019-04-06 11:49:55', '2019-04-06 23:27:53'),
(40, 'P00007', '38680129.4880', 'Pago de deuda - Abono del 30% de la deuda', NULL, 'Caja Chica', NULL, '2019-01-19 04:00:00', '2019-04-06 23:26:40', '2019-04-06 23:26:40'),
(41, 'P00000', '6157200.0000', 'Pago de deuda - Cancelación de deuda', NULL, 'Caja Chica', NULL, '2019-01-19 04:00:00', '2019-04-06 23:27:21', '2019-04-06 23:27:21'),
(42, 'P00002', '2800000.0000', 'Pago de deuda - Cancelación de deuda con el proveedor P00002', NULL, 'Caja Chica', NULL, '2019-01-19 04:00:00', '2019-04-06 23:27:54', '2019-04-06 23:27:54'),
(43, 'P00006', '1558334.4000', 'Pago de deuda - Cancelación de deuda con el proveedor P00006', NULL, 'Caja Chica', NULL, '2019-01-19 04:00:00', '2019-04-06 23:28:32', '2019-04-06 23:28:32'),
(44, 'P00007', '61572000.0000', 'Compra a crédito bajo factura: 312732327326 de fecha 2019-01-20', 94, NULL, NULL, NULL, '2019-04-09 20:25:46', '2019-04-09 20:26:52'),
(45, 'P00001', '396969935.6000', 'Compra a crédito bajo factura: 73864748376423764 de fecha 2019-01-20', 95, NULL, NULL, NULL, '2019-04-09 20:38:35', '2019-04-09 20:47:13'),
(46, 'P00001', '100000000.0000', 'Pago de deuda - Abono de 100 m a la deuda', NULL, 'Caja Chica', NULL, '2019-01-21 04:00:00', '2019-04-09 21:16:07', '2019-04-09 21:16:07'),
(47, 'P00007', '50000000.0000', 'Pago de deuda - abono de 1/3 de la deuda aprox.', NULL, 'Caja Chica', NULL, '2019-01-21 04:00:00', '2019-04-09 21:17:33', '2019-04-09 21:17:33'),
(48, 'P00006', '108333120.0000', 'Compra a crédito bajo factura: 8374834837421312 de fecha 2019-01-21', 98, NULL, 1, NULL, '2019-04-09 21:38:24', '2019-04-11 23:31:15'),
(49, 'P00001', '200000000.0000', 'Pago de deuda - abono de 2/3 de la deuda', NULL, 'Caja Chica', NULL, '2019-01-21 04:00:00', '2019-04-11 03:00:44', '2019-04-11 03:00:44'),
(50, 'P00006', '50000000.0000', 'Pago de deuda - mitad de deuda', NULL, 'Banco de Venezuela', NULL, '2019-01-21 04:00:00', '2019-04-11 03:02:50', '2019-04-11 03:02:50'),
(51, 'P00001', '50000000.0000', 'Pago de deuda - Abono de la mitad de la deuda', NULL, 'Banco de Venezuela', NULL, '2019-01-21 04:00:00', '2019-04-11 03:03:25', '2019-04-11 03:03:25'),
(52, 'P00007', '50000000.0000', 'Pago de deuda - Abono de la mitad de la deuda', NULL, 'Banco de Venezuela', NULL, '2019-01-21 04:00:00', '2019-04-11 03:04:08', '2019-04-11 03:04:08'),
(53, 'P00006', '58333120.0000', 'Pago de deuda - Pago completo de deuda', NULL, 'Banco de Venezuela', NULL, '2019-01-21 04:00:00', '2019-04-11 23:31:15', '2019-04-11 23:31:15'),
(54, 'P00000', '139440.0000', 'Compra a crédito bajo factura: 65665184618861861 de fecha 2019-01-24', 105, NULL, NULL, NULL, '2019-04-13 04:17:01', '2019-04-13 04:17:01'),
(55, 'P00000', '56000.0000', 'Compra a crédito bajo factura: 372467463742834 de fecha 2019-01-24', 106, NULL, NULL, NULL, '2019-04-13 14:16:25', '2019-04-13 14:16:25');

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
(3, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'ANTIPASTO ATÚN (FRASCO 470G)', 102, 9212, '2018-03-23 17:31:56', '2019-04-14 03:56:32'),
(4, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PICADO BLANDO ANTIPASTO (kilo)', 95, 1056, '2019-02-14 10:39:00', '2019-04-09 21:34:08'),
(5, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PICADO DURO ANTIPASTO (kilo)', 96, 1056, '2019-02-14 10:39:16', '2019-04-09 21:34:08'),
(7, 'receta prueba B', 'Receta prueba A', 135, 10, '2019-02-14 16:16:46', '2019-04-14 22:04:17'),
(8, 'receta prueba c', 'receta prueba B', 137, 100, '2019-04-12 00:12:44', '2019-04-14 22:11:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `rec_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ing_ingrediente` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ing_mark` int(1) NOT NULL DEFAULT '0',
  `ing_ratio` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `rec_nombre`, `ing_ingrediente`, `ing_mark`, `ing_ratio`, `created_at`, `updated_at`) VALUES
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
(57, 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', 0, 1, '2017-12-28 22:57:34', '2017-12-28 22:57:34'),
(58, 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', 0, 1, '2017-12-28 23:00:10', '2017-12-28 23:00:10'),
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
(86, 'receta prueba c', 'ACEITE', 0, 1, '2019-04-06 10:34:23', '2019-04-06 10:34:23');

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

--
-- Volcado de datos para la tabla `materiasprimas`
--

INSERT INTO `materiasprimas` (`id`, `mp_codigo`, `mp_cantidad`, `created_at`, `updated_at`) VALUES
(24, 'MP00000', 2, '2019-02-14 10:20:34', '2019-04-13 04:17:01'),
(25, 'MP00003', 5, '2019-02-14 10:20:34', '2019-04-13 03:55:10'),
(26, 'MP00010', 7, '2019-02-14 10:20:34', '2019-04-13 03:55:10'),
(27, 'MP00009', 3, '2019-02-14 10:20:35', '2019-04-09 20:35:56'),
(28, 'MP00008', 1, '2019-02-14 10:40:34', '2019-04-13 01:51:14'),
(29, 'MP00005', 2, '2019-02-14 10:40:35', '2019-04-13 01:51:15'),
(30, 'MP00006', 3, '2019-02-14 10:40:35', '2019-04-13 01:51:15'),
(31, 'MP00007', 4, '2019-02-14 10:40:35', '2019-04-13 01:51:15'),
(32, 'MI00005', 200, '2019-02-14 10:59:43', '2019-04-09 21:34:09'),
(33, 'MI00000', 96, '2019-02-14 10:59:44', '2019-04-14 22:11:23'),
(34, 'MI00001', 20, '2019-02-14 10:59:44', '2019-04-09 21:34:09'),
(35, 'MI00016', 100, '2019-02-14 10:59:44', '2019-04-09 21:34:09'),
(36, 'MI00006', 71, '2019-02-14 10:59:44', '2019-04-09 21:34:09'),
(37, 'MI00011', 50, '2019-02-14 10:59:44', '2019-04-09 21:34:09'),
(38, 'MI00017', 50, '2019-02-14 10:59:44', '2019-04-09 21:34:10'),
(39, 'MI00018', 25, '2019-02-14 10:59:45', '2019-04-09 21:34:10'),
(40, 'MI00013', 2305, '2019-02-14 10:59:45', '2019-04-09 21:34:10'),
(41, 'MI00019', 2095, '2019-02-14 10:59:45', '2019-04-14 22:04:17'),
(42, 'MI00012', 125, '2019-02-14 10:59:45', '2019-04-09 21:34:10'),
(43, 'MI00020', 999974, '2019-02-14 10:59:45', '2019-04-09 21:34:10'),
(44, 'MI00021', 1000072, '2019-02-14 10:59:45', '2019-04-09 21:34:10'),
(45, 'MI00024', 44, '2019-02-14 10:59:46', '2019-04-09 21:34:10'),
(46, 'MI00022', 125, '2019-02-14 10:59:46', '2019-04-09 21:34:10'),
(47, 'MI00023', 121, '2019-02-14 10:59:46', '2019-04-09 21:34:11'),
(48, 'MI00003', 122, '2019-02-14 10:59:46', '2019-04-09 21:34:11'),
(49, 'MI00025', 76, '2019-02-14 10:59:46', '2019-04-09 21:34:11'),
(50, 'MI00027', 0, '2019-02-14 11:05:22', '2019-04-09 21:39:07'),
(51, 'MI00007', 0, '2019-02-14 11:05:23', '2019-04-09 21:39:07'),
(52, 'MI00002', 102, '2019-02-15 00:07:55', '2019-04-13 03:32:07'),
(53, 'MP00001', 100, '2019-02-15 00:07:55', '2019-02-15 00:07:55'),
(54, 'MI00026', 100, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(55, 'MI00004', 100, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(56, 'MP00002', 100, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(57, 'MI00008', 100, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(58, 'MI00010', 100, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(59, 'MI00009', 100, '2019-02-15 00:07:56', '2019-02-15 00:07:56'),
(60, 'MP00004', 100, '2019-02-15 00:07:57', '2019-02-15 00:07:57'),
(61, 'MP00030', 1, '2019-04-13 14:16:25', '2019-04-13 14:16:25'),
(62, 'MP00031', 1, '2019-04-13 14:43:41', '2019-04-13 14:43:41');

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
(1, '102.00', '10002.00', '22.23', '62.00', '10002.00', '475.94', '2017-10-11 04:00:00', '2017-11-07 01:13:15');

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
  `par_default` int(1) DEFAULT '0',
  `par_ratio` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `parametros`
--

INSERT INTO `parametros` (`id`, `par_codigo`, `par_nombre`, `par_unidad`, `par_costo`, `par_observacion`, `par_cost_updated`, `par_default`, `par_ratio`, `created_at`, `updated_at`) VALUES
(98, 'MI00000', 'ACEITE', 'LITRO', '30000.0000', 'ACTUALIZADO AL 02/11/2017', '2018-01-11 22:15:23', 0, NULL, '2017-12-03 02:17:39', '2019-04-13 14:25:49'),
(99, 'MI00001', 'ACEITUNAS', 'KILO', '500000.0000', 'ACTUALIZADO AL 30/11/2017 ESPECULATIVO', NULL, 0, NULL, '2017-12-03 02:19:23', '2018-03-27 05:13:55'),
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
(142, 'MP00011', 'Guanabana', 'Kilo', '0.0000', '', NULL, 0, NULL, '2018-02-13 11:07:02', '2018-02-13 11:07:02'),
(143, 'MP00012', 'Uva', 'KILO', '100000.0000', '', NULL, 0, NULL, '2018-02-13 14:31:50', '2018-02-13 14:31:50'),
(144, 'MI00028', 'prueba12', 'unidad', '2000.0000', '', NULL, 0, NULL, '2018-03-23 16:09:28', '2018-03-23 16:09:28'),
(145, 'MP00029', 'Pasas', 'KILO', '76000.0000', 'COSTO ESPECULATIVO', NULL, 0, NULL, '2019-04-13 14:07:26', '2019-04-13 14:07:26'),
(146, 'MP00030', 'prueba3', 'KILO', '45164.0000', '', NULL, 0, NULL, '2019-04-13 14:15:32', '2019-04-13 14:15:32'),
(147, 'MP00031', 'prueba4', 'KILO', '47543.0000', '', NULL, 0, NULL, '2019-04-13 14:41:27', '2019-04-13 14:41:27');

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

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id`, `pro_fecha`, `rec_nombre`, `pro_etapa`, `pro_produccion`, `pro_disponible`, `pro_costo`, `pro_mano_obra`, `pro_lote`, `pro_concepto`, `created_at`, `updated_at`) VALUES
(1, '2019-01-02', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 100, 100, '25199.2400', '2.5000', NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-02-14 10:41:45', '2019-04-14 01:10:52'),
(2, '2019-01-02', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 40, 40, '8027.3300', '2.0000', NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-02-14 10:45:13', '2019-04-14 01:43:50'),
(3, '2019-01-02', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 3, 97, NULL, '2.5000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-02-14 11:03:28', '2019-04-14 01:10:52'),
(4, '2019-01-02', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 4, 36, NULL, '2.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-02-14 11:03:28', '2019-04-14 01:43:50'),
(5, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 100, 100, '37316.5900', '3.0000', 1, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-02-14 11:03:28', '2019-04-14 01:51:08'),
(6, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 96, 4, NULL, '3.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-02-14 11:16:16', '2019-04-14 01:51:08'),
(7, '2019-01-02', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 8, 8, '516465.1200', '2.5000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-02-14 11:16:17', '2019-04-14 02:03:18'),
(8, '2019-01-02', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 1, 7, NULL, '0.0000', NULL, 'Eliminación de venta bajo factura: 5468464656513 de fecha 2019-01-02', '2019-02-14 14:40:55', '2019-04-14 02:03:19'),
(9, '2019-01-02', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 1, 6, NULL, '0.0000', NULL, 'Venta bajo factura: 69561843513556 de fecha 2019-01-02', '2019-02-14 15:02:19', '2019-04-14 02:03:19'),
(10, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 2, 2, NULL, '3.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-02-14 15:30:12', '2019-04-14 01:51:08'),
(11, '2019-01-03', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 100, 106, '1467.4500', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-02-14 15:30:12', '2019-04-14 02:03:19'),
(12, '2019-01-03', 'Receta prueba A', 'PA', 100, 100, '67988.0000', '1.0000', NULL, 'Producción de Receta prueba A', '2019-02-14 16:16:23', '2019-04-14 01:44:09'),
(13, '2019-01-03', 'Receta prueba A', 'PA', 1, 99, NULL, '1.0000', NULL, 'Producción de receta prueba B', '2019-02-14 16:17:25', '2019-04-14 01:44:09'),
(14, '2019-01-03', 'receta prueba B', 'PB', 100, 100, '1021.3800', '1.0000', 1, 'Producción de receta prueba B', '2019-02-14 16:17:26', '2019-04-14 02:02:09'),
(15, '2019-01-03', 'receta prueba B', 'PB', 1, 99, NULL, '1.0000', NULL, 'Producción de receta prueba c', '2019-02-14 16:19:42', '2019-04-14 02:02:09'),
(16, '2019-01-03', 'receta prueba c', 'PC', 100, 100, '86633.0000', '2.0000', NULL, 'Producción de receta prueba c', '2019-02-14 16:19:43', '2019-04-14 02:06:01'),
(17, '2019-01-03', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 2, 104, NULL, '0.0000', NULL, 'Venta bajo factura: 65635135131015 de fecha 2019-01-03', '2019-02-14 16:26:40', '2019-04-14 02:03:19'),
(18, '2019-01-03', 'receta prueba c', 'PC', 2, 102, '86633.0000', '0.0000', NULL, 'Venta bajo factura: 65635135131015 de fecha 2019-01-03', '2019-02-14 16:26:40', '2019-04-14 02:06:01'),
(19, '2019-01-03', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 5, 99, NULL, '0.0000', NULL, 'Venta bajo factura: 5465645638615 de fecha 2019-01-03', '2019-02-14 23:57:15', '2019-04-14 02:03:19'),
(20, '2019-01-03', 'receta prueba c', 'PC', 5, 107, '86633.0000', '0.0000', NULL, 'Venta bajo factura: 5465645638615 de fecha 2019-01-03', '2019-02-14 23:57:15', '2019-04-14 02:06:01'),
(21, '2019-01-03', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 140, 237, '23901.9300', '2.5000', NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-03-25 09:37:05', '2019-04-14 01:10:52'),
(22, '2019-01-03', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 140, 176, '8459.0700', '2.5000', NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-03-25 09:37:56', '2019-04-14 01:43:50'),
(23, '2019-01-04', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 140, 97, NULL, '2.5000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-03-25 09:43:48', '2019-04-14 01:10:52'),
(24, '2019-01-04', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 140, 36, NULL, '2.5000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-03-25 09:43:48', '2019-04-14 01:43:51'),
(25, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 1000, 1002, '21258.8200', '3.0000', 2, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-03-25 09:43:48', '2019-04-14 01:51:08'),
(26, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 1000, 2002, '21258.8200', '3.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-03-25 09:52:43', '2019-04-14 01:51:08'),
(27, '2019-01-04', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 83, 182, '267319.8400', '2.5000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-03-25 09:52:43', '2019-04-14 02:03:19'),
(28, '2019-01-04', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 226, -44, NULL, '0.0000', NULL, 'Venta bajo factura: 565556165415 de fecha 2019-01-04', '2019-03-25 09:55:57', '2019-04-14 02:03:19'),
(29, '2019-01-04', 'receta prueba c', 'PC', 93, 14, NULL, '0.0000', NULL, 'Venta bajo factura: 565556165415 de fecha 2019-01-04', '2019-03-25 09:55:57', '2019-04-14 02:06:01'),
(30, '2019-01-05', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 36, 61, NULL, '2.5000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-04-03 05:59:31', '2019-04-14 01:10:52'),
(31, '2019-01-05', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 36, 0, NULL, '2.5000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-04-03 05:59:31', '2019-04-14 01:43:51'),
(32, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 100, 2102, '37673.8300', '2.5000', 3, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-04-03 05:59:31', '2019-04-14 01:51:08'),
(33, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 96, 2006, NULL, '2.5000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-05 03:36:32', '2019-04-14 01:51:08'),
(34, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 8, -36, '467150.5200', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-05 03:36:33', '2019-04-14 02:03:19'),
(35, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 8, -44, NULL, '0.0000', NULL, 'Venta bajo factura: 4895734985734 de fecha 2019-01-06', '2019-04-05 03:46:00', '2019-04-14 02:03:19'),
(36, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 4, -48, NULL, '0.0000', NULL, 'Venta bajo factura: 475647853 de fecha 2019-01-06', '2019-04-05 03:51:50', '2019-04-14 02:03:19'),
(37, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 4, -52, NULL, '0.0000', NULL, 'Venta bajo factura: 16846565861565 de fecha 2019-01-06', '2019-04-05 03:57:27', '2019-04-14 02:03:19'),
(38, '2019-01-06', 'receta prueba c', 'PC', 0, 14, NULL, '0.0000', NULL, 'Venta bajo factura: 16846565861565 de fecha 2019-01-06', '2019-04-05 03:57:27', '2019-04-14 02:06:01'),
(39, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 4, -56, NULL, '0.0000', NULL, 'Venta bajo factura: 368464564656 de fecha 2019-01-06', '2019-04-05 04:19:49', '2019-04-14 02:03:19'),
(40, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 4, -60, NULL, '0.0000', NULL, 'Venta bajo factura: 368464564656 de fecha 2019-01-06', '2019-04-05 04:22:30', '2019-04-14 02:03:19'),
(41, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 4, -64, NULL, '0.0000', NULL, 'Venta bajo factura: 368464564656 de fecha 2019-01-06', '2019-04-05 04:24:10', '2019-04-14 02:03:19'),
(42, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 4, -68, NULL, '0.0000', NULL, 'Venta bajo factura: 46846515165165 de fecha 2019-01-06', '2019-04-05 04:28:06', '2019-04-14 02:03:19'),
(43, '2019-01-06', 'receta prueba c', 'PC', 4, 10, NULL, '0.0000', NULL, 'Venta bajo factura: 56565168861684 de fecha 2019-01-06', '2019-04-05 04:29:51', '2019-04-14 02:06:01'),
(44, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 4, -72, NULL, '0.0000', NULL, 'Venta bajo factura: 6566686486189 de fecha 2019-01-06', '2019-04-05 04:31:51', '2019-04-14 02:03:19'),
(45, '2019-01-06', 'receta prueba c', 'PC', 4, 6, NULL, '0.0000', NULL, 'Venta bajo factura: 6566686486189 de fecha 2019-01-06', '2019-04-05 04:31:51', '2019-04-14 02:06:01'),
(46, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 4, -76, NULL, '0.0000', NULL, 'Venta bajo factura: 856165156135 de fecha 2019-01-06', '2019-04-05 05:12:52', '2019-04-14 02:03:19'),
(47, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 4, -80, NULL, '0.0000', NULL, 'Venta bajo factura: 7564685183521 de fecha 2019-01-06', '2019-04-05 18:25:52', '2019-04-14 02:03:19'),
(48, '2019-01-06', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 528, 589, '25883.7800', '3.0000', NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-04-05 18:41:30', '2019-04-14 01:10:52'),
(49, '2019-01-06', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 528, 528, '9026.5300', '4.0000', NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-04-05 18:48:26', '2019-04-14 01:43:51'),
(50, '2019-01-07', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 528, 1117, '258.0000', '3.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-04-06 07:59:14', '2019-04-14 01:10:52'),
(51, '2019-01-07', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 528, 1056, '292.1600', '4.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-04-06 07:59:14', '2019-04-14 01:43:51'),
(52, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 4606, 6612, '36519.1700', '5.0000', 4, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-04-06 07:59:14', '2019-04-14 01:51:08'),
(53, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 240, 6372, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 08:39:59', '2019-04-14 01:51:08'),
(54, '2019-01-07', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 20, -60, '904826.8414', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 08:39:59', '2019-04-14 02:03:19'),
(55, '2019-01-08', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 240, 6132, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 08:41:51', '2019-04-14 01:51:09'),
(56, '2019-01-08', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 20, -40, '904826.8414', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 08:41:51', '2019-04-14 02:03:19'),
(57, '2019-01-09', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 120, 6012, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 08:46:08', '2019-04-14 01:51:09'),
(58, '2019-01-09', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 10, -30, '452413.4207', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 08:46:08', '2019-04-14 02:03:19'),
(59, '2019-01-10', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 120, 5892, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 08:50:32', '2019-04-14 01:51:09'),
(60, '2019-01-10', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 10, -20, '452413.4207', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 08:50:32', '2019-04-14 02:03:19'),
(61, '2019-01-11', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 120, 5772, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 09:07:46', '2019-04-14 01:51:09'),
(62, '2019-01-11', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 10, -10, '452413.4207', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 09:07:46', '2019-04-14 02:03:19'),
(63, '2019-01-12', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 180, 5592, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 09:16:33', '2019-04-14 01:51:09'),
(64, '2019-01-12', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 15, 5, '451238.5093', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 09:16:34', '2019-04-14 02:03:19'),
(65, '2019-01-13', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 120, 5472, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 11:47:03', '2019-04-14 01:51:09'),
(66, '2019-01-13', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 10, 15, '452413.4207', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 11:47:03', '2019-04-14 02:03:19'),
(67, '2019-01-14', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 120, 5352, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 11:50:59', '2019-04-14 01:51:09'),
(68, '2019-01-14', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 10, 5, NULL, '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 11:50:59', '2019-04-14 02:03:19'),
(69, '2019-01-15', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 120, 5232, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 11:52:48', '2019-04-14 01:51:09'),
(70, '2019-01-15', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 10, 15, '14183.3807', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 11:52:48', '2019-04-14 02:03:19'),
(71, '2019-01-16', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 120, 5112, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 11:56:50', '2019-04-14 01:51:09'),
(72, '2019-01-16', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 10, 25, '452413.4207', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 11:56:50', '2019-04-14 02:03:19'),
(73, '2019-01-17', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 1500, 3612, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 12:01:55', '2019-04-14 01:51:10'),
(74, '2019-01-17', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 125, 150, '449311.6547', '3.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 12:01:55', '2019-04-14 02:03:19'),
(75, '2019-01-17', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 250, -100, NULL, '0.0000', NULL, 'Venta bajo factura: 16516816518 de fecha 2019-01-17', '2019-04-06 12:07:03', '2019-04-14 02:03:19'),
(76, '2019-01-17', 'receta prueba c', 'PC', 8, -2, NULL, '0.0000', NULL, 'Venta bajo factura: 16516816518 de fecha 2019-01-17', '2019-04-06 12:07:03', '2019-04-14 02:06:01'),
(77, '2019-01-18', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 1200, 2412, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 12:19:11', '2019-04-14 01:51:10'),
(78, '2019-01-18', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 100, 0, '449417.3968', '3.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 12:19:11', '2019-04-14 02:03:20'),
(79, '2019-01-18', 'receta prueba B', 'PB', 99, 0, NULL, '1.0000', NULL, 'Producción de receta prueba c', '2019-04-06 23:02:43', '2019-04-14 02:02:09'),
(80, '2019-01-18', 'receta prueba c', 'PC', 99, 97, '36036.0604', '2.0000', NULL, 'Producción de receta prueba c', '2019-04-06 23:02:43', '2019-04-14 02:06:01'),
(81, '2019-01-19', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 412, 2000, NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 23:14:53', '2019-04-14 01:51:10'),
(82, '2019-01-19', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 34, 34, '454480.9177', '2.5000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-06 23:14:53', '2019-04-14 02:03:20'),
(83, '2019-01-19', 'Receta prueba A', 'PA', 99, 0, NULL, '1.0000', NULL, 'Producción de receta prueba B', '2019-04-06 23:18:43', '2019-04-14 01:44:09'),
(84, '2019-01-19', 'receta prueba B', 'PB', 99, 99, '69164.1804', '2.0000', 2, 'Producción de receta prueba B', '2019-04-06 23:18:43', '2019-04-14 02:02:09'),
(85, '2019-01-19', 'receta prueba B', 'PB', 99, 0, NULL, '2.0000', NULL, 'Producción de receta prueba c', '2019-04-06 23:20:03', '2019-04-14 02:02:09'),
(86, '2019-01-19', 'receta prueba c', 'PC', 99, 196, '104178.8608', '2.0000', NULL, 'Producción de receta prueba c', '2019-04-06 23:20:03', '2019-04-14 02:06:01'),
(87, '2019-01-19', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 34, 0, NULL, '0.0000', NULL, 'Venta bajo factura: 549864894651864 de fecha 2019-01-19', '2019-04-06 23:21:18', '2019-04-14 02:03:20'),
(88, '2019-01-19', 'receta prueba c', 'PC', 196, 0, NULL, '0.0000', NULL, 'Venta bajo factura: 549864894651864 de fecha 2019-01-19', '2019-04-06 23:21:19', '2019-04-14 02:06:01'),
(89, '2019-01-20', 'Receta prueba A', 'PA', 300, 300, '34817.2597', '2.7000', NULL, 'Producción de Receta prueba A', '2019-04-09 05:56:14', '2019-04-14 01:44:09'),
(90, '2019-01-20', 'Receta prueba A', 'PA', 300, 0, NULL, '2.7000', NULL, 'Producción de receta prueba B', '2019-04-09 05:57:38', '2019-04-14 01:44:09'),
(91, '2019-01-20', 'receta prueba B', 'PB', 300, 300, '35778.3957', '2.4000', 3, 'Producción de receta prueba B', '2019-04-09 05:57:39', '2019-04-14 02:02:09'),
(92, '2019-01-20', 'receta prueba B', 'PB', 300, 0, NULL, '2.4000', NULL, 'Producción de receta prueba c', '2019-04-09 05:59:11', '2019-04-14 02:02:09'),
(93, '2019-01-20', 'receta prueba c', 'PC', 300, 300, '70578.0317', '2.4000', NULL, 'Producción de receta prueba c', '2019-04-09 05:59:11', '2019-04-14 02:06:01'),
(94, '2019-01-20', 'receta prueba c', 'PC', 150, 150, NULL, '0.0000', NULL, 'Venta bajo factura: 48764846783 de fecha 2019-01-20', '2019-04-09 08:24:13', '2019-04-14 02:06:01'),
(95, '2019-01-20', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 1600, 2717, '25827.7058', '4.0000', NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-04-09 20:35:56', '2019-04-14 01:10:52'),
(96, '2019-01-20', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 1600, 2656, '8937.0808', '4.0000', NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-04-09 20:36:36', '2019-04-14 01:43:51'),
(97, '2019-01-20', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 1056, 1661, NULL, '4.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-04-09 20:55:10', '2019-04-14 01:10:52'),
(98, '2019-01-20', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 1056, 1600, NULL, '4.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-04-09 20:55:10', '2019-04-14 01:43:51'),
(99, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 9212, -7212, NULL, '4.0000', 5, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-04-09 20:55:10', '2019-04-14 01:51:10'),
(100, '2019-01-21', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', 1056, 605, NULL, '4.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-04-09 21:34:08', '2019-04-14 01:10:52'),
(101, '2019-01-21', 'PICADO DURO ANTIPASTO (kilo)', 'PA', 1056, 544, NULL, '4.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-04-09 21:34:08', '2019-04-14 01:43:51'),
(102, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', 9212, 2000, '36491.0139', '4.0000', 6, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-04-09 21:34:09', '2019-04-14 01:51:10'),
(104, '2019-01-21', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 767, 767, '564609.8736', '3.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-04-09 21:39:07', '2019-04-14 02:03:20'),
(105, '2019-01-21', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 350, 417, NULL, '0.0000', NULL, 'Venta bajo factura: 654535434237 de fecha 2019-01-21', '2019-04-11 02:39:17', '2019-04-14 02:03:20'),
(106, '2019-01-21', 'receta prueba c', 'PC', 75, 75, NULL, '0.0000', NULL, 'Venta bajo factura: 654535434237 de fecha 2019-01-21', '2019-04-11 02:39:18', '2019-04-14 02:06:01'),
(107, '2019-01-22', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', 200, 217, NULL, '0.0000', NULL, 'Venta bajo factura: 8475843758574398 de fecha 2019-01-22', '2019-04-11 23:50:31', '2019-04-14 02:03:20'),
(108, '2019-01-22', 'receta prueba c', 'PC', 30, 45, NULL, '0.0000', NULL, 'Venta bajo factura: 8475843758574398 de fecha 2019-01-22', '2019-04-11 23:50:31', '2019-04-11 23:50:31'),
(109, '2019-01-25', 'Receta prueba A', 'PA', 15, 15, '32508.4693', '2.0000', NULL, 'Producción de Receta prueba A', '2019-04-14 02:09:09', '2019-04-14 02:09:10'),
(110, '2019-01-25', 'Receta prueba A', 'PA', 14, 1, NULL, '2.0000', NULL, 'Producción de receta prueba B', '2019-04-14 02:09:55', '2019-04-14 02:09:55'),
(111, '2019-01-25', 'receta prueba B', 'PB', 14, 14, '35846.2831', '2.0000', 4, 'Producción de receta prueba B', '2019-04-14 02:09:55', '2019-04-14 02:09:55'),
(112, '2019-01-25', 'receta prueba B', 'PB', 12, 2, NULL, '2.0000', NULL, 'Producción de receta prueba c', '2019-04-14 02:10:35', '2019-04-14 02:10:35'),
(113, '2019-01-25', 'receta prueba c', 'PC', 13, 58, '63922.2983', '2.2000', NULL, 'Producción de receta prueba c', '2019-04-14 02:10:35', '2019-04-14 02:10:35'),
(115, '2019-01-26', 'Receta prueba A', 'PA', 10, 11, '33683.3807', '2.0000', NULL, 'Producción de Receta prueba A', '2019-04-14 03:18:30', '2019-04-14 03:18:30'),
(116, '2019-01-26', 'Receta prueba A', 'PA', 2, 9, NULL, '2.0000', NULL, 'Producción de receta prueba B', '2019-04-14 03:21:04', '2019-04-14 03:21:04'),
(117, '2019-01-26', 'receta prueba B', 'PB', 2, 4, '52127.1974', '2.0000', 5, 'Producción de receta prueba B', '2019-04-14 03:21:05', '2019-04-14 03:21:05'),
(118, '2019-01-27', 'Receta prueba A', 'PA', 70, 79, '30662.1801', '2.0000', NULL, 'Producción de Receta prueba A', '2019-04-14 03:31:38', '2019-04-14 03:31:38'),
(119, '2019-01-27', 'Receta prueba A', 'PA', 5, 74, NULL, '2.0000', NULL, 'Producción de receta prueba B', '2019-04-14 03:34:50', '2019-04-14 03:34:50'),
(120, '2019-01-27', 'receta prueba B', 'PB', 5, 9, '38531.7948', '2.0000', 6, 'Producción de receta prueba B', '2019-04-14 03:34:50', '2019-04-14 03:34:50'),
(121, '2019-01-28', 'Receta prueba A', 'PA', 2, 72, NULL, '2.0000', NULL, 'Producción de receta prueba B', '2019-04-14 03:50:39', '2019-04-14 03:50:39'),
(122, '2019-01-28', 'receta prueba B', 'PB', 2, 11, '49105.9968', '2.0000', 7, 'Producción de receta prueba B', '2019-04-14 03:50:40', '2019-04-14 03:50:40'),
(123, '2019-01-28', 'receta prueba B', 'PB', 11, 0, NULL, '2.0000', NULL, 'Producción de receta prueba c', '2019-04-14 03:56:54', '2019-04-14 03:56:54'),
(124, '2019-01-28', 'receta prueba c', 'PC', 11, 69, '82468.9471', '2.0000', NULL, 'Producción de receta prueba c', '2019-04-14 03:56:55', '2019-04-14 03:56:55'),
(125, '2019-01-28', 'receta prueba c', 'PC', 69, 0, NULL, '0.0000', NULL, 'Venta bajo factura: 355138531151 de fecha 2019-01-28', '2019-04-14 04:01:22', '2019-04-14 04:01:22'),
(126, '2019-01-29', 'Receta prueba A', 'PA', 100, 100, '1.0000', '2.0000', NULL, 'Producción de Receta prueba A', '2019-04-14 04:17:04', '2019-04-14 16:34:58'),
(127, '2019-01-29', 'receta prueba B', 'PB', 72, 72, '32094.2598', '2.5000', 8, 'Producción de receta prueba B', '2019-04-14 04:17:05', '2019-04-14 04:17:05'),
(128, '2019-01-29', 'receta prueba B', 'PB', 69, 3, NULL, '2.5000', NULL, 'Producción de receta prueba c', '2019-04-14 04:17:57', '2019-04-14 16:29:33'),
(129, '2019-01-29', 'receta prueba c', 'PC', 69, 73, '30511.1201', '2.5000', NULL, 'Producción de receta prueba c', '2019-04-14 04:17:57', '2019-04-14 16:34:58'),
(130, '2019-01-30', 'Receta prueba A', 'PA', 3, 9, '1.0000', '1.0000', NULL, 'Producción de Receta prueba A', '2019-04-14 16:36:02', '2019-04-14 16:58:49'),
(131, '2019-01-30', 'receta prueba B', 'PB', 100, 103, '36033.2033', '2.0000', 9, 'Producción de receta prueba B', '2019-04-14 16:36:02', '2019-04-14 16:58:49'),
(132, '2019-01-31', 'Receta prueba A', 'PA', 3, 12, '36033.2033', '1.0000', NULL, 'Producción de Receta prueba A', '2019-04-14 17:01:09', '2019-04-14 17:01:09'),
(133, '2019-01-31', 'Receta prueba A', 'PA', 3, 9, NULL, '1.0000', NULL, 'Producción de receta prueba B', '2019-04-14 17:02:08', '2019-04-14 17:42:12'),
(134, '2019-01-31', 'receta prueba B', 'PB', 3, 106, '42727.9066', '1.0000', 10, 'Producción de receta prueba B', '2019-04-14 17:02:08', '2019-04-14 17:42:12'),
(135, '2019-02-01', 'Receta prueba A', 'PA', 10, 19, '33683.3807', '2.0000', NULL, 'Producción de Receta prueba A', '2019-04-14 22:03:52', '2019-04-14 22:03:53'),
(136, '2019-02-01', 'Receta prueba A', 'PA', 10, 9, NULL, '2.0000', NULL, 'Producción de receta prueba B', '2019-04-14 22:04:17', '2019-04-14 22:04:17'),
(137, '2019-02-01', 'receta prueba B', 'PB', 10, 116, '38028.2614', '2.0000', 11, 'Producción de receta prueba B', '2019-04-14 22:04:17', '2019-04-14 22:04:17'),
(138, '2019-02-01', 'receta prueba B', 'PB', 100, 16, NULL, '2.0000', NULL, 'Producción de receta prueba c', '2019-04-14 22:11:22', '2019-04-14 22:11:22'),
(139, '2019-02-01', 'receta prueba c', 'PC', 100, 173, '68539.3815', '2.0000', NULL, 'Producción de receta prueba c', '2019-04-14 22:11:22', '2019-04-14 22:11:23');

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

--
-- Volcado de datos para la tabla `producciona`
--

INSERT INTO `producciona` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(1, 'PICADO BLANDO ANTIPASTO (kilo)', 605, '2019-02-14 10:41:45', '2019-04-09 21:34:08'),
(2, 'PICADO DURO ANTIPASTO (kilo)', 544, '2019-02-14 10:45:13', '2019-04-09 21:34:08'),
(3, 'Receta prueba A', 9, '2019-02-14 16:16:23', '2019-04-14 22:04:17');

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

--
-- Volcado de datos para la tabla `produccionb`
--

INSERT INTO `produccionb` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(1, 'ANTIPASTO ATÚN (FRASCO 470G)', 2000, '2019-02-14 11:03:28', '2019-04-09 21:39:07'),
(2, 'receta prueba B', 13, '2019-02-14 16:17:25', '2019-04-14 22:11:22');

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

--
-- Volcado de datos para la tabla `produccionc`
--

INSERT INTO `produccionc` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(1, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 217, '2019-02-14 11:16:17', '2019-04-11 23:50:31'),
(2, 'receta prueba c', 168, '2019-02-14 16:19:42', '2019-04-14 22:11:22');

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
(1, 5280, '2017-10-11 08:00:00', '2017-11-01 00:25:27');

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
(2, 'P00000', 'Proveedor', 'J287327', 'ashda', 'sajhda', 'asjdhas', 0, '8189440.0000', 'credito', '2017-12-04 22:57:53', '2019-04-13 14:16:25'),
(3, 'P00002', 'ahdgasyh', 'jhsdhjas', 'hsgdha', 'hasgdhasg', 'ahsdgas', 0, '3976000.0000', 'contado', '2017-12-12 19:14:19', '2019-04-06 11:50:29'),
(4, 'P00003', 'proveedor cinco', 'j-23345567-2', 'la calle', 'ramón', '15 dias', 0, '0.0000', 'contado', '2017-12-24 18:40:01', '2018-03-23 13:47:31'),
(5, 'P00004', 'pablo iglesia', 'j-33333333-3', 'san pablo', 'pablo', 'ninguna', 0, '0.0000', 'contado', '2017-12-30 18:26:26', '2018-02-25 06:11:46'),
(6, 'P00005', 'pepe', 'rif de pepe', 'dirección de pepe', 'pepe', 'pepe condithion', 0, '0.0000', 'credito', '2018-01-11 20:08:54', '2018-02-25 06:11:52'),
(7, 'P00006', 'GATO', 'RIF GATO', 'DIRECCION GATO', 'SR GATO', '123', 0, '109891454.4000', 'credito', '2018-01-11 23:11:57', '2019-04-09 21:38:59'),
(8, 'P00001', 'Repartos Orientales', 'JR6566512545', 'El junquito, kilometro 12, galpón 312', '0414-1452263', '', 0, '396969935.6000', 'contado', '2019-04-05 03:28:33', '2019-04-09 20:47:13'),
(9, 'P00007', 'septimo proveedor', 'J4389754389', 'asjhdajh ausdhsahdas sdjsahdjashd', '04143767273', '', 0, '190505764.9600', 'contado', '2019-04-05 07:17:55', '2019-04-09 20:26:52'),
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
(14, 'receta prueba c', 'si', 'PC', 'KILO', '2019-02-14 16:15:24', '2019-02-14 16:15:24');

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
  `req_default` int(1) DEFAULT '0',
  `req_ratio` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requerimientos`
--

INSERT INTO `requerimientos` (`id`, `req_fecha`, `rec_nombre`, `req_ingrediente`, `req_total`, `req_default`, `req_ratio`, `created_at`, `updated_at`) VALUES
(1, '2019-01-02', 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', '30.0000', 0, 1, '2019-02-14 10:41:09', '2019-02-14 10:42:25'),
(2, '2019-01-02', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', '30.0000', 0, 1, '2019-02-14 10:41:09', '2019-02-14 10:42:25'),
(3, '2019-01-02', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', '30.0000', 0, 1, '2019-02-14 10:41:10', '2019-02-14 10:42:25'),
(4, '2019-01-02', 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', '30.0000', 0, 1, '2019-02-14 10:41:10', '2019-02-14 10:42:25'),
(5, '2019-01-02', 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', '10.0000', 0, 1, '2019-02-14 10:44:48', '2019-02-14 10:45:13'),
(6, '2019-01-02', 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', '10.0000', 0, 1, '2019-02-14 10:44:49', '2019-02-14 10:45:13'),
(7, '2019-01-02', 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', '10.0000', 0, 1, '2019-02-14 10:44:49', '2019-02-14 10:45:14'),
(8, '2019-01-02', 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', '10.0000', 0, 1, '2019-02-14 10:44:49', '2019-02-14 10:45:14'),
(9, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', '2.0000', 0, 1, '2019-02-14 11:02:54', '2019-02-14 11:03:28'),
(10, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', '3.0000', 0, 1, '2019-02-14 11:02:54', '2019-02-14 11:03:28'),
(11, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', '5.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:28'),
(12, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', '4.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:29'),
(13, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', '3.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:29'),
(14, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', '2.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:29'),
(15, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', '4.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:29'),
(16, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', '2.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:29'),
(17, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', '3.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:30'),
(18, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', '5.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:30'),
(19, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', '4.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:30'),
(20, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', '3.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:30'),
(21, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', '4.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:31'),
(22, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', '5.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:31'),
(23, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', '4.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:31'),
(24, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', '3.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:32'),
(25, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', '5.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:32'),
(26, '2019-01-02', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', '2.0000', 0, 1, '2019-02-14 11:02:55', '2019-02-14 11:03:32'),
(27, '2019-01-02', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '50.0000', 0, 1, '2019-02-14 11:15:43', '2019-02-14 11:16:17'),
(28, '2019-01-02', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '8.0000', 0, 1, '2019-02-14 11:15:43', '2019-02-14 11:16:17'),
(29, '2019-01-03', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '2.0000', 0, 1, '2019-02-14 15:29:43', '2019-02-14 15:30:12'),
(30, '2019-01-03', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '2.0000', 0, 1, '2019-02-14 15:29:43', '2019-02-14 15:30:13'),
(31, '2019-01-03', 'Receta prueba A', 'ACEITE', '1.0000', 0, 1, '2019-02-14 16:16:20', '2019-02-14 16:16:23'),
(32, '2019-01-03', 'receta prueba B', 'TAPA 63mm, 500cc, TWIST BLANCA', '1.0000', 1, 2, '2019-02-14 16:17:01', '2019-02-14 16:17:26'),
(33, '2019-01-03', 'receta prueba c', 'ACEITE', '1.0000', 0, 1, '2019-02-14 16:19:38', '2019-02-14 16:19:43'),
(34, '2019-01-03', 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', '40.0000', 0, 1, '2019-03-25 09:26:22', '2019-03-25 09:37:05'),
(35, '2019-01-03', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', '40.0000', 0, 1, '2019-03-25 09:26:22', '2019-03-25 09:37:05'),
(36, '2019-01-03', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', '40.0000', 0, 1, '2019-03-25 09:26:23', '2019-03-25 09:37:05'),
(37, '2019-01-03', 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', '40.0000', 0, 1, '2019-03-25 09:26:23', '2019-03-25 09:37:05'),
(38, '2019-01-03', 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', '40.0000', 0, 1, '2019-03-25 09:37:47', '2019-03-25 09:37:56'),
(39, '2019-01-03', 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', '40.0000', 0, 1, '2019-03-25 09:37:47', '2019-03-25 09:37:56'),
(40, '2019-01-03', 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', '40.0000', 0, 1, '2019-03-25 09:37:48', '2019-03-25 09:37:56'),
(41, '2019-01-03', 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', '40.0000', 0, 1, '2019-03-25 09:37:48', '2019-03-25 09:37:57'),
(42, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(43, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(44, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(45, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(46, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(47, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(48, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(49, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(50, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(51, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(52, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(53, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(54, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(55, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(56, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(57, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(58, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(59, '2019-01-03', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', NULL, 0, 1, '2019-03-25 09:39:55', '2019-03-25 09:39:55'),
(60, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', '20.0000', 0, 1, '2019-03-25 09:43:27', '2019-03-25 09:43:48'),
(61, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', '20.0000', 0, 1, '2019-03-25 09:43:27', '2019-03-25 09:43:49'),
(62, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', '20.0000', 0, 1, '2019-03-25 09:43:27', '2019-03-25 09:43:49'),
(63, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', '20.0000', 0, 1, '2019-03-25 09:43:27', '2019-03-25 09:43:49'),
(64, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:49'),
(65, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:49'),
(66, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:49'),
(67, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:50'),
(68, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:50'),
(69, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:50'),
(70, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:50'),
(71, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:51'),
(72, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:51'),
(73, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:51'),
(74, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:51'),
(75, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:51'),
(76, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:52'),
(77, '2019-01-04', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', '20.0000', 0, 1, '2019-03-25 09:43:28', '2019-03-25 09:43:52'),
(78, '2019-01-04', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '83.0000', 0, 1, '2019-03-25 09:52:08', '2019-03-25 09:52:43'),
(79, '2019-01-04', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '83.0000', 0, 1, '2019-03-25 09:52:08', '2019-03-25 09:52:44'),
(80, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', '5.0000', 0, 1, '2019-04-03 05:58:52', '2019-04-03 05:59:32'),
(81, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', '4.0000', 0, 1, '2019-04-03 05:58:52', '2019-04-03 05:59:32'),
(82, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', '3.0000', 0, 1, '2019-04-03 05:58:52', '2019-04-03 05:59:32'),
(83, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', '2.0000', 0, 1, '2019-04-03 05:58:52', '2019-04-03 05:59:32'),
(84, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', '6.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:32'),
(85, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', '2.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:32'),
(86, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', '3.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:32'),
(87, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', '3.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:33'),
(88, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', '3.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:33'),
(89, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', '2.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:33'),
(90, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', '1.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:33'),
(91, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', '2.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:33'),
(92, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', '3.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:33'),
(93, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', '1.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:33'),
(94, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', '2.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:34'),
(95, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', '1.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:34'),
(96, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', '2.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:34'),
(97, '2019-01-05', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', '2.0000', 0, 1, '2019-04-03 05:58:53', '2019-04-03 05:59:34'),
(98, '2019-01-05', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', NULL, 0, 1, '2019-04-03 06:50:38', '2019-04-03 06:50:38'),
(99, '2019-01-05', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', NULL, 0, 1, '2019-04-03 06:50:38', '2019-04-03 06:50:38'),
(100, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '8.0000', 0, 1, '2019-04-05 03:33:04', '2019-04-05 03:36:33'),
(101, '2019-01-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '8.0000', 0, 1, '2019-04-05 03:33:04', '2019-04-05 03:36:33'),
(102, '2019-01-06', 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', '165.0000', 0, 1, '2019-04-05 18:41:02', '2019-04-05 18:41:30'),
(103, '2019-01-06', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', '165.0000', 0, 1, '2019-04-05 18:41:02', '2019-04-05 18:41:30'),
(104, '2019-01-06', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', '165.0000', 0, 1, '2019-04-05 18:41:02', '2019-04-05 18:41:30'),
(105, '2019-01-06', 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', '165.0000', 0, 1, '2019-04-05 18:41:02', '2019-04-05 18:41:30'),
(106, '2019-01-06', 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', '165.0000', 0, 1, '2019-04-05 18:48:11', '2019-04-05 18:48:26'),
(107, '2019-01-06', 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', '165.0000', 0, 1, '2019-04-05 18:48:12', '2019-04-05 18:48:26'),
(108, '2019-01-06', 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', '165.0000', 0, 1, '2019-04-05 18:48:12', '2019-04-05 18:48:27'),
(109, '2019-01-06', 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', '165.0000', 0, 1, '2019-04-05 18:48:12', '2019-04-05 18:48:27'),
(110, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', NULL, 0, 1, '2019-04-05 18:58:48', '2019-04-05 18:58:48'),
(111, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', NULL, 0, 1, '2019-04-05 18:58:48', '2019-04-05 18:58:48'),
(112, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(113, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(114, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(115, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(116, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(117, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(118, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(119, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(120, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(121, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(122, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(123, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(124, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(125, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(126, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(127, '2019-01-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', NULL, 0, 1, '2019-04-05 18:58:49', '2019-04-05 18:58:49'),
(128, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', '750.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:14'),
(129, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', '200.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:15'),
(130, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', '50.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:15'),
(131, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', '200.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:15'),
(132, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', '100.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:15'),
(133, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', '100.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:15'),
(134, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', '100.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:15'),
(135, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', '50.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:15'),
(136, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', '4606.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:16'),
(137, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', '4606.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:16'),
(138, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', '100.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:16'),
(139, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', '100.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:16'),
(140, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', '100.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:16'),
(141, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', '50.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:17'),
(142, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', '2.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:17'),
(143, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', '10.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:17'),
(144, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', '2.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:17'),
(145, '2019-01-07', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', '100.0000', 0, 1, '2019-04-06 07:34:30', '2019-04-06 07:59:17'),
(146, '2019-01-07', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '20.0000', 0, 1, '2019-04-06 08:39:35', '2019-04-06 08:39:59'),
(147, '2019-01-07', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '20.0000', 0, 1, '2019-04-06 08:39:35', '2019-04-06 08:39:59'),
(148, '2019-01-08', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '20.0000', 0, 1, '2019-04-06 08:41:40', '2019-04-06 08:41:51'),
(149, '2019-01-08', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '20.0000', 0, 1, '2019-04-06 08:41:40', '2019-04-06 08:41:51'),
(150, '2019-01-09', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '10.0000', 0, 1, '2019-04-06 08:46:00', '2019-04-06 08:46:09'),
(151, '2019-01-09', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '10.0000', 0, 1, '2019-04-06 08:46:00', '2019-04-06 08:46:09'),
(152, '2019-01-10', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '10.0000', 0, 1, '2019-04-06 08:50:27', '2019-04-06 08:50:32'),
(153, '2019-01-10', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '10.0000', 0, 1, '2019-04-06 08:50:27', '2019-04-06 08:50:32'),
(154, '2019-01-11', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '10.0000', 0, 1, '2019-04-06 09:07:41', '2019-04-06 09:07:46'),
(155, '2019-01-11', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '10.0000', 0, 1, '2019-04-06 09:07:41', '2019-04-06 09:07:46'),
(156, '2019-01-12', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '15.0000', 0, 1, '2019-04-06 09:16:25', '2019-04-06 09:16:34'),
(157, '2019-01-12', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '15.0000', 0, 1, '2019-04-06 09:16:25', '2019-04-06 09:16:34'),
(158, '2019-01-13', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '10.0000', 0, 1, '2019-04-06 11:46:53', '2019-04-06 11:47:03'),
(159, '2019-01-13', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '10.0000', 0, 1, '2019-04-06 11:46:53', '2019-04-06 11:47:04'),
(160, '2019-01-14', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '10.0000', 0, 1, '2019-04-06 11:49:31', '2019-04-06 11:50:59'),
(161, '2019-01-14', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '10.0000', 0, 1, '2019-04-06 11:49:31', '2019-04-06 11:50:59'),
(162, '2019-01-15', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '10.0000', 0, 1, '2019-04-06 11:52:43', '2019-04-06 11:52:48'),
(163, '2019-01-15', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '10.0000', 0, 1, '2019-04-06 11:52:43', '2019-04-06 11:52:48'),
(164, '2019-01-16', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '10.0000', 0, 1, '2019-04-06 11:56:37', '2019-04-06 11:56:50'),
(165, '2019-01-16', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '10.0000', 0, 1, '2019-04-06 11:56:38', '2019-04-06 11:56:50'),
(166, '2019-01-17', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '125.0000', 0, 1, '2019-04-06 12:01:42', '2019-04-06 12:01:55'),
(167, '2019-01-17', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '125.0000', 0, 1, '2019-04-06 12:01:42', '2019-04-06 12:01:55'),
(168, '2019-01-18', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '100.0000', 0, 1, '2019-04-06 12:18:55', '2019-04-06 12:19:11'),
(169, '2019-01-18', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '100.0000', 0, 1, '2019-04-06 12:18:55', '2019-04-06 12:19:12'),
(170, '2019-01-18', 'receta prueba c', 'ACEITE', '99.0000', 0, 1, '2019-04-06 23:01:59', '2019-04-06 23:02:43'),
(171, '2019-01-19', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '34.0000', 0, 1, '2019-04-06 23:14:39', '2019-04-06 23:14:53'),
(172, '2019-01-19', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '34.0000', 0, 1, '2019-04-06 23:14:39', '2019-04-06 23:14:53'),
(173, '2019-01-19', 'receta prueba B', 'TAPA 63mm, 500cc, TWIST BLANCA', '99.0000', 1, 2, '2019-04-06 23:18:37', '2019-04-06 23:18:43'),
(174, '2019-01-19', 'receta prueba c', 'ACEITE', '99.0000', 0, 1, '2019-04-06 23:20:00', '2019-04-06 23:20:03'),
(175, '2019-01-19', 'Receta prueba A', 'ACEITE', NULL, 0, 1, '2019-04-09 05:40:26', '2019-04-09 05:40:26'),
(176, '2019-01-20', 'Receta prueba A', 'ACEITE', '300.0000', 0, 1, '2019-04-09 05:56:10', '2019-04-09 05:56:14'),
(177, '2019-01-20', 'receta prueba B', 'TAPA 63mm, 500cc, TWIST BLANCA', '300.0000', 1, 2, '2019-04-09 05:56:56', '2019-04-09 05:57:39'),
(178, '2019-01-20', 'receta prueba c', 'ACEITE', '300.0000', 0, 1, '2019-04-09 05:58:44', '2019-04-09 05:59:11'),
(179, '2019-01-20', 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', '500.0000', 0, 1, '2019-04-09 20:35:48', '2019-04-09 20:35:56'),
(180, '2019-01-20', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', '500.0000', 0, 1, '2019-04-09 20:35:48', '2019-04-09 20:35:56'),
(181, '2019-01-20', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', '500.0000', 0, 1, '2019-04-09 20:35:48', '2019-04-09 20:35:56'),
(182, '2019-01-20', 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', '500.0000', 0, 1, '2019-04-09 20:35:48', '2019-04-09 20:35:56'),
(183, '2019-01-20', 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', '500.0000', 0, 1, '2019-04-09 20:36:31', '2019-04-09 20:36:36'),
(184, '2019-01-20', 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', '500.0000', 0, 1, '2019-04-09 20:36:31', '2019-04-09 20:36:36'),
(185, '2019-01-20', 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', '500.0000', 0, 1, '2019-04-09 20:36:31', '2019-04-09 20:36:36'),
(186, '2019-01-20', 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', '500.0000', 0, 1, '2019-04-09 20:36:31', '2019-04-09 20:36:37'),
(187, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', '1500.0000', 0, 1, '2019-04-09 20:54:11', '2019-04-09 20:55:10'),
(188, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', '0.0000', 0, 1, '2019-04-09 20:54:11', '2019-04-09 20:55:10'),
(189, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', NULL, 0, 1, '2019-04-09 20:54:11', '2019-04-09 20:54:11'),
(190, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', NULL, 0, 1, '2019-04-09 20:54:11', '2019-04-09 20:54:11'),
(191, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(192, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(193, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(194, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(195, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(196, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(197, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(198, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(199, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(200, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(201, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(202, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(203, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(204, '2019-01-20', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', NULL, 0, 1, '2019-04-09 20:54:12', '2019-04-09 20:54:12'),
(205, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', '1500.0000', 0, 1, '2019-04-09 21:19:12', '2019-04-09 21:34:09'),
(206, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', '400.0000', 0, 1, '2019-04-09 21:19:12', '2019-04-09 21:34:09'),
(207, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', '100.0000', 0, 1, '2019-04-09 21:19:12', '2019-04-09 21:34:09'),
(208, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', '400.0000', 0, 1, '2019-04-09 21:19:12', '2019-04-09 21:34:09'),
(209, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', '200.0000', 0, 1, '2019-04-09 21:19:12', '2019-04-09 21:34:09'),
(210, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', '200.0000', 0, 1, '2019-04-09 21:19:12', '2019-04-09 21:34:09'),
(211, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', '200.0000', 0, 1, '2019-04-09 21:19:13', '2019-04-09 21:34:09'),
(212, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', '100.0000', 0, 1, '2019-04-09 21:19:13', '2019-04-09 21:34:10'),
(213, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', '9212.0000', 0, 1, '2019-04-09 21:19:13', '2019-04-09 21:34:10'),
(214, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', '9212.0000', 0, 1, '2019-04-09 21:19:13', '2019-04-09 21:34:10'),
(215, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GAS', '200.0000', 0, 1, '2019-04-09 21:19:13', '2019-04-09 21:34:10'),
(216, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ELECTRICIDAD', '200.0000', 0, 1, '2019-04-09 21:19:13', '2019-04-09 21:34:10'),
(217, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AGUA', '200.0000', 0, 1, '2019-04-09 21:19:13', '2019-04-09 21:34:10'),
(218, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', '100.0000', 0, 1, '2019-04-09 21:19:13', '2019-04-09 21:34:10'),
(219, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', '4.0000', 0, 1, '2019-04-09 21:19:13', '2019-04-09 21:34:10'),
(220, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', '20.0000', 0, 1, '2019-04-09 21:19:13', '2019-04-09 21:34:10'),
(221, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', '4.0000', 0, 1, '2019-04-09 21:19:13', '2019-04-09 21:34:11'),
(222, '2019-01-21', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', '200.0000', 0, 1, '2019-04-09 21:19:13', '2019-04-09 21:34:11'),
(223, '2019-01-21', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '9212.0000', 0, 1, '2019-04-09 21:37:39', '2019-04-09 21:39:07'),
(224, '2019-01-21', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '9212.0000', 0, 1, '2019-04-09 21:37:39', '2019-04-09 21:39:07'),
(225, '2019-01-25', 'Receta prueba A', 'ACEITE', '15.0000', 0, 1, '2019-04-14 02:09:05', '2019-04-14 02:09:09'),
(226, '2019-01-25', 'receta prueba B', 'TAPA 63mm, 500cc, TWIST BLANCA', '14.0000', 1, 2, '2019-04-14 02:09:46', '2019-04-14 02:09:55'),
(227, '2019-01-25', 'receta prueba c', 'ACEITE', '12.0000', 0, 1, '2019-04-14 02:10:24', '2019-04-14 02:10:35'),
(228, '2019-01-26', 'Receta prueba A', 'ACEITE', '10.0000', 0, 1, '2019-04-14 03:18:27', '2019-04-14 03:18:30'),
(229, '2019-01-26', 'receta prueba B', 'TAPA 63mm, 500cc, TWIST BLANCA', '2.0000', 1, 2, '2019-04-14 03:20:14', '2019-04-14 03:21:05'),
(230, '2019-01-26', 'receta prueba c', 'ACEITE', NULL, 0, 1, '2019-04-14 03:29:25', '2019-04-14 03:29:25'),
(231, '2019-01-27', 'Receta prueba A', 'ACEITE', '70.0000', 0, 1, '2019-04-14 03:31:21', '2019-04-14 03:31:38'),
(232, '2019-01-27', 'receta prueba B', 'TAPA 63mm, 500cc, TWIST BLANCA', '5.0000', 1, 2, '2019-04-14 03:32:11', '2019-04-14 03:34:50'),
(233, '2019-01-28', 'receta prueba B', 'TAPA 63mm, 500cc, TWIST BLANCA', '2.0000', 1, 2, '2019-04-14 03:47:54', '2019-04-14 03:50:40'),
(234, '2019-01-28', 'receta prueba c', 'ACEITE', '11.0000', 0, 1, '2019-04-14 03:52:40', '2019-04-14 03:56:55'),
(235, '2019-01-28', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', NULL, 0, 1, '2019-04-14 03:56:32', '2019-04-14 03:56:32'),
(236, '2019-01-28', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', NULL, 0, 1, '2019-04-14 03:56:32', '2019-04-14 03:56:32'),
(237, '2019-01-29', 'receta prueba B', 'TAPA 63mm, 500cc, TWIST BLANCA', '72.0000', 1, 2, '2019-04-14 04:16:57', '2019-04-14 04:17:05'),
(238, '2019-01-29', 'receta prueba c', 'ACEITE', '69.0000', 0, 1, '2019-04-14 04:17:52', '2019-04-14 16:29:33'),
(239, '2019-01-29', 'Receta prueba A', 'ACEITE', '100.0000', 0, 1, '2019-04-14 16:32:53', '2019-04-14 16:34:58'),
(240, '2019-01-30', 'receta prueba B', 'TAPA 63mm, 500cc, TWIST BLANCA', '100.0000', 1, 2, '2019-04-14 16:35:59', '2019-04-14 16:36:02'),
(241, '2019-01-30', 'Receta prueba A', 'ACEITE', '3.0000', 0, 1, '2019-04-14 16:52:20', '2019-04-14 16:58:49'),
(242, '2019-01-31', 'Receta prueba A', 'ACEITE', '3.0000', 0, 1, '2019-04-14 17:01:07', '2019-04-14 17:01:09'),
(243, '2019-01-31', 'receta prueba B', 'TAPA 63mm, 500cc, TWIST BLANCA', '3.0000', 1, 2, '2019-04-14 17:02:03', '2019-04-14 17:42:12'),
(244, '2019-02-01', 'Receta prueba A', 'ACEITE', '10.0000', 0, 1, '2019-04-14 22:03:14', '2019-04-14 22:03:52'),
(245, '2019-02-01', 'receta prueba B', 'TAPA 63mm, 500cc, TWIST BLANCA', '10.0000', 1, 2, '2019-04-14 22:04:09', '2019-04-14 22:04:17'),
(246, '2019-02-01', 'receta prueba c', 'ACEITE', '100.0000', 0, 1, '2019-04-14 22:10:54', '2019-04-14 22:11:22');

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

--
-- Volcado de datos para la tabla `saldocaja`
--

INSERT INTO `saldocaja` (`id`, `sc_entidad`, `sc_saldo`, `sc_fecha`, `created_at`, `updated_at`) VALUES
(61, 'Caja Chica', '66326400.0000', '2019-01-01 04:00:00', '2019-02-14 10:28:33', '2019-02-14 10:28:33'),
(62, 'Banco de Venezuela', '49081600.0000', '2019-01-01 04:00:00', '2019-02-14 10:28:33', '2019-02-14 10:28:33'),
(63, 'Venezolano de Crédito', '0.0000', '2019-01-01 04:00:00', '2019-02-14 10:28:33', '2019-02-14 10:28:33'),
(64, 'Banco Bicentenario', '0.0000', '2019-01-01 04:00:00', '2019-02-14 10:28:34', '2019-02-14 10:28:34'),
(65, 'Banco Banesco', '0.0000', '2019-01-01 04:00:00', '2019-02-14 10:28:34', '2019-02-14 10:28:34'),
(66, 'Caja Chica', '66558200.9300', '2019-01-02 04:00:00', '2019-02-14 15:28:52', '2019-02-14 15:28:52'),
(67, 'Banco de Venezuela', '5148417.8200', '2019-01-02 04:00:00', '2019-02-14 15:28:52', '2019-02-14 15:28:52'),
(68, 'Venezolano de Crédito', '-1156881.8600', '2019-01-02 04:00:00', '2019-02-14 15:28:53', '2019-02-14 15:28:53'),
(69, 'Banco Bicentenario', '0.0000', '2019-01-02 04:00:00', '2019-02-14 15:28:53', '2019-02-14 15:28:53'),
(70, 'Banco Banesco', '0.0000', '2019-01-02 04:00:00', '2019-02-14 15:28:53', '2019-02-14 15:28:53'),
(71, 'Caja Chica', '-85641064.3000', '2019-01-03 04:00:00', '2019-03-25 09:42:00', '2019-03-25 09:42:00'),
(72, 'Banco de Venezuela', '5148417.8200', '2019-01-03 04:00:00', '2019-03-25 09:42:00', '2019-03-25 09:42:00'),
(73, 'Venezolano de Crédito', '914375.8600', '2019-01-03 04:00:00', '2019-03-25 09:42:01', '2019-03-25 09:42:01'),
(74, 'Banco Bicentenario', '0.0000', '2019-01-03 04:00:00', '2019-03-25 09:42:01', '2019-03-25 09:42:01'),
(75, 'Banco Banesco', '0.0000', '2019-01-03 04:00:00', '2019-03-25 09:42:01', '2019-03-25 09:42:01'),
(76, 'Caja Chica', '4358935.7000', '2019-01-04 04:00:00', '2019-04-03 05:58:17', '2019-04-03 05:58:17'),
(77, 'Banco de Venezuela', '13527627.2400', '2019-01-04 04:00:00', '2019-04-03 05:58:17', '2019-04-03 05:58:17'),
(78, 'Venezolano de Crédito', '914375.8600', '2019-01-04 04:00:00', '2019-04-03 05:58:17', '2019-04-03 05:58:17'),
(79, 'Banco Bicentenario', '0.0000', '2019-01-04 04:00:00', '2019-04-03 05:58:18', '2019-04-03 05:58:18'),
(80, 'Banco Banesco', '0.0000', '2019-01-04 04:00:00', '2019-04-03 05:58:18', '2019-04-03 05:58:18'),
(81, 'Caja Chica', '4358935.7000', '2019-01-05 04:00:00', '2019-04-05 03:18:47', '2019-04-05 03:18:47'),
(82, 'Banco de Venezuela', '13527627.2400', '2019-01-05 04:00:00', '2019-04-05 03:18:47', '2019-04-05 03:18:47'),
(83, 'Venezolano de Crédito', '914375.8600', '2019-01-05 04:00:00', '2019-04-05 03:18:48', '2019-04-05 03:18:48'),
(84, 'Banco Bicentenario', '0.0000', '2019-01-05 04:00:00', '2019-04-05 03:18:48', '2019-04-05 03:18:48'),
(85, 'Banco Banesco', '0.0000', '2019-01-05 04:00:00', '2019-04-05 03:18:48', '2019-04-05 03:18:48'),
(86, 'Caja Chica', '7660415.7000', '2019-01-06 04:00:00', '2019-04-06 07:33:58', '2019-04-06 07:33:58'),
(87, 'Banco de Venezuela', '13527627.2400', '2019-01-06 04:00:00', '2019-04-06 07:33:58', '2019-04-06 07:33:58'),
(88, 'Venezolano de Crédito', '914375.8600', '2019-01-06 04:00:00', '2019-04-06 07:33:59', '2019-04-06 07:33:59'),
(89, 'Banco Bicentenario', '0.0000', '2019-01-06 04:00:00', '2019-04-06 07:33:59', '2019-04-06 07:33:59'),
(90, 'Banco Banesco', '0.0000', '2019-01-06 04:00:00', '2019-04-06 07:33:59', '2019-04-06 07:33:59'),
(91, 'Caja Chica', '6871528.0200', '2019-01-07 04:00:00', '2019-04-06 08:41:19', '2019-04-06 08:41:19'),
(92, 'Banco de Venezuela', '13527627.2400', '2019-01-07 04:00:00', '2019-04-06 08:41:20', '2019-04-06 08:41:20'),
(93, 'Venezolano de Crédito', '914375.8600', '2019-01-07 04:00:00', '2019-04-06 08:41:20', '2019-04-06 08:41:20'),
(94, 'Banco Bicentenario', '0.0000', '2019-01-07 04:00:00', '2019-04-06 08:41:20', '2019-04-06 08:41:20'),
(95, 'Banco Banesco', '0.0000', '2019-01-07 04:00:00', '2019-04-06 08:41:20', '2019-04-06 08:41:20'),
(96, 'Caja Chica', '6871528.0200', '2019-01-08 04:00:00', '2019-04-06 08:45:31', '2019-04-06 08:45:31'),
(97, 'Banco de Venezuela', '13527627.2400', '2019-01-08 04:00:00', '2019-04-06 08:45:31', '2019-04-06 08:45:31'),
(98, 'Venezolano de Crédito', '914375.8600', '2019-01-08 04:00:00', '2019-04-06 08:45:31', '2019-04-06 08:45:31'),
(99, 'Banco Bicentenario', '0.0000', '2019-01-08 04:00:00', '2019-04-06 08:45:31', '2019-04-06 08:45:31'),
(100, 'Banco Banesco', '0.0000', '2019-01-08 04:00:00', '2019-04-06 08:45:32', '2019-04-06 08:45:32'),
(101, 'Caja Chica', '6871528.0200', '2019-01-09 04:00:00', '2019-04-06 08:50:09', '2019-04-06 08:50:09'),
(102, 'Banco de Venezuela', '13527627.2400', '2019-01-09 04:00:00', '2019-04-06 08:50:09', '2019-04-06 08:50:09'),
(103, 'Venezolano de Crédito', '914375.8600', '2019-01-09 04:00:00', '2019-04-06 08:50:09', '2019-04-06 08:50:09'),
(104, 'Banco Bicentenario', '0.0000', '2019-01-09 04:00:00', '2019-04-06 08:50:09', '2019-04-06 08:50:09'),
(105, 'Banco Banesco', '0.0000', '2019-01-09 04:00:00', '2019-04-06 08:50:09', '2019-04-06 08:50:09'),
(106, 'Caja Chica', '6871528.0200', '2019-01-10 04:00:00', '2019-04-06 09:06:44', '2019-04-06 09:06:44'),
(107, 'Banco de Venezuela', '13527627.2400', '2019-01-10 04:00:00', '2019-04-06 09:06:45', '2019-04-06 09:06:45'),
(108, 'Venezolano de Crédito', '914375.8600', '2019-01-10 04:00:00', '2019-04-06 09:06:45', '2019-04-06 09:06:45'),
(109, 'Banco Bicentenario', '0.0000', '2019-01-10 04:00:00', '2019-04-06 09:06:45', '2019-04-06 09:06:45'),
(110, 'Banco Banesco', '0.0000', '2019-01-10 04:00:00', '2019-04-06 09:06:45', '2019-04-06 09:06:45'),
(111, 'Caja Chica', '6871528.0200', '2019-01-11 04:00:00', '2019-04-06 09:16:09', '2019-04-06 09:16:09'),
(112, 'Banco de Venezuela', '13527627.2400', '2019-01-11 04:00:00', '2019-04-06 09:16:10', '2019-04-06 09:16:10'),
(113, 'Venezolano de Crédito', '914375.8600', '2019-01-11 04:00:00', '2019-04-06 09:16:10', '2019-04-06 09:16:10'),
(114, 'Banco Bicentenario', '0.0000', '2019-01-11 04:00:00', '2019-04-06 09:16:10', '2019-04-06 09:16:10'),
(115, 'Banco Banesco', '0.0000', '2019-01-11 04:00:00', '2019-04-06 09:16:10', '2019-04-06 09:16:10'),
(116, 'Caja Chica', '6871528.0200', '2019-01-12 04:00:00', '2019-04-06 11:46:11', '2019-04-06 11:46:11'),
(117, 'Banco de Venezuela', '13527627.2400', '2019-01-12 04:00:00', '2019-04-06 11:46:12', '2019-04-06 11:46:12'),
(118, 'Venezolano de Crédito', '914375.8600', '2019-01-12 04:00:00', '2019-04-06 11:46:12', '2019-04-06 11:46:12'),
(119, 'Banco Bicentenario', '0.0000', '2019-01-12 04:00:00', '2019-04-06 11:46:12', '2019-04-06 11:46:12'),
(120, 'Banco Banesco', '0.0000', '2019-01-12 04:00:00', '2019-04-06 11:46:12', '2019-04-06 11:46:12'),
(121, 'Caja Chica', '6871528.0200', '2019-01-13 04:00:00', '2019-04-06 11:49:01', '2019-04-06 11:49:01'),
(122, 'Banco de Venezuela', '13527627.2400', '2019-01-13 04:00:00', '2019-04-06 11:49:01', '2019-04-06 11:49:01'),
(123, 'Venezolano de Crédito', '914375.8600', '2019-01-13 04:00:00', '2019-04-06 11:49:01', '2019-04-06 11:49:01'),
(124, 'Banco Bicentenario', '0.0000', '2019-01-13 04:00:00', '2019-04-06 11:49:01', '2019-04-06 11:49:01'),
(125, 'Banco Banesco', '0.0000', '2019-01-13 04:00:00', '2019-04-06 11:49:01', '2019-04-06 11:49:01'),
(126, 'Caja Chica', '6871528.0200', '2019-01-14 04:00:00', '2019-04-06 11:52:30', '2019-04-06 11:52:30'),
(127, 'Banco de Venezuela', '13527627.2400', '2019-01-14 04:00:00', '2019-04-06 11:52:30', '2019-04-06 11:52:30'),
(128, 'Venezolano de Crédito', '914375.8600', '2019-01-14 04:00:00', '2019-04-06 11:52:31', '2019-04-06 11:52:31'),
(129, 'Banco Bicentenario', '0.0000', '2019-01-14 04:00:00', '2019-04-06 11:52:31', '2019-04-06 11:52:31'),
(130, 'Banco Banesco', '0.0000', '2019-01-14 04:00:00', '2019-04-06 11:52:31', '2019-04-06 11:52:31'),
(131, 'Caja Chica', '6871528.0200', '2019-01-15 04:00:00', '2019-04-06 11:56:23', '2019-04-06 11:56:23'),
(132, 'Banco de Venezuela', '13527627.2400', '2019-01-15 04:00:00', '2019-04-06 11:56:23', '2019-04-06 11:56:23'),
(133, 'Venezolano de Crédito', '914375.8600', '2019-01-15 04:00:00', '2019-04-06 11:56:24', '2019-04-06 11:56:24'),
(134, 'Banco Bicentenario', '0.0000', '2019-01-15 04:00:00', '2019-04-06 11:56:24', '2019-04-06 11:56:24'),
(135, 'Banco Banesco', '0.0000', '2019-01-15 04:00:00', '2019-04-06 11:56:24', '2019-04-06 11:56:24'),
(136, 'Caja Chica', '6871528.0200', '2019-01-16 04:00:00', '2019-04-06 12:01:21', '2019-04-06 12:01:21'),
(137, 'Banco de Venezuela', '13527627.2400', '2019-01-16 04:00:00', '2019-04-06 12:01:21', '2019-04-06 12:01:21'),
(138, 'Venezolano de Crédito', '914375.8600', '2019-01-16 04:00:00', '2019-04-06 12:01:22', '2019-04-06 12:01:22'),
(139, 'Banco Bicentenario', '0.0000', '2019-01-16 04:00:00', '2019-04-06 12:01:22', '2019-04-06 12:01:22'),
(140, 'Banco Banesco', '0.0000', '2019-01-16 04:00:00', '2019-04-06 12:01:22', '2019-04-06 12:01:22'),
(141, 'Caja Chica', '173358168.6200', '2019-01-17 04:00:00', '2019-04-06 12:18:29', '2019-04-06 12:18:29'),
(142, 'Banco de Venezuela', '13527627.2400', '2019-01-17 04:00:00', '2019-04-06 12:18:29', '2019-04-06 12:18:29'),
(143, 'Venezolano de Crédito', '914375.8600', '2019-01-17 04:00:00', '2019-04-06 12:18:30', '2019-04-06 12:18:30'),
(144, 'Banco Bicentenario', '0.0000', '2019-01-17 04:00:00', '2019-04-06 12:18:30', '2019-04-06 12:18:30'),
(145, 'Banco Banesco', '0.0000', '2019-01-17 04:00:00', '2019-04-06 12:18:30', '2019-04-06 12:18:30'),
(146, 'Caja Chica', '169118968.6200', '2019-01-18 04:00:00', '2019-04-06 23:12:41', '2019-04-06 23:12:41'),
(147, 'Banco de Venezuela', '13527627.2400', '2019-01-18 04:00:00', '2019-04-06 23:12:41', '2019-04-06 23:12:41'),
(148, 'Venezolano de Crédito', '914375.8600', '2019-01-18 04:00:00', '2019-04-06 23:12:41', '2019-04-06 23:12:41'),
(149, 'Banco Bicentenario', '0.0000', '2019-01-18 04:00:00', '2019-04-06 23:12:42', '2019-04-06 23:12:42'),
(150, 'Banco Banesco', '0.0000', '2019-01-18 04:00:00', '2019-04-06 23:12:42', '2019-04-06 23:12:42'),
(151, 'Caja Chica', '104471237.6120', '2019-01-19 04:00:00', '2019-04-09 05:41:50', '2019-04-09 05:41:50'),
(152, 'Banco de Venezuela', '44574027.2400', '2019-01-19 04:00:00', '2019-04-09 05:41:50', '2019-04-09 05:41:50'),
(153, 'Venezolano de Crédito', '914375.8600', '2019-01-19 04:00:00', '2019-04-09 05:41:50', '2019-04-09 05:41:50'),
(154, 'Banco Bicentenario', '0.0000', '2019-01-19 04:00:00', '2019-04-09 05:41:50', '2019-04-09 05:41:50'),
(155, 'Banco Banesco', '0.0000', '2019-01-19 04:00:00', '2019-04-09 05:41:50', '2019-04-09 05:41:50'),
(156, 'Caja Chica', '211600973.6120', '2019-01-20 04:00:00', '2019-04-09 21:15:19', '2019-04-09 21:15:19'),
(157, 'Banco de Venezuela', '44574027.2400', '2019-01-20 04:00:00', '2019-04-09 21:15:19', '2019-04-09 21:15:19'),
(158, 'Venezolano de Crédito', '914375.8600', '2019-01-20 04:00:00', '2019-04-09 21:15:19', '2019-04-09 21:15:19'),
(159, 'Banco Bicentenario', '0.0000', '2019-01-20 04:00:00', '2019-04-09 21:15:19', '2019-04-09 21:15:19'),
(160, 'Banco Banesco', '0.0000', '2019-01-20 04:00:00', '2019-04-09 21:15:19', '2019-04-09 21:15:19'),
(161, 'Caja Chica', '1375447.9320', '2019-01-21 04:00:00', '2019-04-11 23:32:10', '2019-04-11 23:32:10'),
(162, 'Banco de Venezuela', '64114374.5160', '2019-01-21 04:00:00', '2019-04-11 23:32:10', '2019-04-11 23:32:10'),
(163, 'Venezolano de Crédito', '914375.8600', '2019-01-21 04:00:00', '2019-04-11 23:32:10', '2019-04-11 23:32:10'),
(164, 'Banco Bicentenario', '0.0000', '2019-01-21 04:00:00', '2019-04-11 23:32:11', '2019-04-11 23:32:11'),
(165, 'Banco Banesco', '0.0000', '2019-01-21 04:00:00', '2019-04-11 23:32:11', '2019-04-11 23:32:11'),
(166, 'Caja Chica', '1375447.9320', '2019-01-22 04:00:00', '2019-04-12 20:08:58', '2019-04-12 20:08:58'),
(167, 'Banco de Venezuela', '95745601.7000', '2019-01-22 04:00:00', '2019-04-12 20:08:59', '2019-04-12 20:08:59'),
(168, 'Venezolano de Crédito', '914375.8600', '2019-01-22 04:00:00', '2019-04-12 20:08:59', '2019-04-12 20:08:59'),
(169, 'Banco Bicentenario', '0.0000', '2019-01-22 04:00:00', '2019-04-12 20:08:59', '2019-04-12 20:08:59'),
(170, 'Banco Banesco', '0.0000', '2019-01-22 04:00:00', '2019-04-12 20:08:59', '2019-04-12 20:08:59'),
(171, 'Caja Chica', '1375447.9320', '2019-01-23 04:00:00', '2019-04-12 21:00:57', '2019-04-12 21:00:57'),
(172, 'Banco de Venezuela', '95745601.7000', '2019-01-23 04:00:00', '2019-04-12 21:00:57', '2019-04-12 21:00:57'),
(173, 'Venezolano de Crédito', '914375.8600', '2019-01-23 04:00:00', '2019-04-12 21:00:57', '2019-04-12 21:00:57'),
(174, 'Banco Bicentenario', '0.0000', '2019-01-23 04:00:00', '2019-04-12 21:00:57', '2019-04-12 21:00:57'),
(175, 'Banco Banesco', '0.0000', '2019-01-23 04:00:00', '2019-04-12 21:00:57', '2019-04-12 21:00:57'),
(176, 'Caja Chica', '651367.9320', '2019-01-24 04:00:00', '2019-04-13 15:16:46', '2019-04-13 15:16:46'),
(177, 'Banco de Venezuela', '95535669.7720', '2019-01-24 04:00:00', '2019-04-13 15:16:46', '2019-04-13 15:16:46'),
(178, 'Venezolano de Crédito', '835975.8600', '2019-01-24 04:00:00', '2019-04-13 15:16:46', '2019-04-13 15:16:46'),
(179, 'Banco Bicentenario', '0.0000', '2019-01-24 04:00:00', '2019-04-13 15:16:46', '2019-04-13 15:16:46'),
(180, 'Banco Banesco', '0.0000', '2019-01-24 04:00:00', '2019-04-13 15:16:46', '2019-04-13 15:16:46'),
(181, 'Caja Chica', '651367.9320', '2019-01-25 04:00:00', '2019-04-14 03:17:42', '2019-04-14 03:17:42'),
(182, 'Banco de Venezuela', '95535669.7720', '2019-01-25 04:00:00', '2019-04-14 03:17:42', '2019-04-14 03:17:42'),
(183, 'Venezolano de Crédito', '835975.8600', '2019-01-25 04:00:00', '2019-04-14 03:17:42', '2019-04-14 03:17:42'),
(184, 'Banco Bicentenario', '0.0000', '2019-01-25 04:00:00', '2019-04-14 03:17:43', '2019-04-14 03:17:43'),
(185, 'Banco Banesco', '0.0000', '2019-01-25 04:00:00', '2019-04-14 03:17:43', '2019-04-14 03:17:43'),
(186, 'Caja Chica', '651367.9320', '2019-01-26 04:00:00', '2019-04-14 03:31:02', '2019-04-14 03:31:02'),
(187, 'Banco de Venezuela', '95535669.7720', '2019-01-26 04:00:00', '2019-04-14 03:31:02', '2019-04-14 03:31:02'),
(188, 'Venezolano de Crédito', '835975.8600', '2019-01-26 04:00:00', '2019-04-14 03:31:02', '2019-04-14 03:31:02'),
(189, 'Banco Bicentenario', '0.0000', '2019-01-26 04:00:00', '2019-04-14 03:31:02', '2019-04-14 03:31:02'),
(190, 'Banco Banesco', '0.0000', '2019-01-26 04:00:00', '2019-04-14 03:31:03', '2019-04-14 03:31:03'),
(191, 'Caja Chica', '651367.9320', '2019-01-27 04:00:00', '2019-04-14 03:47:35', '2019-04-14 03:47:35'),
(192, 'Banco de Venezuela', '95535669.7720', '2019-01-27 04:00:00', '2019-04-14 03:47:35', '2019-04-14 03:47:35'),
(193, 'Venezolano de Crédito', '835975.8600', '2019-01-27 04:00:00', '2019-04-14 03:47:35', '2019-04-14 03:47:35'),
(194, 'Banco Bicentenario', '0.0000', '2019-01-27 04:00:00', '2019-04-14 03:47:36', '2019-04-14 03:47:36'),
(195, 'Banco Banesco', '0.0000', '2019-01-27 04:00:00', '2019-04-14 03:47:36', '2019-04-14 03:47:36'),
(196, 'Caja Chica', '651367.9320', '2019-01-28 04:00:00', '2019-04-14 04:16:32', '2019-04-14 04:16:32'),
(197, 'Banco de Venezuela', '97100830.0735', '2019-01-28 04:00:00', '2019-04-14 04:16:32', '2019-04-14 04:16:32'),
(198, 'Venezolano de Crédito', '835975.8600', '2019-01-28 04:00:00', '2019-04-14 04:16:33', '2019-04-14 04:16:33'),
(199, 'Banco Bicentenario', '0.0000', '2019-01-28 04:00:00', '2019-04-14 04:16:33', '2019-04-14 04:16:33'),
(200, 'Banco Banesco', '0.0000', '2019-01-28 04:00:00', '2019-04-14 04:16:33', '2019-04-14 04:16:33'),
(201, 'Caja Chica', '651367.9320', '2019-01-29 04:00:00', '2019-04-14 16:35:44', '2019-04-14 16:35:44'),
(202, 'Banco de Venezuela', '97100830.0735', '2019-01-29 04:00:00', '2019-04-14 16:35:44', '2019-04-14 16:35:44'),
(203, 'Venezolano de Crédito', '835975.8600', '2019-01-29 04:00:00', '2019-04-14 16:35:44', '2019-04-14 16:35:44'),
(204, 'Banco Bicentenario', '0.0000', '2019-01-29 04:00:00', '2019-04-14 16:35:44', '2019-04-14 16:35:44'),
(205, 'Banco Banesco', '0.0000', '2019-01-29 04:00:00', '2019-04-14 16:35:45', '2019-04-14 16:35:45'),
(206, 'Caja Chica', '651367.9320', '2019-01-30 04:00:00', '2019-04-14 17:00:55', '2019-04-14 17:00:55'),
(207, 'Banco de Venezuela', '97100830.0735', '2019-01-30 04:00:00', '2019-04-14 17:00:56', '2019-04-14 17:00:56'),
(208, 'Venezolano de Crédito', '835975.8600', '2019-01-30 04:00:00', '2019-04-14 17:00:56', '2019-04-14 17:00:56'),
(209, 'Banco Bicentenario', '0.0000', '2019-01-30 04:00:00', '2019-04-14 17:00:56', '2019-04-14 17:00:56'),
(210, 'Banco Banesco', '0.0000', '2019-01-30 04:00:00', '2019-04-14 17:00:56', '2019-04-14 17:00:56'),
(211, 'Caja Chica', '651367.9320', '2019-01-31 04:00:00', '2019-04-14 22:02:57', '2019-04-14 22:02:57'),
(212, 'Banco de Venezuela', '97100830.0735', '2019-01-31 04:00:00', '2019-04-14 22:02:57', '2019-04-14 22:02:57'),
(213, 'Venezolano de Crédito', '835975.8600', '2019-01-31 04:00:00', '2019-04-14 22:02:57', '2019-04-14 22:02:57'),
(214, 'Banco Bicentenario', '0.0000', '2019-01-31 04:00:00', '2019-04-14 22:02:57', '2019-04-14 22:02:57'),
(215, 'Banco Banesco', '0.0000', '2019-01-31 04:00:00', '2019-04-14 22:02:58', '2019-04-14 22:02:58');

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

--
-- Volcado de datos para la tabla `totalesventas`
--

INSERT INTO `totalesventas` (`id`, `ven_factura`, `ven_total`, `ven_iva`, `created_at`, `updated_at`) VALUES
(1, '5466551322165', '2313763.7400', 12, '2019-02-14 11:18:30', '2019-02-14 11:18:30'),
(2, '3543646846', '578440.9300', 12, '2019-02-14 12:42:28', '2019-02-14 12:42:28'),
(3, '3435498484986', '578440.9300', 12, '2019-02-14 12:43:06', '2019-02-14 12:43:06'),
(4, '43785634875643', '578440.9300', 12, '2019-02-14 13:54:30', '2019-02-14 13:54:30'),
(5, '5468464656513', '578440.9300', 12, '2019-02-14 14:40:45', '2019-02-14 14:40:45'),
(6, '69561843513556', '0.0000', 12, '2019-02-14 15:02:19', '2019-02-14 15:02:19'),
(7, '65635135131015', '204797.4900', 12, '2019-02-14 16:26:40', '2019-02-14 16:26:40'),
(8, '5465645638615', '3247257.7200', 12, '2019-02-14 23:57:15', '2019-02-14 23:57:15'),
(9, '565556165415', '98379209.4200', 12, '2019-03-25 09:55:57', '2019-03-25 09:55:57'),
(10, '16846565861565', '2688000.0000', 12, '2019-04-05 03:57:27', '2019-04-05 03:57:27'),
(11, '368464564656', '0.0000', 12, '2019-04-05 04:24:10', '2019-04-05 04:24:10'),
(12, '46846515165165', '2688000.0000', 12, '2019-04-05 04:28:06', '2019-04-05 04:28:06'),
(13, '56565168861684', '1344000.0000', 12, '2019-04-05 04:29:51', '2019-04-05 04:29:51'),
(14, '6566686486189', '4032000.0000', 12, '2019-04-05 04:31:51', '2019-04-05 04:31:51'),
(15, '856165156135', '2688000.0000', 12, '2019-04-05 05:12:52', '2019-04-05 05:12:52'),
(16, '7564685183521', '2688000.0000', 12, '2019-04-05 18:25:52', '2019-04-05 18:25:52'),
(17, '16516816518', '167133440.6000', 12, '2019-04-06 12:07:03', '2019-04-06 12:07:03'),
(18, '549864894651864', '103488000.0000', 12, '2019-04-06 23:21:18', '2019-04-06 23:21:18'),
(19, '6735763521327', '0.0000', 12, '2019-04-09 06:54:41', '2019-04-09 06:54:41'),
(20, '48764846783', '15456000.0000', 12, '2019-04-09 08:24:13', '2019-04-09 08:24:13'),
(21, '654535434237', '295431867.2760', 12, '2019-04-11 02:39:17', '2019-04-11 02:39:17'),
(22, '8475843758574398', '167496989.1840', 12, '2019-04-11 23:50:31', '2019-04-11 23:50:31'),
(23, '355138531151', '8285160.3015', 12, '2019-04-14 04:01:22', '2019-04-14 04:01:22');

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
(1, 'Andres Vega', 'andres_vega93@hotmail.com', '$2y$10$4EmD12RT/GyTz47P8bz1l.WQ6OUr5NHCcxpTaTEnf2xEMlSIpvpFO', 'admin', '8ZF1PxEYk1AIHADCJWl4sNdFji8DshoGvJqB2DnfmlKRjZhRQ2VxHs0a7ZV2', '2017-10-11 10:32:19', '2019-04-11 23:41:40'),
(7, 'Carlos', 'carlosteno@gmail.com', '$2y$10$9uwn8GSSYhLxzaSZnhawBu8f0sqBvgRRYHu8yQpI7/pILxLjx.WVK', 'admin', 'J5RWbVZNO1TbIyVmsPepnHUyyXyAlu2mHBQJynPGuwBIS78Fk9JHVBByuSHT', '2017-10-14 15:48:38', '2018-02-12 20:24:56'),
(8, 'clarisa', 'clari98@hotmail.com', '$2y$10$3PdMuwN1QX5OiLW0jhYWWu/PGegeRyRjoaJUPHPq2Y1q6xAAB4mE6', 'tipo1', 'bBBlBCRFAvJDQM0m7IOdpyjauucHgwuUzqGs2zeHERAOdLYpCIHJjRlg9jRo', '2017-12-24 18:33:40', '2019-04-11 23:46:52'),
(9, 'Angélica', 'gavcamerida@gmail.com', '$2y$10$nmvuxdHxxHFRl2pckMARHeQJJ9sjxEV8kg1hLVfJoKvy1NWAbPYMu', 'tipo1', '77kYlLhRAezQrSQf7mP6XcnIPnp3LYiJpwGtJugWppnMSWr18XOL8VawZxlD', '2018-02-07 19:21:08', '2018-02-09 16:07:44'),
(10, 'test', 'mail@mail.com', '$2y$10$BRBmd.UL0KSAzwj6NrOtZOwa98fc/s0YIxD1Tb4lxvPNECw9ouEMK', 'admin', 'QiXg57ED46Vs4JHX9KkzjtTrEB4CsbHhmJdAf10pEGhrsGd11g3lEZJe0oHy', '2018-03-24 10:27:53', '2019-02-08 04:32:45'),
(11, 'Andres2', 'aevega1991@gmail.com', '$2y$10$aGrbbUGzmxz83EsANiV3p.0h4mvH/qibcrKG6QzApTPlLqvwKIApi', 'admin', 'lN8TaKP7UZBtxHC5g6kWQS78CdzJHEVwVaYzjV35QJb6TePeNiec61Ehw87T', '2019-02-08 04:30:20', '2019-02-08 04:33:05');

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
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `cli_codigo`, `ven_fecha`, `ven_factura`, `ven_condicion`, `ven_entidad`, `rec_nombre`, `ven_costo`, `ven_cantidad`, `ven_activo`, `created_at`, `updated_at`) VALUES
(1, 'C00000', '2019-01-02', '5466551322165', 'contado', 'Banco de Venezuela', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '516465.1200', 4, 0, '2019-02-14 11:18:30', '2019-02-14 13:46:50'),
(2, 'C00000', '2019-01-02', '3543646846', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '516465.1200', 1, 1, '2019-02-14 12:42:28', '2019-02-14 12:42:28'),
(3, 'C00000', '2019-01-02', '3435498484986', 'contado', 'Venezolano de Crédito', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '516465.1200', 1, 0, '2019-02-14 12:43:06', '2019-02-14 13:51:03'),
(4, 'C00000', '2019-01-02', '43785634875643', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '516465.1200', 1, 0, '2019-02-14 13:54:30', '2019-02-14 13:57:10'),
(5, 'C00000', '2019-01-02', '5468464656513', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '516465.1200', 1, 0, '2019-02-14 14:40:44', '2019-02-14 14:40:54'),
(6, 'C00000', '2019-01-02', '69561843513556', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '578440.0000', 1, 1, '2019-02-14 15:02:19', '2019-02-14 15:02:19'),
(7, 'C00000', '2019-01-03', '65635135131015', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '1427.4500', 2, 1, '2019-02-14 16:26:40', '2019-02-14 16:26:40'),
(8, 'C00000', '2019-01-03', '65635135131015', 'contado', 'Caja Chica', 'receta prueba c', '90000.0000', 2, 1, '2019-02-14 16:26:40', '2019-02-14 16:26:40'),
(9, 'C00000', '2019-01-03', '5465645638615', 'contado', 'Venezolano de Crédito', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '578440.0000', 5, 1, '2019-02-14 23:57:15', '2019-02-14 23:57:15'),
(10, 'C00000', '2019-01-03', '5465645638615', 'contado', 'Venezolano de Crédito', 'receta prueba c', '1427.4500', 5, 1, '2019-02-14 23:57:15', '2019-02-14 23:57:15'),
(11, 'C00000', '2019-01-04', '565556165415', 'contado', 'Banco de Venezuela', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '347515.8400', 226, 1, '2019-03-25 09:55:57', '2019-03-25 09:55:57'),
(12, 'C00000', '2019-01-04', '565556165415', 'contado', 'Banco de Venezuela', 'receta prueba c', '100000.0000', 93, 1, '2019-03-25 09:55:57', '2019-03-25 09:55:57'),
(15, 'C00000', '2019-01-06', '16846565861565', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '600000.0000', 4, 1, '2019-04-05 03:57:27', '2019-04-05 03:57:27'),
(16, 'C00000', '2019-01-06', '16846565861565', 'contado', 'Caja Chica', 'receta prueba c', '0.0000', 0, 1, '2019-04-05 03:57:27', '2019-04-05 03:57:27'),
(17, 'C00001', '2019-01-06', '368464564656', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '600000.0000', 4, 1, '2019-04-05 04:19:49', '2019-04-05 04:19:49'),
(18, 'C00001', '2019-01-06', '368464564656', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '600000.0000', 4, 1, '2019-04-05 04:22:30', '2019-04-05 04:22:30'),
(19, 'C00001', '2019-01-06', '368464564656', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '600000.0000', 4, 1, '2019-04-05 04:24:10', '2019-04-05 04:24:10'),
(20, 'C00001', '2019-01-06', '46846515165165', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '600000.0000', 4, 1, '2019-04-05 04:28:06', '2019-04-05 04:28:06'),
(21, 'C00000', '2019-01-06', '56565168861684', 'contado', 'Caja Chica', 'receta prueba c', '300000.0000', 4, 1, '2019-04-05 04:29:51', '2019-04-05 04:29:51'),
(22, 'C00001', '2019-01-06', '6566686486189', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '600000.0000', 4, 1, '2019-04-05 04:31:51', '2019-04-05 04:31:51'),
(23, 'C00001', '2019-01-06', '6566686486189', 'contado', 'Caja Chica', 'receta prueba c', '300000.0000', 4, 1, '2019-04-05 04:31:51', '2019-04-05 04:31:51'),
(24, 'C00000', '2019-01-06', '856165156135', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '600000.0000', 4, 1, '2019-04-05 05:12:52', '2019-04-05 05:12:52'),
(25, 'C00001', '2019-01-06', '7564685183521', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '600000.0000', 4, 1, '2019-04-05 18:25:52', '2019-04-05 18:25:52'),
(26, 'C00000', '2019-01-17', '16516816518', 'contado', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '584105.1450', 250, 1, '2019-04-06 12:07:03', '2019-04-06 12:07:03'),
(27, 'C00000', '2019-01-17', '16516816518', 'contado', 'Caja Chica', 'receta prueba c', '400000.0000', 8, 1, '2019-04-06 12:07:03', '2019-04-06 12:07:03'),
(28, 'C00001', '2019-01-19', '549864894651864', 'credito', 'Caja Chica', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '700000.0000', 34, 1, '2019-04-06 23:21:18', '2019-04-06 23:21:18'),
(29, 'C00001', '2019-01-19', '549864894651864', 'credito', 'Caja Chica', 'receta prueba c', '350000.0000', 196, 1, '2019-04-06 23:21:18', '2019-04-06 23:21:18'),
(30, 'C00000', '2019-01-20', '48764846783', 'contado', 'Caja Chica', 'receta prueba c', '92000.0000', 150, 1, '2019-04-09 08:24:13', '2019-04-09 08:24:13'),
(31, 'C00000', '2019-01-21', '654535434237', 'contado', 'Banco de Venezuela', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '733991.7000', 350, 1, '2019-04-11 02:39:17', '2019-04-11 02:39:17'),
(32, 'C00000', '2019-01-21', '654535434237', 'contado', 'Banco de Venezuela', 'receta prueba c', '91751.4390', 75, 1, '2019-04-11 02:39:18', '2019-04-11 02:39:18'),
(33, 'C00000', '2019-01-22', '8475843758574398', 'credito', 'Banco de Venezuela', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '733991.7000', 200, 1, '2019-04-11 23:50:31', '2019-04-11 23:50:31'),
(34, 'C00000', '2019-01-22', '8475843758574398', 'credito', 'Banco de Venezuela', 'receta prueba c', '91751.4400', 30, 1, '2019-04-11 23:50:31', '2019-04-11 23:50:31'),
(35, 'C00001', '2019-01-28', '355138531151', 'contado', 'Banco de Venezuela', 'receta prueba c', '107209.6312', 69, 1, '2019-04-14 04:01:22', '2019-04-14 04:01:22');

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
  ADD KEY `cuentasxcobrar_fk1` (`cta_venta_id`),
  ADD KEY `cuentasxcobrar_fk2` (`cta_cli_codigo`);

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
  ADD UNIQUE KEY `par_codigo` (`par_codigo`),
  ADD KEY `par_default` (`par_default`);

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
  ADD KEY `requerimientos_ibfk_2` (`req_ingrediente`),
  ADD KEY `requerimientos_ibfk_3` (`req_default`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=701;

--
-- AUTO_INCREMENT de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=394;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT de la tabla `costofijos`
--
ALTER TABLE `costofijos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cuentasxcobrar`
--
ALTER TABLE `cuentasxcobrar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cuentasxpagar`
--
ALTER TABLE `cuentasxpagar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT de la tabla `producciona`
--
ALTER TABLE `producciona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `produccionb`
--
ALTER TABLE `produccionb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `produccionc`
--
ALTER TABLE `produccionc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT de la tabla `salarios`
--
ALTER TABLE `salarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `saldocaja`
--
ALTER TABLE `saldocaja`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT de la tabla `totalesventas`
--
ALTER TABLE `totalesventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
  ADD CONSTRAINT `cardexmp_ibfk_1` FOREIGN KEY (`mp_codigo`) REFERENCES `parametros` (`par_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `cuentasxcobrar_fk1` FOREIGN KEY (`cta_venta_id`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibkf_1` FOREIGN KEY (`cli_codigo`) REFERENCES `clientes` (`cli_codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibkf_2` FOREIGN KEY (`ven_factura`) REFERENCES `totalesventas` (`ven_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibkf_3` FOREIGN KEY (`rec_nombre`) REFERENCES `recetas` (`rec_nombre`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
