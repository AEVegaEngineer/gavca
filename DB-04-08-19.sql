-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2019 a las 04:54:50
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
(44, '23.00', 'Marzo 2019, Gaceta Nº 44068', '2019-06-16 08:16:05', '2019-06-16 08:16:05');

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
(1, 'Banco de Venezuela', '2018-01-14 21:37:16', '2019-04-30 04:40:45'),
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
(1203, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-04-30 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-06-18 11:03:22', '2019-06-18 11:03:22'),
(1204, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-18 11:03:22', '2019-06-18 11:37:03'),
(1205, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-04-30 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-06-18 11:03:22', '2019-06-18 11:03:22'),
(1206, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-18 11:03:22', '2019-06-18 11:37:04'),
(1207, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-04-30 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-06-18 11:03:22', '2019-06-18 11:03:22'),
(1208, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-18 11:03:22', '2019-06-18 11:37:04'),
(1209, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-04-30 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-06-18 11:03:22', '2019-06-18 11:03:22'),
(1210, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-18 11:03:22', '2019-06-18 11:37:04'),
(1211, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-04-30 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-06-18 11:03:22', '2019-06-18 11:03:22'),
(1212, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-18 11:03:22', '2019-06-18 11:37:05'),
(1213, 'Caja Chica', '150000000.0000', NULL, NULL, 'DEBE', '2019-05-01 04:00:00', '150000000.0000', 'Entrada generada: Inicio de Operaciones', 0, '2019-06-18 11:03:55', '2019-06-18 11:37:03'),
(1214, 'Banco de Venezuela', '100000000.0000', NULL, NULL, 'DEBE', '2019-05-01 04:00:00', '100000000.0000', 'Entrada generada: Inicio de Operaciones', 0, '2019-06-18 11:04:12', '2019-06-18 11:37:04'),
(1215, 'Caja Chica', '100000000.0000', NULL, NULL, 'HABER', '2019-05-01 04:00:00', '50000000.0000', 'Transferido hacia Banco Bicentenario, Inicio de Operaciones', 0, '2019-06-18 11:04:24', '2019-06-18 11:37:03'),
(1216, 'Banco Bicentenario', '100000000.0000', NULL, NULL, 'DEBE', '2019-05-01 04:00:00', '100000000.0000', 'Transferido desde Caja Chica, Inicio de Operaciones', 0, '2019-06-18 11:04:24', '2019-06-18 11:37:04'),
(1217, 'Banco Bicentenario', '97440000.0000', 32, NULL, 'HABER', '2019-05-01 04:00:00', '2560000.0000', 'Compra', 0, '2019-06-18 11:05:24', '2019-06-18 11:37:04'),
(1218, 'Caja Chica', '1604176.0000', NULL, NULL, 'HABER', '2019-05-01 04:00:00', '48395824.0000', 'Pago de deuda de proveedor P00000', 0, '2019-06-18 11:07:09', '2019-06-18 11:37:03'),
(1219, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-01 04:00:00', '48395824.0000', 'Cierre de caja', 0, '2019-06-18 11:37:04', '2019-06-18 11:37:04'),
(1220, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-02 04:00:00', '48395824.0000', 'Inicio de caja', 0, '2019-06-18 11:37:04', '2019-06-18 11:40:40'),
(1221, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-01 04:00:00', '100000000.0000', 'Cierre de caja', 0, '2019-06-18 11:37:04', '2019-06-18 11:37:04'),
(1222, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-02 04:00:00', '100000000.0000', 'Inicio de caja', 0, '2019-06-18 11:37:04', '2019-06-18 11:40:40'),
(1223, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-01 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-06-18 11:37:04', '2019-06-18 11:37:04'),
(1224, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-02 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-18 11:37:04', '2019-06-18 11:40:40'),
(1225, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-01 04:00:00', '2560000.0000', 'Cierre de caja', 0, '2019-06-18 11:37:05', '2019-06-18 11:37:05'),
(1226, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-02 04:00:00', '2560000.0000', 'Inicio de caja', 0, '2019-06-18 11:37:05', '2019-06-18 11:40:40'),
(1227, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-01 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-06-18 11:37:05', '2019-06-18 11:37:05'),
(1228, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-02 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-18 11:37:05', '2019-06-18 11:40:41'),
(1229, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-02 04:00:00', '48395824.0000', 'Cierre de caja', 0, '2019-06-18 11:40:40', '2019-06-18 11:40:40'),
(1230, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-03 04:00:00', '48395824.0000', 'Inicio de caja', 0, '2019-06-18 11:40:40', '2019-06-18 11:43:38'),
(1231, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-02 04:00:00', '100000000.0000', 'Cierre de caja', 0, '2019-06-18 11:40:40', '2019-06-18 11:40:40'),
(1232, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-03 04:00:00', '100000000.0000', 'Inicio de caja', 0, '2019-06-18 11:40:40', '2019-06-18 11:43:38'),
(1233, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-02 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-06-18 11:40:40', '2019-06-18 11:40:40'),
(1234, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-03 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-18 11:40:40', '2019-06-18 11:43:39'),
(1235, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-02 04:00:00', '2560000.0000', 'Cierre de caja', 0, '2019-06-18 11:40:40', '2019-06-18 11:40:40'),
(1236, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-03 04:00:00', '2560000.0000', 'Inicio de caja', 0, '2019-06-18 11:40:41', '2019-06-18 11:43:39'),
(1237, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-02 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-06-18 11:40:41', '2019-06-18 11:40:41'),
(1238, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-03 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-18 11:40:41', '2019-06-18 11:43:39'),
(1239, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-03 04:00:00', '48395824.0000', 'Cierre de caja', 0, '2019-06-18 11:43:38', '2019-06-18 11:43:38'),
(1240, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-04 04:00:00', '48395824.0000', 'Inicio de caja', 0, '2019-06-18 11:43:38', '2019-06-19 01:59:16'),
(1241, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-03 04:00:00', '100000000.0000', 'Cierre de caja', 0, '2019-06-18 11:43:38', '2019-06-18 11:43:38'),
(1242, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-04 04:00:00', '100000000.0000', 'Inicio de caja', 0, '2019-06-18 11:43:39', '2019-06-19 01:59:16'),
(1243, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-03 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-06-18 11:43:39', '2019-06-18 11:43:39'),
(1244, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-04 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-18 11:43:39', '2019-06-19 01:59:17'),
(1245, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-03 04:00:00', '2560000.0000', 'Cierre de caja', 0, '2019-06-18 11:43:39', '2019-06-18 11:43:39'),
(1246, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-04 04:00:00', '2560000.0000', 'Inicio de caja', 0, '2019-06-18 11:43:39', '2019-06-19 01:59:17'),
(1247, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-03 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-06-18 11:43:39', '2019-06-18 11:43:39'),
(1248, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-04 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-18 11:43:39', '2019-06-19 01:59:17'),
(1249, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-04 04:00:00', '48395824.0000', 'Cierre de caja', 0, '2019-06-19 01:59:16', '2019-06-19 01:59:16'),
(1250, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-05 04:00:00', '48395824.0000', 'Inicio de caja', 0, '2019-06-19 01:59:16', '2019-07-26 00:55:29'),
(1251, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-04 04:00:00', '100000000.0000', 'Cierre de caja', 0, '2019-06-19 01:59:16', '2019-06-19 01:59:16'),
(1252, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-05 04:00:00', '100000000.0000', 'Inicio de caja', 0, '2019-06-19 01:59:17', '2019-07-26 00:55:29'),
(1253, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-04 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-06-19 01:59:17', '2019-06-19 01:59:17'),
(1254, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-05 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-19 01:59:17', '2019-07-26 00:55:30'),
(1255, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-04 04:00:00', '2560000.0000', 'Cierre de caja', 0, '2019-06-19 01:59:17', '2019-06-19 01:59:17'),
(1256, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-05 04:00:00', '2560000.0000', 'Inicio de caja', 0, '2019-06-19 01:59:17', '2019-07-26 00:55:30'),
(1257, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-04 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-06-19 01:59:17', '2019-06-19 01:59:17'),
(1258, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-05 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-06-19 01:59:17', '2019-07-26 00:55:30'),
(1259, 'Caja Chica', '2004800.0000', 36, NULL, 'HABER', '2019-05-05 04:00:00', '46391024.0000', 'Compra', 0, '2019-07-26 00:44:18', '2019-07-26 00:55:29'),
(1260, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-05 04:00:00', '46391024.0000', 'Cierre de caja', 0, '2019-07-26 00:55:29', '2019-07-26 00:55:29'),
(1261, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-06 04:00:00', '46391024.0000', 'Inicio de caja', 0, '2019-07-26 00:55:29', '2019-08-01 23:40:34'),
(1262, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-05 04:00:00', '100000000.0000', 'Cierre de caja', 0, '2019-07-26 00:55:30', '2019-07-26 00:55:30'),
(1263, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-06 04:00:00', '100000000.0000', 'Inicio de caja', 0, '2019-07-26 00:55:30', '2019-08-01 23:40:34'),
(1264, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-05 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-07-26 00:55:30', '2019-07-26 00:55:30'),
(1265, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-06 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-07-26 00:55:30', '2019-08-01 23:40:35'),
(1266, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-05 04:00:00', '2560000.0000', 'Cierre de caja', 0, '2019-07-26 00:55:30', '2019-07-26 00:55:30'),
(1267, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-06 04:00:00', '2560000.0000', 'Inicio de caja', 0, '2019-07-26 00:55:30', '2019-08-01 23:40:35'),
(1268, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-05 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-07-26 00:55:30', '2019-07-26 00:55:30'),
(1269, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-06 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-07-26 00:55:30', '2019-08-01 23:40:36'),
(1270, 'Caja Chica', '34720.0000', 37, NULL, 'HABER', '2019-05-06 04:00:00', '46356304.0000', 'Compra', 0, '2019-07-31 03:32:18', '2019-08-01 23:40:34'),
(1271, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-06 04:00:00', '46356304.0000', 'Cierre de caja', 0, '2019-08-01 23:40:34', '2019-08-01 23:40:34'),
(1272, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-05-07 04:00:00', '46356304.0000', 'Inicio de caja', 1, '2019-08-01 23:40:34', '2019-08-01 23:40:34'),
(1273, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-06 04:00:00', '100000000.0000', 'Cierre de caja', 0, '2019-08-01 23:40:35', '2019-08-01 23:40:35'),
(1274, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-05-07 04:00:00', '100000000.0000', 'Inicio de caja', 1, '2019-08-01 23:40:35', '2019-08-01 23:40:35'),
(1275, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-06 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-08-01 23:40:35', '2019-08-01 23:40:35'),
(1276, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-05-07 04:00:00', '0.0000', 'Inicio de caja', 1, '2019-08-01 23:40:35', '2019-08-01 23:40:35'),
(1277, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-06 04:00:00', '2560000.0000', 'Cierre de caja', 0, '2019-08-01 23:40:35', '2019-08-01 23:40:35'),
(1278, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-05-07 04:00:00', '2560000.0000', 'Inicio de caja', 1, '2019-08-01 23:40:35', '2019-08-01 23:40:35'),
(1279, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-06 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-08-01 23:40:36', '2019-08-01 23:40:36'),
(1280, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-05-07 04:00:00', '0.0000', 'Inicio de caja', 1, '2019-08-01 23:40:36', '2019-08-01 23:40:36'),
(1281, 'Caja Chica', '32760000.0000', 38, NULL, 'HABER', '2019-05-07 04:00:00', '13596304.0000', 'Compra', 1, '2019-08-02 14:45:43', '2019-08-02 14:45:43'),
(1282, 'Caja Chica', '3360000.0000', NULL, 3, 'DEBE', '2019-05-07 04:00:00', '16956304.0000', 'Venta', 1, '2019-08-02 14:46:47', '2019-08-02 14:46:47');

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
(346, 'MI00000', '48795384598459', '31000.0000', '0.0000', '200.0000', '12%', '744000.0000', 32, NULL, NULL, '2019-06-18 11:05:24', '2019-06-18 11:05:24'),
(347, 'MI00001', '48795384598459', '500000.0000', '0.0000', '140.0000', '12%', '8400000.0000', 32, NULL, NULL, '2019-06-18 11:05:24', '2019-06-18 11:05:24'),
(348, 'MI00002', '48795384598459', '9000.0000', '0.0000', '200.0000', '12%', '216000.0000', 32, NULL, NULL, '2019-06-18 11:05:24', '2019-06-18 11:05:24'),
(349, 'MP00000', '48795384598459', '45000.0000', '0.0000', '200.0000', '12%', '1080000.0000', 32, NULL, NULL, '2019-06-18 11:05:24', '2019-06-18 11:05:24'),
(350, 'MI00019', '47563847563', '661.5000', '0.0000', '200.0000', '12%', '15876.0000', 33, NULL, NULL, '2019-06-18 11:06:12', '2019-06-18 11:06:12'),
(351, 'MI00014', '47563847563', '1000.0000', '0.0000', '200.0000', '12%', '24000.0000', 33, NULL, NULL, '2019-06-18 11:06:12', '2019-06-18 11:06:12'),
(352, 'MI00013', '47563847563', '3000.0000', '0.0000', '200.0000', '12%', '72000.0000', 33, NULL, NULL, '2019-06-18 11:06:12', '2019-06-18 11:06:12'),
(353, 'MI00015', '47563847563', '2500.0000', '0.0000', '200.0000', '12%', '60000.0000', 33, NULL, NULL, '2019-06-18 11:06:12', '2019-06-18 11:06:12'),
(354, 'MI00000', NULL, NULL, '200.0000', '194.5000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-01', '2019-06-18 11:11:34', '2019-06-18 11:11:34'),
(355, 'MI00001', NULL, NULL, '140.0000', '133.4000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-01', '2019-06-18 11:11:34', '2019-06-18 11:11:34'),
(356, 'MI00002', NULL, NULL, '200.0000', '195.2000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-05-01', '2019-06-18 11:12:46', '2019-06-18 11:12:46'),
(357, 'MP00000', NULL, NULL, '200.0000', '192.8000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-05-01', '2019-06-18 11:12:46', '2019-06-18 11:12:46'),
(358, 'MI00013', NULL, NULL, '200.0000', '187.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-01', '2019-06-18 11:13:52', '2019-06-18 11:13:52'),
(359, 'MI00019', NULL, NULL, '200.0000', '187.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-01', '2019-06-18 11:13:52', '2019-06-18 11:13:52'),
(360, 'MI00014', NULL, NULL, '200.0000', '187.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-01', '2019-06-18 11:13:52', '2019-06-18 11:13:52'),
(361, 'MI00027', '25468543465', '10000.0000', '0.0000', '200.0000', '12%', '240000.0000', 34, NULL, NULL, '2019-06-18 11:35:34', '2019-06-18 11:35:34'),
(362, 'MI00007', '2', '500.0000', '0.0000', '200.0000', '12%', '12000.0000', 35, NULL, NULL, '2019-06-18 11:36:23', '2019-06-18 11:36:23'),
(363, 'MI00027', NULL, NULL, '200.0000', '190.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-05-01', '2019-06-18 11:36:38', '2019-06-18 11:36:38'),
(364, 'MI00007', NULL, NULL, '200.0000', '199.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-05-01', '2019-06-18 11:36:39', '2019-06-18 11:36:39'),
(365, 'MI00000', NULL, NULL, '194.5000', '193.5000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-02', '2019-06-18 11:39:22', '2019-06-18 11:39:22'),
(366, 'MI00001', NULL, NULL, '133.4000', '132.2000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-02', '2019-06-18 11:39:22', '2019-06-18 11:39:22'),
(367, 'MI00002', NULL, NULL, '195.2000', '194.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-05-02', '2019-06-18 11:39:42', '2019-06-18 11:39:42'),
(368, 'MP00000', NULL, NULL, '192.8000', '191.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-05-02', '2019-06-18 11:39:42', '2019-06-18 11:39:42'),
(369, 'MI00000', NULL, NULL, '193.5000', '143.5000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-03', '2019-06-18 11:41:04', '2019-06-18 11:41:04'),
(370, 'MI00001', NULL, NULL, '132.2000', '72.2000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-03', '2019-06-18 11:41:05', '2019-06-18 11:41:05'),
(371, 'MI00002', NULL, NULL, '194.0000', '154.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-05-03', '2019-06-18 11:41:18', '2019-06-18 11:41:18'),
(372, 'MP00000', NULL, NULL, '191.0000', '131.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-05-03', '2019-06-18 11:41:18', '2019-06-18 11:41:18'),
(373, 'MI00013', NULL, NULL, '187.0000', '175.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-03', '2019-06-18 11:41:49', '2019-06-18 11:41:49'),
(374, 'MI00019', NULL, NULL, '187.0000', '175.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-03', '2019-06-18 11:41:50', '2019-06-18 11:41:50'),
(375, 'MI00014', NULL, NULL, '187.0000', '175.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-03', '2019-06-18 11:41:50', '2019-06-18 11:41:50'),
(376, 'MI00027', NULL, NULL, '190.0000', '180.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-05-03', '2019-06-18 11:43:19', '2019-06-18 11:43:19'),
(377, 'MI00007', NULL, NULL, '199.0000', '198.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-05-03', '2019-06-18 11:43:19', '2019-06-18 11:43:19'),
(378, 'MI00000', NULL, NULL, '143.5000', '141.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-04', '2019-06-18 11:44:23', '2019-06-18 11:44:23'),
(379, 'MI00001', NULL, NULL, '72.2000', '69.2000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-04', '2019-06-18 11:44:23', '2019-06-18 11:44:23'),
(380, 'MI00002', NULL, NULL, '154.0000', '150.8000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-05-04', '2019-06-18 11:44:41', '2019-06-18 11:44:41'),
(381, 'MP00000', NULL, NULL, '131.0000', '126.2000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-05-04', '2019-06-18 11:44:41', '2019-06-18 11:44:41'),
(382, 'MI00013', NULL, NULL, '175.0000', '160.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-04', '2019-06-18 11:45:05', '2019-06-18 11:45:05'),
(383, 'MI00019', NULL, NULL, '175.0000', '160.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-04', '2019-06-18 11:45:05', '2019-06-18 11:45:05'),
(384, 'MI00014', NULL, NULL, '175.0000', '160.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-04', '2019-06-18 11:45:05', '2019-06-18 11:45:05'),
(385, 'MI00027', NULL, NULL, '180.0000', '170.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-05-04', '2019-06-18 11:45:28', '2019-06-18 11:45:28'),
(386, 'MI00007', NULL, NULL, '198.0000', '197.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-05-04', '2019-06-18 11:45:28', '2019-06-18 11:45:28'),
(387, 'MI00000', NULL, NULL, '141.0000', '137.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-05', '2019-06-19 02:00:53', '2019-06-19 02:00:53'),
(388, 'MI00001', NULL, NULL, '69.2000', '64.4000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-05', '2019-06-19 02:00:54', '2019-06-19 02:00:54'),
(389, 'MI00002', NULL, NULL, '150.8000', '147.2000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-05-05', '2019-06-19 02:01:25', '2019-06-19 02:01:25'),
(390, 'MP00000', NULL, NULL, '126.2000', '120.8000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-05-05', '2019-06-19 02:01:25', '2019-06-19 02:01:25'),
(391, 'MI00013', NULL, NULL, '160.0000', '151.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-05', '2019-06-19 02:02:14', '2019-06-19 02:02:14'),
(392, 'MI00019', NULL, NULL, '160.0000', '151.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-05', '2019-06-19 02:02:14', '2019-06-19 02:02:14'),
(393, 'MI00014', NULL, NULL, '160.0000', '151.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-05', '2019-06-19 02:02:14', '2019-06-19 02:02:14'),
(394, 'MI00027', NULL, NULL, '170.0000', '160.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-05-05', '2019-06-19 02:02:44', '2019-06-19 02:02:44'),
(395, 'MI00007', NULL, NULL, '197.0000', '196.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-05-05', '2019-06-19 02:02:44', '2019-06-19 02:02:44'),
(396, 'MI00000', '4875384584', '31000.0000', '137.0000', '187.0000', '12%', '186000.0000', 36, NULL, NULL, '2019-07-26 00:44:18', '2019-07-26 00:44:18'),
(397, 'MP00001', '4875384584', '4000.0000', '0.0000', '50.0000', '12%', '24000.0000', 36, NULL, NULL, '2019-07-26 00:44:19', '2019-07-26 00:44:19'),
(398, 'MI00008', '4875384584', '500.0000', '0.0000', '50.0000', '12%', '3000.0000', 36, NULL, NULL, '2019-07-26 00:44:19', '2019-07-26 00:44:19'),
(399, 'MI00009', '4875384584', '300.0000', '0.0000', '50.0000', '12%', '1800.0000', 36, NULL, NULL, '2019-07-26 00:44:19', '2019-07-26 00:44:19'),
(400, 'MI00000', NULL, NULL, '187.0000', '182.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-06', '2019-07-26 00:56:06', '2019-07-26 00:56:06'),
(401, 'MI00001', NULL, NULL, '64.4000', '58.4000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-06', '2019-07-26 00:56:07', '2019-07-26 00:56:07'),
(402, 'MI00013', NULL, NULL, '151.0000', '101.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-06', '2019-07-26 00:57:26', '2019-07-26 00:57:26'),
(403, 'MI00019', NULL, NULL, '151.0000', '101.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-06', '2019-07-26 00:57:26', '2019-07-26 00:57:26'),
(404, 'MI00014', NULL, NULL, '151.0000', '101.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-06', '2019-07-26 00:57:26', '2019-07-26 00:57:26'),
(405, 'MI00000', '48578345734', '31000.0000', '182.0000', '183.0000', '12%', '3720.0000', 37, NULL, NULL, '2019-07-31 03:32:18', '2019-07-31 03:32:18'),
(406, 'MI00013', NULL, NULL, '101.0000', '90.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-07', '2019-08-01 23:43:20', '2019-08-01 23:43:20'),
(407, 'MI00019', NULL, NULL, '101.0000', '90.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-07', '2019-08-01 23:43:20', '2019-08-01 23:43:20'),
(408, 'MI00014', NULL, NULL, '101.0000', '90.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-05-07', '2019-08-01 23:43:20', '2019-08-01 23:43:20'),
(409, 'MI00000', NULL, NULL, '183.0000', '178.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-07', '2019-08-01 23:43:55', '2019-08-01 23:43:55'),
(410, 'MI00001', NULL, NULL, '58.4000', '52.4000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-05-07', '2019-08-01 23:43:55', '2019-08-01 23:43:55'),
(411, 'MI00002', NULL, NULL, '147.2000', '143.2000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-05-07', '2019-08-01 23:44:09', '2019-08-01 23:44:09'),
(412, 'MP00000', NULL, NULL, '120.8000', '114.8000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-05-07', '2019-08-01 23:44:10', '2019-08-01 23:44:10'),
(413, 'MI00000', '47856475435438', '31000.0000', '178.0000', '228.0000', '12%', '186000.0000', 38, NULL, NULL, '2019-08-02 14:45:43', '2019-08-02 14:45:43'),
(414, 'MI00001', '47856475435438', '500000.0000', '52.4000', '102.4000', '12%', '3000000.0000', 38, NULL, NULL, '2019-08-02 14:45:44', '2019-08-02 14:45:44'),
(415, 'MI00002', '47856475435438', '9000.0000', '143.2000', '193.2000', '12%', '54000.0000', 38, NULL, NULL, '2019-08-02 14:45:44', '2019-08-02 14:45:44'),
(416, 'MP00000', '47856475435438', '45000.0000', '114.8000', '164.8000', '12%', '270000.0000', 38, NULL, NULL, '2019-08-02 14:45:44', '2019-08-02 14:45:44');

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
(2, 'C00001', 'cliente dos', 'J62626512962', 'Centro Av.5 con Calle 15, Edif. Juan Ramos, Local 2', '04169856865', 'Contado', '5878809.5910', '2019-04-05 03:40:45', '2019-07-31 03:02:24'),
(3, 'C00002', 'cliente tres', 'J62626512', 'Centro Av.5 con Calle 15, Edif. Juan Ramos, Local 2', '04169856865', 'Contado', '0.0000', '2019-05-25 05:47:46', '2019-06-16 04:52:12'),
(4, 'C00003', 'Client four', 'J-26845642', 'Mérida, edo. Mérida, Centro, Calle 20, Edificio Crisostomo, Local 3', '0274-3645364', 'Crédito', '0.0000', '2019-06-07 19:16:14', '2019-06-07 19:31:13'),
(5, 'C00004', 'cliente 1', 'J62626512962', 'Mérida, edo. Mérida, Centro, Calle 20, Edificio Crisostomo, Local 3', '04169856865', 'Contado', '0.0000', '2019-06-18 11:28:23', '2019-06-18 11:28:23');

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
(32, '48795384598459', 'P00000', '2019-05-01 04:00:00', '97440000.0000', 'contado', 'Banco Bicentenario', 1, '2019-06-18 11:05:23', '2019-06-18 11:05:23'),
(33, '47563847563', 'P00000', '2019-05-01 04:00:00', '1604176.0000', 'credito', NULL, 1, '2019-06-18 11:06:12', '2019-06-18 11:06:12'),
(34, '25468543465', 'P00000', '2019-05-01 04:00:00', '2240000.0000', 'credito', NULL, 1, '2019-06-18 11:35:34', '2019-06-18 11:35:34'),
(35, '2', 'P00000', '2019-05-01 04:00:00', '112000.0000', 'credito', NULL, 1, '2019-06-18 11:36:22', '2019-06-18 11:36:22'),
(36, '4875384584', 'P00000', '2019-05-05 04:00:00', '2004800.0000', 'contado', 'Caja Chica', 1, '2019-07-26 00:44:18', '2019-07-26 00:44:18'),
(37, '48578345734', 'P00009', '2019-05-06 04:00:00', '34720.0000', 'contado', 'Caja Chica', 1, '2019-07-31 03:32:18', '2019-07-31 03:32:18'),
(38, '47856475435438', 'P00003', '2019-05-07 04:00:00', '32760000.0000', 'contado', 'Caja Chica', 1, '2019-08-02 14:45:43', '2019-08-02 14:45:43');

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
(1, 'ALQUILER PLANTA MOCOTIES', '70000.00', '2017-10-22 09:41:45', '2019-06-02 19:32:08'),
(2, 'ALQUILER DEPÓSITO Y OFICINA', '90000.00', '2017-10-22 09:44:40', '2019-06-02 19:32:23'),
(3, 'SUELDOS  ADMINISTRATIVOS', '1946082.36', '2017-10-22 09:44:54', '2019-06-02 19:32:51'),
(4, 'HONORARIOS CONTADOR', '70000.00', '2017-10-22 09:45:06', '2019-06-02 19:32:56'),
(5, 'HONORARIOS ABOGADOS (ACTAS)', '8232.33', '2017-10-22 09:45:21', '2019-06-02 19:33:03'),
(6, 'SISTEMA DE ALARMA (SISTEL)', '2000.00', '2017-10-22 09:45:34', '2019-06-02 19:33:10'),
(7, 'SUELDO MARINO ROJAS', '326542.00', '2017-10-22 09:45:48', '2019-06-02 19:33:21'),
(9, 'HONORARIOS ASESOSRÍA EN SEGURIDAD INDUSTRIAL', '12000.00', '2017-11-01 05:17:16', '2019-06-02 19:33:43');

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
(1, 'C00001', '2518809.5910', 'Venta de factura 45873485743 de fecha 2019-05-05', 1, NULL, '', NULL, '2019-07-26 00:53:13', '2019-07-26 00:53:13'),
(2, 'C00001', '3360000.0000', 'Venta de factura 7564754857489 de fecha 2019-05-06', 2, NULL, '', NULL, '2019-07-31 03:02:24', '2019-07-31 03:02:24');

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
(18, 'P00000', '1604176.0000', 'Compra a crédito bajo factura: 47563847563 de fecha 2019-05-01', 33, NULL, 1, NULL, '2019-06-18 11:06:12', '2019-06-18 11:07:09'),
(19, 'P00000', '1604176.0000', 'Pago de deuda - pago deuda', NULL, 'Caja Chica', NULL, '2019-05-01 04:00:00', '2019-06-18 11:07:10', '2019-06-18 11:07:10'),
(20, 'P00000', '2240000.0000', 'Compra a crédito bajo factura: 25468543465 de fecha 2019-05-01', 34, NULL, NULL, NULL, '2019-06-18 11:35:34', '2019-06-18 11:35:34'),
(21, 'P00000', '112000.0000', 'Compra a crédito bajo factura: 2 de fecha 2019-05-01', 35, NULL, NULL, NULL, '2019-06-18 11:36:22', '2019-06-18 11:36:22');

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
(4, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PICADO BLANDO ANTIPASTO (kilo)', NULL, 12, '2019-02-14 10:39:00', '2019-04-30 07:23:37'),
(5, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PICADO DURO ANTIPASTO (kilo)', NULL, 11, '2019-02-14 10:39:16', '2019-04-30 07:23:37'),
(10, 'Producto Ejemplo Presentación 12 Unid.', 'Producto terminado ejemplo', 180, 12, '2019-06-02 00:33:02', '2019-06-19 02:02:43'),
(25, 'Producto terminado ejemplo', 'Producto Semiprocesado Ejemplo 2', 177, 5, '2019-06-15 18:35:43', '2019-08-01 23:43:20'),
(26, 'Producto terminado ejemplo', 'Producto Semiprocesado Ejemplo 1', 184, 6, '2019-06-15 18:35:46', '2019-08-01 23:43:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `rec_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ing_ingrediente` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ing_default` int(1) NOT NULL DEFAULT '0',
  `ing_ratio` decimal(10,4) NOT NULL DEFAULT '1.0000',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `rec_nombre`, `ing_ingrediente`, `ing_default`, `ing_ratio`, `created_at`, `updated_at`) VALUES
(41, 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', 0, '1.0000', '2017-12-28 20:02:03', '2017-12-28 20:02:03'),
(42, 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', 0, '1.0000', '2017-12-28 20:02:20', '2017-12-28 20:02:20'),
(43, 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', 0, '1.0000', '2017-12-28 20:02:34', '2017-12-28 20:02:34'),
(44, 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', 0, '1.0000', '2017-12-28 20:03:14', '2017-12-28 20:03:14'),
(45, 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', 0, '1.0000', '2017-12-28 22:43:03', '2017-12-28 22:43:03'),
(46, 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', 0, '1.0000', '2017-12-28 22:43:14', '2017-12-28 22:43:14'),
(47, 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', 0, '1.0000', '2017-12-28 22:43:31', '2017-12-28 22:43:31'),
(48, 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', 0, '1.0000', '2017-12-28 22:43:52', '2017-12-28 22:43:52'),
(49, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', 0, '1.0000', '2017-12-28 22:49:27', '2017-12-28 22:49:27'),
(50, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', 0, '1.0000', '2017-12-28 22:49:44', '2017-12-28 22:49:44'),
(51, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', 0, '1.0000', '2017-12-28 22:49:49', '2017-12-28 22:49:49'),
(52, 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', 0, '1.0000', '2017-12-28 22:54:50', '2017-12-28 22:54:50'),
(53, 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', 0, '1.0000', '2017-12-28 22:54:57', '2017-12-28 22:54:57'),
(54, 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', 0, '1.0000', '2017-12-28 22:55:05', '2017-12-28 22:55:05'),
(55, 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', 0, '1.0000', '2017-12-28 22:56:03', '2017-12-28 22:56:03'),
(62, 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', 0, '1.0000', '2017-12-28 23:24:06', '2017-12-28 23:24:06'),
(63, 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', 0, '1.0000', '2017-12-28 23:24:12', '2017-12-28 23:24:12'),
(64, 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', 0, '1.0000', '2017-12-28 23:24:18', '2017-12-28 23:24:18'),
(65, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', 0, '1.0000', '2017-12-28 23:24:23', '2017-12-28 23:24:23'),
(66, 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', 0, '1.0000', '2017-12-28 23:24:30', '2017-12-28 23:24:30'),
(68, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', 0, '1.0000', '2018-01-11 20:37:36', '2018-01-11 20:37:36'),
(70, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', 0, '1.0000', '2018-03-23 18:00:25', '2018-03-23 18:00:25'),
(98, 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', 1, '1.0000', '2019-04-15 21:04:36', '2019-04-15 21:04:36'),
(99, 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', 1, '1.0000', '2019-04-15 21:04:49', '2019-04-15 21:04:49'),
(101, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', 0, '1.0000', '2019-06-01 17:57:04', '2019-06-01 17:57:04'),
(115, 'Producto terminado ejemplo', 'FRASCO 500CC', 1, '1.0000', '2019-06-01 22:00:23', '2019-06-01 22:00:23'),
(116, 'Producto terminado ejemplo', 'TAPA 63mm, 500cc, TWIST BLANCA', 1, '1.0000', '2019-06-01 22:00:28', '2019-06-01 22:00:28'),
(118, 'Producto terminado ejemplo', 'PRESINTO FRASCO 500cc', 1, '1.0000', '2019-06-01 22:03:22', '2019-06-01 22:03:22'),
(119, 'Producto Ejemplo Presentación 12 Unid.', 'PLASTICO TERMOENCOJIBLE', 1, '10.0000', '2019-06-02 00:33:54', '2019-06-02 00:33:54'),
(121, 'Producto Ejemplo Presentación 12 Unid.', 'BANDEJA CARTÓN 12x500cc', 1, '1.0000', '2019-06-02 00:45:22', '2019-06-02 00:45:22'),
(124, 'Producto Semiprocesado Ejemplo 1', 'ACEITE', 1, '0.5000', '2019-06-09 15:26:54', '2019-06-09 15:26:54'),
(125, 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', 1, '0.6000', '2019-06-09 15:27:02', '2019-06-09 15:27:02'),
(130, 'Producto Semiprocesado Ejemplo 2', 'ÁCIDO CÍTRICO', 1, '0.4000', '2019-06-18 11:12:19', '2019-06-18 11:12:19'),
(131, 'Producto Semiprocesado Ejemplo 2', 'AJOPORRO', 1, '0.6000', '2019-06-18 11:12:26', '2019-06-18 11:12:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id` int(11) NOT NULL,
  `ins_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ins_unidad` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ins_costo` decimal(25,4) NOT NULL,
  `ins_observacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ins_cost_updated` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`id`, `ins_nombre`, `ins_unidad`, `ins_costo`, `ins_observacion`, `ins_cost_updated`, `created_at`, `updated_at`) VALUES
(1, 'Gas', '% sobre Bombona', '80000.0000', 'Costo especulativo', NULL, '2019-06-01 04:53:12', '2019-06-01 04:53:12'),
(2, 'Agua', 'Unid. Estándar', '0.0500', '', NULL, '2019-06-01 04:55:21', '2019-06-01 04:55:21'),
(3, 'Electricidad', 'KW/Hr', '0.0009', '', '2019-06-01', '2019-06-01 04:59:38', '2019-06-01 05:02:03'),
(4, 'insumo prueba', 'unidad', '387438.0000', '', NULL, '2019-06-17 07:35:11', '2019-06-17 07:35:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo_requerido`
--

CREATE TABLE `insumo_requerido` (
  `id` int(11) NOT NULL,
  `ins_req_fecha` date DEFAULT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ins_req_insumo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ins_req_total` decimal(25,4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insumo_requerido`
--

INSERT INTO `insumo_requerido` (`id`, `ins_req_fecha`, `rec_nombre`, `ins_req_insumo`, `ins_req_total`, `created_at`, `updated_at`) VALUES
(97, '2019-05-01', 'Producto terminado ejemplo', 'Gas', '1.3000', '2019-06-18 11:13:52', '2019-06-18 11:13:52'),
(98, '2019-05-01', 'Producto terminado ejemplo', 'Agua', '6.5000', '2019-06-18 11:13:52', '2019-06-18 11:13:52'),
(99, '2019-05-01', 'Producto terminado ejemplo', 'Electricidad', '13.0000', '2019-06-18 11:13:52', '2019-06-18 11:13:52'),
(100, '2019-05-01', 'Producto Ejemplo Presentación 12 Unid.', 'Electricidad', '2.0000', '2019-06-18 11:36:39', '2019-06-18 11:36:39'),
(101, '2019-05-03', 'Producto terminado ejemplo', 'Gas', '1.2000', '2019-06-18 11:41:50', '2019-06-18 11:41:50'),
(102, '2019-05-03', 'Producto terminado ejemplo', 'Agua', '6.0000', '2019-06-18 11:41:50', '2019-06-18 11:41:50'),
(103, '2019-05-03', 'Producto terminado ejemplo', 'Electricidad', '12.0000', '2019-06-18 11:41:50', '2019-06-18 11:41:50'),
(104, '2019-05-03', 'Producto Ejemplo Presentación 12 Unid.', 'Electricidad', '2.0000', '2019-06-18 11:43:19', '2019-06-18 11:43:19'),
(105, '2019-05-04', 'Producto terminado ejemplo', 'Gas', '1.5000', '2019-06-18 11:45:05', '2019-06-18 11:45:05'),
(106, '2019-05-04', 'Producto terminado ejemplo', 'Agua', '7.5000', '2019-06-18 11:45:06', '2019-06-18 11:45:06'),
(107, '2019-05-04', 'Producto terminado ejemplo', 'Electricidad', '15.0000', '2019-06-18 11:45:06', '2019-06-18 11:45:06'),
(108, '2019-05-04', 'Producto Ejemplo Presentación 12 Unid.', 'Electricidad', '2.0000', '2019-06-18 11:45:28', '2019-06-18 11:45:28'),
(109, '2019-05-05', 'Producto terminado ejemplo', 'Gas', '1.0000', '2019-06-19 02:02:14', '2019-06-19 02:02:14'),
(110, '2019-05-05', 'Producto terminado ejemplo', 'Agua', '4.5000', '2019-06-19 02:02:14', '2019-06-19 02:02:14'),
(111, '2019-05-05', 'Producto terminado ejemplo', 'Electricidad', '9.0000', '2019-06-19 02:02:14', '2019-06-19 02:02:14'),
(112, '2019-05-05', 'Producto Ejemplo Presentación 12 Unid.', 'Electricidad', '2.0000', '2019-06-19 02:02:44', '2019-06-19 02:02:44'),
(113, '2019-05-06', 'Producto terminado ejemplo', 'Gas', '5.0000', '2019-07-26 00:57:27', '2019-07-26 00:57:27'),
(114, '2019-05-06', 'Producto terminado ejemplo', 'Agua', '25.0000', '2019-07-26 00:57:27', '2019-07-26 00:57:27'),
(115, '2019-05-06', 'Producto terminado ejemplo', 'Electricidad', '50.0000', '2019-07-26 00:57:27', '2019-07-26 00:57:27'),
(116, '2019-05-07', 'Producto terminado ejemplo', 'Gas', '1.1000', '2019-08-01 23:43:21', '2019-08-01 23:43:21'),
(117, '2019-05-07', 'Producto terminado ejemplo', 'Agua', '5.5000', '2019-08-01 23:43:21', '2019-08-01 23:43:21'),
(118, '2019-05-07', 'Producto terminado ejemplo', 'Electricidad', '11.0000', '2019-08-01 23:43:21', '2019-08-01 23:43:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo_usado`
--

CREATE TABLE `insumo_usado` (
  `id` int(11) NOT NULL,
  `insing_default` int(1) NOT NULL DEFAULT '0',
  `insing_insumo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `insing_ratio` decimal(10,4) NOT NULL DEFAULT '1.0000',
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insumo_usado`
--

INSERT INTO `insumo_usado` (`id`, `insing_default`, `insing_insumo`, `insing_ratio`, `rec_nombre`, `created_at`, `updated_at`) VALUES
(3, 1, 'Agua', '1.0000', 'ANTIPASTO ATÚN (FRASCO 470G)', '2019-06-01 18:33:02', '2019-06-01 18:33:02'),
(4, 1, 'Electricidad', '0.0000', 'ANTIPASTO ATÚN (FRASCO 470G)', '2019-06-01 18:33:14', '2019-06-01 18:33:14'),
(5, 0, 'Gas', '1.0000', 'ANTIPASTO ATÚN (FRASCO 470G)', '2019-06-01 18:36:58', '2019-06-01 18:36:58'),
(10, 1, 'Agua', '1.0000', 'PICADO BLANDO ANTIPASTO (kilo)', '2019-06-01 20:03:52', '2019-06-01 20:03:52'),
(11, 1, 'Gas', '0.1000', 'Producto terminado ejemplo', '2019-06-01 22:01:18', '2019-06-01 22:01:18'),
(12, 1, 'Agua', '0.5000', 'Producto terminado ejemplo', '2019-06-01 22:01:26', '2019-06-01 22:01:26'),
(13, 1, 'Electricidad', '1.0000', 'Producto terminado ejemplo', '2019-06-01 22:01:40', '2019-06-01 22:01:40'),
(14, 1, 'Electricidad', '2.0000', 'Producto Ejemplo Presentación 12 Unid.', '2019-06-05 21:41:28', '2019-06-05 21:41:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiasprimas`
--

CREATE TABLE `materiasprimas` (
  `id` int(10) UNSIGNED NOT NULL,
  `mp_codigo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mp_cantidad` decimal(25,4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiasprimas`
--

INSERT INTO `materiasprimas` (`id`, `mp_codigo`, `mp_cantidad`, `created_at`, `updated_at`) VALUES
(85, 'MI00000', '228.0000', '2019-06-18 11:05:24', '2019-08-02 14:45:43'),
(86, 'MI00001', '102.4000', '2019-06-18 11:05:24', '2019-08-02 14:45:43'),
(87, 'MI00002', '193.2000', '2019-06-18 11:05:24', '2019-08-02 14:45:44'),
(88, 'MP00000', '164.8000', '2019-06-18 11:05:24', '2019-08-02 14:45:44'),
(89, 'MI00019', '90.0000', '2019-06-18 11:06:12', '2019-08-01 23:43:20'),
(90, 'MI00014', '90.0000', '2019-06-18 11:06:12', '2019-08-01 23:43:20'),
(91, 'MI00013', '90.0000', '2019-06-18 11:06:12', '2019-08-01 23:43:20'),
(92, 'MI00015', '200.0000', '2019-06-18 11:06:12', '2019-06-18 11:06:12'),
(93, 'MI00027', '160.0000', '2019-06-18 11:35:34', '2019-06-19 02:02:44'),
(94, 'MI00007', '196.0000', '2019-06-18 11:36:22', '2019-06-19 02:02:44'),
(95, 'MP00001', '50.0000', '2019-07-26 00:44:19', '2019-07-26 00:44:19'),
(96, 'MI00008', '50.0000', '2019-07-26 00:44:19', '2019-07-26 00:44:19'),
(97, 'MI00009', '50.0000', '2019-07-26 00:44:19', '2019-07-26 00:44:19');

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
(1, '102.00', '10002.00', '22.23', '62.00', '10002.00', '480.47', '2017-10-11 04:00:00', '2017-11-07 01:13:15');

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
(98, 'MI00000', 'ACEITE', 'LITRO', '31000.0000', 'ACTUALIZADO AL 02/11/2018', '2019-05-03 04:00:00', '2017-12-03 02:17:39', '2019-07-31 01:28:52'),
(99, 'MI00001', 'ACEITUNAS', 'KILO', '500000.0000', 'ACTUALIZADO AL 30/11/2018 ESPECULATIVO', NULL, '2017-12-03 02:19:23', '2019-07-31 01:28:56'),
(100, 'MP00000', 'AJOPORRO', 'KILO', '45000.0000', 'ACTUALIZADO AL 29/11/2018', NULL, '2017-12-03 02:24:43', '2019-07-31 01:30:32'),
(101, 'MI00002', 'ÁCIDO CÍTRICO', 'KILO', '9000.0000', 'ACTUALIZADO AL 22/02/2019', NULL, '2017-12-03 02:26:53', '2019-07-31 01:30:14'),
(102, 'MP00001', 'ALBAHACA', 'KILO', '4000.0000', 'ACTUALIZADO AL 29/11/2018', NULL, '2017-12-03 02:35:18', '2019-07-31 01:29:14'),
(103, 'MI00003', 'ALCOHOL', 'LITRO', '3139.0000', 'ACTUALIZADO AL 25/01/2019', NULL, '2017-12-03 02:39:43', '2019-07-31 01:29:28'),
(104, 'MI00004', 'ALMIDÓN DE MAÍZ (MAICINA) ', 'KILO', '55555.5600', 'ACTUALIZADO AL 29/11/2018', NULL, '2017-12-03 02:43:57', '2019-07-31 01:29:35'),
(105, 'MI00005', 'ATÚN ENLATADO', 'KILO', '86981.0000', 'ACTUALIZADO AL 29/11/2018', NULL, '2017-12-03 21:19:18', '2019-07-31 01:29:40'),
(106, 'MP00002', 'ATÚN FRESCO', 'KILO', '0.0000', '', NULL, '2017-12-03 21:22:12', '2017-12-03 21:22:12'),
(107, 'MI00006', 'AZÚCAR', 'KILO', '13600.0000', 'ACTUALIZADO AL 29/11/2018', NULL, '2017-12-03 21:24:14', '2019-07-31 01:29:44'),
(108, 'MI00007', 'BANDEJA CARTÓN 12x500cc', 'UNIDAD', '500.0000', 'COSTO ESPECULATIVO', NULL, '2017-12-03 21:29:49', '2017-12-03 21:29:49'),
(109, 'MI00008', 'BANDEJA CARTÓN 12x300cc', 'UNIDAD', '500.0000', 'COSTO ESPECULATIVO', NULL, '2017-12-03 21:31:42', '2017-12-03 21:31:42'),
(110, 'MI00009', 'BANDEJA CARTÓN 6x300cc', 'UNIDAD', '300.0000', 'COSTO ESPECULATIVO', NULL, '2017-12-03 21:32:42', '2017-12-03 21:32:42'),
(111, 'MI00010', 'BANDEJA CARTÓN 24x200cc', 'UNIDAD', '600.0000', 'COSTO ESPECULATIVO', NULL, '2017-12-03 21:34:19', '2017-12-03 21:34:19'),
(113, 'MP00003', 'CEBOLLA', 'KILO', '30000.0000', 'ACTUALIZADO AL 29/11/2018', NULL, '2017-12-03 21:45:26', '2019-07-31 01:29:53'),
(117, 'MP00005', 'VAINITA', 'KILO', '6000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-05 01:49:07', '2017-12-05 01:49:07'),
(118, 'MP00006', 'ZANAHORIA ', 'KILO', '6400.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-05 01:51:43', '2017-12-05 01:51:43'),
(119, 'MP00007', 'PIMENTÓN', 'KILO', '9550.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-05 01:52:27', '2017-12-05 01:52:27'),
(120, 'MP00008', 'COLIFLOR', 'KILO', '6000.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-05 01:53:19', '2017-12-05 01:53:19'),
(121, 'MP00009', 'CÉLERI (APIO ESPAÑA)', 'KILO', '4500.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-05 01:54:09', '2017-12-05 01:54:09'),
(122, 'MP00010', 'CEBOLLÍN', 'KILO', '2500.0000', 'ACTUALIZADO AL 29/11/2017', NULL, '2017-12-05 01:54:34', '2017-12-05 01:54:34'),
(123, 'MI00011', 'SAL', 'KILO', '10000.0000', 'PRECIO INVENTADO', NULL, '2017-12-10 22:41:38', '2017-12-10 22:41:38'),
(125, 'MI00013', 'FRASCO 500CC', 'UNIDAD', '3000.0000', 'COSTO INVENTADO', NULL, '2017-12-10 22:45:39', '2017-12-12 18:59:01'),
(126, 'MI00014', 'PRESINTO FRASCO 500cc', 'UNIDAD', '1000.0000', 'COSTO INVENTADO', NULL, '2017-12-10 22:47:12', '2017-12-12 18:59:16'),
(127, 'MI00015', 'ETIQUETA ANTIPASTO ATÚN 470G', 'UNIDAD', '2500.0000', 'PRECIO INVENTADO', NULL, '2017-12-10 22:48:47', '2017-12-12 18:59:24'),
(128, '', 'PECTINA', 'KILO', '3800000.0000', 'TA MUY CARO', NULL, '2017-12-12 19:18:40', '2017-12-12 19:18:40'),
(129, 'MI00016', 'SALSA DE TOMATE', 'KILO', '157000.0000', '', NULL, '2017-12-28 22:54:15', '2017-12-28 22:54:15'),
(130, 'MI00017', 'VINAGRE', 'LITRO', '7700.0000', '', '2018-01-11 20:30:04', '2017-12-28 22:55:52', '2018-01-11 20:30:04'),
(131, 'MI00018', 'PIMIENTA', 'GRAMOS', '1000.0000', '', NULL, '2017-12-28 22:57:16', '2017-12-28 22:57:16'),
(132, 'MI00019', 'TAPA 63mm, 500cc, TWIST BLANCA', 'UNIDAD', '661.5000', '', NULL, '2017-12-28 22:59:34', '2017-12-28 22:59:34'),
(135, 'MI00022', 'DETERGENTE PARA PISOS', 'LITROS', '1000.0000', '', NULL, '2017-12-28 23:17:15', '2017-12-28 23:17:15'),
(136, 'MI00023', 'DETERGENTE PARA VAJILLAS', 'LITRO', '2875.0000', '', NULL, '2017-12-28 23:19:59', '2017-12-28 23:19:59'),
(137, 'MI00024', 'GUANTES DE LATEX REUSABLES', 'PAR', '2000.0000', '', NULL, '2017-12-28 23:21:49', '2017-12-28 23:21:49'),
(138, 'MI00025', 'BOLSA DE BASURA', 'UNIDAD', '2000.0000', '', NULL, '2017-12-28 23:22:31', '2017-12-28 23:22:31'),
(139, 'MI00026', 'ALCAPARRAS', 'KILO', '1000000.0000', '', NULL, '2018-01-11 22:27:09', '2018-01-11 22:27:09'),
(140, 'MI00027', 'PLASTICO TERMOENCOJIBLE', 'GRAMOS', '10000.0000', '', NULL, '2018-01-11 20:37:19', '2018-01-11 20:37:19'),
(141, 'MP00004', 'Durazno', 'Kilo', '50000.0000', '', NULL, '2018-02-12 20:59:40', '2018-02-12 20:59:40'),
(142, 'MP00011', 'Guanabana', 'Kilo', '0.0000', '', NULL, '2018-02-13 11:07:02', '2018-02-13 11:07:02'),
(143, 'MP00012', 'Uva', 'KILO', '100000.0000', '', NULL, '2018-02-13 14:31:50', '2018-02-13 14:31:50'),
(145, 'MP00029', 'Pasas', 'KILO', '76000.0000', 'COSTO ESPECULATIVO', NULL, '2019-04-13 14:07:26', '2019-04-13 14:07:26');

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
  `pro_produccion` decimal(25,4) NOT NULL,
  `pro_disponible` decimal(25,4) NOT NULL,
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
(152, '2019-05-01', 'Producto Semiprocesado Ejemplo 1', 'PA', '11.0000', '11.0000', '317016.8046', '2.1000', NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-06-18 11:11:33', '2019-06-21 07:58:53'),
(153, '2019-05-01', 'Producto Semiprocesado Ejemplo 2', 'PA', '12.0000', '12.0000', '32056.6139', '2.2000', NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-06-18 11:12:46', '2019-06-21 07:58:57'),
(154, '2019-05-01', 'Producto Semiprocesado Ejemplo 2', 'PA', '6.0000', '6.0000', NULL, '2.2000', NULL, 'Producción de Producto terminado ejemplo', '2019-06-18 11:13:51', '2019-06-18 11:13:51'),
(155, '2019-05-01', 'Producto Semiprocesado Ejemplo 1', 'PA', '7.0000', '4.0000', NULL, '2.1000', NULL, 'Producción de Producto terminado ejemplo', '2019-06-18 11:13:51', '2019-06-18 11:13:51'),
(156, '2019-05-01', 'Producto terminado ejemplo', 'PB', '13.0000', '13.0000', '178784.1633', '2.3000', 1, 'Producción de Producto terminado ejemplo', '2019-06-18 11:13:51', '2019-06-21 07:58:59'),
(157, '2019-05-01', 'Producto terminado ejemplo', 'PB', '12.0000', '1.0000', NULL, '2.3000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-06-18 11:36:38', '2019-06-18 11:36:38'),
(158, '2019-05-01', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '1.0000', '1.0000', '2248937.1348', '2.0000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-06-18 11:36:38', '2019-06-21 07:58:43'),
(159, '2019-05-02', 'Producto Semiprocesado Ejemplo 1', 'PA', '2.0000', '6.0000', '323842.4250', '2.1000', NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-06-18 11:39:21', '2019-06-21 07:58:40'),
(160, '2019-05-02', 'Producto Semiprocesado Ejemplo 2', 'PA', '3.0000', '9.0000', '39339.6834', '3.3000', NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-06-18 11:39:42', '2019-08-01 23:39:30'),
(161, '2019-05-02', 'Producto Semiprocesado Ejemplo 2', 'PA', '6.0000', '3.0000', NULL, '3.3000', NULL, 'Producción de Producto terminado ejemplo', '2019-06-18 11:40:08', '2019-06-18 11:40:08'),
(162, '2019-05-03', 'Producto Semiprocesado Ejemplo 1', 'PA', '100.0000', '106.0000', '315738.3550', '3.0000', NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-06-18 11:41:04', '2019-08-01 23:39:34'),
(163, '2019-05-03', 'Producto Semiprocesado Ejemplo 2', 'PA', '100.0000', '103.0000', '30798.6292', '2.5000', NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-06-18 11:41:18', '2019-08-01 23:39:39'),
(164, '2019-05-03', 'Producto Semiprocesado Ejemplo 2', 'PA', '6.0000', '97.0000', NULL, '2.5000', NULL, 'Producción de Producto terminado ejemplo', '2019-06-18 11:41:49', '2019-06-18 11:41:49'),
(165, '2019-05-03', 'Producto Semiprocesado Ejemplo 1', 'PA', '7.0000', '99.0000', NULL, '3.0000', NULL, 'Producción de Producto terminado ejemplo', '2019-06-18 11:41:49', '2019-06-18 11:41:49'),
(166, '2019-05-03', 'Producto terminado ejemplo', 'PB', '12.0000', '13.0000', '192273.1811', '2.5000', 2, 'Producción de Producto terminado ejemplo', '2019-06-18 11:41:49', '2019-08-01 23:39:54'),
(167, '2019-05-03', 'Producto terminado ejemplo', 'PB', '12.0000', '1.0000', NULL, '2.5000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-06-18 11:43:18', '2019-06-18 11:43:18'),
(168, '2019-05-03', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '1.0000', '2.0000', '2253704.2348', '2.6000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-06-18 11:43:19', '2019-06-21 07:58:17'),
(169, '2019-05-04', 'Producto Semiprocesado Ejemplo 1', 'PA', '5.0000', '104.0000', '319631.4867', '2.6000', NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-06-18 11:44:23', '2019-06-21 07:58:11'),
(170, '2019-05-04', 'Producto Semiprocesado Ejemplo 2', 'PA', '8.0000', '105.0000', '33082.8646', '2.5000', NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-06-18 11:44:41', '2019-06-18 11:44:42'),
(171, '2019-05-04', 'Producto Semiprocesado Ejemplo 2', 'PA', '6.0000', '99.0000', NULL, '2.5000', NULL, 'Producción de Producto terminado ejemplo', '2019-06-18 11:45:04', '2019-06-18 11:45:04'),
(172, '2019-05-04', 'Producto Semiprocesado Ejemplo 1', 'PA', '7.0000', '97.0000', NULL, '2.6000', NULL, 'Producción de Producto terminado ejemplo', '2019-06-18 11:45:04', '2019-06-18 11:45:04'),
(173, '2019-05-04', 'Producto terminado ejemplo', 'PB', '15.0000', '16.0000', '157771.1385', '5.0000', 3, 'Producción de Producto terminado ejemplo', '2019-06-18 11:45:05', '2019-08-01 23:40:00'),
(174, '2019-05-04', 'Producto terminado ejemplo', 'PB', '12.0000', '4.0000', NULL, '5.0000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-06-18 11:45:27', '2019-06-18 11:45:27'),
(175, '2019-05-04', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '1.0000', '3.0000', '2256087.7848', '2.9000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-06-18 11:45:27', '2019-06-21 07:57:51'),
(176, '2019-05-05', 'Producto Semiprocesado Ejemplo 1', 'PA', '8.0000', '105.0000', '317982.8646', '2.5000', NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-06-19 02:00:53', '2019-06-21 07:57:48'),
(177, '2019-05-05', 'Producto Semiprocesado Ejemplo 2', 'PA', '9.0000', '108.0000', '32453.8722', '2.1000', NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-06-19 02:01:25', '2019-06-21 07:57:44'),
(178, '2019-05-05', 'Producto Semiprocesado Ejemplo 2', 'PA', '4.0000', '104.0000', NULL, '2.1000', NULL, 'Producción de Producto terminado ejemplo', '2019-06-19 02:02:13', '2019-06-19 02:02:13'),
(179, '2019-05-05', 'Producto Semiprocesado Ejemplo 1', 'PA', '5.0000', '100.0000', NULL, '2.5000', NULL, 'Producción de Producto terminado ejemplo', '2019-06-19 02:02:13', '2019-06-19 02:02:13'),
(180, '2019-05-05', 'Producto terminado ejemplo', 'PB', '9.0000', '13.0000', '177314.9749', '4.9000', 4, 'Producción de Producto terminado ejemplo', '2019-06-19 02:02:14', '2019-08-01 23:40:14'),
(181, '2019-05-05', 'Producto terminado ejemplo', 'PB', '12.0000', '1.0000', NULL, '4.9000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-06-19 02:02:43', '2019-06-19 02:02:43'),
(182, '2019-05-05', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '1.0000', '4.0000', '2248937.1348', '2.0000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-06-19 02:02:43', '2019-07-26 00:52:21'),
(183, '2019-05-05', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '1.0000', '3.0000', NULL, '0.0000', NULL, 'Venta bajo factura: 45873485743 de fecha 2019-05-05', '2019-07-26 00:53:13', '2019-07-26 00:53:13'),
(184, '2019-05-06', 'Producto Semiprocesado Ejemplo 1', 'PA', '10.0000', '110.0000', '317089.0333', '2.0000', NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-07-26 00:56:06', '2019-07-26 00:56:07'),
(185, '2019-05-06', 'Producto Semiprocesado Ejemplo 2', 'PA', '20.0000', '84.0000', NULL, '2.1000', NULL, 'Producción de Producto terminado ejemplo', '2019-07-26 00:57:26', '2019-07-26 00:57:26'),
(186, '2019-05-06', 'Producto Semiprocesado Ejemplo 1', 'PA', '20.0000', '90.0000', NULL, '2.0000', NULL, 'Producción de Producto terminado ejemplo', '2019-07-26 00:57:26', '2019-07-26 00:57:26'),
(187, '2019-05-06', 'Producto terminado ejemplo', 'PB', '50.0000', '51.0000', '153753.6748', '5.0000', 5, 'Producción de Producto terminado ejemplo', '2019-07-26 00:57:26', '2019-08-01 23:45:04'),
(188, '2019-05-06', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '1.0000', '2.0000', NULL, '0.0000', NULL, 'Venta bajo factura: 7564754857489 de fecha 2019-05-06', '2019-07-31 03:02:24', '2019-07-31 03:02:24'),
(189, '2019-05-07', 'Producto Semiprocesado Ejemplo 2', 'PA', '5.0000', '79.0000', NULL, '2.1000', NULL, 'Producción de Producto terminado ejemplo', '2019-08-01 23:43:19', '2019-08-01 23:43:19'),
(190, '2019-05-07', 'Producto Semiprocesado Ejemplo 1', 'PA', '6.0000', '84.0000', NULL, '2.0000', NULL, 'Producción de Producto terminado ejemplo', '2019-08-01 23:43:20', '2019-08-01 23:43:20'),
(191, '2019-05-07', 'Producto terminado ejemplo', 'PB', '11.0000', '62.0000', '176781.2065', '2.5000', 6, 'Producción de Producto terminado ejemplo', '2019-08-01 23:43:20', '2019-08-01 23:44:44'),
(192, '2019-05-07', 'Producto Semiprocesado Ejemplo 1', 'PA', '10.0000', '94.0000', '317486.2917', '2.5000', NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-01 23:43:55', '2019-08-01 23:44:49'),
(193, '2019-05-07', 'Producto Semiprocesado Ejemplo 2', 'PA', '10.0000', '89.0000', '32586.2917', '2.5000', NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-08-01 23:44:09', '2019-08-01 23:44:54'),
(194, '2019-05-07', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '1.0000', '1.0000', NULL, '0.0000', NULL, 'Venta bajo factura: 948573485748357 de fecha 2019-05-07', '2019-08-02 14:46:47', '2019-08-02 14:46:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producciona`
--

CREATE TABLE `producciona` (
  `id` int(10) UNSIGNED NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producciona`
--

INSERT INTO `producciona` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(12, 'Producto Semiprocesado Ejemplo 1', '94.0000', '2019-06-18 11:11:33', '2019-08-01 23:43:55'),
(13, 'Producto Semiprocesado Ejemplo 2', '89.0000', '2019-06-18 11:12:46', '2019-08-01 23:44:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccionb`
--

CREATE TABLE `produccionb` (
  `id` int(10) UNSIGNED NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccionb`
--

INSERT INTO `produccionb` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(8, 'Producto terminado ejemplo', '62.0000', '2019-06-18 11:13:51', '2019-08-01 23:43:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccionc`
--

CREATE TABLE `produccionc` (
  `id` int(10) UNSIGNED NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccionc`
--

INSERT INTO `produccionc` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(5, 'Producto Ejemplo Presentación 12 Unid.', '1.0000', '2019-06-18 11:36:38', '2019-08-02 14:46:47');

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
(1, 5255, '2017-10-11 08:00:00', '2019-06-07 18:13:06');

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
(2, 'P00000', 'Proveedor', 'J287327', 'ashda', 'sajhda', 'asjdhas', 0, '3956176.0000', 'credito', '2017-12-04 22:57:53', '2019-06-18 11:36:22'),
(3, 'P00002', 'ahdgasyh', 'jhsdhjas', 'hsgdha', 'hasgdhasg', 'ahsdgas', 0, '0.0000', 'contado', '2017-12-12 19:14:19', '2019-04-06 11:50:29'),
(4, 'P00003', 'proveedor cinco', 'j-23345567-2', 'la calle', 'ramón', '15 dias', 0, '0.0000', 'contado', '2017-12-24 18:40:01', '2019-04-30 05:59:59'),
(5, 'P00004', 'pablo iglesia', 'j-33333333-3', 'san pablo', 'pablo', 'ninguna', 0, '0.0000', 'contado', '2017-12-30 18:26:26', '2019-04-17 23:47:00'),
(6, 'P00005', 'pepe', 'rif de pepe', 'dirección de pepe', 'pepe', 'pepe condithion', 0, '0.0000', 'credito', '2018-01-11 20:08:54', '2019-06-07 23:47:11'),
(7, 'P00006', 'GATO', 'RIF GATO', 'DIRECCION GATO', 'SR GATO', '123', 0, '0.0000', 'credito', '2018-01-11 23:11:57', '2019-04-09 21:38:59'),
(8, 'P00001', 'Repartos Orientales', 'JR6566512545', 'El junquito, kilometro 12, galpón 312', '0414-1452263', '', 0, '0.0000', 'contado', '2019-04-05 03:28:33', '2019-04-17 01:12:07'),
(9, 'P00007', 'septimo proveedor', 'J4389754389', 'asjhdajh ausdhsahdas sdjsahdjashd', '04143767273', '', 0, '0.0000', 'contado', '2019-04-05 07:17:55', '2019-04-09 20:26:52'),
(10, 'P00008', 'Proveedor Ocho', '84374283', 'askhdaushda', '4857438534', '', 0, '0.0000', 'contado', '2019-06-07 18:35:51', '2019-06-07 18:35:51'),
(11, 'P00009', 'Ninth supplier', 'J87346374', 'ajsdahs ashdghasdg asdhgsahdas', '04247437423', 'ashdsada', 0, '0.0000', 'contado', '2019-07-31 03:31:59', '2019-07-31 03:31:59');

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
(13, 'Producto terminado ejemplo', 'si', 'PB', 'KILO', '2018-03-24 10:37:13', '2019-06-15 20:06:48'),
(14, 'Producto Ejemplo Presentación 12 Unid.', 'si', 'PC', 'KILO', '2019-02-14 16:15:24', '2019-06-07 20:07:34'),
(18, 'Producto Semiprocesado Ejemplo 2', 'si', 'PA', 'Kilos', '2019-06-07 19:36:28', '2019-06-07 20:06:54'),
(19, 'Producto Semiprocesado Ejemplo 1', 'si', 'PA', 'Kilos', '2019-06-07 19:45:39', '2019-06-07 20:05:46'),
(20, 'Proc Prod prueba 1', 'no', 'PA', 'KILO', '2019-06-17 06:37:58', '2019-06-17 06:39:09');

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

--
-- Volcado de datos para la tabla `requerimientos`
--

INSERT INTO `requerimientos` (`id`, `req_fecha`, `rec_nombre`, `req_ingrediente`, `req_total`, `created_at`, `updated_at`) VALUES
(220, '2019-05-01', 'Producto Semiprocesado Ejemplo 1', 'ACEITE', '5.5000', '2019-06-18 11:11:34', '2019-06-18 11:11:34'),
(221, '2019-05-01', 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', '6.6000', '2019-06-18 11:11:34', '2019-06-18 11:11:34'),
(222, '2019-05-01', 'Producto Semiprocesado Ejemplo 2', 'ÁCIDO CÍTRICO', '4.8000', '2019-06-18 11:12:46', '2019-06-18 11:12:46'),
(223, '2019-05-01', 'Producto Semiprocesado Ejemplo 2', 'AJOPORRO', '7.2000', '2019-06-18 11:12:46', '2019-06-18 11:12:46'),
(224, '2019-05-01', 'Producto terminado ejemplo', 'FRASCO 500CC', '13.0000', '2019-06-18 11:13:51', '2019-06-18 11:13:51'),
(225, '2019-05-01', 'Producto terminado ejemplo', 'TAPA 63mm, 500cc, TWIST BLANCA', '13.0000', '2019-06-18 11:13:52', '2019-06-18 11:13:52'),
(226, '2019-05-01', 'Producto terminado ejemplo', 'PRESINTO FRASCO 500cc', '13.0000', '2019-06-18 11:13:52', '2019-06-18 11:13:52'),
(227, '2019-05-01', 'Producto Ejemplo Presentación 12 Unid.', 'PLASTICO TERMOENCOJIBLE', '10.0000', '2019-06-18 11:36:38', '2019-06-18 11:36:38'),
(228, '2019-05-01', 'Producto Ejemplo Presentación 12 Unid.', 'BANDEJA CARTÓN 12x500cc', '1.0000', '2019-06-18 11:36:39', '2019-06-18 11:36:39'),
(229, '2019-05-02', 'Producto Semiprocesado Ejemplo 1', 'ACEITE', '1.0000', '2019-06-18 11:39:21', '2019-06-18 11:39:21'),
(230, '2019-05-02', 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', '1.2000', '2019-06-18 11:39:22', '2019-06-18 11:39:22'),
(231, '2019-05-02', 'Producto Semiprocesado Ejemplo 2', 'ÁCIDO CÍTRICO', '1.2000', '2019-06-18 11:39:42', '2019-06-18 11:39:42'),
(232, '2019-05-02', 'Producto Semiprocesado Ejemplo 2', 'AJOPORRO', '1.8000', '2019-06-18 11:39:42', '2019-06-18 11:39:42'),
(233, '2019-05-03', 'Producto Semiprocesado Ejemplo 1', 'ACEITE', '50.0000', '2019-06-18 11:41:04', '2019-06-18 11:41:04'),
(234, '2019-05-03', 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', '60.0000', '2019-06-18 11:41:04', '2019-06-18 11:41:04'),
(235, '2019-05-03', 'Producto Semiprocesado Ejemplo 2', 'ÁCIDO CÍTRICO', '40.0000', '2019-06-18 11:41:18', '2019-06-18 11:41:18'),
(236, '2019-05-03', 'Producto Semiprocesado Ejemplo 2', 'AJOPORRO', '60.0000', '2019-06-18 11:41:18', '2019-06-18 11:41:18'),
(237, '2019-05-03', 'Producto terminado ejemplo', 'FRASCO 500CC', '12.0000', '2019-06-18 11:41:49', '2019-06-18 11:41:49'),
(238, '2019-05-03', 'Producto terminado ejemplo', 'TAPA 63mm, 500cc, TWIST BLANCA', '12.0000', '2019-06-18 11:41:50', '2019-06-18 11:41:50'),
(239, '2019-05-03', 'Producto terminado ejemplo', 'PRESINTO FRASCO 500cc', '12.0000', '2019-06-18 11:41:50', '2019-06-18 11:41:50'),
(240, '2019-05-03', 'Producto Ejemplo Presentación 12 Unid.', 'PLASTICO TERMOENCOJIBLE', '10.0000', '2019-06-18 11:43:19', '2019-06-18 11:43:19'),
(241, '2019-05-03', 'Producto Ejemplo Presentación 12 Unid.', 'BANDEJA CARTÓN 12x500cc', '1.0000', '2019-06-18 11:43:19', '2019-06-18 11:43:19'),
(242, '2019-05-04', 'Producto Semiprocesado Ejemplo 1', 'ACEITE', '2.5000', '2019-06-18 11:44:23', '2019-06-18 11:44:23'),
(243, '2019-05-04', 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', '3.0000', '2019-06-18 11:44:23', '2019-06-18 11:44:23'),
(244, '2019-05-04', 'Producto Semiprocesado Ejemplo 2', 'ÁCIDO CÍTRICO', '3.2000', '2019-06-18 11:44:41', '2019-06-18 11:44:41'),
(245, '2019-05-04', 'Producto Semiprocesado Ejemplo 2', 'AJOPORRO', '4.8000', '2019-06-18 11:44:41', '2019-06-18 11:44:41'),
(246, '2019-05-04', 'Producto terminado ejemplo', 'FRASCO 500CC', '15.0000', '2019-06-18 11:45:05', '2019-06-18 11:45:05'),
(247, '2019-05-04', 'Producto terminado ejemplo', 'TAPA 63mm, 500cc, TWIST BLANCA', '15.0000', '2019-06-18 11:45:05', '2019-06-18 11:45:05'),
(248, '2019-05-04', 'Producto terminado ejemplo', 'PRESINTO FRASCO 500cc', '15.0000', '2019-06-18 11:45:05', '2019-06-18 11:45:05'),
(249, '2019-05-04', 'Producto Ejemplo Presentación 12 Unid.', 'PLASTICO TERMOENCOJIBLE', '10.0000', '2019-06-18 11:45:28', '2019-06-18 11:45:28'),
(250, '2019-05-04', 'Producto Ejemplo Presentación 12 Unid.', 'BANDEJA CARTÓN 12x500cc', '1.0000', '2019-06-18 11:45:28', '2019-06-18 11:45:28'),
(251, '2019-05-05', 'Producto Semiprocesado Ejemplo 1', 'ACEITE', '4.0000', '2019-06-19 02:00:53', '2019-06-19 02:00:53'),
(252, '2019-05-05', 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', '4.8000', '2019-06-19 02:00:54', '2019-06-19 02:00:54'),
(253, '2019-05-05', 'Producto Semiprocesado Ejemplo 2', 'ÁCIDO CÍTRICO', '3.6000', '2019-06-19 02:01:25', '2019-06-19 02:01:25'),
(254, '2019-05-05', 'Producto Semiprocesado Ejemplo 2', 'AJOPORRO', '5.4000', '2019-06-19 02:01:25', '2019-06-19 02:01:25'),
(255, '2019-05-05', 'Producto terminado ejemplo', 'FRASCO 500CC', '9.0000', '2019-06-19 02:02:14', '2019-06-19 02:02:14'),
(256, '2019-05-05', 'Producto terminado ejemplo', 'TAPA 63mm, 500cc, TWIST BLANCA', '9.0000', '2019-06-19 02:02:14', '2019-06-19 02:02:14'),
(257, '2019-05-05', 'Producto terminado ejemplo', 'PRESINTO FRASCO 500cc', '9.0000', '2019-06-19 02:02:14', '2019-06-19 02:02:14'),
(258, '2019-05-05', 'Producto Ejemplo Presentación 12 Unid.', 'PLASTICO TERMOENCOJIBLE', '10.0000', '2019-06-19 02:02:43', '2019-06-19 02:02:43'),
(259, '2019-05-05', 'Producto Ejemplo Presentación 12 Unid.', 'BANDEJA CARTÓN 12x500cc', '1.0000', '2019-06-19 02:02:44', '2019-06-19 02:02:44'),
(260, '2019-05-06', 'Producto Semiprocesado Ejemplo 1', 'ACEITE', '5.0000', '2019-07-26 00:56:06', '2019-07-26 00:56:06'),
(261, '2019-05-06', 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', '6.0000', '2019-07-26 00:56:07', '2019-07-26 00:56:07'),
(262, '2019-05-06', 'Producto terminado ejemplo', 'FRASCO 500CC', '50.0000', '2019-07-26 00:57:26', '2019-07-26 00:57:26'),
(263, '2019-05-06', 'Producto terminado ejemplo', 'TAPA 63mm, 500cc, TWIST BLANCA', '50.0000', '2019-07-26 00:57:26', '2019-07-26 00:57:26'),
(264, '2019-05-06', 'Producto terminado ejemplo', 'PRESINTO FRASCO 500cc', '50.0000', '2019-07-26 00:57:26', '2019-07-26 00:57:26'),
(265, '2019-05-07', 'Producto terminado ejemplo', 'FRASCO 500CC', '11.0000', '2019-08-01 23:43:20', '2019-08-01 23:43:20'),
(266, '2019-05-07', 'Producto terminado ejemplo', 'TAPA 63mm, 500cc, TWIST BLANCA', '11.0000', '2019-08-01 23:43:20', '2019-08-01 23:43:20'),
(267, '2019-05-07', 'Producto terminado ejemplo', 'PRESINTO FRASCO 500cc', '11.0000', '2019-08-01 23:43:20', '2019-08-01 23:43:20'),
(268, '2019-05-07', 'Producto Semiprocesado Ejemplo 1', 'ACEITE', '5.0000', '2019-08-01 23:43:55', '2019-08-01 23:43:55'),
(269, '2019-05-07', 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', '6.0000', '2019-08-01 23:43:55', '2019-08-01 23:43:55'),
(270, '2019-05-07', 'Producto Semiprocesado Ejemplo 2', 'ÁCIDO CÍTRICO', '4.0000', '2019-08-01 23:44:09', '2019-08-01 23:44:09'),
(271, '2019-05-07', 'Producto Semiprocesado Ejemplo 2', 'AJOPORRO', '6.0000', '2019-08-01 23:44:10', '2019-08-01 23:44:10');

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
(1, '40000.0000', 250, 20, '7945.1667', NULL, '2019-06-18 11:20:47');

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
(101, 'Caja Chica', '48395824.0000', '2019-05-01 04:00:00', '2019-06-18 11:37:04', '2019-06-18 11:37:04'),
(102, 'Banco de Venezuela', '100000000.0000', '2019-05-01 04:00:00', '2019-06-18 11:37:04', '2019-06-18 11:37:04'),
(103, 'Venezolano de Crédito', '0.0000', '2019-05-01 04:00:00', '2019-06-18 11:37:04', '2019-06-18 11:37:04'),
(104, 'Banco Bicentenario', '2560000.0000', '2019-05-01 04:00:00', '2019-06-18 11:37:05', '2019-06-18 11:37:05'),
(105, 'Banco Banesco', '0.0000', '2019-05-01 04:00:00', '2019-06-18 11:37:05', '2019-06-18 11:37:05'),
(106, 'Caja Chica', '48395824.0000', '2019-05-02 04:00:00', '2019-06-18 11:40:40', '2019-06-18 11:40:40'),
(107, 'Banco de Venezuela', '100000000.0000', '2019-05-02 04:00:00', '2019-06-18 11:40:40', '2019-06-18 11:40:40'),
(108, 'Venezolano de Crédito', '0.0000', '2019-05-02 04:00:00', '2019-06-18 11:40:40', '2019-06-18 11:40:40'),
(109, 'Banco Bicentenario', '2560000.0000', '2019-05-02 04:00:00', '2019-06-18 11:40:40', '2019-06-18 11:40:40'),
(110, 'Banco Banesco', '0.0000', '2019-05-02 04:00:00', '2019-06-18 11:40:41', '2019-06-18 11:40:41'),
(111, 'Caja Chica', '48395824.0000', '2019-05-03 04:00:00', '2019-06-18 11:43:38', '2019-06-18 11:43:38'),
(112, 'Banco de Venezuela', '100000000.0000', '2019-05-03 04:00:00', '2019-06-18 11:43:38', '2019-06-18 11:43:38'),
(113, 'Venezolano de Crédito', '0.0000', '2019-05-03 04:00:00', '2019-06-18 11:43:39', '2019-06-18 11:43:39'),
(114, 'Banco Bicentenario', '2560000.0000', '2019-05-03 04:00:00', '2019-06-18 11:43:39', '2019-06-18 11:43:39'),
(115, 'Banco Banesco', '0.0000', '2019-05-03 04:00:00', '2019-06-18 11:43:39', '2019-06-18 11:43:39'),
(116, 'Caja Chica', '48395824.0000', '2019-05-04 04:00:00', '2019-06-19 01:59:16', '2019-06-19 01:59:16'),
(117, 'Banco de Venezuela', '100000000.0000', '2019-05-04 04:00:00', '2019-06-19 01:59:16', '2019-06-19 01:59:16'),
(118, 'Venezolano de Crédito', '0.0000', '2019-05-04 04:00:00', '2019-06-19 01:59:17', '2019-06-19 01:59:17'),
(119, 'Banco Bicentenario', '2560000.0000', '2019-05-04 04:00:00', '2019-06-19 01:59:17', '2019-06-19 01:59:17'),
(120, 'Banco Banesco', '0.0000', '2019-05-04 04:00:00', '2019-06-19 01:59:17', '2019-06-19 01:59:17'),
(121, 'Caja Chica', '46391024.0000', '2019-05-05 04:00:00', '2019-07-26 00:55:29', '2019-07-26 00:55:29'),
(122, 'Banco de Venezuela', '100000000.0000', '2019-05-05 04:00:00', '2019-07-26 00:55:30', '2019-07-26 00:55:30'),
(123, 'Venezolano de Crédito', '0.0000', '2019-05-05 04:00:00', '2019-07-26 00:55:30', '2019-07-26 00:55:30'),
(124, 'Banco Bicentenario', '2560000.0000', '2019-05-05 04:00:00', '2019-07-26 00:55:30', '2019-07-26 00:55:30'),
(125, 'Banco Banesco', '0.0000', '2019-05-05 04:00:00', '2019-07-26 00:55:30', '2019-07-26 00:55:30'),
(126, 'Caja Chica', '46356304.0000', '2019-05-06 04:00:00', '2019-08-01 23:40:34', '2019-08-01 23:40:34'),
(127, 'Banco de Venezuela', '100000000.0000', '2019-05-06 04:00:00', '2019-08-01 23:40:34', '2019-08-01 23:40:34'),
(128, 'Venezolano de Crédito', '0.0000', '2019-05-06 04:00:00', '2019-08-01 23:40:35', '2019-08-01 23:40:35'),
(129, 'Banco Bicentenario', '2560000.0000', '2019-05-06 04:00:00', '2019-08-01 23:40:35', '2019-08-01 23:40:35'),
(130, 'Banco Banesco', '0.0000', '2019-05-06 04:00:00', '2019-08-01 23:40:36', '2019-08-01 23:40:36');

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
(1, '45873485743', '2518809.5910', 12, '2019-07-26 00:53:13', '2019-07-26 00:53:13'),
(2, '7564754857489', '3360000.0000', 12, '2019-07-31 03:02:24', '2019-07-31 03:02:24'),
(3, '948573485748357', '3360000.0000', 12, '2019-08-02 14:46:47', '2019-08-02 14:46:47');

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
(1, 'Andres Vega', 'andres_vega93@hotmail.com', '$2y$10$ZO7X6Vj11qtEQ8tot9.isOkI6PUSntu3EsQ4KRrzxK/vYhkQXMKH6', 'admin', '4HfXrRZkGvI0cZE1HqX19UnjFsiM0iVsDKO8ksDpLOoo6HvCOuKQwekRICPo', '2017-10-11 10:32:19', '2019-06-17 06:48:47'),
(7, 'Carlos', 'carlosteno@gmail.com', '$2y$10$9uwn8GSSYhLxzaSZnhawBu8f0sqBvgRRYHu8yQpI7/pILxLjx.WVK', 'admin', 'J5RWbVZNO1TbIyVmsPepnHUyyXyAlu2mHBQJynPGuwBIS78Fk9JHVBByuSHT', '2017-10-14 15:48:38', '2018-02-12 20:24:56'),
(8, 'clarisa', 'clari98@hotmail.com', '$2y$10$3PdMuwN1QX5OiLW0jhYWWu/PGegeRyRjoaJUPHPq2Y1q6xAAB4mE6', 'tipo1', '0azYYFx0yL46GxRRI9hTSUn0UZOTwOKEp1G4CCLfxgHAc5HszeyTpKSwOjJu', '2017-12-24 18:33:40', '2019-05-12 07:19:14'),
(9, 'Angélica', 'gavcamerida@gmail.com', '$2y$10$nmvuxdHxxHFRl2pckMARHeQJJ9sjxEV8kg1hLVfJoKvy1NWAbPYMu', 'tipo1', '77kYlLhRAezQrSQf7mP6XcnIPnp3LYiJpwGtJugWppnMSWr18XOL8VawZxlD', '2018-02-07 19:21:08', '2018-02-09 16:07:44'),
(10, 'test', 'mail@mail.com', '$2y$10$BRBmd.UL0KSAzwj6NrOtZOwa98fc/s0YIxD1Tb4lxvPNECw9ouEMK', 'admin', 'LrP4JWi0wTjiRsbTWcAVDa9qI1d8KRqmp6mtJy3c0K0q9sa3ccthxZKQQM0g', '2018-03-24 10:27:53', '2019-04-29 03:37:31'),
(11, 'Andres Eduardo Vega', 'aevega1991@gmail.com', '$2y$10$uTv5TpUjU0mNz2OzRVSgFe8HErOtmZsV.4U607urJmylTx.C7ig7q', 'admin', 'Ylr3Lv5Ow2d0xC0pTKqlHXtUhHWGdjFkKPas4J8AnCzlbpCZnKXJhDmbbuzX', '2019-02-08 04:30:20', '2019-05-31 02:49:09'),
(15, 'tipo1', 'tipo1@test.com', '$2y$10$LMaHzVe0qQ9/afNY9filgO1PADWWRVMfwJB1A032EkUtP1floSykm', 'tipo1', 'MSFSehKQadTtedbGrJRYI9z2GrExMdATorPEuh256Qj8uqtQsP85tp6RiH3G', '2019-05-31 02:49:50', '2019-06-05 02:45:21'),
(18, 'tipo2', 'tipo2@test.com', '$2y$10$RH2daeWMO38Os0zQiaMpw.Xp7rDPianWraOM5G8CbcZOEAzWY1F/y', 'tipo2', '8LhE60CThId0b5lZeVGYkv9KgWd7bsWW7OXUTPHSUtoNKXGdtJcxXwyl7NyX', '2019-05-31 03:55:11', '2019-06-17 01:18:09');

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
(1, 'C00001', '2019-05-05', '45873485743', 'credito', 'Caja Chica', 'Producto Ejemplo Presentación 12 Unid.', '2248937.1348', 1, 1, '2019-07-26 00:53:13', '2019-07-26 00:53:13'),
(2, 'C00001', '2019-05-06', '7564754857489', 'credito', 'Caja Chica', 'Producto Ejemplo Presentación 12 Unid.', '3000000.0000', 1, 1, '2019-07-31 03:02:24', '2019-07-31 03:02:24'),
(3, 'C00002', '2019-05-07', '948573485748357', 'contado', 'Caja Chica', 'Producto Ejemplo Presentación 12 Unid.', '3000000.0000', 1, 1, '2019-08-02 14:46:47', '2019-08-02 14:46:47');

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
  ADD KEY `cuentasxcobrar_fk1` (`cta_venta_id`),
  ADD KEY `cta_entidad` (`cta_entidad`);

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
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ins_nombre` (`ins_nombre`);

--
-- Indices de la tabla `insumo_requerido`
--
ALTER TABLE `insumo_requerido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ins_req_FK1` (`rec_nombre`),
  ADD KEY `ins_req_FK2` (`ins_req_insumo`);

--
-- Indices de la tabla `insumo_usado`
--
ALTER TABLE `insumo_usado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ins_usa_FK1` (`rec_nombre`),
  ADD KEY `ins_usa_FK2` (`insing_insumo`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cajabanco`
--
ALTER TABLE `cajabanco`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1283;

--
-- AUTO_INCREMENT de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=417;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `costofijos`
--
ALTER TABLE `costofijos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `cuentasxcobrar`
--
ALTER TABLE `cuentasxcobrar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cuentasxpagar`
--
ALTER TABLE `cuentasxpagar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `insumo_requerido`
--
ALTER TABLE `insumo_requerido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT de la tabla `insumo_usado`
--
ALTER TABLE `insumo_usado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT de la tabla `producciona`
--
ALTER TABLE `producciona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `produccionb`
--
ALTER TABLE `produccionb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `produccionc`
--
ALTER TABLE `produccionc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT de la tabla `salarios`
--
ALTER TABLE `salarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `saldocaja`
--
ALTER TABLE `saldocaja`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de la tabla `totalesventas`
--
ALTER TABLE `totalesventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Filtros para la tabla `insumo_requerido`
--
ALTER TABLE `insumo_requerido`
  ADD CONSTRAINT `ins_req_FK1` FOREIGN KEY (`rec_nombre`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ins_req_FK2` FOREIGN KEY (`ins_req_insumo`) REFERENCES `insumos` (`ins_nombre`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `insumo_usado`
--
ALTER TABLE `insumo_usado`
  ADD CONSTRAINT `ins_usa_FK1` FOREIGN KEY (`rec_nombre`) REFERENCES `recetas` (`rec_nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ins_usa_FK2` FOREIGN KEY (`insing_insumo`) REFERENCES `insumos` (`ins_nombre`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `requerimientos_ibfk_2` FOREIGN KEY (`req_ingrediente`) REFERENCES `parametros` (`par_nombre`) ON DELETE NO ACTION ON UPDATE CASCADE;

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
