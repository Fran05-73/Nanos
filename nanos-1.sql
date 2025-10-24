-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-10-2025 a las 13:45:16
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nanos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajustes_inventario`
--

CREATE TABLE `ajustes_inventario` (
  `id_ajustes` varchar(50) NOT NULL,
  `id_producto` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `fecha` date NOT NULL,
  `id_usuario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id_log` int(11) NOT NULL,
  `tabla_afectada` varchar(100) DEFAULT NULL,
  `accion` varchar(100) DEFAULT NULL,
  `id_registrado_afectado` varchar(50) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuario` varchar(100) DEFAULT NULL,
  `datos_anteriores` text DEFAULT NULL,
  `datos_nuevos` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
('CAT_01', 'Alimentos y Bebidas'),
('CAT_02', 'Bebidas Alcoholicas'),
('CAT_03', 'Limpieza y Hogar'),
('CAT_04', 'Cuidado Personal'),
('CAT_05', 'Productos para Ninos y Bebes'),
('CAT_06', 'Productos para Mascotas'),
('CAT_07', 'Oficina y Escolar'),
('CAT_08', 'Electronica Menor'),
('CAT_09', 'Temporada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` varchar(50) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `ci` varchar(50) DEFAULT NULL,
  `telefono_principal` varchar(50) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `id_proveedores` varchar(50) DEFAULT NULL,
  `id_empleado` varchar(50) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_det_compra` varchar(50) NOT NULL,
  `id_compra` varchar(50) DEFAULT NULL,
  `id_producto` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_det_venta` varchar(50) NOT NULL,
  `id_venta` varchar(50) DEFAULT NULL,
  `id_producto` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emails`
--

CREATE TABLE `emails` (
  `id_email` varchar(50) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `tipo` enum('personal','trabajo','facturacion','otro') DEFAULT 'trabajo',
  `id_proveedor` varchar(50) DEFAULT NULL,
  `id_empleado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `emails`
--

INSERT INTO `emails` (`id_email`, `correo`, `tipo`, `id_proveedor`, `id_empleado`) VALUES
('EMAIL_68f4391908e15', 'farmacorp@gmail.com', 'trabajo', 'PROV_68f4391893c7b', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ci` varchar(100) NOT NULL,
  `telefono_principal` varchar(50) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `id_usuario` varchar(50) DEFAULT NULL,
  `email_principal` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` varchar(50) NOT NULL,
  `id_venta` varchar(50) DEFAULT NULL,
  `fecha` date NOT NULL,
  `nro_factura` varchar(50) NOT NULL,
  `nit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_precios`
--

CREATE TABLE `historial_precios` (
  `id_hist_precios` varchar(50) NOT NULL,
  `id_producto` varchar(50) DEFAULT NULL,
  `precio_anterior` decimal(10,2) DEFAULT NULL,
  `precio_nuevo` decimal(10,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_usuario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` varchar(50) NOT NULL,
  `id_producto` varchar(50) DEFAULT NULL,
  `stock_actual` int(11) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `magnitudes`
--

CREATE TABLE `magnitudes` (
  `id_magnitud` varchar(50) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `tipo` enum('peso','volumen','unidad','longitud','otros') DEFAULT 'unidad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `magnitudes`
--

INSERT INTO `magnitudes` (`id_magnitud`, `nombre`, `abreviatura`, `tipo`) VALUES
('MAG_01', 'Unidad', 'u', 'unidad'),
('MAG_02', 'Paquete', 'pkg', 'unidad'),
('MAG_03', 'Caja', 'cj', 'unidad'),
('MAG_04', 'Docena', 'dz', 'unidad'),
('MAG_05', 'Gramos', 'g', 'peso'),
('MAG_06', 'Kilogramos', 'kg', 'peso'),
('MAG_07', 'Libras', 'lb', 'peso'),
('MAG_08', 'Mililitros', 'ml', 'volumen'),
('MAG_09', 'Litros', 'L', 'volumen'),
('MAG_10', 'Metro', 'm', 'longitud'),
('MAG_11', 'Par', 'par', 'otros'),
('MAG_12', 'Combo', 'cb', 'otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` varchar(50) NOT NULL,
  `id_venta` varchar(50) DEFAULT NULL,
  `metodo` varchar(100) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `id_proveedores` varchar(50) DEFAULT NULL,
  `id_categoria` varchar(50) DEFAULT NULL,
  `peso` decimal(10,3) DEFAULT NULL,
  `id_magnitud` varchar(50) DEFAULT NULL,
  `fecha_vencimiento` date NOT NULL,
  `id_subcategoria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provee`
--

CREATE TABLE `provee` (
  `id_provee` varchar(50) NOT NULL,
  `id_proveedores` varchar(50) DEFAULT NULL,
  `id_producto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedores` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono_principal` varchar(50) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `email_principal` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedores`, `nombre`, `telefono_principal`, `direccion`, `email_principal`) VALUES
('PROV_68d99f644f2f6', 'Fridosa', '87654321', 'Z. Villa Adela', 'franciscoparicalle@gmail.com'),
('PROV_68f4391893c7b', 'farmacorp', '79862145', 'Av. Santa Rosa #9635', 'carlos@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id_subcategoria` varchar(50) NOT NULL,
  `id_categoria` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`id_subcategoria`, `id_categoria`, `nombre`, `descripcion`) VALUES
('SUB_01', 'CAT_01', 'Enlatados y Conservas', NULL),
('SUB_02', 'CAT_01', 'Snacks y Golosinas', NULL),
('SUB_03', 'CAT_01', 'Lacteos y Derivados', ''),
('SUB_04', 'CAT_01', 'Panaderia y Reposteria', ''),
('SUB_05', 'CAT_01', 'Frutas y Verduras', NULL),
('SUB_06', 'CAT_01', 'Carnes y Embutidos', NULL),
('SUB_07', 'CAT_01', 'Abarrotes', NULL),
('SUB_08', 'CAT_01', 'Bebidas no Alcoholicas', ''),
('SUB_09', 'CAT_02', 'Cervezas', NULL),
('SUB_10', 'CAT_02', 'Vinos', NULL),
('SUB_11', 'CAT_02', 'Licores', NULL),
('SUB_12', 'CAT_02', 'Cocteles y Preparadas', ''),
('SUB_13', 'CAT_03', 'Detergentes y Suavizantes', NULL),
('SUB_14', 'CAT_03', 'Limpiadores Multiusos', NULL),
('SUB_15', 'CAT_03', 'Utensilios de Limpieza', NULL),
('SUB_16', 'CAT_03', 'Ambientadores e Insecticidas', NULL),
('SUB_17', 'CAT_04', 'Jabones y Champus', ''),
('SUB_18', 'CAT_04', 'Higiene Bucal', NULL),
('SUB_19', 'CAT_04', 'Desodorantes y Perfumes', NULL),
('SUB_20', 'CAT_04', 'Higiene Femenina', NULL),
('SUB_21', 'CAT_05', 'Leche Infantil y Papillas', NULL),
('SUB_22', 'CAT_05', 'Panales y Toallitas', ''),
('SUB_23', 'CAT_05', 'Higiene Infantil', NULL),
('SUB_24', 'CAT_06', 'Alimento para Perros', NULL),
('SUB_25', 'CAT_06', 'Alimento para Gatos', NULL),
('SUB_26', 'CAT_06', 'Accesorios para Mascotas', NULL),
('SUB_27', 'CAT_07', 'Utiles Escolares', ''),
('SUB_28', 'CAT_07', 'Papeleria', ''),
('SUB_29', 'CAT_07', 'Articulos de Oficina', ''),
('SUB_30', 'CAT_08', 'Pilas y Baterias', ''),
('SUB_31', 'CAT_08', 'Cables y Cargadores', NULL),
('SUB_32', 'CAT_08', 'Linternas y Focos', NULL),
('SUB_33', 'CAT_09', 'Decoraciones y Regalos', NULL),
('SUB_34', 'CAT_09', 'Productos de Temporada', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `id_telefono` varchar(50) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `tipo` enum('celular','fijo','whatsapp','otro') DEFAULT 'otro',
  `id_proveedor` varchar(50) DEFAULT NULL,
  `id_cliente` varchar(50) DEFAULT NULL,
  `id_empleado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id_telefono`, `numero`, `tipo`, `id_proveedor`, `id_cliente`, `id_empleado`) VALUES
('TEL_68f43918e0bd7', '76842198', 'otro', 'PROV_68f4391893c7b', NULL, NULL),
('TEL_68f4391908d32', '91358465', 'whatsapp', 'PROV_68f4391893c7b', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id_turno` varchar(50) NOT NULL,
  `id_empleado` varchar(50) DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usario` varchar(50) NOT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `id_rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` varchar(50) DEFAULT NULL,
  `id_empleado` varchar(50) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ajustes_inventario`
--
ALTER TABLE `ajustes_inventario`
  ADD PRIMARY KEY (`id_ajustes`),
  ADD KEY `fk_ajusprod` (`id_producto`),
  ADD KEY `fk_ajusus` (`id_usuario`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id_log`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `fk_compprovs` (`id_proveedores`),
  ADD KEY `fk_compempl` (`id_empleado`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_det_compra`),
  ADD KEY `fk_detcomcomp` (`id_compra`),
  ADD KEY `fk_detcomprod` (`id_producto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_det_venta`),
  ADD KEY `fk_detvenvent` (`id_venta`),
  ADD KEY `fk_detvenprod` (`id_producto`);

--
-- Indices de la tabla `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id_email`),
  ADD KEY `fk_emailprov` (`id_proveedor`),
  ADD KEY `fk_emailempl` (`id_empleado`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `fk_emplus` (`id_usuario`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `fk_facven` (`id_venta`);

--
-- Indices de la tabla `historial_precios`
--
ALTER TABLE `historial_precios`
  ADD PRIMARY KEY (`id_hist_precios`),
  ADD KEY `fk_histpreprod` (`id_producto`),
  ADD KEY `fk_histpreus` (`id_usuario`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `fk_invprod` (`id_producto`);

--
-- Indices de la tabla `magnitudes`
--
ALTER TABLE `magnitudes`
  ADD PRIMARY KEY (`id_magnitud`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `fk_pagven` (`id_venta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_prodcat` (`id_categoria`),
  ADD KEY `fk_prodprovs` (`id_proveedores`),
  ADD KEY `fk_prodmag` (`id_magnitud`),
  ADD KEY `fk_prodsubcat` (`id_subcategoria`);

--
-- Indices de la tabla `provee`
--
ALTER TABLE `provee`
  ADD PRIMARY KEY (`id_provee`),
  ADD KEY `fk_proveeprovs` (`id_proveedores`),
  ADD KEY `fk_proveeprod` (`id_producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedores`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id_subcategoria`),
  ADD KEY `fk_subcatcat` (`id_categoria`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`id_telefono`),
  ADD KEY `fk_telprov` (`id_proveedor`),
  ADD KEY `fk_telcli` (`id_cliente`),
  ADD KEY `fk_telempl` (`id_empleado`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id_turno`),
  ADD KEY `fk_turempl` (`id_empleado`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usario`),
  ADD KEY `fk_usrol` (`id_rol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_vencli` (`id_cliente`),
  ADD KEY `fk_venempl` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ajustes_inventario`
--
ALTER TABLE `ajustes_inventario`
  ADD CONSTRAINT `fk_ajusprod` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `fk_ajusus` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usario`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_compempl` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `fk_compprovs` FOREIGN KEY (`id_proveedores`) REFERENCES `proveedores` (`id_proveedores`);

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `fk_detcomcomp` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`),
  ADD CONSTRAINT `fk_detcomprod` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detvenprod` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `fk_detvenvent` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`);

--
-- Filtros para la tabla `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `fk_emailempl` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `fk_emailprov` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedores`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_emplus` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usario`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `fk_facven` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`);

--
-- Filtros para la tabla `historial_precios`
--
ALTER TABLE `historial_precios`
  ADD CONSTRAINT `fk_histpreprod` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `fk_histpreus` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usario`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_invprod` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_pagven` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_prodcat` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `fk_prodmag` FOREIGN KEY (`id_magnitud`) REFERENCES `magnitudes` (`id_magnitud`),
  ADD CONSTRAINT `fk_prodprovs` FOREIGN KEY (`id_proveedores`) REFERENCES `proveedores` (`id_proveedores`),
  ADD CONSTRAINT `fk_prodsubcat` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategorias` (`id_subcategoria`);

--
-- Filtros para la tabla `provee`
--
ALTER TABLE `provee`
  ADD CONSTRAINT `fk_proveeprod` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `fk_proveeprovs` FOREIGN KEY (`id_proveedores`) REFERENCES `proveedores` (`id_proveedores`);

--
-- Filtros para la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD CONSTRAINT `fk_subcatcat` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `fk_telcli` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `fk_telempl` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `fk_telprov` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedores`);

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `fk_turempl` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usrol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_vencli` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `fk_venempl` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
