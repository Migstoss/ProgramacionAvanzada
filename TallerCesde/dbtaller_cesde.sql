-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2020 a las 03:06:47
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbtaller_cesde`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductor`
--

CREATE TABLE `conductor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipo_licencia` varchar(255) NOT NULL,
  `placa_vehiculo` varchar(6) NOT NULL,
  `id_tipo_conductor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id` int(11) NOT NULL,
  `placa_vehiculo` varchar(6) DEFAULT NULL,
  `id_conductor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `id` int(11) NOT NULL,
  `estacion` varchar(255) DEFAULT NULL,
  `placa_vehiculo` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipovehiculo`
--

CREATE TABLE `tipovehiculo` (
  `id` int(11) NOT NULL,
  `tipoVehiculo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_conductor`
--

CREATE TABLE `tipo_conductor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `placa` varchar(6) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `referencia` varchar(50) NOT NULL,
  `modelo` int(11) DEFAULT NULL,
  `id_tv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `placa_vehiculo` (`placa_vehiculo`),
  ADD KEY `id_tipo_conductor` (`id_tipo_conductor`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `placa_vehiculo` (`placa_vehiculo`),
  ADD KEY `id_conductor` (`id_conductor`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `placa_vehiculo` (`placa_vehiculo`);

--
-- Indices de la tabla `tipovehiculo`
--
ALTER TABLE `tipovehiculo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipoVehiculo` (`tipoVehiculo`);

--
-- Indices de la tabla `tipo_conductor`
--
ALTER TABLE `tipo_conductor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `id_tv` (`id_tv`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD CONSTRAINT `conductor_ibfk_1` FOREIGN KEY (`placa_vehiculo`) REFERENCES `vehiculo` (`placa`),
  ADD CONSTRAINT `conductor_ibfk_2` FOREIGN KEY (`id_tipo_conductor`) REFERENCES `tipo_conductor` (`id`);

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`placa_vehiculo`) REFERENCES `vehiculo` (`placa`),
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`id_conductor`) REFERENCES `conductor` (`id`);

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`placa_vehiculo`) REFERENCES `vehiculo` (`placa`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`id_tv`) REFERENCES `tipovehiculo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
