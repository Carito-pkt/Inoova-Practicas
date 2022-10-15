-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-08-2022 a las 11:06:41
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_amosis_v2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medida_id` bigint(20) UNSIGNED DEFAULT NULL,
  `marca_id` bigint(20) UNSIGNED DEFAULT NULL,
  `categoria_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra` decimal(10,2) DEFAULT NULL,
  `venta` decimal(10,2) DEFAULT NULL,
  `stock_minimo` decimal(10,2) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `nombre`, `barra`, `medida_id`, `marca_id`, `categoria_id`, `compra`, `venta`, `stock_minimo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'PRODUCTO 1', '003', 2, 1, 1, '1.00', '2.00', '10.00', 1, '2022-08-06 10:08:27', '2022-08-07 04:40:14'),
(2, '5656', '6556', 2, 1, 1, '0.00', '0.00', '0.00', 0, '2022-08-06 10:21:25', '2022-08-06 10:21:33'),
(3, 'PRODUCTO 3', '0100', 2, 1, 1, '10.50', '17.00', '5.00', 1, '2022-08-07 08:49:41', '2022-08-07 10:52:57'),
(4, 'PRODUCTO 2', '10221', 2, 1, 1, '10.00', '15.00', '15.00', 1, '2022-08-07 08:55:28', '2022-08-08 03:20:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id`, `user_id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '2022-08-08 08:37:41', '2022-08-09 04:38:45'),
(2, 1, 1, '2022-08-09 04:38:45', '2022-08-09 04:38:45'),
(3, 3, 1, '2022-08-09 08:55:12', '2022-08-09 08:55:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_compras`
--

CREATE TABLE `caja_compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caja_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra_id` bigint(20) UNSIGNED DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `caja_compras`
--

INSERT INTO `caja_compras` (`id`, `caja_id`, `compra_id`, `monto`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '10.00', 1, '2022-08-09 03:56:28', '2022-08-09 03:56:28'),
(2, 2, 3, '20.50', 1, '2022-08-09 08:10:13', '2022-08-09 08:10:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_movimientos`
--

CREATE TABLE `caja_movimientos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caja_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `monto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `motivo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `caja_movimientos`
--

INSERT INTO `caja_movimientos` (`id`, `caja_id`, `tipo`, `monto`, `motivo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '10.00', NULL, 1, '2022-08-09 03:02:11', '2022-08-09 03:02:11'),
(2, 1, 1, '10.00', NULL, 0, '2022-08-09 03:02:32', '2022-08-09 03:25:29'),
(3, 1, 1, '12.00', '--', 1, '2022-08-09 03:10:52', '2022-08-09 03:10:52'),
(4, 1, 2, '1.00', 'ñ{{', 1, '2022-08-09 03:22:34', '2022-08-09 03:22:34'),
(5, 2, 1, '0.00', 'mm', 0, '2022-08-09 04:40:02', '2022-08-09 04:40:13'),
(6, 2, 1, '10.00', 'mm', 1, '2022-08-09 04:41:26', '2022-08-09 04:41:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_ventas`
--

CREATE TABLE `caja_ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caja_id` bigint(20) UNSIGNED DEFAULT NULL,
  `venta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `caja_ventas`
--

INSERT INTO `caja_ventas` (`id`, `caja_id`, `venta_id`, `monto`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '15.00', 1, '2022-08-09 03:56:40', '2022-08-09 03:56:40'),
(2, 2, 2, '32.00', 1, '2022-08-09 06:12:10', '2022-08-09 06:12:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'FRUTAS', 1, '2022-08-06 09:02:00', '2022-08-06 09:02:13'),
(2, 'SD', 0, '2022-08-06 09:02:20', '2022-08-06 09:02:31'),
(3, 'LACTEOS', 1, '2022-08-08 03:21:31', '2022-08-08 03:21:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `motivo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proveedor` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `total`, `tipo`, `motivo`, `proveedor`, `estado`, `created_at`, `updated_at`) VALUES
(1, '21.50', 1, '', 'PUBLICO GENERAL', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(2, '10.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-09 03:56:28', '2022-08-09 03:56:28'),
(3, '20.50', 1, '', 'PUBLICO GENERAL', 1, '2022-08-09 08:10:13', '2022-08-09 08:10:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_inventarios`
--

CREATE TABLE `compra_inventarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inventario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra_id` bigint(20) UNSIGNED DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cantidad` decimal(10,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compra_inventarios`
--

INSERT INTO `compra_inventarios` (`id`, `inventario_id`, `compra_id`, `precio`, `cantidad`, `estado`, `created_at`, `updated_at`) VALUES
(1, 27, 1, '1.00', '1.00', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(2, 28, 1, '10.50', '1.00', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(3, 29, 1, '10.00', '1.00', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(4, 31, 2, '10.00', '1.00', 1, '2022-08-09 03:56:28', '2022-08-09 03:56:28'),
(5, 35, 3, '10.00', '1.00', 1, '2022-08-09 08:10:13', '2022-08-09 08:10:13'),
(6, 36, 3, '10.50', '1.00', 1, '2022-08-09 08:10:13', '2022-08-09 08:10:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `articulo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra` decimal(10,2) DEFAULT NULL,
  `venta` decimal(10,2) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `motivo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventarios`
--

INSERT INTO `inventarios` (`id`, `articulo_id`, `compra`, `venta`, `cantidad`, `tipo`, `motivo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, '1.00', '2.00', '10.00', 1, 'AJUSTE DE INVENTARIO', 0, '2022-08-07 04:52:23', '2022-08-07 05:50:47'),
(2, 1, '1.00', '2.00', '1.00', 1, 'AJUSTE DE INVENTARIO', 1, '2022-08-07 04:58:05', '2022-08-07 04:58:05'),
(3, 1, '1.00', '2.00', '1.00', 1, 'AJUSTE DE INVENTARIO', 1, '2022-08-07 05:01:47', '2022-08-07 05:01:47'),
(4, 1, '1.00', '2.00', '3.00', 2, 'AJUSTE DE INVENTARIO', 1, '2022-08-07 05:12:15', '2022-08-07 05:12:15'),
(5, 1, '1.00', '2.00', '10.00', 1, 'AJUSTE DE INVENTARIO', 1, '2022-08-07 05:33:51', '2022-08-07 05:33:51'),
(6, 1, '1.00', '2.00', '5.00', 2, 'AJUSTE DE INVENTARIO', 0, '2022-08-07 05:34:28', '2022-08-07 05:50:55'),
(7, 1, '1.00', '2.00', '3.00', 1, 'AJUSTE DE INVENTARIO', 1, '2022-08-07 05:51:10', '2022-08-07 05:51:10'),
(8, 1, '1.00', '2.00', '1.00', 2, 'AJUSTE DE INVENTARIO', 1, '2022-08-07 06:06:16', '2022-08-07 06:06:16'),
(9, 1, '1.00', '2.00', '1.00', 1, 'COMPRA 3', 1, '2022-08-07 10:51:11', '2022-08-07 10:51:11'),
(10, 4, '9.00', '5.00', '1.00', 1, 'COMPRA 3', 1, '2022-08-07 10:51:11', '2022-08-07 10:51:11'),
(11, 1, '1.00', '2.00', '1.00', 1, 'COMPRA 4', 1, '2022-08-07 10:52:12', '2022-08-07 10:52:12'),
(12, 4, '9.00', '5.00', '1.00', 1, 'COMPRA 4', 1, '2022-08-07 10:52:12', '2022-08-07 10:52:12'),
(13, 3, '17.50', '10.00', '5.00', 1, 'COMPRA 4', 1, '2022-08-07 10:52:12', '2022-08-07 10:52:12'),
(14, 4, '9.00', '5.00', '1.00', 1, 'COMPRA 5', 1, '2022-08-08 03:19:26', '2022-08-08 03:19:26'),
(15, 3, '10.50', '17.00', '1.00', 1, 'COMPRA 5', 1, '2022-08-08 03:19:26', '2022-08-08 03:19:26'),
(16, 4, '10.00', '15.00', '1.00', 1, 'COMPRA 6', 1, '2022-08-08 03:55:52', '2022-08-08 03:55:52'),
(17, 3, '10.50', '17.00', '1.00', 1, 'COMPRA 6', 1, '2022-08-08 03:55:52', '2022-08-08 03:55:52'),
(18, 1, '1.00', '2.00', '3.00', 2, 'VENTA 2', 1, '2022-08-08 04:08:15', '2022-08-08 04:08:15'),
(19, 4, '10.00', '15.00', '4.00', 2, 'VENTA 3', 1, '2022-08-08 04:39:43', '2022-08-08 04:39:43'),
(20, 3, '10.50', '17.00', '6.00', 2, 'VENTA 3', 1, '2022-08-08 04:39:43', '2022-08-08 04:39:43'),
(21, 3, '10.50', '17.00', '1.00', 2, 'VENTA 4', 1, '2022-08-08 04:44:52', '2022-08-08 04:44:52'),
(22, 1, '1.00', '2.00', '3.00', 2, 'VENTA 5', 1, '2022-08-08 04:45:01', '2022-08-08 04:45:01'),
(23, 1, '1.00', '2.00', '7.00', 2, 'VENTA 6', 1, '2022-08-08 04:45:10', '2022-08-08 04:45:10'),
(24, 1, '1.00', '2.00', '4.00', 1, 'COMPRA 7', 1, '2022-08-08 04:45:40', '2022-08-08 04:45:40'),
(25, 3, '10.50', '17.00', '3.00', 1, 'COMPRA 7', 1, '2022-08-08 04:45:40', '2022-08-08 04:45:40'),
(26, 4, '10.00', '15.00', '5.00', 1, 'COMPRA 7', 1, '2022-08-08 04:45:40', '2022-08-08 04:45:40'),
(27, 1, '1.00', '2.00', '1.00', 1, 'COMPRA 1', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(28, 3, '10.50', '17.00', '1.00', 1, 'COMPRA 1', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(29, 4, '10.00', '15.00', '1.00', 1, 'COMPRA 1', 1, '2022-08-08 04:47:50', '2022-08-08 04:47:50'),
(30, 1, '1.00', '2.00', '10.00', 1, 'AJUSTE DE INVENTARIO', 1, '2022-08-08 04:48:42', '2022-08-08 04:48:42'),
(31, 4, '10.00', '15.00', '1.00', 1, 'COMPRA 2', 1, '2022-08-09 03:56:28', '2022-08-09 03:56:28'),
(32, 4, '10.00', '15.00', '1.00', 2, 'VENTA 1', 1, '2022-08-09 03:56:40', '2022-08-09 03:56:40'),
(33, 4, '10.00', '15.00', '1.00', 2, 'VENTA 2', 1, '2022-08-09 06:12:10', '2022-08-09 06:12:10'),
(34, 3, '10.50', '17.00', '1.00', 2, 'VENTA 2', 1, '2022-08-09 06:12:10', '2022-08-09 06:12:10'),
(35, 4, '10.00', '15.00', '1.00', 1, 'COMPRA 3', 1, '2022-08-09 08:10:13', '2022-08-09 08:10:13'),
(36, 3, '10.50', '17.00', '1.00', 1, 'COMPRA 3', 1, '2022-08-09 08:10:13', '2022-08-09 08:10:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'LG ', 1, '2022-08-06 09:27:17', '2022-08-07 08:54:48'),
(2, 'k', 0, '2022-08-06 09:27:24', '2022-08-06 09:27:37'),
(3, 'GLORIA', 1, '2022-08-08 03:21:01', '2022-08-08 03:21:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidas`
--

CREATE TABLE `medidas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medidas`
--

INSERT INTO `medidas` (`id`, `nombre`, `codigo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'UNIDAD', 'UND', 0, '2022-08-05 06:45:33', '2022-08-06 07:05:04'),
(2, 'KILOGRAMO', 'KG', 1, '2022-08-05 06:49:03', '2022-08-06 07:14:43'),
(3, '1', '2', 0, '2022-08-05 09:07:30', '2022-08-05 09:52:10'),
(4, NULL, NULL, 0, '2022-08-05 09:34:41', '2022-08-05 09:46:44'),
(5, NULL, NULL, 0, '2022-08-05 09:35:53', '2022-08-05 09:46:46'),
(6, NULL, NULL, 0, '2022-08-05 09:37:18', '2022-08-05 09:46:10'),
(7, 'LITRO', 'LT', 1, '2022-08-05 09:52:21', '2022-08-05 09:52:21'),
(8, 'hj', 'k', 0, '2022-08-05 10:04:45', '2022-08-05 10:04:50'),
(9, 'n', 'nn', 0, '2022-08-05 10:04:58', '2022-08-05 10:05:16'),
(10, 'fgfg', 'fgfg', 0, '2022-08-05 10:12:44', '2022-08-06 06:31:33'),
(11, '', '', 0, '2022-08-05 10:19:49', '2022-08-05 10:19:56'),
(12, 'UNIDAD', 'UND', 1, '2022-08-06 06:36:10', '2022-08-07 08:54:33'),
(13, 'vnm', 'kgj', 0, '2022-08-06 06:36:16', '2022-08-06 07:06:17'),
(14, 'nm', 'nmnm', 0, '2022-08-06 06:37:00', '2022-08-09 08:31:13'),
(15, 'hh', 'jjj', 0, '2022-08-06 06:40:38', '2022-08-09 08:31:16'),
(16, 'jf', 'fj', 0, '2022-08-06 06:49:47', '2022-08-09 08:31:21'),
(17, 'kk', 'kk', 0, '2022-08-06 06:49:54', '2022-08-09 08:31:25'),
(18, 'fgfg', 'fgfg', 0, '2022-08-06 07:44:50', '2022-08-09 08:31:29'),
(19, 'as', 'as', 0, '2022-08-06 07:46:11', '2022-08-09 08:31:40'),
(20, 'jfhj', 'fg', 0, '2022-08-06 07:48:10', '2022-08-09 08:31:33'),
(21, NULL, NULL, 0, '2022-08-06 07:48:20', '2022-08-09 08:30:52'),
(22, 'hh', 'hhh', 0, '2022-08-06 07:48:43', '2022-08-09 08:31:37'),
(23, 'nm', 'nm', 0, '2022-08-06 07:48:53', '2022-08-09 08:30:56'),
(24, 'ghgh', 'ghgh', 0, '2022-08-06 07:49:45', '2022-08-09 08:30:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2022_08_05_055844_create_medidas_table', 1),
(3, '2022_08_05_060125_create_categorias_table', 1),
(4, '2022_08_05_060310_create_marcas_table', 2),
(5, '2022_08_05_060432_create_articulos_table', 3),
(6, '2022_08_07_032306_create_inventarios_table', 4),
(11, '2022_08_07_103657_create_compras_table', 5),
(12, '2022_08_08_031546_create_compra_inventarios_table', 5),
(13, '2022_08_08_040211_create_ventas_table', 5),
(14, '2022_08_08_040345_create_venta_inventarios_table', 5),
(15, '2022_08_08_045914_create_users_table', 6),
(16, '2022_08_08_083127_create_cajas_table', 7),
(17, '2022_08_09_025342_create_caja_movimientos_table', 8),
(18, '2022_08_09_034252_create_caja_compras_table', 9),
(19, '2022_08_09_034339_create_caja_ventas_table', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `username`, `email`, `password`, `tipo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Jhonycreativo', 'jhony', 'jhonycreativo.code@gmail.com', '$2y$10$oZsis9tWArXrwxgglkimZuN3nhKmsoB1pI/1L8YKAhcpethPzIPmW', 1, 1, '2022-08-08 05:38:15', '2022-08-08 05:53:48'),
(2, 'l', 'l', 'k', '$2y$10$.drHVmnHeHx3VQfm75Ds7enHJUqVoQBfZXOvFT8oteiE/cqTbt45m', 1, 0, '2022-08-08 06:05:20', '2022-08-08 06:05:28'),
(3, 'admin', 'admin', 'admin', '$2y$10$n3Xb/WNfWmX/AzH2sccYIu4YNbu1iBcU3/E1NqitUVA0M.OnxvMlS', 1, 1, '2022-08-09 08:55:00', '2022-08-09 08:55:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `pago` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cambio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `motivo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `total`, `pago`, `cambio`, `tipo`, `motivo`, `cliente`, `estado`, `created_at`, `updated_at`) VALUES
(1, '15.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 0, '2022-08-09 03:56:40', '2022-08-09 06:12:23'),
(2, '32.00', '0.00', '0.00', 1, '', 'PUBLICO GENERAL', 1, '2022-08-09 06:12:09', '2022-08-09 06:12:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_inventarios`
--

CREATE TABLE `venta_inventarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inventario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `venta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `venta_inventarios`
--

INSERT INTO `venta_inventarios` (`id`, `inventario_id`, `venta_id`, `precio`, `cantidad`, `estado`, `created_at`, `updated_at`) VALUES
(1, 32, 1, '15.00', '1.00', 1, '2022-08-09 03:56:40', '2022-08-09 03:56:40'),
(2, 33, 2, '15.00', '1.00', 1, '2022-08-09 06:12:10', '2022-08-09 06:12:10'),
(3, 34, 2, '17.00', '1.00', 1, '2022-08-09 06:12:10', '2022-08-09 06:12:10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articulos_medida_id_foreign` (`medida_id`),
  ADD KEY `articulos_marca_id_foreign` (`marca_id`),
  ADD KEY `articulos_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cajas_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `caja_compras`
--
ALTER TABLE `caja_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caja_compras_caja_id_foreign` (`caja_id`),
  ADD KEY `caja_compras_compra_id_foreign` (`compra_id`);

--
-- Indices de la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caja_movimientos_caja_id_foreign` (`caja_id`);

--
-- Indices de la tabla `caja_ventas`
--
ALTER TABLE `caja_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caja_ventas_caja_id_foreign` (`caja_id`),
  ADD KEY `caja_ventas_venta_id_foreign` (`venta_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra_inventarios`
--
ALTER TABLE `compra_inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_inventarios_inventario_id_foreign` (`inventario_id`),
  ADD KEY `compra_inventarios_compra_id_foreign` (`compra_id`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventarios_articulo_id_foreign` (`articulo_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medidas`
--
ALTER TABLE `medidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta_inventarios`
--
ALTER TABLE `venta_inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_inventarios_inventario_id_foreign` (`inventario_id`),
  ADD KEY `venta_inventarios_venta_id_foreign` (`venta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `caja_compras`
--
ALTER TABLE `caja_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `caja_ventas`
--
ALTER TABLE `caja_ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compra_inventarios`
--
ALTER TABLE `compra_inventarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `medidas`
--
ALTER TABLE `medidas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `venta_inventarios`
--
ALTER TABLE `venta_inventarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `articulos_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `articulos_medida_id_foreign` FOREIGN KEY (`medida_id`) REFERENCES `medidas` (`id`);

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `cajas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `caja_compras`
--
ALTER TABLE `caja_compras`
  ADD CONSTRAINT `caja_compras_caja_id_foreign` FOREIGN KEY (`caja_id`) REFERENCES `cajas` (`id`),
  ADD CONSTRAINT `caja_compras_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`);

--
-- Filtros para la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  ADD CONSTRAINT `caja_movimientos_caja_id_foreign` FOREIGN KEY (`caja_id`) REFERENCES `cajas` (`id`);

--
-- Filtros para la tabla `caja_ventas`
--
ALTER TABLE `caja_ventas`
  ADD CONSTRAINT `caja_ventas_caja_id_foreign` FOREIGN KEY (`caja_id`) REFERENCES `cajas` (`id`),
  ADD CONSTRAINT `caja_ventas_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `compra_inventarios`
--
ALTER TABLE `compra_inventarios`
  ADD CONSTRAINT `compra_inventarios_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`),
  ADD CONSTRAINT `compra_inventarios_inventario_id_foreign` FOREIGN KEY (`inventario_id`) REFERENCES `inventarios` (`id`);

--
-- Filtros para la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `inventarios_articulo_id_foreign` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`);

--
-- Filtros para la tabla `venta_inventarios`
--
ALTER TABLE `venta_inventarios`
  ADD CONSTRAINT `venta_inventarios_inventario_id_foreign` FOREIGN KEY (`inventario_id`) REFERENCES `inventarios` (`id`),
  ADD CONSTRAINT `venta_inventarios_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
