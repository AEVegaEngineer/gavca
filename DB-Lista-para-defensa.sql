-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-08-2019 a las 17:30:15
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `gavca`
--
CREATE DATABASE IF NOT EXISTS `gavca` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gavca`;

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aumentos`
--

INSERT INTO `aumentos` (`id`, `aum_aumento`, `aum_descripcion`, `created_at`, `updated_at`) VALUES
(44, '23.00', 'Marzo 2019, Gaceta Nº 44068', '2019-06-16 08:16:05', '2019-06-16 08:16:05');

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
(1, 'Banco de Venezuela', '2018-01-14 21:37:16', '2019-04-30 04:40:45'),
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
  `cb_venta_id` int(10) unsigned DEFAULT NULL,
  `cb_debe_haber` enum('DEBE','HABER') DEFAULT NULL,
  `cb_fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cb_saldo` decimal(25,4) NOT NULL,
  `cb_concepto` varchar(255) DEFAULT NULL,
  `cb_activo` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1376 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajabanco`
--

INSERT INTO `cajabanco` (`id`, `cb_entidad`, `cb_monto`, `cb_compra_id`, `cb_venta_id`, `cb_debe_haber`, `cb_fecha`, `cb_saldo`, `cb_concepto`, `cb_activo`, `created_at`, `updated_at`) VALUES
(1347, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-07-31 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-08-10 03:16:50', '2019-08-10 03:16:50'),
(1348, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-10 03:16:51', '2019-08-10 04:47:49'),
(1349, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-07-31 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-08-10 03:16:51', '2019-08-10 03:16:51'),
(1350, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-10 03:16:51', '2019-08-10 04:47:49'),
(1351, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-07-31 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-08-10 03:16:51', '2019-08-10 03:16:51'),
(1352, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-10 03:16:51', '2019-08-10 04:47:49'),
(1353, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-07-31 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-08-10 03:16:52', '2019-08-10 03:16:52'),
(1354, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-10 03:16:52', '2019-08-10 04:47:50'),
(1355, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-07-31 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-08-10 03:16:52', '2019-08-10 03:16:52'),
(1356, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-10 03:16:52', '2019-08-10 04:47:50'),
(1357, 'Caja Chica', '200000000.0000', NULL, NULL, 'DEBE', '2019-08-01 04:00:00', '200000000.0000', 'Entrada generada: Inicio de Operaciones', 0, '2019-08-10 03:48:09', '2019-08-10 04:47:49'),
(1358, 'Caja Chica', '50000000.0000', NULL, NULL, 'HABER', '2019-08-01 04:00:00', '150000000.0000', 'Transferido hacia Banco de Venezuela, Inicio de Operaciones', 0, '2019-08-10 03:48:24', '2019-08-10 04:47:49'),
(1359, 'Banco de Venezuela', '50000000.0000', NULL, NULL, 'DEBE', '2019-08-01 04:00:00', '50000000.0000', 'Transferido desde Caja Chica, Inicio de Operaciones', 0, '2019-08-10 03:48:24', '2019-08-10 04:47:49'),
(1360, 'Caja Chica', '50000000.0000', NULL, NULL, 'HABER', '2019-08-01 04:00:00', '100000000.0000', 'Transferido hacia Banco Banesco, Inicio de Operaciones', 0, '2019-08-10 03:48:37', '2019-08-10 04:47:49'),
(1361, 'Banco Banesco', '50000000.0000', NULL, NULL, 'DEBE', '2019-08-01 04:00:00', '50000000.0000', 'Transferido desde Caja Chica, Inicio de Operaciones', 0, '2019-08-10 03:48:37', '2019-08-10 04:47:50'),
(1362, 'Caja Chica', '10000000.0000', NULL, NULL, 'HABER', '2019-08-01 04:00:00', '90000000.0000', 'Transferido hacia Venezolano de Crédito, Inicio de Operaciones', 0, '2019-08-10 03:48:48', '2019-08-10 04:47:49'),
(1363, 'Venezolano de Crédito', '10000000.0000', NULL, NULL, 'DEBE', '2019-08-01 04:00:00', '10000000.0000', 'Transferido desde Caja Chica, Inicio de Operaciones', 0, '2019-08-10 03:48:49', '2019-08-10 04:47:49'),
(1364, 'Caja Chica', '10000000.0000', NULL, NULL, 'HABER', '2019-08-01 04:00:00', '80000000.0000', 'Transferido hacia Banco Bicentenario, Inicio de Operaciones', 0, '2019-08-10 03:49:01', '2019-08-10 04:47:49'),
(1365, 'Banco Bicentenario', '10000000.0000', NULL, NULL, 'DEBE', '2019-08-01 04:00:00', '10000000.0000', 'Transferido desde Caja Chica, Inicio de Operaciones', 0, '2019-08-10 03:49:01', '2019-08-10 04:47:50'),
(1366, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '80000000.0000', 'Cierre de caja', 0, '2019-08-10 04:47:49', '2019-08-10 04:47:49'),
(1367, 'Caja Chica', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '80000000.0000', 'Inicio de caja', 1, '2019-08-10 04:47:49', '2019-08-10 04:47:49'),
(1368, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '50000000.0000', 'Cierre de caja', 0, '2019-08-10 04:47:49', '2019-08-10 04:47:49'),
(1369, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '50000000.0000', 'Inicio de caja', 1, '2019-08-10 04:47:49', '2019-08-10 04:47:49'),
(1370, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '10000000.0000', 'Cierre de caja', 0, '2019-08-10 04:47:50', '2019-08-10 04:47:50'),
(1371, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '10000000.0000', 'Inicio de caja', 1, '2019-08-10 04:47:50', '2019-08-10 04:47:50'),
(1372, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '10000000.0000', 'Cierre de caja', 0, '2019-08-10 04:47:50', '2019-08-10 04:47:50'),
(1373, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '10000000.0000', 'Inicio de caja', 1, '2019-08-10 04:47:50', '2019-08-10 04:47:50'),
(1374, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '50000000.0000', 'Cierre de caja', 0, '2019-08-10 04:47:50', '2019-08-10 04:47:50'),
(1375, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '50000000.0000', 'Inicio de caja', 1, '2019-08-10 04:47:51', '2019-08-10 04:47:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cardexmp`
--

