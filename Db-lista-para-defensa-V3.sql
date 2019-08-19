-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2019 a las 02:56:04
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
(44, '23.00', 'Marzo 2019, Gaceta Nº 44068', '2019-06-16 08:16:05', '2019-06-16 08:16:05'),
(45, '15.00', 'Aumento Agosto 2019, Gaceta Nº 47463', '2019-08-18 06:43:26', '2019-08-18 06:43:26');

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
  `cb_entidad` varchar(255) DEFAULT NULL,
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
(1653, NULL, NULL, NULL, NULL, 'HABER', '2019-07-31 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-08-15 03:12:09', '2019-08-15 03:12:09'),
(1654, NULL, NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:12:09', '2019-08-15 03:12:23'),
(1655, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-07-31 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-08-15 03:12:09', '2019-08-15 03:12:09'),
(1656, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:12:09', '2019-08-15 03:12:24'),
(1657, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-07-31 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-08-15 03:12:09', '2019-08-15 03:12:09'),
(1658, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:12:09', '2019-08-15 03:12:24'),
(1659, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-07-31 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-08-15 03:12:09', '2019-08-15 03:12:09'),
(1660, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:12:09', '2019-08-15 03:12:24'),
(1661, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-07-31 04:00:00', '0.0000', 'Cierre del dia', 0, '2019-08-15 03:12:09', '2019-08-15 03:12:09'),
(1662, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:12:09', '2019-08-15 03:12:24'),
(1663, NULL, '200000000.0000', NULL, NULL, 'DEBE', '2019-08-01 04:00:00', '200000000.0000', 'Entrada generada: Inicio de Operaciones', 0, '2019-08-15 03:12:20', '2019-08-15 03:12:23'),
(1664, NULL, NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '200000000.0000', 'Cierre de caja', 0, '2019-08-15 03:12:24', '2019-08-15 03:12:24'),
(1665, NULL, NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '200000000.0000', 'Inicio de caja', 0, '2019-08-15 03:12:24', '2019-08-15 03:15:56'),
(1666, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-08-15 03:12:24', '2019-08-15 03:12:24'),
(1667, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:12:24', '2019-08-15 03:15:56'),
(1668, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-08-15 03:12:24', '2019-08-15 03:12:24'),
(1669, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:12:24', '2019-08-15 03:15:56'),
(1670, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-08-15 03:12:24', '2019-08-15 03:12:24'),
(1671, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:12:24', '2019-08-15 03:15:57'),
(1672, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-01 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-08-15 03:12:24', '2019-08-15 03:12:24'),
(1673, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:12:24', '2019-08-15 03:15:57'),
(1674, NULL, NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '200000000.0000', 'Cierre de caja', 0, '2019-08-15 03:15:56', '2019-08-15 03:15:56'),
(1675, NULL, NULL, NULL, NULL, 'HABER', '2019-08-03 04:00:00', '200000000.0000', 'Inicio de caja', 0, '2019-08-15 03:15:56', '2019-08-15 03:22:40'),
(1676, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-08-15 03:15:56', '2019-08-15 03:15:56'),
(1677, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-03 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:15:56', '2019-08-15 03:22:40'),
(1678, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-08-15 03:15:57', '2019-08-15 03:15:57'),
(1679, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-03 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:15:57', '2019-08-15 03:22:40'),
(1680, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-08-15 03:15:57', '2019-08-15 03:15:57'),
(1681, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-03 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:15:57', '2019-08-15 03:22:40'),
(1682, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-02 04:00:00', '0.0000', 'Cierre de caja', 0, '2019-08-15 03:15:57', '2019-08-15 03:15:57'),
(1683, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-03 04:00:00', '0.0000', 'Inicio de caja', 0, '2019-08-15 03:15:57', '2019-08-15 03:22:41'),
(1684, NULL, '50000000.0000', NULL, NULL, 'HABER', '2019-08-03 04:00:00', '150000000.0000', 'Transferido hacia Banco Banesco, Inicio de Operaciones', 0, '2019-08-15 03:21:56', '2019-08-15 03:22:40'),
(1685, 'Banco Banesco', '50000000.0000', NULL, NULL, 'DEBE', '2019-08-03 04:00:00', '50000000.0000', 'Transferido desde , Inicio de Operaciones', 0, '2019-08-15 03:21:56', '2019-08-15 03:22:41'),
(1686, NULL, '50000000.0000', NULL, NULL, 'HABER', '2019-08-03 04:00:00', '100000000.0000', 'Transferido hacia Banco de Venezuela, Inicio de Operaciones', 0, '2019-08-15 03:22:03', '2019-08-15 03:22:40'),
(1687, 'Banco de Venezuela', '50000000.0000', NULL, NULL, 'DEBE', '2019-08-03 04:00:00', '50000000.0000', 'Transferido desde , Inicio de Operaciones', 0, '2019-08-15 03:22:03', '2019-08-15 03:22:40'),
(1688, NULL, '20000000.0000', NULL, NULL, 'HABER', '2019-08-03 04:00:00', '80000000.0000', 'Transferido hacia Venezolano de Crédito, Inicio de Operaciones', 0, '2019-08-15 03:22:13', '2019-08-15 03:22:40'),
(1689, 'Venezolano de Crédito', '20000000.0000', NULL, NULL, 'DEBE', '2019-08-03 04:00:00', '20000000.0000', 'Transferido desde , Inicio de Operaciones', 0, '2019-08-15 03:22:13', '2019-08-15 03:22:40'),
(1690, NULL, '20000000.0000', NULL, NULL, 'HABER', '2019-08-03 04:00:00', '60000000.0000', 'Transferido hacia Banco Bicentenario, Inicio de Operaciones', 0, '2019-08-15 03:22:22', '2019-08-15 03:22:40'),
(1691, 'Banco Bicentenario', '20000000.0000', NULL, NULL, 'DEBE', '2019-08-03 04:00:00', '20000000.0000', 'Transferido desde , Inicio de Operaciones', 0, '2019-08-15 03:22:22', '2019-08-15 03:22:40'),
(1692, NULL, NULL, NULL, NULL, 'HABER', '2019-08-03 04:00:00', '60000000.0000', 'Cierre de caja', 0, '2019-08-15 03:22:40', '2019-08-15 03:22:40'),
(1693, NULL, NULL, NULL, NULL, 'HABER', '2019-08-04 04:00:00', '60000000.0000', 'Inicio de caja', 0, '2019-08-15 03:22:40', '2019-08-15 04:20:26'),
(1694, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-03 04:00:00', '50000000.0000', 'Cierre de caja', 0, '2019-08-15 03:22:40', '2019-08-15 03:22:40'),
(1695, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-04 04:00:00', '50000000.0000', 'Inicio de caja', 0, '2019-08-15 03:22:40', '2019-08-15 04:20:26'),
(1696, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-03 04:00:00', '20000000.0000', 'Cierre de caja', 0, '2019-08-15 03:22:40', '2019-08-15 03:22:40'),
(1697, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-04 04:00:00', '20000000.0000', 'Inicio de caja', 0, '2019-08-15 03:22:40', '2019-08-15 04:20:26'),
(1698, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-03 04:00:00', '20000000.0000', 'Cierre de caja', 0, '2019-08-15 03:22:41', '2019-08-15 03:22:41'),
(1699, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-04 04:00:00', '20000000.0000', 'Inicio de caja', 0, '2019-08-15 03:22:41', '2019-08-15 04:20:27'),
(1700, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-03 04:00:00', '50000000.0000', 'Cierre de caja', 0, '2019-08-15 03:22:41', '2019-08-15 03:22:41'),
(1701, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-04 04:00:00', '50000000.0000', 'Inicio de caja', 0, '2019-08-15 03:22:41', '2019-08-15 04:20:27'),
(1702, NULL, '6723750.7200', NULL, NULL, 'HABER', '2019-08-04 04:00:00', '53276249.2800', 'Pago de deuda de proveedor P00000', 0, '2019-08-15 03:56:36', '2019-08-15 04:20:26'),
(1703, 'Banco Banesco', '10000000.0000', NULL, NULL, 'HABER', '2019-08-04 04:00:00', '40000000.0000', 'Pago de deuda de proveedor P00000', 0, '2019-08-15 03:57:27', '2019-08-15 04:20:27'),
(1704, NULL, '1456000.0000', 15, NULL, 'HABER', '2019-08-04 04:00:00', '51820249.2800', 'Compra', 0, '2019-08-15 04:01:24', '2019-08-15 04:20:26'),
(1705, NULL, '74088.0000', 16, NULL, 'HABER', '2019-08-04 04:00:00', '51746161.2800', 'Compra', 0, '2019-08-15 04:05:11', '2019-08-15 04:20:26'),
(1706, NULL, '784000.0000', NULL, NULL, 'DEBE', '2019-08-04 04:00:00', '52530161.2800', 'Cobro de deuda a cliente C00000', 0, '2019-08-15 04:15:12', '2019-08-15 04:20:26'),
(1707, NULL, NULL, NULL, NULL, 'HABER', '2019-08-04 04:00:00', '52530161.2800', 'Cierre de caja', 0, '2019-08-15 04:20:26', '2019-08-15 04:20:26'),
(1708, NULL, NULL, NULL, NULL, 'HABER', '2019-08-05 04:00:00', '52530161.2800', 'Inicio de caja', 0, '2019-08-15 04:20:26', '2019-08-18 21:27:41'),
(1709, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-04 04:00:00', '50000000.0000', 'Cierre de caja', 0, '2019-08-15 04:20:26', '2019-08-15 04:20:26'),
(1710, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-05 04:00:00', '50000000.0000', 'Inicio de caja', 0, '2019-08-15 04:20:26', '2019-08-18 21:27:41'),
(1711, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-04 04:00:00', '20000000.0000', 'Cierre de caja', 0, '2019-08-15 04:20:26', '2019-08-15 04:20:26'),
(1712, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-05 04:00:00', '20000000.0000', 'Inicio de caja', 0, '2019-08-15 04:20:27', '2019-08-18 21:27:42'),
(1713, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-04 04:00:00', '20000000.0000', 'Cierre de caja', 0, '2019-08-15 04:20:27', '2019-08-15 04:20:27'),
(1714, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-05 04:00:00', '20000000.0000', 'Inicio de caja', 0, '2019-08-15 04:20:27', '2019-08-18 21:27:42'),
(1715, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-04 04:00:00', '40000000.0000', 'Cierre de caja', 0, '2019-08-15 04:20:27', '2019-08-15 04:20:27'),
(1716, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-05 04:00:00', '40000000.0000', 'Inicio de caja', 0, '2019-08-15 04:20:27', '2019-08-18 21:27:42'),
(1717, NULL, '5000.0000', NULL, NULL, 'HABER', '2019-08-05 04:00:00', '52525161.2800', 'Transferido hacia Banco Banesco, Transferencia de prueba', 0, '2019-08-18 16:51:53', '2019-08-18 21:27:41'),
(1718, 'Banco Banesco', '5000.0000', NULL, NULL, 'DEBE', '2019-08-05 04:00:00', '40005000.0000', 'Transferido desde Caja Chica, Transferencia de prueba', 0, '2019-08-18 16:51:53', '2019-08-18 21:27:42'),
(1719, 'Banco Banesco', '1500.0000', NULL, NULL, 'DEBE', '2019-08-05 04:00:00', '40006500.0000', 'Entrada generada: Entrada de Prueba', 0, '2019-08-18 17:10:58', '2019-08-18 21:27:42'),
(1720, 'Banco Banesco', '2500.0000', NULL, NULL, 'HABER', '2019-08-05 04:00:00', '40004000.0000', 'Salida generada: salida de prueba', 0, '2019-08-18 17:20:40', '2019-08-18 21:27:42'),
(1721, NULL, '6700000.0000', NULL, NULL, 'HABER', '2019-08-05 04:00:00', '45825161.2800', 'Pago de deuda de proveedor P00000', 0, '2019-08-18 18:51:39', '2019-08-18 21:27:41'),
(1722, NULL, '360000.0000', NULL, NULL, 'DEBE', '2019-08-05 04:00:00', '46185161.2800', 'Cobro de deuda a cliente C00000', 0, '2019-08-18 19:50:11', '2019-08-18 21:27:41'),
(1723, NULL, '5152000.0000', NULL, 4, 'DEBE', '2019-08-05 04:00:00', '51337161.2800', 'Venta', 0, '2019-08-18 20:39:24', '2019-08-18 21:27:41'),
(1724, NULL, NULL, NULL, NULL, 'HABER', '2019-08-05 04:00:00', '51337161.2800', 'Cierre de caja', 0, '2019-08-18 21:27:41', '2019-08-18 21:27:41'),
(1725, NULL, NULL, NULL, NULL, 'HABER', '2019-08-06 04:00:00', '51337161.2800', 'Inicio de caja', 1, '2019-08-18 21:27:41', '2019-08-18 21:27:41'),
(1726, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-05 04:00:00', '50000000.0000', 'Cierre de caja', 0, '2019-08-18 21:27:41', '2019-08-18 21:27:41'),
(1727, 'Banco de Venezuela', NULL, NULL, NULL, 'HABER', '2019-08-06 04:00:00', '50000000.0000', 'Inicio de caja', 1, '2019-08-18 21:27:42', '2019-08-18 21:27:42'),
(1728, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-05 04:00:00', '20000000.0000', 'Cierre de caja', 0, '2019-08-18 21:27:42', '2019-08-18 21:27:42'),
(1729, 'Venezolano de Crédito', NULL, NULL, NULL, 'HABER', '2019-08-06 04:00:00', '20000000.0000', 'Inicio de caja', 1, '2019-08-18 21:27:42', '2019-08-18 21:27:42'),
(1730, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-05 04:00:00', '20000000.0000', 'Cierre de caja', 0, '2019-08-18 21:27:42', '2019-08-18 21:27:42'),
(1731, 'Banco Bicentenario', NULL, NULL, NULL, 'HABER', '2019-08-06 04:00:00', '20000000.0000', 'Inicio de caja', 1, '2019-08-18 21:27:42', '2019-08-18 21:27:42'),
(1732, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-05 04:00:00', '40004000.0000', 'Cierre de caja', 0, '2019-08-18 21:27:42', '2019-08-18 21:27:42'),
(1733, 'Banco Banesco', NULL, NULL, NULL, 'HABER', '2019-08-06 04:00:00', '40004000.0000', 'Inicio de caja', 1, '2019-08-18 21:27:42', '2019-08-18 21:27:42');

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
(1, 'MI00000', '5341316684684151', '31000.0000', '0.0000', '100.0000', '12%', '372000.0000', 14, NULL, NULL, '2019-08-15 03:54:47', '2019-08-15 03:54:47'),
(2, 'MI00001', '5341316684684151', '500000.0000', '0.0000', '100.0000', '12%', '6000000.0000', 14, NULL, NULL, '2019-08-15 03:54:47', '2019-08-15 03:54:47'),
(3, 'MI00002', '5341316684684151', '9000.0000', '0.0000', '100.0000', '12%', '108000.0000', 14, NULL, NULL, '2019-08-15 03:54:47', '2019-08-15 03:54:47'),
(4, 'MP00000', '5341316684684151', '46000.0000', '0.0000', '100.0000', '12%', '552000.0000', 14, NULL, NULL, '2019-08-15 03:54:47', '2019-08-15 03:54:47'),
(5, 'MP00001', '5341316684684151', '4000.0000', '0.0000', '100.0000', '12%', '48000.0000', 14, NULL, NULL, '2019-08-15 03:54:47', '2019-08-15 03:54:47'),
(6, 'MI00026', '5341316684684151', '1000000.0000', '0.0000', '100.0000', '12%', '12000000.0000', 14, NULL, NULL, '2019-08-15 03:54:47', '2019-08-15 03:54:47'),
(7, 'MI00003', '5341316684684151', '3139.0000', '0.0000', '100.0000', '12%', '37668.0000', 14, NULL, NULL, '2019-08-15 03:54:47', '2019-08-15 03:54:47'),
(8, 'MI00004', '5341316684684151', '55555.5600', '0.0000', '100.0000', '12%', '666666.7200', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(9, 'MI00005', '5341316684684151', '86981.0000', '0.0000', '100.0000', '12%', '1043772.0000', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(10, 'MP00002', '5341316684684151', '90000.0000', '0.0000', '100.0000', '12%', '1080000.0000', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(11, 'MI00006', '5341316684684151', '13600.0000', '0.0000', '100.0000', '12%', '163200.0000', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(12, 'MI00007', '5341316684684151', '500.0000', '0.0000', '100.0000', '12%', '6000.0000', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(13, 'MI00025', '5341316684684151', '2000.0000', '0.0000', '100.0000', '12%', '24000.0000', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(14, 'MP00003', '5341316684684151', '30000.0000', '0.0000', '100.0000', '12%', '360000.0000', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(15, 'MP00010', '5341316684684151', '2500.0000', '0.0000', '100.0000', '12%', '30000.0000', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(16, 'MP00009', '5341316684684151', '4500.0000', '0.0000', '100.0000', '12%', '54000.0000', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(17, 'MP00008', '5341316684684151', '6000.0000', '0.0000', '100.0000', '12%', '72000.0000', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(18, 'MI00022', '5341316684684151', '1000.0000', '0.0000', '100.0000', '12%', '12000.0000', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(19, 'MI00023', '5341316684684151', '2875.0000', '0.0000', '100.0000', '12%', '34500.0000', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(20, 'MP00004', '5341316684684151', '50000.0000', '0.0000', '100.0000', '12%', '600000.0000', 14, NULL, NULL, '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(21, 'MI00015', '5341316684684151', '2500.0000', '0.0000', '100.0000', '12%', '30000.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(22, 'MI00013', '5341316684684151', '3000.0000', '0.0000', '100.0000', '12%', '36000.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(23, 'MP00011', '5341316684684151', '0.0000', '0.0000', '100.0000', '12%', '0.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(24, 'MI00024', '5341316684684151', '2000.0000', '0.0000', '100.0000', '12%', '24000.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(25, 'MP00029', '5341316684684151', '76000.0000', '0.0000', '100.0000', '12%', '912000.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(26, 'MI00030', '5341316684684151', '3800000.0000', '0.0000', '100.0000', '12%', '45600000.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(27, 'MP00007', '5341316684684151', '9550.0000', '0.0000', '100.0000', '12%', '114600.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(28, 'MI00018', '5341316684684151', '1000.0000', '0.0000', '100.0000', '12%', '12000.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(29, 'MI00027', '5341316684684151', '10000.0000', '0.0000', '100.0000', '12%', '120000.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(30, 'MI00014', '5341316684684151', '1000.0000', '0.0000', '100.0000', '12%', '12000.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(31, 'MI00011', '5341316684684151', '10000.0000', '0.0000', '100.0000', '12%', '120000.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(32, 'MI00016', '5341316684684151', '157000.0000', '0.0000', '100.0000', '12%', '1884000.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(33, 'MI00019', '5341316684684151', '661.5000', '0.0000', '100.0000', '12%', '7938.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(34, 'MP00012', '5341316684684151', '100000.0000', '0.0000', '100.0000', '12%', '1200000.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(35, 'MP00005', '5341316684684151', '6000.0000', '0.0000', '100.0000', '12%', '72000.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(36, 'MI00017', '5341316684684151', '7700.0000', '0.0000', '100.0000', '12%', '92400.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(37, 'MP00006', '5341316684684151', '6400.0000', '0.0000', '100.0000', '12%', '76800.0000', 14, NULL, NULL, '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(38, 'MI00000', NULL, NULL, '100.0000', '50.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-04', '2019-08-15 03:58:42', '2019-08-15 03:58:42'),
(39, 'MI00001', NULL, NULL, '100.0000', '40.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-04', '2019-08-15 03:58:42', '2019-08-15 03:58:42'),
(40, 'MI00002', NULL, NULL, '100.0000', '20.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-08-04', '2019-08-15 03:59:02', '2019-08-15 03:59:02'),
(41, 'MP00000', NULL, NULL, '100.0000', '0.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-08-04', '2019-08-15 03:59:02', '2019-08-15 03:59:02'),
(42, 'MI00013', '2323232323232323', '3000.0000', '100.0000', '300.0000', '12%', '72000.0000', 15, NULL, NULL, '2019-08-15 04:01:25', '2019-08-15 04:01:25'),
(43, 'MI00015', '2323232323232323', '2500.0000', '100.0000', '300.0000', '12%', '60000.0000', 15, NULL, NULL, '2019-08-15 04:01:25', '2019-08-15 04:01:25'),
(44, 'MI00014', '2323232323232323', '1000.0000', '100.0000', '300.0000', '12%', '24000.0000', 15, NULL, NULL, '2019-08-15 04:01:25', '2019-08-15 04:01:25'),
(45, 'MI00019', '47563847564', '661.5000', '100.0000', '200.0000', '12%', '7938.0000', 16, NULL, NULL, '2019-08-15 04:05:11', '2019-08-15 04:05:11'),
(46, 'MI00013', NULL, NULL, '300.0000', '150.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-08-04', '2019-08-15 04:05:34', '2019-08-15 04:05:34'),
(47, 'MI00019', NULL, NULL, '200.0000', '50.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-08-04', '2019-08-15 04:05:35', '2019-08-15 04:05:35'),
(48, 'MI00014', NULL, NULL, '300.0000', '150.0000', NULL, NULL, NULL, 'Producción de Producto terminado ejemplo', '2019-08-04', '2019-08-15 04:05:35', '2019-08-15 04:05:35'),
(49, 'MI00027', NULL, NULL, '100.0000', '0.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-08-04', '2019-08-15 04:08:33', '2019-08-15 04:08:33'),
(50, 'MI00007', NULL, NULL, '100.0000', '88.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-08-04', '2019-08-15 04:08:34', '2019-08-15 04:08:34'),
(51, 'MI00000', '4546768678343243', '31000.0000', '50.0000', '150.0000', '12%', '372000.0000', 17, NULL, NULL, '2019-08-15 04:32:19', '2019-08-15 04:32:19'),
(52, 'MI00001', '4546768678343243', '500000.0000', '40.0000', '165.0000', '12%', '7500000.0000', 17, NULL, NULL, '2019-08-15 04:32:19', '2019-08-15 04:32:19'),
(53, 'MI00002', '4546768678343243', '9000.0000', '20.0000', '170.0000', '12%', '162000.0000', 17, NULL, NULL, '2019-08-15 04:32:19', '2019-08-15 04:32:19'),
(54, 'MP00000', '4546768678343243', '46000.0000', '0.0000', '175.0000', '12%', '966000.0000', 17, NULL, NULL, '2019-08-15 04:32:20', '2019-08-15 04:32:20'),
(55, 'MI00019', '4546768678343243', '661.5000', '50.0000', '150.0000', '12%', '7938.0000', 17, NULL, NULL, '2019-08-15 04:32:20', '2019-08-15 04:32:20'),
(56, 'MI00027', '4546768678343243', '10000.0000', '0.0000', '100.0000', '12%', '120000.0000', 17, NULL, NULL, '2019-08-15 04:32:20', '2019-08-15 04:32:20'),
(57, 'MI00000', NULL, NULL, '150.0000', '145.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-05', '2019-08-17 22:37:59', '2019-08-17 22:37:59'),
(58, 'MI00001', NULL, NULL, '165.0000', '159.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-05', '2019-08-17 22:37:59', '2019-08-17 22:37:59'),
(59, 'MI00000', '4756384756443242', '31000.0000', '145.0000', '155.0000', '12%', '37200.0000', 18, NULL, NULL, '2019-08-18 20:14:39', '2019-08-18 20:14:39'),
(60, 'MI00001', '4756384756443242', '500000.0000', '159.0000', '170.0000', '12%', '660000.0000', 18, NULL, NULL, '2019-08-18 20:14:39', '2019-08-18 20:14:39'),
(61, 'MI00002', '4756384756443242', '9000.0000', '170.0000', '182.0000', '12%', '12960.0000', 18, NULL, NULL, '2019-08-18 20:14:40', '2019-08-18 20:14:40'),
(62, 'MP00000', '4756384756443242', '46000.0000', '175.0000', '188.0000', '12%', '71760.0000', 18, NULL, NULL, '2019-08-18 20:14:40', '2019-08-18 20:14:40'),
(63, 'MI00000', NULL, NULL, '155.0000', '150.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-06', '2019-08-18 21:42:23', '2019-08-18 21:42:23'),
(64, 'MI00001', NULL, NULL, '170.0000', '164.0000', NULL, NULL, NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-06', '2019-08-18 21:42:24', '2019-08-18 21:42:24'),
(65, 'MP00000', NULL, NULL, '188.0000', '184.5000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-08-06', '2019-08-19 00:43:42', '2019-08-19 00:43:42'),
(66, 'MP00003', NULL, NULL, '100.0000', '98.0000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-08-06', '2019-08-19 00:43:42', '2019-08-19 00:43:42'),
(67, 'MP00010', NULL, NULL, '100.0000', '97.5000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-08-06', '2019-08-19 00:43:42', '2019-08-19 00:43:42'),
(68, 'MP00009', NULL, NULL, '100.0000', '97.5000', NULL, NULL, NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-08-06', '2019-08-19 00:43:42', '2019-08-19 00:43:42'),
(69, 'MP00008', NULL, NULL, '100.0000', '96.5000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-08-06', '2019-08-19 00:43:56', '2019-08-19 00:43:56'),
(70, 'MP00005', NULL, NULL, '100.0000', '97.5000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-08-06', '2019-08-19 00:43:56', '2019-08-19 00:43:56'),
(71, 'MP00006', NULL, NULL, '100.0000', '97.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-08-06', '2019-08-19 00:43:56', '2019-08-19 00:43:56'),
(72, 'MP00007', NULL, NULL, '100.0000', '99.0000', NULL, NULL, NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-08-06', '2019-08-19 00:43:56', '2019-08-19 00:43:56'),
(73, 'MI00024', NULL, NULL, '100.0000', '96.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:19', '2019-08-19 00:48:19'),
(74, 'MI00022', NULL, NULL, '100.0000', '99.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:19', '2019-08-19 00:48:19'),
(75, 'MI00023', NULL, NULL, '100.0000', '99.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:19', '2019-08-19 00:48:19'),
(76, 'MI00003', NULL, NULL, '100.0000', '100.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(77, 'MI00025', NULL, NULL, '100.0000', '100.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(78, 'MI00019', NULL, NULL, '150.0000', '130.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(79, 'MI00013', NULL, NULL, '150.0000', '130.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(80, 'MI00005', NULL, NULL, '100.0000', '94.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(81, 'MI00000', NULL, NULL, '150.0000', '149.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(82, 'MI00001', NULL, NULL, '164.0000', '163.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(83, 'MI00016', NULL, NULL, '100.0000', '99.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(84, 'MI00006', NULL, NULL, '100.0000', '99.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(85, 'MI00011', NULL, NULL, '100.0000', '99.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(86, 'MI00017', NULL, NULL, '100.0000', '99.4000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(87, 'MI00018', NULL, NULL, '100.0000', '99.0000', NULL, NULL, NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-06', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(88, 'MI00027', NULL, NULL, '100.0000', '80.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-08-06', '2019-08-19 00:49:45', '2019-08-19 00:49:45'),
(89, 'MI00007', NULL, NULL, '88.0000', '86.0000', NULL, NULL, NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-08-06', '2019-08-19 00:49:45', '2019-08-19 00:49:45'),
(90, 'MI00027', NULL, NULL, '80.0000', '60.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-08-06', '2019-08-19 00:52:01', '2019-08-19 00:52:01'),
(91, 'MI00007', NULL, NULL, '86.0000', '84.0000', NULL, NULL, NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-08-06', '2019-08-19 00:52:02', '2019-08-19 00:52:02');

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
(1, 'C00000', 'cliente 1', 'J-37824623-7', 'askjdhsakd', 'dajkshdjas asudhsaudh ', 'sdjjkhfjksd', '4144000.0000', '2018-01-11 20:34:13', '2019-08-18 18:56:23'),
(2, 'C00001', 'cliente dos', 'J-62626512-9', 'Centro Av.5 con Calle 15, Edif. Juan Ramos, Local 2', '04169856865', 'Contado', '0.0000', '2019-04-05 03:40:45', '2019-08-11 14:45:35'),
(3, 'C00002', 'cliente tres', 'J-62626512-6', 'Centro Av.5 con Calle 15, Edif. Juan Ramos, Local 2', '04169856865', 'Contado', '0.0000', '2019-05-25 05:47:46', '2019-08-11 14:45:54'),
(4, 'C00003', 'Client four', 'J-26845642-3', 'Mérida, edo. Mérida, Centro, Calle 20, Edificio Crisostomo, Local 3', '0274-3645364', 'Crédito', '0.0000', '2019-06-07 19:16:14', '2019-08-11 14:46:09'),
(5, 'C00004', 'cliente 1', 'J-62626123-9', 'Mérida, edo. Mérida, Centro, Calle 20, Edificio Crisostomo, Local 3', '04169856865', 'Contado', '0.0000', '2019-06-18 11:28:23', '2019-08-11 14:46:47'),
(6, 'C00005', 'Cliente de prueba', 'J-45757434-2', 'Centro Av.5 con Calle 21, Edif. Los Rios, Local 2', '0274-5546556', 'Contado', '0.0000', '2019-08-18 19:11:03', '2019-08-18 19:11:03');

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
(14, '5341316684684151', 'P00000', '2019-08-04 04:00:00', '686723750.7200', 'credito', NULL, 1, '2019-08-15 03:54:46', '2019-08-15 03:54:46'),
(15, '2323232323232323', 'P00003', '2019-08-04 04:00:00', '1456000.0000', 'contado', NULL, 1, '2019-08-15 04:01:24', '2019-08-15 04:01:24'),
(16, '47563847564', 'P00007', '2019-08-04 04:00:00', '74088.0000', 'contado', NULL, 1, '2019-08-15 04:05:11', '2019-08-15 04:05:11'),
(17, '4546768678343243', 'P00007', '2019-08-05 04:00:00', '85194088.0000', 'credito', NULL, 1, '2019-08-15 04:32:19', '2019-08-15 04:32:19'),
(18, '4756384756443242', 'P00003', '2019-08-05 04:00:00', '7297920.0000', 'credito', NULL, 1, '2019-08-18 20:14:39', '2019-08-18 20:14:39');

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
-- Estructura de tabla para la tabla `costoshijos`
--

CREATE TABLE `costoshijos` (
  `id` int(11) NOT NULL,
  `id_produccion` int(10) UNSIGNED NOT NULL,
  `id_hijo` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `costoshijos`
--

INSERT INTO `costoshijos` (`id`, `id_produccion`, `id_hijo`, `created_at`, `updated_at`) VALUES
(10, 30, 27, '2019-08-15 04:05:34', '2019-08-15 04:05:34'),
(11, 30, 26, '2019-08-15 04:05:34', '2019-08-15 04:05:34'),
(12, 32, 30, '2019-08-15 04:08:33', '2019-08-15 04:08:33'),
(13, 42, 39, '2019-08-19 00:48:19', '2019-08-19 00:48:19'),
(14, 42, 38, '2019-08-19 00:48:19', '2019-08-19 00:48:19'),
(15, 44, 30, '2019-08-19 00:49:45', '2019-08-19 00:49:45'),
(16, 46, 42, '2019-08-19 00:52:01', '2019-08-19 00:52:01');

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
(1, 'C00000', '784000.0000', 'Venta de factura 1000 de fecha 2019-08-04', 2, 1, '', NULL, '2019-08-15 04:10:32', '2019-08-15 04:15:12'),
(2, 'C00000', '784000.0000', 'Cobro de deuda - Cancelación de deuda', NULL, NULL, 'Caja Chica', '2019-08-04 04:00:00', '2019-08-15 04:15:12', '2019-08-15 04:15:12'),
(3, 'C00000', '3360000.0000', 'Venta de factura 1001 de fecha 2019-08-05', 3, NULL, '', NULL, '2019-08-18 18:56:23', '2019-08-18 18:56:23'),
(4, 'C00000', '360000.0000', 'Cobro de deuda - Cobro parcial de la deuda', NULL, NULL, 'Caja Chica', '2019-08-05 04:00:00', '2019-08-18 19:50:11', '2019-08-18 19:50:11');

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
(9, 'P00000', '686723750.7200', 'Compra a crédito bajo factura: 5341316684684151 de fecha 2019-08-04', 14, NULL, NULL, NULL, '2019-08-15 03:54:47', '2019-08-15 03:54:47'),
(10, 'P00000', '6723750.7200', 'Pago de deuda - Pago parcial de deuda', NULL, NULL, NULL, '2019-08-04 04:00:00', '2019-08-15 03:56:36', '2019-08-15 03:56:36'),
(11, 'P00000', '10000000.0000', 'Pago de deuda - Pago parcial de deuda', NULL, 'Banco Banesco', NULL, '2019-08-04 04:00:00', '2019-08-15 03:57:27', '2019-08-15 03:57:27'),
(12, 'P00007', '85194088.0000', 'Compra a crédito bajo factura: 4546768678343243 de fecha 2019-08-05', 17, NULL, NULL, NULL, '2019-08-15 04:32:19', '2019-08-15 04:32:19'),
(13, 'P00000', '6700000.0000', 'Pago de deuda - Pago parcial de deuda', NULL, NULL, NULL, '2019-08-05 04:00:00', '2019-08-18 18:51:39', '2019-08-18 18:51:39'),
(14, 'P00003', '7297920.0000', 'Compra a crédito bajo factura: 4756384756443242 de fecha 2019-08-05', 18, NULL, NULL, NULL, '2019-08-18 20:14:39', '2019-08-18 20:14:39');

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
(3, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'ANTIPASTO ATÚN (FRASCO 470G)', 42, 20, '2018-03-23 17:31:56', '2019-08-19 00:52:01'),
(4, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PICADO BLANDO ANTIPASTO (kilo)', 38, 10, '2019-02-14 10:39:00', '2019-08-19 00:48:19'),
(5, 'ANTIPASTO ATÚN (FRASCO 470G)', 'PICADO DURO ANTIPASTO (kilo)', 39, 10, '2019-02-14 10:39:16', '2019-08-19 00:48:19'),
(10, 'Producto Ejemplo Presentación 12 Unid.', 'Producto terminado ejemplo', 30, 20, '2019-06-02 00:33:02', '2019-08-19 00:49:44'),
(25, 'Producto terminado ejemplo', 'Producto Semiprocesado Ejemplo 2', 27, 75, '2019-06-15 18:35:43', '2019-08-18 21:02:24'),
(26, 'Producto terminado ejemplo', 'Producto Semiprocesado Ejemplo 1', 34, 75, '2019-06-15 18:35:46', '2019-08-18 21:02:24');

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
(1, 'Gas', '% sobre Bombona', '800.0000', 'Costo especulativo', '2019-08-10', '2019-06-01 04:53:12', '2019-08-10 04:35:18'),
(2, 'Agua', 'Unid. Estándar', '0.0500', '', NULL, '2019-06-01 04:55:21', '2019-06-01 04:55:21'),
(3, 'Electricidad', 'KW/Hr', '0.0009', '', '2019-06-01', '2019-06-01 04:59:38', '2019-06-01 05:02:03');

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
(16, '2019-08-04', 'Producto terminado ejemplo', 'Gas', '15.0000', '2019-08-15 04:05:35', '2019-08-15 04:05:35'),
(17, '2019-08-04', 'Producto terminado ejemplo', 'Agua', '75.0000', '2019-08-15 04:05:35', '2019-08-15 04:05:35'),
(18, '2019-08-04', 'Producto terminado ejemplo', 'Electricidad', '150.0000', '2019-08-15 04:05:35', '2019-08-15 04:05:35'),
(19, '2019-08-04', 'Producto Ejemplo Presentación 12 Unid.', 'Electricidad', '24.0000', '2019-08-15 04:08:34', '2019-08-15 04:08:34'),
(20, '2019-08-06', 'PICADO BLANDO ANTIPASTO (kilo)', 'Agua', '10.0000', '2019-08-19 00:43:42', '2019-08-19 00:43:42'),
(21, '2019-08-06', 'PICADO DURO ANTIPASTO (kilo)', 'Agua', '10.0000', '2019-08-19 00:43:56', '2019-08-19 00:43:56'),
(22, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'Agua', '10.0000', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(23, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'Electricidad', '800.0000', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(24, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'Gas', '5.0000', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(25, '2019-08-06', 'Producto Ejemplo Presentación 12 Unid.', 'Electricidad', '4.0000', '2019-08-19 00:49:45', '2019-08-19 00:49:45');

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
(78, 'MI00000', '149.0000', '2019-08-15 03:54:47', '2019-08-19 00:48:20'),
(79, 'MI00001', '163.0000', '2019-08-15 03:54:47', '2019-08-19 00:48:20'),
(80, 'MI00002', '182.0000', '2019-08-15 03:54:47', '2019-08-18 20:14:40'),
(81, 'MP00000', '184.5000', '2019-08-15 03:54:47', '2019-08-19 00:43:42'),
(82, 'MP00001', '100.0000', '2019-08-15 03:54:47', '2019-08-15 03:54:47'),
(83, 'MI00026', '100.0000', '2019-08-15 03:54:47', '2019-08-15 03:54:47'),
(84, 'MI00003', '100.0000', '2019-08-15 03:54:47', '2019-08-19 00:48:20'),
(85, 'MI00004', '100.0000', '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(86, 'MI00005', '94.0000', '2019-08-15 03:54:48', '2019-08-19 00:48:20'),
(87, 'MP00002', '100.0000', '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(88, 'MI00006', '99.0000', '2019-08-15 03:54:48', '2019-08-19 00:48:21'),
(89, 'MI00007', '84.0000', '2019-08-15 03:54:48', '2019-08-19 00:52:02'),
(90, 'MI00025', '100.0000', '2019-08-15 03:54:48', '2019-08-19 00:48:20'),
(91, 'MP00003', '98.0000', '2019-08-15 03:54:48', '2019-08-19 00:43:42'),
(92, 'MP00010', '97.5000', '2019-08-15 03:54:48', '2019-08-19 00:43:42'),
(93, 'MP00009', '97.5000', '2019-08-15 03:54:48', '2019-08-19 00:43:42'),
(94, 'MP00008', '96.5000', '2019-08-15 03:54:48', '2019-08-19 00:43:56'),
(95, 'MI00022', '99.0000', '2019-08-15 03:54:48', '2019-08-19 00:48:19'),
(96, 'MI00023', '99.0000', '2019-08-15 03:54:48', '2019-08-19 00:48:19'),
(97, 'MP00004', '100.0000', '2019-08-15 03:54:48', '2019-08-15 03:54:48'),
(98, 'MI00015', '300.0000', '2019-08-15 03:54:48', '2019-08-15 04:01:25'),
(99, 'MI00013', '130.0000', '2019-08-15 03:54:49', '2019-08-19 00:48:20'),
(100, 'MP00011', '100.0000', '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(101, 'MI00024', '96.0000', '2019-08-15 03:54:49', '2019-08-19 00:48:19'),
(102, 'MP00029', '100.0000', '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(103, 'MI00030', '100.0000', '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(104, 'MP00007', '99.0000', '2019-08-15 03:54:49', '2019-08-19 00:43:56'),
(105, 'MI00018', '99.0000', '2019-08-15 03:54:49', '2019-08-19 00:48:21'),
(106, 'MI00027', '60.0000', '2019-08-15 03:54:49', '2019-08-19 00:52:02'),
(107, 'MI00014', '150.0000', '2019-08-15 03:54:49', '2019-08-15 04:05:35'),
(108, 'MI00011', '99.0000', '2019-08-15 03:54:49', '2019-08-19 00:48:21'),
(109, 'MI00016', '99.0000', '2019-08-15 03:54:49', '2019-08-19 00:48:21'),
(110, 'MI00019', '130.0000', '2019-08-15 03:54:49', '2019-08-19 00:48:20'),
(111, 'MP00012', '100.0000', '2019-08-15 03:54:49', '2019-08-15 03:54:49'),
(112, 'MP00005', '97.5000', '2019-08-15 03:54:49', '2019-08-19 00:43:56'),
(113, 'MI00017', '99.4000', '2019-08-15 03:54:49', '2019-08-19 00:48:21'),
(114, 'MP00006', '97.0000', '2019-08-15 03:54:49', '2019-08-19 00:43:56');

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
  `std_x_frasco` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `miscelaneos`
--

INSERT INTO `miscelaneos` (`id`, `std_x_frasco`, `created_at`, `updated_at`) VALUES
(1, '480.47', '2017-10-11 04:00:00', '2017-11-07 01:13:15');

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
(100, 'MP00000', 'AJOPORRO', 'KILO', '46000.0000', 'ACTUALIZADO AL 29/11/2018', '2019-08-13 04:03:01', '2017-12-03 02:24:43', '2019-08-13 04:03:01'),
(101, 'MI00002', 'ÁCIDO CÍTRICO', 'KILO', '9000.0000', 'ACTUALIZADO AL 22/02/2019', NULL, '2017-12-03 02:26:53', '2019-07-31 01:30:14'),
(102, 'MP00001', 'ALBAHACA', 'KILO', '4000.0000', 'ACTUALIZADO AL 29/11/2018', NULL, '2017-12-03 02:35:18', '2019-07-31 01:29:14'),
(103, 'MI00003', 'ALCOHOL', 'LITRO', '3139.0000', 'ACTUALIZADO AL 25/01/2019', NULL, '2017-12-03 02:39:43', '2019-07-31 01:29:28'),
(104, 'MI00004', 'ALMIDÓN DE MAÍZ (MAICINA) ', 'KILO', '55555.5600', 'ACTUALIZADO AL 29/11/2018', NULL, '2017-12-03 02:43:57', '2019-07-31 01:29:35'),
(105, 'MI00005', 'ATÚN ENLATADO', 'KILO', '86981.0000', 'ACTUALIZADO AL 29/11/2018', NULL, '2017-12-03 21:19:18', '2019-07-31 01:29:40'),
(106, 'MP00002', 'ATÚN FRESCO', 'KILO', '90000.0000', '', '2019-08-14 23:39:22', '2017-12-03 21:22:12', '2019-08-14 23:39:22'),
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
(128, 'MI00030', 'PECTINA', 'KILO', '3800000.0000', 'Segunda corrección', NULL, '2017-12-12 19:18:40', '2019-08-14 23:43:29'),
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
  `pro_concepto` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id`, `pro_fecha`, `rec_nombre`, `pro_etapa`, `pro_produccion`, `pro_disponible`, `pro_costo`, `pro_mano_obra`, `pro_lote`, `pro_concepto`, `created_at`, `updated_at`) VALUES
(26, '2019-08-04', 'Producto Semiprocesado Ejemplo 1', 'PA', '100.0000', '100.0000', '315658.9033', '2.0000', NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-15 03:58:42', '2019-08-15 03:58:43'),
(27, '2019-08-04', 'Producto Semiprocesado Ejemplo 2', 'PA', '200.0000', '200.0000', '26719.1775', '3.0000', NULL, 'Producción de Producto Semiprocesado Ejemplo 2', '2019-08-15 03:59:02', '2019-08-15 03:59:02'),
(28, '2019-08-04', 'Producto Semiprocesado Ejemplo 2', 'PA', '75.0000', '125.0000', NULL, '3.0000', NULL, 'Producción de Producto terminado ejemplo', '2019-08-15 04:05:34', '2019-08-15 04:05:34'),
(29, '2019-08-04', 'Producto Semiprocesado Ejemplo 1', 'PA', '75.0000', '25.0000', NULL, '2.0000', NULL, 'Producción de Producto terminado ejemplo', '2019-08-15 04:05:34', '2019-08-15 04:05:34'),
(30, '2019-08-04', 'Producto terminado ejemplo', 'PB', '150.0000', '150.0000', '176675.8752', '5.0000', 1, 'Producción de Producto terminado ejemplo', '2019-08-15 04:05:34', '2019-08-15 04:05:35'),
(31, '2019-08-04', 'Producto terminado ejemplo', 'PB', '12.0000', '138.0000', NULL, '5.0000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-08-15 04:08:31', '2019-08-15 04:08:31'),
(32, '2019-08-04', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '12.0000', '12.0000', '261833.4048', '2.0000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-08-15 04:08:33', '2019-08-15 19:14:55'),
(33, '2019-08-04', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '2.0000', '10.0000', NULL, '0.0000', NULL, 'Venta bajo factura: 1000 de fecha 2019-08-04', '2019-08-15 04:10:31', '2019-08-15 04:10:31'),
(34, '2019-08-05', 'Producto Semiprocesado Ejemplo 1', 'PA', '10.0000', '35.0000', '317589.0333', '2.0000', NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-17 22:37:59', '2019-08-18 16:16:14'),
(35, '2019-08-05', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '1.0000', '9.0000', NULL, '0.0000', NULL, 'Venta bajo factura: 1001 de fecha 2019-08-05', '2019-08-18 18:56:22', '2019-08-18 18:56:22'),
(36, '2019-08-05', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '2.0000', '7.0000', NULL, '0.0000', NULL, 'Venta bajo factura: 1002 de fecha 2019-08-05', '2019-08-18 20:39:24', '2019-08-18 20:39:24'),
(37, '2019-08-06', 'Producto Semiprocesado Ejemplo 1', 'PA', '10.0000', '45.0000', '317589.0333', '2.0000', NULL, 'Producción de Producto Semiprocesado Ejemplo 1', '2019-08-18 21:42:23', '2019-08-18 23:41:05'),
(38, '2019-08-06', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', '10.0000', '10.0000', '25939.0833', '2.0000', NULL, 'Producción de PICADO BLANDO ANTIPASTO (kilo)', '2019-08-19 00:43:41', '2019-08-19 00:43:43'),
(39, '2019-08-06', 'PICADO DURO ANTIPASTO (kilo)', 'PA', '10.0000', '10.0000', '8564.0833', '2.0000', NULL, 'Producción de PICADO DURO ANTIPASTO (kilo)', '2019-08-19 00:43:56', '2019-08-19 00:43:56'),
(40, '2019-08-06', 'PICADO BLANDO ANTIPASTO (kilo)', 'PA', '10.0000', '0.0000', NULL, '2.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-19 00:48:18', '2019-08-19 00:48:18'),
(41, '2019-08-06', 'PICADO DURO ANTIPASTO (kilo)', 'PA', '10.0000', '0.0000', NULL, '2.0000', NULL, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-19 00:48:19', '2019-08-19 00:48:19'),
(42, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', '20.0000', '20.0000', '86231.6976', '4.0000', 1, 'Producción de ANTIPASTO ATÚN (FRASCO 470G)', '2019-08-19 00:48:19', '2019-08-19 00:48:22'),
(43, '2019-08-06', 'Producto terminado ejemplo', 'PB', '20.0000', '118.0000', NULL, '5.0000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-08-19 00:49:44', '2019-08-19 00:49:44'),
(44, '2019-08-06', 'Producto Ejemplo Presentación 12 Unid.', 'PC', '2.0000', '9.0000', '1877703.9205', '2.0000', NULL, 'Producción de Producto Ejemplo Presentación 12 Unid.', '2019-08-19 00:49:45', '2019-08-19 00:49:45'),
(45, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PB', '20.0000', '0.0000', NULL, '4.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-08-19 00:52:01', '2019-08-19 00:52:01'),
(46, '2019-08-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PC', '2.0000', '2.0000', '973262.1427', '2.0000', NULL, 'Producción de ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2019-08-19 00:52:01', '2019-08-19 00:52:02');

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
(7, 'Producto Semiprocesado Ejemplo 1', '45.0000', '2019-08-15 03:58:42', '2019-08-18 21:42:23'),
(8, 'Producto Semiprocesado Ejemplo 2', '125.0000', '2019-08-15 03:59:02', '2019-08-15 04:05:34'),
(9, 'PICADO BLANDO ANTIPASTO (kilo)', '0.0000', '2019-08-19 00:43:41', '2019-08-19 00:48:18'),
(10, 'PICADO DURO ANTIPASTO (kilo)', '0.0000', '2019-08-19 00:43:56', '2019-08-19 00:48:18');

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
(4, 'Producto terminado ejemplo', '118.0000', '2019-08-15 04:05:34', '2019-08-19 00:49:44'),
(5, 'ANTIPASTO ATÚN (FRASCO 470G)', '0.0000', '2019-08-19 00:48:19', '2019-08-19 00:52:01');

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
(4, 'Producto Ejemplo Presentación 12 Unid.', '9.0000', '2019-08-15 04:08:32', '2019-08-19 00:49:45'),
(5, 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', '2.0000', '2019-08-19 00:52:01', '2019-08-19 00:52:01');

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
(2, 'P00000', 'Proveedor', 'J-00000000-0', 'ashda', 'sajhda', 'asjdhas', 0, '686723750.7200', 'credito', '2017-12-04 22:57:53', '2019-08-15 03:54:47'),
(3, 'P00002', 'segundo proveedor', 'J-00000001-0', 'hsgdha', 'hasgdhasg', 'ahsdgas', 0, '0.0000', 'contado', '2017-12-12 19:14:19', '2019-08-09 20:26:06'),
(4, 'P00003', 'proveedor cinco', 'j-23345567-2', 'la calle', 'ramón', '15 dias', 0, '7297920.0000', 'contado', '2017-12-24 18:40:01', '2019-08-18 20:14:39'),
(5, 'P00004', 'pablo iglesia', 'j-33333333-3', 'san pablo', 'pablo', 'ninguna', 0, '0.0000', 'contado', '2017-12-30 18:26:26', '2019-08-10 03:15:03'),
(6, 'P00005', 'pepe', 'J-00000004-0', 'dirección de pepe', 'pepe', 'pepe condithion', 0, '0.0000', 'credito', '2018-01-11 20:08:54', '2019-08-09 20:26:25'),
(7, 'P00006', 'GATO', 'J-00000005-0', 'DIRECCION GATO', 'SR GATO', '123', 0, '0.0000', 'credito', '2018-01-11 23:11:57', '2019-08-10 03:37:43'),
(8, 'P00001', 'Repartos Orientales', 'J-00000006-0', 'El junquito, kilometro 12, galpón 312', '0414-1452263', '', 0, '0.0000', 'contado', '2019-04-05 03:28:33', '2019-08-09 20:26:51'),
(9, 'P00007', 'septimo proveedor', 'J-00000007-0', 'asjhdajh ausdhsahdas sdjsahdjashd', '04143767273', '', 0, '85194088.0000', 'contado', '2019-04-05 07:17:55', '2019-08-15 04:32:19'),
(10, 'P00008', 'Proveedor Ocho', 'J-00000008-0', 'askhdaushda', '4857438534', '', 0, '0.0000', 'contado', '2019-06-07 18:35:51', '2019-08-09 20:27:13'),
(11, 'P00009', 'Ninth supplier', 'J-00000009-0', 'ajsdahs ashdghasdg asdhgsahdas', '04247437423', 'ashdsada', 0, '0.0000', 'contado', '2019-07-31 03:31:59', '2019-08-10 00:06:44'),
(12, 'P00010', 'Los Andinos', 'J-48544543-3', 'Mérida, edo. Mérida, Centro, Calle 4, Edificio Ruices, Local 03-04', '0274-5642613', '', 0, '0.0000', 'contado', '2019-08-18 18:11:25', '2019-08-18 18:11:25');

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
(19, 'Producto Semiprocesado Ejemplo 1', 'si', 'PA', 'Kilos', '2019-06-07 19:45:39', '2019-08-18 21:26:35');

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
  `req_costo` decimal(25,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requerimientos`
--

INSERT INTO `requerimientos` (`id`, `req_fecha`, `rec_nombre`, `req_ingrediente`, `req_total`, `req_costo`, `created_at`, `updated_at`) VALUES
(54, '2019-08-04', 'Producto Semiprocesado Ejemplo 1', 'ACEITE', '50.0000', '31000.0000', '2019-08-15 03:58:42', '2019-08-15 03:58:42'),
(55, '2019-08-04', 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', '60.0000', '500000.0000', '2019-08-15 03:58:42', '2019-08-15 03:58:42'),
(56, '2019-08-04', 'Producto Semiprocesado Ejemplo 2', 'ÁCIDO CÍTRICO', '80.0000', '9000.0000', '2019-08-15 03:59:02', '2019-08-15 03:59:02'),
(57, '2019-08-04', 'Producto Semiprocesado Ejemplo 2', 'AJOPORRO', '100.0000', '46000.0000', '2019-08-15 03:59:02', '2019-08-15 03:59:02'),
(58, '2019-08-04', 'Producto terminado ejemplo', 'FRASCO 500CC', '150.0000', '3000.0000', '2019-08-15 04:05:34', '2019-08-15 04:05:34'),
(59, '2019-08-04', 'Producto terminado ejemplo', 'TAPA 63mm, 500cc, TWIST BLANCA', '150.0000', '661.5000', '2019-08-15 04:05:34', '2019-08-15 04:05:34'),
(60, '2019-08-04', 'Producto terminado ejemplo', 'PRESINTO FRASCO 500cc', '150.0000', '1000.0000', '2019-08-15 04:05:35', '2019-08-15 04:05:35'),
(61, '2019-08-04', 'Producto Ejemplo Presentación 12 Unid.', 'PLASTICO TERMOENCOJIBLE', '100.0000', '10000.0000', '2019-08-15 04:08:33', '2019-08-15 04:08:33'),
(62, '2019-08-04', 'Producto Ejemplo Presentación 12 Unid.', 'BANDEJA CARTÓN 12x500cc', '12.0000', '500.0000', '2019-08-15 04:08:34', '2019-08-15 04:08:34'),
(63, '2019-08-05', 'Producto Semiprocesado Ejemplo 1', 'ACEITE', '5.0000', '31000.0000', '2019-08-17 22:37:59', '2019-08-17 22:37:59'),
(64, '2019-08-05', 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', '6.0000', '500000.0000', '2019-08-17 22:37:59', '2019-08-17 22:37:59'),
(65, '2019-08-06', 'Producto Semiprocesado Ejemplo 1', 'ACEITE', '5.0000', '31000.0000', '2019-08-18 21:42:23', '2019-08-18 21:42:23'),
(66, '2019-08-06', 'Producto Semiprocesado Ejemplo 1', 'ACEITUNAS', '6.0000', '500000.0000', '2019-08-18 21:42:24', '2019-08-18 21:42:24'),
(67, '2019-08-06', 'PICADO BLANDO ANTIPASTO (kilo)', 'AJOPORRO', '3.5000', '46000.0000', '2019-08-19 00:43:41', '2019-08-19 00:43:41'),
(68, '2019-08-06', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLA', '2.0000', '30000.0000', '2019-08-19 00:43:42', '2019-08-19 00:43:42'),
(69, '2019-08-06', 'PICADO BLANDO ANTIPASTO (kilo)', 'CEBOLLÍN', '2.5000', '2500.0000', '2019-08-19 00:43:42', '2019-08-19 00:43:42'),
(70, '2019-08-06', 'PICADO BLANDO ANTIPASTO (kilo)', 'CÉLERI (APIO ESPAÑA)', '2.5000', '4500.0000', '2019-08-19 00:43:42', '2019-08-19 00:43:42'),
(71, '2019-08-06', 'PICADO DURO ANTIPASTO (kilo)', 'COLIFLOR', '3.5000', '6000.0000', '2019-08-19 00:43:56', '2019-08-19 00:43:56'),
(72, '2019-08-06', 'PICADO DURO ANTIPASTO (kilo)', 'VAINITA', '2.5000', '6000.0000', '2019-08-19 00:43:56', '2019-08-19 00:43:56'),
(73, '2019-08-06', 'PICADO DURO ANTIPASTO (kilo)', 'ZANAHORIA ', '3.0000', '6400.0000', '2019-08-19 00:43:56', '2019-08-19 00:43:56'),
(74, '2019-08-06', 'PICADO DURO ANTIPASTO (kilo)', 'PIMENTÓN', '1.0000', '9550.0000', '2019-08-19 00:43:56', '2019-08-19 00:43:56'),
(75, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'GUANTES DE LATEX REUSABLES', '4.0000', '2000.0000', '2019-08-19 00:48:19', '2019-08-19 00:48:19'),
(76, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA PISOS', '1.0000', '1000.0000', '2019-08-19 00:48:19', '2019-08-19 00:48:19'),
(77, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'DETERGENTE PARA VAJILLAS', '1.0000', '2875.0000', '2019-08-19 00:48:19', '2019-08-19 00:48:19'),
(78, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ALCOHOL', '0.0000', '3139.0000', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(79, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'BOLSA DE BASURA', '0.0000', '2000.0000', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(80, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'TAPA 63mm, 500cc, TWIST BLANCA', '20.0000', '661.5000', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(81, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'FRASCO 500CC', '20.0000', '3000.0000', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(82, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ATÚN ENLATADO', '6.0000', '86981.0000', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(83, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITE', '1.0000', '31000.0000', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(84, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'ACEITUNAS', '1.0000', '500000.0000', '2019-08-19 00:48:20', '2019-08-19 00:48:20'),
(85, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SALSA DE TOMATE', '1.0000', '157000.0000', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(86, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'AZÚCAR', '1.0000', '13600.0000', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(87, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'SAL', '1.0000', '10000.0000', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(88, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'VINAGRE', '0.6000', '7700.0000', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(89, '2019-08-06', 'ANTIPASTO ATÚN (FRASCO 470G)', 'PIMIENTA', '1.0000', '1000.0000', '2019-08-19 00:48:21', '2019-08-19 00:48:21'),
(90, '2019-08-06', 'Producto Ejemplo Presentación 12 Unid.', 'PLASTICO TERMOENCOJIBLE', '20.0000', '10000.0000', '2019-08-19 00:49:45', '2019-08-19 00:49:45'),
(91, '2019-08-06', 'Producto Ejemplo Presentación 12 Unid.', 'BANDEJA CARTÓN 12x500cc', '2.0000', '500.0000', '2019-08-19 00:49:45', '2019-08-19 00:49:45'),
(92, '2019-08-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'PLASTICO TERMOENCOJIBLE', '20.0000', '10000.0000', '2019-08-19 00:52:01', '2019-08-19 00:52:01'),
(93, '2019-08-06', 'ANTIAPSTO ATÚN 470G x 12 UNIDADES', 'BANDEJA CARTÓN 12x500cc', '2.0000', '500.0000', '2019-08-19 00:52:02', '2019-08-19 00:52:02');

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
(1, '40000.0000', 250, 30, '10445.1667', NULL, '2019-08-18 06:31:05');

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
(71, 'Caja Chica', '200000000.0000', '2019-08-01 04:00:00', '2019-08-15 03:12:23', '2019-08-15 03:12:23'),
(72, 'Banco de Venezuela', '0.0000', '2019-08-01 04:00:00', '2019-08-15 03:12:24', '2019-08-15 03:12:24'),
(73, 'Venezolano de Crédito', '0.0000', '2019-08-01 04:00:00', '2019-08-15 03:12:24', '2019-08-15 03:12:24'),
(74, 'Banco Bicentenario', '0.0000', '2019-08-01 04:00:00', '2019-08-15 03:12:24', '2019-08-15 03:12:24'),
(75, 'Banco Banesco', '0.0000', '2019-08-01 04:00:00', '2019-08-15 03:12:24', '2019-08-15 03:12:24'),
(76, 'Caja Chica', '200000000.0000', '2019-08-02 04:00:00', '2019-08-15 03:15:56', '2019-08-15 03:15:56'),
(77, 'Banco de Venezuela', '0.0000', '2019-08-02 04:00:00', '2019-08-15 03:15:56', '2019-08-15 03:15:56'),
(78, 'Venezolano de Crédito', '0.0000', '2019-08-02 04:00:00', '2019-08-15 03:15:56', '2019-08-15 03:15:56'),
(79, 'Banco Bicentenario', '0.0000', '2019-08-02 04:00:00', '2019-08-15 03:15:57', '2019-08-15 03:15:57'),
(80, 'Banco Banesco', '0.0000', '2019-08-02 04:00:00', '2019-08-15 03:15:57', '2019-08-15 03:15:57'),
(81, 'Caja Chica', '60000000.0000', '2019-08-03 04:00:00', '2019-08-15 03:22:40', '2019-08-15 03:22:40'),
(82, 'Banco de Venezuela', '50000000.0000', '2019-08-03 04:00:00', '2019-08-15 03:22:40', '2019-08-15 03:22:40'),
(83, 'Venezolano de Crédito', '20000000.0000', '2019-08-03 04:00:00', '2019-08-15 03:22:40', '2019-08-15 03:22:40'),
(84, 'Banco Bicentenario', '20000000.0000', '2019-08-03 04:00:00', '2019-08-15 03:22:41', '2019-08-15 03:22:41'),
(85, 'Banco Banesco', '50000000.0000', '2019-08-03 04:00:00', '2019-08-15 03:22:41', '2019-08-15 03:22:41'),
(86, 'Caja Chica', '52530161.2800', '2019-08-04 04:00:00', '2019-08-15 04:20:26', '2019-08-15 04:20:26'),
(87, 'Banco de Venezuela', '50000000.0000', '2019-08-04 04:00:00', '2019-08-15 04:20:26', '2019-08-15 04:20:26'),
(88, 'Venezolano de Crédito', '20000000.0000', '2019-08-04 04:00:00', '2019-08-15 04:20:26', '2019-08-15 04:20:26'),
(89, 'Banco Bicentenario', '20000000.0000', '2019-08-04 04:00:00', '2019-08-15 04:20:27', '2019-08-15 04:20:27'),
(90, 'Banco Banesco', '40000000.0000', '2019-08-04 04:00:00', '2019-08-15 04:20:27', '2019-08-15 04:20:27'),
(91, 'Caja Chica', '51337161.2800', '2019-08-05 04:00:00', '2019-08-18 21:27:41', '2019-08-18 21:27:41'),
(92, 'Banco de Venezuela', '50000000.0000', '2019-08-05 04:00:00', '2019-08-18 21:27:41', '2019-08-18 21:27:41'),
(93, 'Venezolano de Crédito', '20000000.0000', '2019-08-05 04:00:00', '2019-08-18 21:27:42', '2019-08-18 21:27:42'),
(94, 'Banco Bicentenario', '20000000.0000', '2019-08-05 04:00:00', '2019-08-18 21:27:42', '2019-08-18 21:27:42'),
(95, 'Banco Banesco', '40004000.0000', '2019-08-05 04:00:00', '2019-08-18 21:27:42', '2019-08-18 21:27:42');

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
(2, '1000', '784000.0000', 12, '2019-08-15 04:10:31', '2019-08-15 04:10:31'),
(3, '1001', '3360000.0000', 12, '2019-08-18 18:56:22', '2019-08-18 18:56:22'),
(4, '1002', '5152000.0000', 12, '2019-08-18 20:39:23', '2019-08-18 20:39:23');

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
(1, 'Andres Vega', 'andres_vega92@hotmail.com', '$2y$10$ZO7X6Vj11qtEQ8tot9.isOkI6PUSntu3EsQ4KRrzxK/vYhkQXMKH6', 'admin', 'IRLkx1SzIAXreTHtooofQYLZAuqa0pLNOnjDtxtLA81tVMDFNEJLZwqr2vxF', '2017-10-11 10:32:19', '2019-08-18 16:07:27'),
(7, 'Carlos', 'carlosteno@gmail.com', '$2y$10$9uwn8GSSYhLxzaSZnhawBu8f0sqBvgRRYHu8yQpI7/pILxLjx.WVK', 'admin', 'J5RWbVZNO1TbIyVmsPepnHUyyXyAlu2mHBQJynPGuwBIS78Fk9JHVBByuSHT', '2017-10-14 15:48:38', '2018-02-12 20:24:56'),
(8, 'clarisa', 'clari98@hotmail.com', '$2y$10$3PdMuwN1QX5OiLW0jhYWWu/PGegeRyRjoaJUPHPq2Y1q6xAAB4mE6', 'tipo1', '0azYYFx0yL46GxRRI9hTSUn0UZOTwOKEp1G4CCLfxgHAc5HszeyTpKSwOjJu', '2017-12-24 18:33:40', '2019-05-12 07:19:14'),
(9, 'Angélica', 'gavcamerida@gmail.com', '$2y$10$nmvuxdHxxHFRl2pckMARHeQJJ9sjxEV8kg1hLVfJoKvy1NWAbPYMu', 'tipo1', '77kYlLhRAezQrSQf7mP6XcnIPnp3LYiJpwGtJugWppnMSWr18XOL8VawZxlD', '2018-02-07 19:21:08', '2018-02-09 16:07:44'),
(11, 'Andres Eduardo Vega', 'aevega1991@gmail.com', '$2y$10$uTv5TpUjU0mNz2OzRVSgFe8HErOtmZsV.4U607urJmylTx.C7ig7q', 'admin', 'Ylr3Lv5Ow2d0xC0pTKqlHXtUhHWGdjFkKPas4J8AnCzlbpCZnKXJhDmbbuzX', '2019-02-08 04:30:20', '2019-05-31 02:49:09'),
(15, 'tipo1', 'tipo13@test.com', '$2y$10$LMaHzVe0qQ9/afNY9filgO1PADWWRVMfwJB1A032EkUtP1floSykm', 'tipo1', 'CaRi15sbuNWXpe9wbOmelliKvF2iZpeH0JmB72F7wpBZ04nhVjXdlJqH9Ugx', '2019-05-31 02:49:50', '2019-08-18 16:16:05'),
(18, 'tipo2', 'tipo2@test.com', '$2y$10$RH2daeWMO38Os0zQiaMpw.Xp7rDPianWraOM5G8CbcZOEAzWY1F/y', 'tipo2', 'hMsF3XUHRhTDr7RuJzYiFWDRC37a9bdciJVA9rzEb4CsPhkp7PijHF97BUQ0', '2019-05-31 03:55:11', '2019-08-18 16:42:29');

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
(2, 'C00000', '2019-08-04', '1000', 'credito', 'Caja Chica', 'Producto Ejemplo Presentación 12 Unid.', '350000.0000', 2, 1, '2019-08-15 04:10:31', '2019-08-15 04:10:31'),
(3, 'C00000', '2019-08-05', '1001', 'credito', 'Caja Chica', 'Producto Ejemplo Presentación 12 Unid.', '3000000.0000', 1, 1, '2019-08-18 18:56:22', '2019-08-18 18:56:22'),
(4, 'C00002', '2019-08-05', '1002', 'contado', 'Caja Chica', 'Producto Ejemplo Presentación 12 Unid.', '2300000.0000', 2, 1, '2019-08-18 20:39:23', '2019-08-18 20:39:23');

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ban_nombre` (`ban_nombre`);

--
-- Indices de la tabla `cajabanco`
--
ALTER TABLE `cajabanco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cajabanco_fk1` (`cb_compra_id`),
  ADD KEY `cajabanco_fk2` (`cb_venta_id`),
  ADD KEY `cajabanco_fk3` (`cb_entidad`);

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
-- Indices de la tabla `costoshijos`
--
ALTER TABLE `costoshijos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ch_ibkf_1` (`id_produccion`),
  ADD KEY `ch_ibkf_2` (`id_hijo`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cajabanco`
--
ALTER TABLE `cajabanco`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1734;

--
-- AUTO_INCREMENT de la tabla `cardexmp`
--
ALTER TABLE `cardexmp`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `costofijos`
--
ALTER TABLE `costofijos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `costoshijos`
--
ALTER TABLE `costoshijos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `cuentasxcobrar`
--
ALTER TABLE `cuentasxcobrar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cuentasxpagar`
--
ALTER TABLE `cuentasxpagar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `dependencias`
--
ALTER TABLE `dependencias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `insumo_requerido`
--
ALTER TABLE `insumo_requerido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `insumo_usado`
--
ALTER TABLE `insumo_usado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `materiasprimas`
--
ALTER TABLE `materiasprimas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `producciona`
--
ALTER TABLE `producciona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `produccionb`
--
ALTER TABLE `produccionb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `produccionc`
--
ALTER TABLE `produccionc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `requerimientos`
--
ALTER TABLE `requerimientos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `salarios`
--
ALTER TABLE `salarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `saldocaja`
--
ALTER TABLE `saldocaja`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `totalesventas`
--
ALTER TABLE `totalesventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajabanco`
--
ALTER TABLE `cajabanco`
  ADD CONSTRAINT `cajabanco_fk1` FOREIGN KEY (`cb_compra_id`) REFERENCES `compras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajabanco_fk2` FOREIGN KEY (`cb_venta_id`) REFERENCES `totalesventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cajabanco_fk3` FOREIGN KEY (`cb_entidad`) REFERENCES `bancos` (`ban_nombre`) ON UPDATE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