CREATE TABLE IF NOT EXISTS `cardexmp` (
`id` int(10) unsigned NOT NULL,
  `mp_codigo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comp_doc` varchar(255) DEFAULT NULL,
  `car_costo` decimal(25,4) DEFAULT NULL,
  `car_valor_anterior` decimal(25,4) NOT NULL,
  `car_valor_actual` decimal(25,4) NOT NULL,
  `car_alicuota` varchar(255) DEFAULT NULL,
  `car_iva` decimal(25,4) DEFAULT NULL,
  `car_compra_id` int(10) unsigned DEFAULT NULL,
  `car_concepto` varchar(255) DEFAULT NULL,
  `car_fecha` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cardexmp`
--

INSERT INTO `cardexmp` (`id`, `mp_codigo`, `comp_doc`, `car_costo`, `car_valor_anterior`, `car_valor_actual`, `car_alicuota`, `car_iva`, `car_compra_id`, `car_concepto`, `car_fecha`, `created_at`, `updated_at`) VALUES
(38, 'MI00000', '387463743898327', '31000.0000', '0.0000', '200.0000', '12%', '744000.0000', 8, NULL, NULL, '2019-08-10 03:37:43', '2019-08-10 03:37:43'),
(39, 'MI00001', '387463743898327', '500000.0000', '0.0000', '200.0000', '12%', '12000000.0000', 8, NULL, NULL, '2019-08-10 03:37:43', '2019-08-10 03:37:43'),
(40, 'MI00002', '387463743898327', '9000.0000', '0.0000', '200.0000', '12%', '216000.0000', 8, NULL, NULL, '2019-08-10 03:37:44', '2019-08-10 03:37:44'),
(41, 'MP00000', '387463743898327', '45000.0000', '0.0000', '200.0000', '12%', '1080000.0000', 8, NULL, NULL, '2019-08-10 03:37:44', '2019-08-10 03:37:44'),
(42, 'MP00003', '387463743898327', '30000.0000', '0.0000', '200.0000', '12%', '720000.0000', 8, NULL, NULL, '2019-08-10 03:37:44', '2019-08-10 03:37:44'),
(43, 'MP00010', '387463743898327', '2500.0000', '0.0000', '200.0000', '12%', '60000.0000', 8, NULL, NULL, '2019-08-10 03:37:44', '2019-08-10 03:37:44'),
(44, 'MP00009', '387463743898327', '4500.0000', '0.0000', '200.0000', '12%', '108000.0000', 8, NULL, NULL, '2019-08-10 03:37:45', '2019-08-10 03:37:45'),
(45, 'MP00008', '387463743898327', '6000.0000', '0.0000', '200.0000', '12%', '144000.0000', 8, NULL, NULL, '2019-08-10 03:37:45', '2019-08-10 03:37:45'),
(46, 'MP00005', '387463743898327', '6000.0000', '0.0000', '200.0000', '12%', '144000.0000', 8, NULL, NULL, '2019-08-10 03:37:45', '2019-08-10 03:37:45'),
(47, 'MP00006', '387463743898327', '6400.0000', '0.0000', '200.0000', '12%', '153600.0000', 8, NULL, NULL, '2019-08-10 03:37:45', '2019-08-10 03:37:45'),
(48, 'MP00007', '387463743898327', '9550.0000', '0.0000', '200.0000', '12%', '229200.0000', 8, NULL, NULL, '2019-08-10 03:37:45', '2019-08-10 03:37:45'),
(49, 'MI00005', '387463743898327', '86981.0000', '0.0000', '200.0000', '12%', '2087544.0000', 8, NULL, NULL, '2019-08-10 03:37:46', '2019-08-10 03:37:46'),
(50, 'MI00016', '387463743898327', '157000.0000', '0.0000', '200.0000', '12%', '3768000.0000', 8, NULL, NULL, '2019-08-10 03:37:46', '2019-08-10 03:37:46'),
(51, 'MI00006', '387463743898327', '13600.0000', '0.0000', '200.0000', '12%', '326400.0000', 8, NULL, NULL, '2019-08-10 03:37:46', '2019-08-10 03:37:46'),
(52, 'MI00011', '387463743898327', '10000.0000', '0.0000', '200.0000', '12%', '240000.0000', 8, NULL, NULL, '2019-08-10 03:37:46', '2019-08-10 03:37:46'),
(53, 'MI00017', '387463743898327', '7700.0000', '0.0000', '200.0000', '12%', '184800.0000', 8, NULL, NULL, '2019-08-10 03:37:46', '2019-08-10 03:37:46'),
(54, 'MI00024', '387463743898327', '2000.0000', '0.0000', '200.0000', '12%', '48000.0000', 8, NULL, NULL, '2019-08-10 03:37:47', '2019-08-10 03:37:47'),
(55, 'MI00022', '387463743898327', '1000.0000', '0.0000', '200.0000', '12%', '24000.0000', 8, NULL, NULL, '2019-08-10 03:37:47', '2019-08-10 03:37:47'),
(56, 'MI00023', '387463743898327', '2875.0000', '0.0000', '200.0000', '12%', '69000.0000', 8, NULL, NULL, '2019-08-10 03:37:47', '2019-08-10 03:37:47'),
(57, 'MI00003', '387463743898327', '3139.0000', '0.0000', '200.0000', '12%', '75336.0000', 8, NULL, NULL, '2019-08-10 03:37:47', '2019-08-10 03:37:47'),
(58, 'MI00025', '387463743898327', '2000.0000', '0.0000', '200.0000', '12%', '48000.0000', 8, NULL, NULL, '2019-08-10 03:37:47', '2019-08-10 03:37:47'),
(59, 'MI00019', '387463743898327', '661.5000', '0.0000', '200.0000', '12%', '15876.0000', 8, NULL, NULL, '2019-08-10 03:37:48', '2019-08-10 03:37:48'),
(60, 'MI00013', '387463743898327', '3000.0000', '0.0000', '200.0000', '12%', '72000.0000', 8, NULL, NULL, '2019-08-10 03:37:48', '2019-08-10 03:37:48'),
(61, 'MI00018', '387463743898327', '1000.0000', '0.0000', '200.0000', '12%', '24000.0000', 8, NULL, NULL, '2019-08-10 03:37:48', '2019-08-10 03:37:48'),
(62, 'MI00014', '387463743898327', '1000.0000', '0.0000', '200.0000', '12%', '24000.0000', 8, NULL, NULL, '2019-08-10 03:37:48', '2019-08-10 03:37:48'),
(63, 'MI00027', '387463743898327', '10000.0000', '0.0000', '200.0000', '12%', '240000.0000', 8, NULL, NULL, '2019-08-10 03:37:48', '2019-08-10 03:37:48'),
(64, 'MI00007', '387463743898327', '500.0000', '0.0000', '200.0000', '12%', '12000.0000', 8, NULL, NULL, '2019-08-10 03:37:48', '2019-08-10 03:37:48'),
(65, 'MP00000', NULL, NULL, '200.0000', '165.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-08-01', '2019-08-10 03:59:28', '2019-08-10 03:59:28'),
(66, 'MP00003', NULL, NULL, '200.0000', '180.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-08-01', '2019-08-10 03:59:29', '2019-08-10 03:59:29'),
(67, 'MP00010', NULL, NULL, '200.0000', '175.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-08-01', '2019-08-10 03:59:29', '2019-08-10 03:59:29'),
(68, 'MP00009', NULL, NULL, '200.0000', '175.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-08-01', '2019-08-10 03:59:29', '2019-08-10 03:59:29'),
(69, 'MP00008', NULL, NULL, '200.0000', '165.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-08-01', '2019-08-10 04:00:05', '2019-08-10 04:00:05'),
(70, 'MP00005', NULL, NULL, '200.0000', '175.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-08-01', '2019-08-10 04:00:06', '2019-08-10 04:00:06'),
(71, 'MP00006', NULL, NULL, '200.0000', '170.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-08-01', '2019-08-10 04:00:06', '2019-08-10 04:00:06'),
(72, 'MP00007', NULL, NULL, '200.0000', '190.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-08-01', '2019-08-10 04:00:07', '2019-08-10 04:00:07'),
(73, 'MI00024', NULL, NULL, '200.0000', '196.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:10', '2019-08-10 04:33:10'),
(74, 'MI00022', NULL, NULL, '200.0000', '198.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:10', '2019-08-10 04:33:10'),
(75, 'MI00023', NULL, NULL, '200.0000', '198.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:10', '2019-08-10 04:33:10'),
(76, 'MI00003', NULL, NULL, '200.0000', '198.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:11', '2019-08-10 04:33:11'),
(77, 'MI00025', NULL, NULL, '200.0000', '196.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:11', '2019-08-10 04:33:11'),
(78, 'MI00019', NULL, NULL, '200.0000', '164.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:11', '2019-08-10 04:33:11'),
(79, 'MI00013', NULL, NULL, '200.0000', '164.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:12', '2019-08-10 04:33:12'),
(80, 'MI00005', NULL, NULL, '200.0000', '189.2000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:12', '2019-08-10 04:33:12'),
(81, 'MI00000', NULL, NULL, '200.0000', '198.2000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:12', '2019-08-10 04:33:12'),
(82, 'MI00001', NULL, NULL, '200.0000', '198.2000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:12', '2019-08-10 04:33:12'),
(83, 'MI00016', NULL, NULL, '200.0000', '198.2000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:12', '2019-08-10 04:33:12'),
(84, 'MI00006', NULL, NULL, '200.0000', '198.2000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:13', '2019-08-10 04:33:13'),
(85, 'MI00011', NULL, NULL, '200.0000', '198.2000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:13', '2019-08-10 04:33:13'),
(86, 'MI00017', NULL, NULL, '200.0000', '198.9200', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:13', '2019-08-10 04:33:13'),
(87, 'MI00018', NULL, NULL, '200.0000', '198.2000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-01', '2019-08-10 04:33:14', '2019-08-10 04:33:14'),
(88, 'MI00027', NULL, NULL, '200.0000', '164.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-08-01', '2019-08-10 04:38:31', '2019-08-10 04:38:31'),
(89, 'MI00007', NULL, NULL, '200.0000', '197.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-08-01', '2019-08-10 04:38:31', '2019-08-10 04:38:31'),
(90, 'MI00000', NULL, NULL, '198.2000', '98.2000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-01', '2019-08-10 04:42:36', '2019-08-10 04:42:36'),
(91, 'MI00001', NULL, NULL, '198.2000', '78.2000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-01', '2019-08-10 04:42:37', '2019-08-10 04:42:37'),
(92, 'MI00002', NULL, NULL, '200.0000', '180.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-08-01', '2019-08-10 04:43:07', '2019-08-10 04:43:07'),
(93, 'MP00000', NULL, NULL, '165.0000', '135.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-08-01', '2019-08-10 04:43:07', '2019-08-10 04:43:07'),
(94, 'MI00013', NULL, NULL, '164.0000', '114.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-08-01', '2019-08-10 04:44:39', '2019-08-10 04:44:39'),
(95, 'MI00019', NULL, NULL, '164.0000', '114.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-08-01', '2019-08-10 04:44:40', '2019-08-10 04:44:40'),
(96, 'MI00014', NULL, NULL, '200.0000', '150.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-08-01', '2019-08-10 04:44:40', '2019-08-10 04:44:40'),
(97, 'MI00027', NULL, NULL, '164.0000', '144.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-08-01', '2019-08-10 04:46:59', '2019-08-10 04:46:59'),
(98, 'MI00007', NULL, NULL, '197.0000', '195.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-08-01', '2019-08-10 04:47:00', '2019-08-10 04:47:00'),
(99, 'MI00002', NULL, NULL, '180.0000', '160.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-08-02', '2019-08-10 04:48:12', '2019-08-10 04:48:12'),
(100, 'MP00000', NULL, NULL, '135.0000', '105.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-08-02', '2019-08-10 04:48:13', '2019-08-10 04:48:13');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `cli_codigo`, `cli_nombre`, `cli_rif`, `cli_direccion`, `cli_contacto`, `cli_condiciones`, `cli_saldo`, `created_at`, `updated_at`) VALUES
(1, 'C00000', 'cliente 1', 'J-37824623-7', 'askjdhsakd', 'dajkshdjas asudhsaudh ', 'sdjjkhfjksd', '0.0000', '2018-01-11 20:34:13', '2019-08-11 14:45:20'),
(2, 'C00001', 'cliente dos', 'J-62626512-9', 'Centro Av.5 con Calle 15, Edif. Juan Ramos, Local 2', '04169856865', 'Contado', '0.0000', '2019-04-05 03:40:45', '2019-08-11 14:45:35'),
(3, 'C00002', 'cliente tres', 'J-62626512-6', 'Centro Av.5 con Calle 15, Edif. Juan Ramos, Local 2', '04169856865', 'Contado', '0.0000', '2019-05-25 05:47:46', '2019-08-11 14:45:54'),
(4, 'C00003', 'Client four', 'J-26845642-3', 'Mérida, edo. Mérida, Centro, Calle 20, Edificio Crisostomo, Local 3', '0274-3645364', 'Crédito', '0.0000', '2019-06-07 19:16:14', '2019-08-11 14:46:09'),
(5, 'C00004', 'cliente 1', 'J-62626123-9', 'Mérida, edo. Mérida, Centro, Calle 20, Edificio Crisostomo, Local 3', '04169856865', 'Contado', '0.0000', '2019-06-18 11:28:23', '2019-08-11 14:46:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `comp_doc`, `comp_proveedor`, `comp_fecha`, `comp_monto`, `comp_cred_cont`, `comp_entidad`, `comp_activo`, `created_at`, `updated_at`) VALUES
(8, '387463743898327', 'P00006', '2019-08-01 04:00:00', '213339056.0000', 'credito', NULL, 1, '2019-08-10 03:37:43', '2019-08-10 03:37:43');

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
-- Estructura de tabla para la tabla `costoshijos`
--

CREATE TABLE IF NOT EXISTS `costoshijos` (
`id` int(11) NOT NULL,
  `id_produccion` int(10) unsigned NOT NULL,
  `id_hijo` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `costoshijos`
--

INSERT INTO `costoshijos` (`id`, `id_produccion`, `id_hijo`, `created_at`, `updated_at`) VALUES
(1, 5, 2, '2019-08-10 04:33:09', '2019-08-10 04:33:09'),
(2, 5, 1, '2019-08-10 04:33:09', '2019-08-10 04:33:09'),
(3, 7, 5, '2019-08-10 04:38:31', '2019-08-10 04:38:31'),
(4, 12, 9, '2019-08-10 04:44:39', '2019-08-10 04:44:39'),
(5, 12, 8, '2019-08-10 04:44:39', '2019-08-10 04:44:39'),
(6, 14, 12, '2019-08-10 04:46:59', '2019-08-10 04:46:59');

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
  `cta_entidad` varchar(255) NOT NULL,
  `cta_fecha` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `cta_entidad` varchar(255) DEFAULT NULL,
  `cta_pagada` int(1) DEFAULT NULL,
  `cta_fecha` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentasxpagar`
--

INSERT INTO `cuentasxpagar` (`id`, `cta_prov_codigo`, `cta_monto`, `cta_concepto`, `cta_compra_id`, `cta_entidad`, `cta_pagada`, `cta_fecha`, `created_at`, `updated_at`) VALUES
(5, 'P00006', '213339056.0000', 'Compra a crédito bajo factura: 387463743898327 de fecha 2019-08-01', 8, NULL, NULL, NULL, '2019-08-10 03:37:43', '2019-08-10 03:37:43');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dependencias`
--

INSERT INTO `dependencias` (`id`, `dep_padre`, `dep_hijo`, `dep_produccion`, `requerimiento`, `created_at`, `updated_at`) VALUES
(3, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'ANTIPASTO ATÚN (FRASCO 470G)', 5, 36, '2018-03-23 17:31:56', '2019-08-10 04:38:30'),
(4, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PICADO BLANDO ANTIPASTO (kilo)', 1, 11, '2019-02-14 10:39:00', '2019-08-10 04:33:08'),
(5, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PICADO DURO ANTIPASTO (kilo)', 2, 11, '2019-02-14 10:39:16', '2019-08-10 04:33:09'),
(10, 'Producto Ejemplo Presentación 12 Unid.', 'Producto terminado ejemplo', 12, 24, '2019-06-02 00:33:02', '2019-08-10 04:46:58'),
(25, 'Producto terminado ejemplo', 'Producto Semiprocesado Ejemplo 2', 9, 25, '2019-06-15 18:35:43', '2019-08-10 04:44:38'),
(26, 'Producto terminado ejemplo', 'Producto Semiprocesado Ejemplo 1', 8, 24, '2019-06-15 18:35:46', '2019-08-10 04:44:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE IF NOT EXISTS `ingredientes` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ing_ingrediente` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ing_default` int(1) NOT NULL DEFAULT '0',
  `ing_ratio` decimal(10,4) NOT NULL DEFAULT '1.0000',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id`, `rec_nombre`, `ing_ingrediente`, `ing_default`, `ing_ratio`, `created_at`, `updated_at`) VALUES
(62, 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', 0, '1.0000', '2017-12-28 23:24:06', '2017-12-28 23:24:06'),
(63, 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', 0, '1.0000', '2017-12-28 23:24:12', '2017-12-28 23:24:12'),
(64, 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', 0, '1.0000', '2017-12-28 23:24:18', '2017-12-28 23:24:18'),
(65, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', 0, '1.0000', '2017-12-28 23:24:23', '2017-12-28 23:24:23'),
(66, 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', 0, '1.0000', '2017-12-28 23:24:30', '2017-12-28 23:24:30'),
(68, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', 0, '1.0000', '2018-01-11 20:37:36', '2018-01-11 20:37:36'),
(70, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', 0, '1.0000', '2018-03-23 18:00:25', '2018-03-23 18:00:25'),
(98, 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', 1, '1.0000', '2019-04-15 21:04:36', '2019-04-15 21:04:36'),
(99, 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', 1, '1.0000', '2019-04-15 21:04:49', '2019-04-15 21:04:49'),
(115, 'Producto terminado ejemplo', 'FRASCO 500CC', 1, '1.0000', '2019-06-01 22:00:23', '2019-06-01 22:00:23'),
(116, 'Producto terminado ejemplo', 'TAPA 63mm, 500cc, TWIST BLANCA', 1, '1.0000', '2019-06-01 22:00:28', '2019-06-01 22:00:28'),
(118, 'Producto terminado ejemplo', 'PRESINTO FRASCO 500cc', 1, '1.0000', '2019-06-01 22:03:22', '2019-06-01 22:03:22'),
(119, 'Producto Ejemplo Presentación 12 Unid.', 'PLASTICO TERMOENCOJIBLE', 1, '10.0000', '2019-06-02 00:33:54', '2019-06-02 00:33:54'),
(121, 'Producto Ejemplo Presentación 12 Unid.', 'BANDEJA CARTÓN 12x500cc', 1, '1.0000', '2019-06-02 00:45:22', '2019-06-02 00:45:22'),
(124, 'Producto Semiprocesado Ejemplo 1', 'ACEITE', 1, '0.5000', '2019-06-09 15:26:54', '2019-06-09 15:26:54'),
(125, 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', 1, '0.6000', '2019-06-09 15:27:02', '2019-06-09 15:27:02'),
(130, 'Producto Semiprocesado Ejemplo 2', 'ÁCIDO CÍTRICO', 1, '0.4000', '2019-06-18 11:12:19', '2019-06-18 11:12:19'),
(131, 'Producto Semiprocesado Ejemplo 2', 'AJOPORRO', 1, '0.6000', '2019-06-18 11:12:26', '2019-06-18 11:12:26'),
(132, 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', 1, '0.3500', '2019-08-10 03:53:49', '2019-08-10 03:53:49'),
(133, 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', 1, '0.2000', '2019-08-10 03:54:19', '2019-08-10 03:54:19'),
(134, 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', 1, '0.2500', '2019-08-10 03:55:01', '2019-08-10 03:55:01'),
(135, 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', 1, '0.2500', '2019-08-10 03:55:27', '2019-08-10 03:55:27'),
(136, 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', 1, '0.3500', '2019-08-10 03:56:43', '2019-08-10 03:56:43'),
(138, 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', 1, '0.2500', '2019-08-10 03:57:51', '2019-08-10 03:57:51'),
(139, 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', 1, '0.3000', '2019-08-10 03:58:29', '2019-08-10 03:58:29'),
(140, 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', 1, '0.1000', '2019-08-10 03:58:45', '2019-08-10 03:58:45'),
(141, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', 1, '0.3000', '2019-08-10 04:14:21', '2019-08-10 04:14:21'),
(142, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', 1, '0.0500', '2019-08-10 04:14:42', '2019-08-10 04:14:42'),
(143, 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', 1, '0.0500', '2019-08-10 04:15:01', '2019-08-10 04:15:01'),
(144, 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', 1, '0.0500', '2019-08-10 04:15:39', '2019-08-10 04:15:39'),
(145, 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', 1, '0.0500', '2019-08-10 04:16:11', '2019-08-10 04:16:11'),
(146, 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', 1, '0.0500', '2019-08-10 04:16:34', '2019-08-10 04:16:34'),
(147, 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', 1, '0.0300', '2019-08-10 04:17:27', '2019-08-10 04:17:27'),
(148, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', 1, '0.0500', '2019-08-10 04:18:00', '2019-08-10 04:18:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo_requerido`
--

CREATE TABLE IF NOT EXISTS `insumo_requerido` (
`id` int(11) NOT NULL,
  `ins_req_fecha` date DEFAULT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ins_req_insumo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ins_req_total` decimal(25,4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insumo_requerido`
--

INSERT INTO `insumo_requerido` (`id`, `ins_req_fecha`, `rec_nombre`, `ins_req_insumo`, `ins_req_total`, `created_at`, `updated_at`) VALUES
(1, '2019-08-01', 'PICADO BLANDO ANTIPASTO (kilo)', 'Agua', '100.0000', '2019-08-10 03:59:29', '2019-08-10 03:59:29'),
(2, '2019-08-01', 'PICADO DURO ANTIPASTO (kilo)', 'Agua', '100.0000', '2019-08-10 04:00:07', '2019-08-10 04:00:07'),
(3, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'Agua', '18.0000', '2019-08-10 04:33:14', '2019-08-10 04:33:14'),
(4, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'Electricidad', '1440.0000', '2019-08-10 04:33:14', '2019-08-10 04:33:14'),
(5, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'Gas', '9.0000', '2019-08-10 04:33:14', '2019-08-10 04:33:14'),
(6, '2019-08-01', 'Producto terminado ejemplo', 'Gas', '5.0000', '2019-08-10 04:44:41', '2019-08-10 04:44:41'),
(7, '2019-08-01', 'Producto terminado ejemplo', 'Agua', '25.0000', '2019-08-10 04:44:41', '2019-08-10 04:44:41'),
(8, '2019-08-01', 'Producto terminado ejemplo', 'Electricidad', '50.0000', '2019-08-10 04:44:41', '2019-08-10 04:44:41'),
(9, '2019-08-01', 'Producto Ejemplo Presentación 12 Unid.', 'Electricidad', '4.0000', '2019-08-10 04:47:00', '2019-08-10 04:47:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo_usado`
--

CREATE TABLE IF NOT EXISTS `insumo_usado` (
`id` int(11) NOT NULL,
  `insing_default` int(1) NOT NULL DEFAULT '0',
  `insing_insumo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `insing_ratio` decimal(10,4) NOT NULL DEFAULT '1.0000',
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insumo_usado`
--

INSERT INTO `insumo_usado` (`id`, `insing_default`, `insing_insumo`, `insing_ratio`, `rec_nombre`, `created_at`, `updated_at`) VALUES
(11, 1, 'Gas', '0.1000', 'Producto terminado ejemplo', '2019-06-01 22:01:18', '2019-06-01 22:01:18'),
(12, 1, 'Agua', '0.5000', 'Producto terminado ejemplo', '2019-06-01 22:01:26', '2019-06-01 22:01:26'),
(13, 1, 'Electricidad', '1.0000', 'Producto terminado ejemplo', '2019-06-01 22:01:40', '2019-06-01 22:01:40'),
(14, 1, 'Electricidad', '2.0000', 'Producto Ejemplo Presentación 12 Unid.', '2019-06-05 21:41:28', '2019-06-05 21:41:28'),
(15, 1, 'Agua', '1.0000', 'PICADO BLANDO ANTIPASTO (kilo)', '2019-08-10 03:56:03', '2019-08-10 03:56:03'),
(16, 1, 'Agua', '1.0000', 'PICADO DURO ANTIPASTO (kilo)', '2019-08-10 03:58:54', '2019-08-10 03:58:54'),
(18, 1, 'Agua', '0.5000', 'ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-10 04:19:59', '2019-08-10 04:19:59'),
(19, 1, 'Electricidad', '40.0000', 'ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-10 04:21:22', '2019-08-10 04:21:22'),
(20, 1, 'Gas', '0.2500', 'ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-10 04:23:25', '2019-08-10 04:23:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE IF NOT EXISTS `insumos` (
`id` int(11) NOT NULL,
  `ins_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ins_unidad` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ins_costo` decimal(25,4) NOT NULL,
  `ins_observacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ins_cost_updated` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`id`, `ins_nombre`, `ins_unidad`, `ins_costo`, `ins_observacion`, `ins_cost_updated`, `created_at`, `updated_at`) VALUES
(1, 'Gas', '% sobre Bombona', '800.0000', 'Costo especulativo', '2019-08-10', '2019-06-01 04:53:12', '2019-08-10 04:35:18'),
(2, 'Agua', 'Unid. Estándar', '0.0500', '', NULL, '2019-06-01 04:55:21', '2019-06-01 04:55:21'),
(3, 'Electricidad', 'KW/Hr', '0.0009', '', '2019-06-01', '2019-06-01 04:59:38', '2019-06-01 05:02:03'),
(4, 'insumo prueba', 'unidad', '387438.0000', '', NULL, '2019-06-17 07:35:11', '2019-06-17 07:35:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiasprimas`
--

CREATE TABLE IF NOT EXISTS `materiasprimas` (
`id` int(10) unsigned NOT NULL,
  `mp_codigo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mp_cantidad` decimal(25,4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiasprimas`
--

INSERT INTO `materiasprimas` (`id`, `mp_codigo`, `mp_cantidad`, `created_at`, `updated_at`) VALUES
(11, 'MI00000', '98.2000', '2019-08-10 03:37:43', '2019-08-10 04:42:37'),
(12, 'MI00001', '78.2000', '2019-08-10 03:37:43', '2019-08-10 04:42:37'),
(13, 'MI00002', '160.0000', '2019-08-10 03:37:44', '2019-08-10 04:48:12'),
(14, 'MP00000', '105.0000', '2019-08-10 03:37:44', '2019-08-10 04:48:13'),
(15, 'MP00003', '180.0000', '2019-08-10 03:37:44', '2019-08-10 03:59:29'),
(16, 'MP00010', '175.0000', '2019-08-10 03:37:44', '2019-08-10 03:59:29'),
(17, 'MP00009', '175.0000', '2019-08-10 03:37:44', '2019-08-10 03:59:29'),
(18, 'MP00008', '165.0000', '2019-08-10 03:37:45', '2019-08-10 04:00:05'),
(19, 'MP00005', '175.0000', '2019-08-10 03:37:45', '2019-08-10 04:00:06'),
(20, 'MP00006', '170.0000', '2019-08-10 03:37:45', '2019-08-10 04:00:07'),
(21, 'MP00007', '190.0000', '2019-08-10 03:37:45', '2019-08-10 04:00:07'),
(22, 'MI00005', '189.2000', '2019-08-10 03:37:45', '2019-08-10 04:33:12'),
(23, 'MI00016', '198.2000', '2019-08-10 03:37:46', '2019-08-10 04:33:13'),
(24, 'MI00006', '198.2000', '2019-08-10 03:37:46', '2019-08-10 04:33:13'),
(25, 'MI00011', '198.2000', '2019-08-10 03:37:46', '2019-08-10 04:33:13'),
(26, 'MI00017', '198.9200', '2019-08-10 03:37:46', '2019-08-10 04:33:13'),
(27, 'MI00024', '196.0000', '2019-08-10 03:37:47', '2019-08-10 04:33:10'),
(28, 'MI00022', '198.0000', '2019-08-10 03:37:47', '2019-08-10 04:33:10'),
(29, 'MI00023', '198.0000', '2019-08-10 03:37:47', '2019-08-10 04:33:11'),
(30, 'MI00003', '198.0000', '2019-08-10 03:37:47', '2019-08-10 04:33:11'),
(31, 'MI00025', '196.0000', '2019-08-10 03:37:47', '2019-08-10 04:33:11'),
(32, 'MI00019', '114.0000', '2019-08-10 03:37:48', '2019-08-10 04:44:40'),
(33, 'MI00013', '114.0000', '2019-08-10 03:37:48', '2019-08-10 04:44:39'),
(34, 'MI00018', '198.2000', '2019-08-10 03:37:48', '2019-08-10 04:33:14'),
(35, 'MI00014', '150.0000', '2019-08-10 03:37:48', '2019-08-10 04:44:40'),
(36, 'MI00027', '144.0000', '2019-08-10 03:37:48', '2019-08-10 04:46:59'),
(37, 'MI00007', '195.0000', '2019-08-10 03:37:48', '2019-08-10 04:47:00');

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
(1, '102.00', '10002.00', '22.23', '62.00', '10002.00', '480.47', '2017-10-11 04:00:00', '2017-11-07 01:13:15');

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
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `pro_produccion` decimal(25,4) NOT NULL,
  `pro_disponible` decimal(25,4) NOT NULL,
  `pro_costo` decimal(25,4) DEFAULT NULL,
  `pro_mano_obra` decimal(25,4) NOT NULL,
  `pro_lote` int(10) unsigned DEFAULT NULL,
  `pro_concepto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id`, `pro_fecha`, `rec_nombre`, `pro_etapa`, `pro_produccion`, `pro_disponible`, `pro_costo`, `pro_mano_obra`, `pro_lote`, `pro_concepto`, `created_at`, `updated_at`) VALUES
(1, '2019-08-01', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', '100.0000', '100.0000', '23738.4050', '3.0000', NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-08-10 03:59:28', '2019-08-10 03:59:31'),
(2, '2019-08-01', 'PICADO DURO ANTIPASTO (kilo)', 'PA', '100.0000', '100.0000', '6633.9533', '2.0000', NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-08-10 04:00:05', '2019-08-10 04:00:08'),
(3, '2019-08-01', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', '10.8000', '89.2000', NULL, '3.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-10 04:33:08', '2019-08-10 04:33:08'),
(4, '2019-08-01', 'PICADO DURO ANTIPASTO (kilo)', 'PA', '10.8000', '89.2000', NULL, '2.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-10 04:33:08', '2019-08-10 04:33:08'),
(5, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', '36.0000', '36.0000', '77346.6450', '5.0000', 1, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-10 04:33:09', '2019-08-10 04:35:26'),
(6, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', '36.0000', '0.0000', NULL, '5.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-08-10 04:38:30', '2019-08-10 04:38:30'),
(7, '2019-08-01', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', '3.0000', '3.0000', '1053956.5178', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-08-10 04:38:30', '2019-08-10 04:41:43'),
(8, '2019-08-01', 'Producto Semiprocesado Ejemplo 1', 'PA', '200.0000', '200.0000', '315599.3146', '2.5000', NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-10 04:42:36', '2019-08-10 04:42:38'),
(9, '2019-08-01', 'Producto Semiprocesado Ejemplo 2', 'PA', '50.0000', '50.0000', '31076.7100', '3.0000', NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-08-10 04:43:06', '2019-08-10 04:43:08'),
(10, '2019-08-01', 'Producto Semiprocesado Ejemplo 2', 'PA', '25.0000', '25.0000', NULL, '3.0000', NULL, 'Producción de Producto terminado ejemplo', '2019-08-10 04:44:37', '2019-08-10 04:44:37'),
(11, '2019-08-01', 'Producto Semiprocesado Ejemplo 1', 'PA', '24.0000', '176.0000', NULL, '2.5000', NULL, 'Producción de Producto terminado ejemplo', '2019-08-10 04:44:38', '2019-08-10 04:44:38'),
(12, '2019-08-01', 'Producto terminado ejemplo', 'PB', '50.0000', '50.0000', '178732.9907', '5.0000', 1, 'Producción de Producto terminado ejemplo', '2019-08-10 04:44:39', '2019-08-10 04:44:43'),
(13, '2019-08-01', 'Producto terminado ejemplo', 'PB', '24.0000', '26.0000', NULL, '5.0000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-08-10 04:46:58', '2019-08-10 04:46:58'),
(14, '2019-08-01', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '2.0000', '2.0000', '2257213.6403', '3.0000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-08-10 04:46:59', '2019-08-10 04:47:01'),
(15, '2019-08-02', 'Producto Semiprocesado Ejemplo 2', 'PA', '50.0000', '75.0000', '31076.7100', '3.0000', NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-08-10 04:48:12', '2019-08-10 04:48:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producciona`
--

CREATE TABLE IF NOT EXISTS `producciona` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producciona`
--

INSERT INTO `producciona` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(1, 'PICADO BLANDO ANTIPASTO (kilo)', '89.2000', '2019-08-10 03:59:28', '2019-08-10 04:33:08'),
(2, 'PICADO DURO ANTIPASTO (kilo)', '89.2000', '2019-08-10 04:00:04', '2019-08-10 04:33:08'),
(3, 'Producto Semiprocesado Ejemplo 1', '176.0000', '2019-08-10 04:42:36', '2019-08-10 04:44:38'),
(4, 'Producto Semiprocesado Ejemplo 2', '75.0000', '2019-08-10 04:43:06', '2019-08-10 04:48:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccionb`
--

CREATE TABLE IF NOT EXISTS `produccionb` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccionb`
--

INSERT INTO `produccionb` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(1, 'ANTIPASTO ATÚN (FRASCO 470G)', '0.0000', '2019-08-10 04:33:09', '2019-08-10 04:38:30'),
(2, 'Producto terminado ejemplo', '26.0000', '2019-08-10 04:44:38', '2019-08-10 04:46:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccionc`
--

CREATE TABLE IF NOT EXISTS `produccionc` (
`id` int(10) unsigned NOT NULL,
  `rec_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pro_produccion` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccionc`
--

INSERT INTO `produccionc` (`id`, `rec_nombre`, `pro_produccion`, `created_at`, `updated_at`) VALUES
(1, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '3.0000', '2019-08-10 04:38:30', '2019-08-10 04:38:30'),
(2, 'Producto Ejemplo Presentación 12 Unid.', '2.0000', '2019-08-10 04:46:59', '2019-08-10 04:46:59');

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
(1, 5255, '2017-10-11 08:00:00', '2019-06-07 18:13:06');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `prov_codigo`, `prov_nombre`, `prov_rif`, `prov_direccion`, `prov_contacto`, `prov_condiciones`, `prov_retencion`, `prov_saldo`, `prov_cred_o_cont`, `created_at`, `updated_at`) VALUES
(2, 'P00000', 'Proveedor', 'J-00000000-0', 'ashda', 'sajhda', 'asjdhas', 0, '0.0000', 'credito', '2017-12-04 22:57:53', '2019-08-09 20:25:33'),
(3, 'P00002', 'segundo proveedor', 'J-00000001-0', 'hsgdha', 'hasgdhasg', 'ahsdgas', 0, '0.0000', 'contado', '2017-12-12 19:14:19', '2019-08-09 20:26:06'),
(4, 'P00003', 'proveedor cinco', 'j-23345567-2', 'la calle', 'ramón', '15 dias', 0, '0.0000', 'contado', '2017-12-24 18:40:01', '2019-04-30 05:59:59'),
(5, 'P00004', 'pablo iglesia', 'j-33333333-3', 'san pablo', 'pablo', 'ninguna', 0, '0.0000', 'contado', '2017-12-30 18:26:26', '2019-08-10 03:15:03'),
(6, 'P00005', 'pepe', 'J-00000004-0', 'dirección de pepe', 'pepe', 'pepe condithion', 0, '0.0000', 'credito', '2018-01-11 20:08:54', '2019-08-09 20:26:25'),
(7, 'P00006', 'GATO', 'J-00000005-0', 'DIRECCION GATO', 'SR GATO', '123', 0, '213339056.0000', 'credito', '2018-01-11 23:11:57', '2019-08-10 03:37:43'),
(8, 'P00001', 'Repartos Orientales', 'J-00000006-0', 'El junquito, kilometro 12, galpón 312', '0414-1452263', '', 0, '0.0000', 'contado', '2019-04-05 03:28:33', '2019-08-09 20:26:51'),
(9, 'P00007', 'septimo proveedor', 'J-00000007-0', 'asjhdajh ausdhsahdas sdjsahdjashd', '04143767273', '', 0, '0.0000', 'contado', '2019-04-05 07:17:55', '2019-08-09 20:27:02'),
(10, 'P00008', 'Proveedor Ocho', 'J-00000008-0', 'askhdaushda', '4857438534', '', 0, '0.0000', 'contado', '2019-06-07 18:35:51', '2019-08-09 20:27:13'),
(11, 'P00009', 'Ninth supplier', 'J-00000009-0', 'ajsdahs ashdghasdg asdhgsahdas', '04247437423', 'ashdsada', 0, '0.0000', 'contado', '2019-07-31 03:31:59', '2019-08-10 00:06:44');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(19, 'Producto Semiprocesado Ejemplo 1', 'si', 'PA', 'Kilos', '2019-06-07 19:45:39', '2019-06-07 20:05:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requerimientos`
--

INSERT INTO `requerimientos` (`id`, `req_fecha`, `rec_nombre`, `req_ingrediente`, `req_total`, `created_at`, `updated_at`) VALUES
(1, '2019-08-01', 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', '35.0000', '2019-08-10 03:59:28', '2019-08-10 03:59:28'),
(2, '2019-08-01', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', '20.0000', '2019-08-10 03:59:28', '2019-08-10 03:59:28'),
(3, '2019-08-01', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', '25.0000', '2019-08-10 03:59:29', '2019-08-10 03:59:29'),
(4, '2019-08-01', 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', '25.0000', '2019-08-10 03:59:29', '2019-08-10 03:59:29'),
(5, '2019-08-01', 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', '35.0000', '2019-08-10 04:00:05', '2019-08-10 04:00:05'),
(6, '2019-08-01', 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', '25.0000', '2019-08-10 04:00:06', '2019-08-10 04:00:06'),
(7, '2019-08-01', 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', '30.0000', '2019-08-10 04:00:06', '2019-08-10 04:00:06'),
(8, '2019-08-01', 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', '10.0000', '2019-08-10 04:00:07', '2019-08-10 04:00:07'),
(9, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', '4.0000', '2019-08-10 04:33:09', '2019-08-10 04:33:09'),
(10, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', '2.0000', '2019-08-10 04:33:10', '2019-08-10 04:33:10'),
(11, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', '2.0000', '2019-08-10 04:33:10', '2019-08-10 04:33:10'),
(12, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', '2.0000', '2019-08-10 04:33:11', '2019-08-10 04:33:11'),
(13, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', '4.0000', '2019-08-10 04:33:11', '2019-08-10 04:33:11'),
(14, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', '36.0000', '2019-08-10 04:33:11', '2019-08-10 04:33:11'),
(15, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', '36.0000', '2019-08-10 04:33:11', '2019-08-10 04:33:11'),
(16, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', '10.8000', '2019-08-10 04:33:12', '2019-08-10 04:33:12'),
(17, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', '1.8000', '2019-08-10 04:33:12', '2019-08-10 04:33:12'),
(18, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', '1.8000', '2019-08-10 04:33:12', '2019-08-10 04:33:12'),
(19, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', '1.8000', '2019-08-10 04:33:12', '2019-08-10 04:33:12'),
(20, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', '1.8000', '2019-08-10 04:33:13', '2019-08-10 04:33:13'),
(21, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', '1.8000', '2019-08-10 04:33:13', '2019-08-10 04:33:13'),
(22, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', '1.0800', '2019-08-10 04:33:13', '2019-08-10 04:33:13'),
(23, '2019-08-01', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', '1.8000', '2019-08-10 04:33:14', '2019-08-10 04:33:14'),
(24, '2019-08-01', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '36.0000', '2019-08-10 04:38:31', '2019-08-10 04:38:31'),
(25, '2019-08-01', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '3.0000', '2019-08-10 04:38:31', '2019-08-10 04:38:31'),
(26, '2019-08-01', 'Producto Semiprocesado Ejemplo 1', 'ACEITE', '100.0000', '2019-08-10 04:42:36', '2019-08-10 04:42:36'),
(27, '2019-08-01', 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', '120.0000', '2019-08-10 04:42:37', '2019-08-10 04:42:37'),
(28, '2019-08-01', 'Producto Semiprocesado Ejemplo 2', 'ÁCIDO CÍTRICO', '20.0000', '2019-08-10 04:43:07', '2019-08-10 04:43:07'),
(29, '2019-08-01', 'Producto Semiprocesado Ejemplo 2', 'AJOPORRO', '30.0000', '2019-08-10 04:43:07', '2019-08-10 04:43:07'),
(30, '2019-08-01', 'Producto terminado ejemplo', 'FRASCO 500CC', '50.0000', '2019-08-10 04:44:39', '2019-08-10 04:44:39'),
(31, '2019-08-01', 'Producto terminado ejemplo', 'TAPA 63mm, 500cc, TWIST BLANCA', '50.0000', '2019-08-10 04:44:40', '2019-08-10 04:44:40'),
(32, '2019-08-01', 'Producto terminado ejemplo', 'PRESINTO FRASCO 500cc', '50.0000', '2019-08-10 04:44:40', '2019-08-10 04:44:40'),
(33, '2019-08-01', 'Producto Ejemplo Presentación 12 Unid.', 'PLASTICO TERMOENCOJIBLE', '20.0000', '2019-08-10 04:46:59', '2019-08-10 04:46:59'),
(34, '2019-08-01', 'Producto Ejemplo Presentación 12 Unid.', 'BANDEJA CARTÓN 12x500cc', '2.0000', '2019-08-10 04:46:59', '2019-08-10 04:46:59'),
(35, '2019-08-02', 'Producto Semiprocesado Ejemplo 2', 'ÁCIDO CÍTRICO', '20.0000', '2019-08-10 04:48:12', '2019-08-10 04:48:12'),
(36, '2019-08-02', 'Producto Semiprocesado Ejemplo 2', 'AJOPORRO', '30.0000', '2019-08-10 04:48:12', '2019-08-10 04:48:12');

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
(1, '40000.0000', 250, 20, '7945.1667', NULL, '2019-06-18 11:20:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `saldocaja`
--

INSERT INTO `saldocaja` (`id`, `sc_entidad`, `sc_saldo`, `sc_fecha`, `created_at`, `updated_at`) VALUES
(1, 'Caja Chica', '80000000.0000', '2019-08-01 04:00:00', '2019-08-10 04:47:49', '2019-08-10 04:47:49'),
(2, 'Banco de Venezuela', '50000000.0000', '2019-08-01 04:00:00', '2019-08-10 04:47:49', '2019-08-10 04:47:49'),
(3, 'Venezolano de Crédito', '10000000.0000', '2019-08-01 04:00:00', '2019-08-10 04:47:50', '2019-08-10 04:47:50'),
(4, 'Banco Bicentenario', '10000000.0000', '2019-08-01 04:00:00', '2019-08-10 04:47:50', '2019-08-10 04:47:50'),
(5, 'Banco Banesco', '50000000.0000', '2019-08-01 04:00:00', '2019-08-10 04:47:50', '2019-08-10 04:47:50');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `privilegio`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Andres Vega', 'andres_vega93@hotmail.com', '$2y$10$ZO7X6Vj11qtEQ8tot9.isOkI6PUSntu3EsQ4KRrzxK/vYhkQXMKH6', 'admin', 'kPMmdvxcr1KrqMYYO5RYUHfQGa0VO1ga0Jp815yoffyFSAVjNlxFxpAvwTyi', '2017-10-11 10:32:19', '2019-08-10 03:08:43'),
(7, 'Carlos', 'carlosteno@gmail.com', '$2y$10$9uwn8GSSYhLxzaSZnhawBu8f0sqBvgRRYHu8yQpI7/pILxLjx.WVK', 'admin', 'J5RWbVZNO1TbIyVmsPepnHUyyXyAlu2mHBQJynPGuwBIS78Fk9JHVBByuSHT', '2017-10-14 15:48:38', '2018-02-12 20:24:56'),
(8, 'clarisa', 'clari98@hotmail.com', '$2y$10$3PdMuwN1QX5OiLW0jhYWWu/PGegeRyRjoaJUPHPq2Y1q6xAAB4mE6', 'tipo1', '0azYYFx0yL46GxRRI9hTSUn0UZOTwOKEp1G4CCLfxgHAc5HszeyTpKSwOjJu', '2017-12-24 18:33:40', '2019-05-12 07:19:14'),
(9, 'Angélica', 'gavcamerida@gmail.com', '$2y$10$nmvuxdHxxHFRl2pckMARHeQJJ9sjxEV8kg1hLVfJoKvy1NWAbPYMu', 'tipo1', '77kYlLhRAezQrSQf7mP6XcnIPnp3LYiJpwGtJugWppnMSWr18XOL8VawZxlD', '2018-02-07 19:21:08', '2018-02-09 16:07:44'),
(10, 'test', 'mail@mail.com', '$2y$10$BRBmd.UL0KSAzwj6NrOtZOwa98fc/s0YIxD1Tb4lxvPNECw9ouEMK', 'admin', 'LrP4JWi0wTjiRsbTWcAVDa9qI1d8KRqmp6mtJy3c0K0q9sa3ccthxZKQQM0g', '2018-03-24 10:27:53', '2019-04-29 03:37:31'),
(11, 'Andres Eduardo Vega', 'aevega1991@gmail.com', '$2y$10$uTv5TpUjU0mNz2OzRVSgFe8HErOtmZsV.4U607urJmylTx.C7ig7q', 'admin', 'Ylr3Lv5Ow2d0xC0pTKqlHXtUhHWGdjFkKPas4J8AnCzlbpCZnKXJhDmbbuzX', '2019-02-08 04:30:20', '2019-05-31 02:49:09'),
(15, 'tipo1', 'tipo1@test.com', '$2y$10$LMaHzVe0qQ9/afNY9filgO1PADWWRVMfwJB1A032EkUtP1floSykm', 'tipo1', 'MSFSehKQadTtedbGrJRYI9z2GrExMdATorPEuh256Qj8uqtQsP85tp6RiH3G', '2019-05-31 02:49:50', '2019-06-05 02:45:21'),
(18, 'tipo2', 'tipo2@test.com', '$2y$10$RH2daeWMO38Os0zQiaMpw.Xp7rDPianWraOM5G8CbcZOEAzWY1F/y', 'tipo2', 'oYXpsqfvll9zZ1QTm7nvw4o7vIELeB4d1Y76G9IwWOgL2A4tlr5N8bFODhxh', '2019-05-31 03:55:11', '2019-08-08 01:56:35');

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
 ADD PRIMARY KEY (`id`), ADD KEY `cajabanco_fk1` (`cb_compra_id`), ADD KEY `cajabanco_fk2` (`cb_venta_id`);

--
-- Indices de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
 ADD PRIMARY KEY (`id`), ADD KEY `cardexmp_ibfk_1` (`mp_codigo`), ADD KEY `cardexmp_ibfk_2` (`comp_doc`), ADD KEY `cardexmp_ibfk_4` (`car_compra_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `cli_codigo` (`cli_codigo`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `comp_doc` (`comp_doc`), ADD KEY `compras_fk1` (`comp_proveedor`);

--
-- Indices de la tabla `costofijos`
--
ALTER TABLE `costofijos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `costoshijos`
--
ALTER TABLE `costoshijos`
 ADD PRIMARY KEY (`id`), ADD KEY `ch_ibkf_1` (`id_produccion`), ADD KEY `ch_ibkf_2` (`id_hijo`);

--
-- Indices de la tabla `cuentasxcobrar`
--
ALTER TABLE `cuentasxcobrar`
 ADD PRIMARY KEY (`id`), ADD KEY `cuentasxcobrar_fk2` (`cta_cli_codigo`), ADD KEY `cuentasxcobrar_fk1` (`cta_venta_id`), ADD KEY `cta_entidad` (`cta_entidad`);

--
-- Indices de la tabla `cuentasxpagar`
--
ALTER TABLE `cuentasxpagar`
 ADD PRIMARY KEY (`id`), ADD KEY `cuentaxpagar_fk_1` (`cta_compra_id`), ADD KEY `cuentaxpagar_fk_2` (`cta_prov_codigo`);

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
-- Indices de la tabla `insumo_requerido`
--
ALTER TABLE `insumo_requerido`
 ADD PRIMARY KEY (`id`), ADD KEY `ins_req_FK1` (`rec_nombre`), ADD KEY `ins_req_FK2` (`ins_req_insumo`);

--
-- Indices de la tabla `insumo_usado`
--
ALTER TABLE `insumo_usado`
 ADD PRIMARY KEY (`id`), ADD KEY `ins_usa_FK1` (`rec_nombre`), ADD KEY `ins_usa_FK2` (`insing_insumo`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
 ADD PRIMARY KEY (`id`), ADD KEY `ins_nombre` (`ins_nombre`);

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
-- Indices de la tabla `saldocaja`
--
ALTER TABLE `saldocaja`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `totalesventas`
--
ALTER TABLE `totalesventas`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ven_factura` (`ven_factura`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
 ADD PRIMARY KEY (`id`), ADD KEY `ventas_ibkf_2` (`ven_factura`), ADD KEY `ventas_ibkf_1` (`cli_codigo`), ADD KEY `ventas_ibkf_3` (`rec_nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aumentos`
--
ALTER TABLE `aumentos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `cajabanco`
--
ALTER TABLE `cajabanco`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1376;
--
-- AUTO_INCREMENT de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `costofijos`
--
ALTER TABLE `costofijos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `costoshijos`
--
ALTER TABLE `costoshijos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `cuentasxcobrar`
--
ALTER TABLE `cuentasxcobrar`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuentasxpagar`
--
ALTER TABLE `cuentasxpagar`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=149;
--
-- AUTO_INCREMENT de la tabla `insumo_requerido`
--
ALTER TABLE `insumo_requerido`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `insumo_usado`
--
ALTER TABLE `insumo_usado`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `miscelaneos`
--
ALTER TABLE `miscelaneos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `salarios`
--
ALTER TABLE `salarios`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `saldocaja`
--
ALTER TABLE `saldocaja`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `totalesventas`
--
ALTER TABLE `totalesventas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
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
-- Filtros para la tabla `costoshijos`
--
ALTER TABLE `costoshijos`
ADD CONSTRAINT `ch_ibkf_1` FOREIGN KEY (`id_produccion`) REFERENCES `produccion` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
ADD CONSTRAINT `ch_ibkf_2` FOREIGN KEY (`id_hijo`) REFERENCES `produccion` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
