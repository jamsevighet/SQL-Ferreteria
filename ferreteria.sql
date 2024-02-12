DROP DATABASE IF EXISTS ferreteria; -- Para ejecutarlo cuantas veces queramos 
CREATE DATABASE ferreteria; 
USE ferreteria;  -- Indicarle donde estaremos trabajando 

-- ---------------------------------------------------------------------------------------------------------
/*  ESQUEMA PARA LA FERRETERIA */

 CREATE TABLE productos ( -- Productos que manejamos 
 id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,  -- identificador autoincrementante
 descripcion VARCHAR(100) NOT NULL,
 categoria VARCHAR(50), -- se agregó este campo para mayor facilidad de identificar los productos
 marca VARCHAR(50) NOT NULL
 );
 CREATE TABLE precios (  -- Los precios de venta al publico 
 mayoreo INT,
 pieza INT, 
 id_producto INT UNSIGNED NOT NULL,
FOREIGN KEY (id_producto) REFERENCES productos(id_producto)  -- La llave primaria es la foránea  
 );
 
 CREATE TABLE sucursales ( -- Distintos puntos de venta 
 id_sucursal INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL,
 ubicacion VARCHAR(100) NOT NULL
 ); 

CREATE TABLE proveedores(  -- Para llevar el conteo de que surte cada sucursal y de que manera lo hace 
 id_compra INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 id_provedor INT NOT NULL,
 id_producto INT UNSIGNED NOT NULL,
 id_sucursal INT UNSIGNED NOT NULL,
 costo INT,
 unidades INT,
 credito ENUM ('0','3','6') NOT NULL, 
 CONSTRAINT FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
 CONSTRAINT FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
 ); 

CREATE TABLE clientes(  -- quien nos compra 
id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre_cliente VARCHAR(50) NOT NULL,
telefono VARCHAR (14),
correo VARCHAR(150),
direccion VARCHAR(300)
);

CREATE TABLE pedidos (  -- qué nos compran   
 id_ticket INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
 id_producto INT UNSIGNED NOT NULL,
 id_sucursal INT UNSIGNED NOT NULL, 
 cantidad INT,
 id_cliente INT UNSIGNED NOT NULL,
 fecha_hora DATETIME,
 CONSTRAINT FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
 CONSTRAINT FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal),
 CONSTRAINT FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
 );
-- -----------------------------------------------------------------------------------------------------
/* POBLAMOS LAS TABLAS  */ 

-- PRODUCTO ; tenemos 127 disponibles 
INSERT INTO productos (descripcion, categoria, marca) VALUES  -- el id se irá llenando solo 
('Martillo', 'Carpintería', 'Trupper'),
('Destornillador de cruz', 'Desarmadores', 'Stanley'),
('Destornillador plano', 'Desarmadores', 'Trupper'),
('Destornillador plano', 'Desarmadores', 'Stanley'),
('Cinta Métrica', 'Cintas', 'Kobalt'),
('Cinta Métrica', 'Cintas', 'Coffex'),
('Cinta Métrica', 'Cintas', 'Bosch'),
('Martillo', 'Carpintería', 'DeWalt'),
('Manguera #10', 'Construcción', 'Coffex'),
('Manguera #12', 'Construcción', 'Coffex'),
('Manguera #14', 'Construcción', 'Coffex'),
('Manguera #18', 'Construcción', 'Coffex'),
('Taladro inalámbrico', 'Máquinas', 'Pretul'),
('Llave ajustable 10 pulgadas', 'Plomería', 'DeWalt'),
('Pala de jardín', 'Construcción', 'Foset'),
('Sierra circular', 'Carpintería', 'Kobalt'),
('Pinzas de corte', 'Pinzas', 'Stanley'),
('Clavos para madera', 'Clavos y Tornillos', 'Senco'),
('Clavos para concreto', 'Clavos y Tornillos', 'Senco'),
('Destornillador de cruz', 'Desarmadores', 'Trupper'),
('Destornillador de cruz', 'Desarmadores', 'Kobalt'),
('Brocha', 'Pintura', 'Foset'),
('Pistola de silicona', 'Plomería', 'Bosch'),
('Pintura acrílica blanca', 'Pintura', 'Bosch'),
('Lija', 'Abrasivos y Perforación', 'Trupper'),
('Escalera plegable', 'Escaleras', 'Stanley'),
('Desatornillador de cruz', 'Desarmadores', 'Trupper'),
('Brocas para metal', 'Abrasivos y Perforación', 'DeWalt'),
('Caja para herramientas', 'Organizadores', 'Stanley'),
('Segueta', 'Corte', 'Trupper'),
('Tornillos para yeso', 'Clavos y Tornillos', 'Pretul'),
('Brocha angular', 'Pintrua', 'Foset'),
('Nivelador', 'Construcción', 'Stanley'),
('Alambre', 'Cables y Cadenas', 'Coffex'),
('Escuadra metálica', 'Carpintería', 'DeWalt'),
('Taladro', 'Máquinas', 'Arrow'),
('Martillo', 'Carpintería', 'Arrow'),
('Nivelador digital', 'Construcción', 'Stanley'),
('Espátula', 'Carpintería', 'Senco'),
('Gafas de seguridad', 'Seguridad', 'Senco'),
('Llave hexagonal', 'Plomería', 'Trupper'),
('Abrazaderas de plástico', 'Cerrajería', 'Kobalt'),
('Cerradura de puerta', 'Cerrajería', 'Kobalt'),
('Llave de tubo', 'Plomería', 'Bosch'),
('Clavos para madera', 'Clavos y Tornillos', 'Pretul'),
('Cinta de teflón', 'Cintas', 'Foset'),
('Cinta de aislar', 'Cintas', 'Foset'),
('Cinta de teflón', 'Cintas', 'Coffex'),
('Cinta de aislar', 'Cintas', 'Coffex'),
('Pinzas de corte', 'Pinzas', 'Stanley'),
('Aceite lubricante', 'Lubricantes', 'Foset'),
('Cerradura de puerta', 'Cerrajería', 'Kobalt'),
('Pizallas', 'Varios', 'DeWalt'),
('Pegamento', 'Plomería', 'Gorilla'),
('Pegamento', 'Plomería', 'DeWalt'),
('Clavos para madera', 'Clavos y Tornillos', 'Kobalt'),
('Alambre', 'Cables y Cadenas', 'Arrow'),
('Pistola de clavos', 'Clavos y Tornillos', 'Trupper'),
('Pinzas de corte', 'Pinzas', 'Trupper'),
('Cadenas de acero', 'Cables y Cadenas', 'Campbell'),
('Segueta', 'Corte', 'Campbell'),
('Alambre', 'Cables y Cadenas', 'Campbell'),
('Pinzas para acero', 'Pinzas', 'Campbell'),
('Pintura acrílica negra', 'Pintura', 'Alesamex'),
('Carretilla', 'Construcción', 'Trupper'),
('Carretilla', 'Construcción', 'Stanley'),
('Carretilla', 'Construcción', 'DeWalt'),
('Sellador de silicona', 'Plomería', 'Alesamex'),
('Bisagras para puertas', 'Cerrajería', 'Trupper'),
('Taladro', 'Máquinas', 'Gorilla'),
('Manguera', 'Construcción', 'Arrow'),
('Martillo', 'Carpintería', 'Kobalt'),
('Martillo demoledor', 'Carpintería', 'Bosch'),
('Pintura para hierro', 'Pintura', 'Alesamex'),
('Cerradura de puerta', 'Cerrajería', 'Pretul'),
('Estantería metálica', 'Organizadores', 'Pretul'),
('Cable para luz', 'Cables y Cadenas', 'Cable Matters'),
('Tijeras de hojalatero', 'Corte', 'Trupper'),
('Cinta de aislar', 'Cintas', 'Bosch'),
('Trapo de limpieza', 'Limpieza', 'Gorilla'),
('Llave de impacto', 'Plomería', 'Pretul'),
('Grapas para pistola', 'Clavos y Tornillos', 'Stanley'),
('Rodillo para pintar', 'Pintura', 'Alesamex'),
('Nivel de burbuja', 'Construcción', 'Stanley'),
('Llave de cadena', 'Plomería', 'Kobalt'),
('Pintura acrilica blanca', 'Pintura', 'Alesamex'),
('Tornillos para concreto', 'Clavos y Tornillos', 'Pretul'),
('Serrucho', 'Carpintería', 'Trupper'),
('Martillo', 'Carpintería', 'Stanley'),
('Malla metálica', 'Mallas', 'Kobalt'),
('Manguera #10', 'Construcción', 'Porter-Cable'),
('Manguera #12', 'Construcción', 'Porter-Cable'),
('Manguera #14', 'Construcción', 'Porter-Cable'),
('Manguera #18', 'Construcción', 'Porter-Cable'),
('Cable eletrico #10', 'Cables y Cadenas', 'Porter-Cable'),
('Cable eletrico #12', 'Cables y Cadenas', 'Porter-Cable'),
('Cable eletrico #14', 'Cables y Cadenas', 'Porter-Cable'),
('Cable eletrico #16', 'Cables y Cadenas', 'Porter-Cable'),
('Caja de herramientas', 'Organizadores', 'DeWalt'),
('Barniz para madera', 'Lubricantes', 'Alesamex'),
('Pinzas para corte', 'Pinzas', 'Senco'),
('Pistola para espuma de poliuretano', 'Máquinas', 'Senco'),
('Grillete de carga', 'Cables y Cadenas', 'Pretul'),
('Cepillo de carpintero', 'Carpintería', 'Stanley'),
('Taladro', 'Máquinas', 'Trupper'),
('Guantes de trabajo', 'Seguridad', 'DeWalt'),
('Cepillo para yeso', 'Abrasivos y Perforación', 'Foset'),
('Rastrillo de jardín', 'Jardinería', 'Foset'),
('Cinta metrica', 'Cintas', 'Scotch'),
('Pegamento', 'Plomería', 'Scotch'),
('Llave para tubos', 'Plomería', 'DeWalt'),
('Pinzas de presión', 'Pinzas', 'Trupper'),
('Alicate de electricista', 'Corte', 'Bosch'),
('Clavos para techos', 'Clavos y Tornillos', 'Trupper'),
('Llave dinamométrica', 'Plomería', 'Kobalt'),
('Segueta', 'Corte', 'Stanley'),
('Rociador de jardín', 'Jardinería', 'Foset'),
('Martillo de carpintero', 'Carpintería', 'DeWalt'),
('Cinta aislante', 'Cintas', 'Scotch'),
('Trapo industrial', 'Limpieza', 'Trupper'),
('Cepillo metálico', 'Abrasivos y Perforación', 'Stanley'),
('Ruedas para puerta corrediza', 'Varios', 'Kobalt'),
('Pinzas de presión', 'Pinzas', 'Trupper'),
('Sellador de madera', 'Carpintería', 'Alesamex'),
('Taladro inalámbrico', 'Máquinas', 'Trupper'),
('Taladro inalámbrico', 'Máquinas', 'Stanley');


/* Precios */ 
-- INSERT INTO precios (mayoreo, unidad) VALUES
-- (null ,180, 1 ); ej: el producto con id = 1 tienen un precio de 180 por unidad y no de mayoreo
-- acepta valores nulos, no tienen que tener todos ambos precios, pero si deben tener al menos 1   
INSERT INTO precios (mayoreo, pieza, id_producto) VALUES 
(155, 187, 1),
 (27, 33, 2),
 (45, 55, 3),
 (39, 45, 4),
 (48, 58, 5),
 (35, 42, 6),
 (54, 65, 7),
 (235, 285, 8),
 (138, 147, 9),
 (149, 156, 10),
 (165, 170, 11),
 (168, 175, 12),
 (1095, 1325, 13),
 (189, 229, 14),
 (225, 269, 15),
 (2872, 3023, 16),
 (86, 92, 17),
 (75, 92, 18),
 (54, 64, 19),
 (355, 435, 20),
 (399, 485, 21),
 (57, 63, 22),
 (109, 140, 23),
 (50, 53, 24),
 (7, 8, 25),
 (1030, 1145, 26),
 (1255, 1525, 27),
 (205, 245, 28),
 (345, 415, 29),
 (14, 15, 30),
 (97, 117, 31),
 (30, 32, 32),
 (28, 34, 33),
 (32, 33, 34),
 (179, 215, 35),
 (1663, 1750, 36),
 (189, 229, 37),
 (228, 545, 38),
 (21, 25, 39),
 (79, 97, 40),
 (98, 112, 41),
 (143, 151, 42),
 (152, 160, 43),
 (87, 99, 44),
 (79, 85, 45),
 (4, 5, 46),
 (22, 25, 47),
 (5, 6, 48),
 (25, 27, 49),
 (154, 163, 50),
 (30, 35, 51),
 (119, 125, 52),
 (Null, 1944, 53),
 (280, 295, 54),
 (Null, 1395, 55),
 (86, 90, 56),
 (128, 136, 57),
 (820, 895, 58),
 (92, 101, 59),
 (667, 691, 60),
 (95, 103, 61),
 (145, 156, 62),
 (467, 489, 63),
 (8753, 880, 64),
 (1247, 1305, 65),
 (1060, 1159, 66),
 (1196, 1234, 67),
 (133, 138, 68),
 (61, 66, 69),
 (1048, 1137, 70),
 (97, 108, 71),
 (174, 183, 72),
 (6985, 7116, 73),
 (356, 379, 74),
 (163, 169, 75),
 (614, 629, 76),
 (215, 224, 77),
 (241, 255, 78),
 (64, 71, 79),
 (117, 128, 80),
 (Null, 1299, 81),
 (49, 56, 82),
 (81, 86, 83),
 (178, 192, 84),
 (136, 144, 85),
 (127, 138, 86),
 (127, 140, 87),
 (138, 145, 88),
 (193, 206, 89),
 (224, 237, 90),
 (216, 226, 91),
 (302, 315, 92),
 (377, 397, 93),
 (433, 456, 94),
 (195, 213, 95),
 (278, 290, 96),
 (317, 331, 97),
 (362, 376, 98),
 (Null, 1143, 99),
 (207, 223, 100),
 (173, 189, 101),
 (184, 195, 102),
 (254, 279, 103),
 (822, 847, 104),
 (716, 749, 105),
 (265, 287, 106),
 (74, 89, 107),
 (137, 155, 108),
 (41, 56, 109),
 (238, 257, 110),
 (61, 67, 111),
 (209, 226, 112),
 (292, 313, 113),
 (265, 279, 114),
 (471, 498, 115),
 (121, 129, 116),
 (209, 220, 117),
 (158, 165, 118),
 (403, 427, 119),
 (33, 39, 120),
 (398, 415, 121),
 (278, 296, 122),
 (231, 243, 123),
 (98, 106, 124),
 (Null, 1435, 125),
 (Null, 2299, 126);


/* Sucursales*/ 
INSERT INTO sucursales (nombre, ubicacion) VALUES
('Rosy', 'Naucalpan de Juárez'),
('Kataskevi', 'Vallejo'),
('Vinimex', 'Naucalpan de Juárez'),
('14 de Mayo', 'Naucalpan de Juárez'),
('Rosy', 'Tlanepantla'),
('Rosy', 'Azcapotzalco'),
('Vinimex', 'Vallejo'),
('Vinimex', 'Nicolas Romero'),
('Vinimex', 'Coacalco'),
('14 de Mayo', 'Ecatepec'),
('Kataskevi', 'Coyoacán'),
('Kataskevi', 'Coacalco'),
('Kataskevi', 'Perisur') ;


/* Provedores tenemos 16 */ 
INSERT INTO proveedores (id_provedor, id_producto, id_sucursal, costo, unidades, credito)
VALUES
(1, 1, 2, 100, 80, '3'),
(1, 3, 2, 100, 80, '3'),
(1, 20, 2, 50, 200, '3'),
(1, 25, 2, 100, 80, '3'),
(1, 27, 2, 20, 200, '3'),
(1, 30, 2, 100, 120, '3'),
(1, 41, 2, 300, 20, '3'),
(1, 58, 2, 100, 200 , '3'),
(1, 59, 2, 500, 40, '3'),
(1, 65, 2, 10, 2000, '3'),
(1, 69, 2, 200, 60, '3'),
(1, 78, 2, 100, 60, '3'),
(1, 88, 2, 2, 2000, '3'),
(1, 120, 2, 30, 200, '3'),
(1, 123, 2, 100, 1600, '3'),
(1, 125, 2, 300, 40, '3'),
(1, 1, 3, 100, 80, '3'),
(1, 3, 3, 100, 80, '3'),
(1, 20, 3, 100, 480, '3'),
(1, 25, 3, 50, 200, '3'),
(1, 27, 3, 100, 80, '3'),
(1, 30, 3, 20, 200, '3'),
(1, 59, 3, 300, 20, '3'),
(1, 65, 3, 100, 200 , '3'),
(1, 69, 3, 500, 40, '3'),
(1, 88, 3, 10, 2000, '3'),
(1, 78, 3, 70, 100, '3'),
(1, 105, 3, 100, 20, '3'),
(1, 112, 3, 200, 60, '3'),
(1, 120, 3, 100, 60, '3'),
(1, 114, 3, 2, 2000, '3'),
(1, 123, 3, 100, 1600, '3'),
(1, 125, 3, 300, 40, '3'),
(1, 1, 4, 100, 80, '3'),
(1, 3, 4, 100, 80, '3'),
(1, 25, 4, 50, 200, '3'),
(1, 30, 4, 20, 200, '3'),
(1, 41, 4, 100, 120, '3'),
(1, 58, 4, 300, 20, '3'),
(1, 59, 4, 100, 200 , '3'),
(1, 65, 4, 500, 40, '3'),
(1, 79, 4, 10, 2000, '3'),
(1, 78, 4, 70, 100, '3'),
(1, 88, 4, 100, 20, '3'),
(1, 105, 4, 200, 60, '3'),
(1, 114, 4, 100, 60, '3'),
(1, 112, 4, 2, 2000, '3'),
(1, 123, 4, 30, 200, '3'),
(1, 125, 4, 100, 1600, '3'),
(1, 1, 1, 100, 80, '3'),
(1, 3, 1, 100, 80, '3'),
(1, 20, 1, 100, 480, '3'),
(1, 25, 1, 50, 200, '3'),
(1, 27, 1, 100, 80, '3'),
(1, 30, 1, 20, 200, '3'),
(1, 65, 1, 500, 40, '3'),
(1, 69, 1, 10, 2000, '3'),
(1, 78, 1, 70, 100, '3'),
(1, 88, 1, 100, 20, '3'),
(1, 105, 1, 200, 60, '3'),
(1, 112, 1, 100, 60, '3'),
(1, 114, 1, 2, 2000, '3'),
(1, 120, 1, 30, 200, '3'),
(1, 123, 1, 100, 1600, '3'),
(1, 125, 1, 300, 40, '3'),
(2, 2, 3, 90, 80, '0'),
(2, 4, 3, 90, 80, '0'),
(2, 17, 3, 90, 70, '0'), 
(2, 26, 3, 200, 8, '0'),
(2, 29, 3, 350, 5, '0'),
(2, 33, 3, 70, 50, '0'),
(2, 38, 3, 150, 20, '0'),
(2, 50, 3, 90, 80, '0'),
(2, 66, 3, 450, 5, '0'),
(2, 82, 3, 2, 800, '0'),
(2, 84, 3, 100, 20, '0'),
(2, 89, 3, 90, 80, '0'),
(2, 104,3, 60, 50, '0'),
(2, 116, 3, 20, 120, '0'),
(2, 121, 3, 90, 80, '0'),
(2, 126, 3, 350, 20, '0'),
(2, 2, 1, 90, 80, '0'),
(2, 4, 1, 90, 80, '0'),
(2, 17, 1, 100, 80, '0'),
(2, 26, 1, 200, 8, '0'),
(2, 29, 1, 350, 5, '0'),
(2, 33, 1, 70, 50, '0'),
(2, 50, 1, 90, 80, '0'),
(2, 66, 1, 450, 5, '0'),
(2, 82, 1, 2, 800, '0'),
(2, 84, 1, 100, 20, '0'),
(2, 89, 1, 90, 80, '0'),
(2, 104,1, 60, 50, '0'),
(2, 116, 1, 20, 120, '0'),
(2, 121, 1, 90, 80, '0'),
(2, 126, 1, 380, 20, '0'),
(2, 2, 4, 90, 80, '0'),
(2, 4, 4, 90, 80, '0'),
(2, 17, 4, 100, 80, '0'),
(2, 26, 4, 200, 8, '0'),
(2, 29, 4, 350, 5, '0'),
(2, 33, 4, 70, 50, '0'),
(2, 38, 4, 150, 20, '0'),
(2, 50, 4, 90, 80, '0'),
(2, 66, 4, 450, 5, '0'),
(2, 82, 4, 2, 800, '0'),
(2, 84, 4, 100, 20, '0'),
(2, 89, 4, 90, 80, '0'),
(2, 104, 4, 60, 50, '0'),
(2, 116, 4, 20, 120, '0'),
(2, 121, 4, 90, 80, '0'),
(2, 126, 4, 380, 20, '0'),
(2, 2, 2, 90, 80, '0'),
(2, 4, 2, 90, 80, '0'),
(2, 17, 2, 100, 80, '0'),
(2, 26, 2, 200, 8, '0'),
(2, 29, 2, 350, 5, '0'),
(2, 66, 2, 450, 5, '0'),
(2, 82, 2, 2, 800, '0'),
(2, 84, 2, 100, 20, '0'),
(2, 89, 2, 90, 80, '0'),
(2, 104, 2, 60, 50, '0'),
(2, 116, 2, 20, 120, '0'),
(2, 121, 2, 90, 80, '0'),
(2, 126, 2, 380, 20, '0'),
(3, 5, 1, 15, 300, '3'),
(3, 16, 1, 120, 15, '3'),
(3, 42, 1, 8, 200, '3'),
(3, 43, 1, 15, 300, '3'),
(3, 52, 1, 40, 100, '3'),
(3, 56, 1, 5, 500, '3'),
(3, 72, 1, 110, 30, '3'),
(3, 85, 1, 100, 30, '3'),
(3, 90, 1, 100, 400, '3'),
(3, 115, 1, 150, 30, '3'),
(3, 5, 2, 15, 300, '3'),
(3, 16, 2, 120, 15, '3'),
(3, 21, 2, 100, 20, '3'),
(3, 42, 2, 8, 200, '3'),
(3, 43, 2, 15, 300, '3'),
(3, 52, 2, 40, 100, '3'),
(3, 56, 2, 5, 500, '3'),
(3, 72, 2, 110, 30, '3'),
(3, 85, 2, 100, 30, '3'),
(3, 90, 2, 100, 400, '3'),
(3, 115,2, 150, 30, '3'),
(3, 122, 2, 100, 15, '3'),
(3, 5, 3, 15, 300, '3'),
(3, 16, 3, 120, 15, '3'),
(3, 21, 3, 100, 20, '3'),
(3, 42, 3, 8, 200, '3'),
(3, 43, 3, 15, 300, '3'),
(3, 52, 3, 40, 100, '3'),
(3, 56, 3, 5, 500, '3'),
(3, 72, 3, 110, 30, '3'),
(3, 85, 3, 100, 30, '3'),
(3, 122, 3, 100, 15, '3'),
(3, 5, 4, 15, 300, '3'),
(3, 21, 4, 100, 20, '3'),
(3, 42, 4, 8, 200, '3'),
(3, 43, 4, 15, 300, '3'),
(3, 52, 4, 40, 100, '3'),
(3, 56, 4, 5, 500, '3'),
(3, 72, 4, 110, 30, '3'),
(3, 85, 4, 100, 30, '3'),
(3, 90, 4, 100, 400, '3'),
(3, 115,4 , 150, 30, '3'),
(3, 122, 4, 100, 15, '3'),
(4, 6, 4, 30, 20, '6'),
(4, 9, 4, 25, 250, '6'),
(4, 10, 4, 25, 250, '6'),
(4, 11, 4, 25, 250, '6'),
(4, 12, 4, 25, 250, '6'),
(4, 34, 4, 40, 350, '6'),
(4, 48, 4, 20, 250, '6'),
(4, 49, 4, 30, 350, '6'),
(4, 6, 3, 30, 20, '6'),
(4, 9, 3, 25, 250, '6'),
(4, 10, 3, 25, 250, '6'),
(4, 11, 3, 25, 250, '6'),
(4, 12, 3, 25, 250, '6'),
(4, 34, 3, 40, 350, '6'),
(4, 49, 3, 30, 350, '6'),
(4, 6, 2, 30, 20, '6'),
(4, 10, 2, 25, 250, '6'),
(4, 11, 2, 25, 250, '6'),
(4, 12, 2, 25, 250, '6'),
(4, 34, 2, 40, 350, '6'),
(4, 48, 2, 20, 250, '6'),
(4, 49, 2, 30, 350, '6'),
(4, 6, 1, 30, 20, '6'),
(4, 9, 1, 25, 250, '6'),
(4, 11, 1, 25, 250, '6'),
(4, 12, 1, 25, 250, '6'),
(4, 34, 1, 40, 350, '6'),
(4, 48, 1, 20, 250, '6'),
(4, 49, 1, 30, 350, '6'),
(5, 7, 1 , 20, 100, '3'),
(5, 23, 1 , 200, 10, '3'),
(5, 44, 1 , 20, 100, '3'),
(5, 73, 1 , 120, 80, '3'),
(5, 79, 1 , 20, 100, '3'),
(5, 113, 1 , 120, 100, '3'),
(5, 7, 2 , 20, 100, '3'),
(5, 23, 2 , 200, 10, '3'),
(5, 24, 2 , 180, 100, '3'),
(5, 44, 2 , 20, 100, '3'),
(5, 73, 2 , 120, 80, '3'),
(5, 79, 2 , 20, 100, '3'),
(5, 113, 2 , 120, 100, '3'),
(5, 7, 3 , 20, 100, '3'),
(5, 23, 3 , 200, 10, '3'),
(5, 24, 3 , 180, 100, '3'),
(5, 44, 3 , 20, 100, '3'),
(5, 73, 3 , 120, 80, '3'),
(5, 79, 3 , 20, 100, '3'),
(5, 113, 3 , 120, 100, '3'),
(5, 7, 4 , 20, 100, '3'),
(5, 44, 4 , 20, 100, '3'),
(5, 73, 4 , 120, 80, '3'),
(5, 79, 4 , 20, 100, '3'),
(5, 113,4 , 120, 100, '3'),
(6, 99, 2, 380, 10, '6'),
(6, 106, 2, 180, 20, '6'),
(6, 111, 2, 80, 10, '6'),
(6, 118, 2, 150 , 30, '6'),
(6, 67, 2, 480, 10, '6'),
(6, 55, 2, 30, 100, '6'),
(6, 53, 2, 380, 10, '6'),
(6, 8, 2, 110, 80, '6'),
(6, 14, 2, 120, 20, '6'),
(6, 99, 1, 380, 10, '6'),
(6, 106, 1, 180, 20, '6'),
(6, 111, 1, 80, 10, '6'),
(6, 118, 1, 150 , 30, '6'),
(6, 67, 1, 480, 10, '6'),
(6, 55, 1, 30, 100, '6'),
(6, 53, 1, 380, 10, '6'),
(6, 28, 1, 12, 550, '6'),
(6, 35, 1, 100, 80, '6'),
(6, 8, 1, 110, 80, '6'),
(6, 14, 1, 120, 20, '6'),
(6, 99, 3, 380, 10, '6'),
(6, 106, 3, 180, 20, '6'),
(6, 111, 3, 80, 10, '6'),
(6, 118, 3, 150 , 30, '6'),
(6, 67, 3, 480, 10, '6'),
(6, 55, 3, 30, 100, '6'),
(6, 53, 3, 380, 10, '6'),
(6, 28, 3, 12, 550, '6'),
(6, 35, 3, 100, 80, '6'),
(6, 14,3, 120, 20, '6'),
(6, 99, 4, 380, 10, '6'),
(6, 106, 4, 180, 20, '6'),
(6, 111, 4, 80, 10, '6'),
(6, 118, 4, 150 , 30, '6'),
(6, 67, 4, 480, 10, '6'),
(6, 55, 4, 30, 100, '6'),
(6, 53, 4, 380, 10, '6'),
(6, 28, 4, 12, 550, '6'),
(6, 35, 4, 100, 80, '6'),
(6, 8, 4, 110, 80, '6'),
(6, 14, 4, 120, 20, '6'),
(7, 13, 1, 200, 30, '0'),
(7, 31, 1, 2, 300, '0'),
(7, 45, 1, 2, 300, '0'),
(7, 75, 1, 20, 30, '0'),
(7, 76, 1, 400, 30, '0'),
(7, 81, 1, 100, 30, '0'),
(7, 87, 1, 8, 300, '0'),
(7, 103, 1, 20, 90, '0'),
(7, 13, 2, 200, 30, '0'),
(7, 45, 2, 2, 300, '0'),
(7, 75, 2, 20, 30, '0'),
(7, 76, 2, 400, 30, '0'),
(7, 81, 2, 100, 30, '0'),
(7, 87, 2, 8, 300, '0'),
(7, 103, 2, 20, 90, '0'),
(7, 75, 3, 20, 30, '0'),
(7, 76, 3, 400, 30, '0'),
(7, 81, 3, 100, 30, '0'),
(7, 87, 3, 8, 300, '0'),
(7, 31, 4, 2, 300, '0'),
(7, 45, 4, 2, 300, '0'),
(7, 75, 4, 20, 30, '0'),
(7, 76, 4, 400, 30, '0'),
(7, 81, 4, 100, 30, '0'),
(7, 87, 4, 8, 300, '0'),
(7, 103,4, 20, 90, '0'),
(8, 15, 3, 130, 20, '6'),
(8, 22, 3, 130, 30, '6'),
(8, 32, 3, 150, 20, '6'),
(8, 46, 3, 25, 200, '6'),
(8, 51, 3, 450, 20, '6'),
(8, 47, 1 , 30, 110, '0'),
(8, 47, 2 , 30, 110, '0'),
(8, 47, 3 , 30, 110, '0'),
(8, 47, 4 , 30, 110, '0'),
(8, 108, 3, 130, 20, '6'),
(8, 117, 3, 180, 10, '6'),
(8, 15, 2, 130, 20, '6'),
(8, 22, 2, 130, 30, '6'),
(8, 32, 2, 150, 20, '6'),
(8, 46, 2, 25, 200, '6'),
(8, 51, 2, 450, 20, '6'),
(8, 117, 2, 180, 10, '6'),
(8, 15, 1, 130, 20, '6'),
(8, 22, 1, 130, 30, '6'),
(8, 32, 1, 150, 20, '6'),
(8, 107,1, 130, 40, '6'),
(8, 108, 1, 130, 20, '6'),
(8, 117, 1, 180, 10, '6'),
(8, 15, 4, 130, 20, '6'),
(8, 22, 4, 130, 30, '6'),
(8, 32, 4, 150, 20, '6'),
(8, 46, 4, 25, 200, '6'),
(8, 51, 4, 450, 20, '6'),
(8, 107, 4, 130, 40, '6'),
(8, 108, 4, 130, 20, '6'),
(9, 18, 1, 5, 150, '3'),  
(9, 19, 1, 10, 150, '3'),  
(9, 39, 1, 70, 100, '3'),  
(9, 40, 1, 80, 150, '3'),  
(9, 101, 1, 100, 50, '3'),  
(9, 102, 1, 200, 15, '3'),  
(9, 18, 4, 5, 150, '3'),  
(9, 19, 4, 10, 150, '3'),  
(9, 39, 4, 70, 100, '3'),  
(9, 40, 4, 80, 150, '3'),  
(9, 101, 4, 100, 50, '3'),  
(9, 102, 4, 200, 15, '3'),  
(9, 18, 3, 5, 150, '3'),  
(9, 19, 3, 10, 150, '3'),  
(9, 39, 3, 70, 100, '3'),  
(9, 40, 3, 80, 150, '3'),  
(9, 101, 3, 100, 50, '3'),  
(9, 102, 3, 200, 15, '3'),
(9, 18, 2, 5, 150, '3'),  
(9, 19, 2, 10, 150, '3'),  
(9, 39, 2, 70, 100, '3'),  
(9, 40, 2, 80, 150, '3'),  
(9, 101, 2, 100, 50, '3'),  
(9, 102, 2, 200, 15, '3'),
(10, 36, 1 , 150, 40, '3'),
(10, 37, 1 , 100, 40, '3'),
(10, 57, 1 , 15, 400, '3'),
(10, 71, 1 , 20, 200, '3'),
(10, 36, 2 , 150, 40, '3'),
(10, 37, 2 , 100, 40, '3'),
(10, 57, 2 , 15, 400, '3'),
(10, 71, 2 , 20, 200, '3'),
(10, 36, 4 , 150, 40, '3'),
(10, 37, 4 , 100, 40, '3'),
(10, 57, 4 , 15, 400, '3'),
(10, 71, 4 , 20, 200, '3'),
(10, 36, 3 , 150, 40, '3'),
(10, 37, 3 , 100, 40, '3'),
(10, 57, 3 , 15, 400, '3'),
(10, 71,3 , 20, 200, '3'),
(11, 54, 1 , 30, 110, '0'),
(11, 70, 1 , 150, 10, '0'),
(11, 80, 1 , 10, 160, '0'),
(11, 54, 2 , 30, 110, '0'),
(11, 70, 2 , 150, 10, '0'),
(11, 80, 2 , 10, 160, '0'),
(11, 54, 3 , 30, 110, '0'),
(11, 70, 3 , 150, 10, '0'),
(11, 80, 3 , 10, 160, '0'),
(11, 54, 4, 30, 110, '0'),
(11, 70, 4 , 150, 10, '0'),
(11, 80, 4 , 10, 160, '0'),
(12, 60, 4 , 50, 220, '0'),
(12, 61, 4 , 20, 20, '0'),
(12, 62, 4 , 30, 220, '0'),
(12, 63, 4 , 80, 20, '0'),
(12, 60, 2 , 50, 220, '0'),
(12, 61, 2 , 20, 20, '0'),
(12, 62, 2 , 30, 220, '0'),
(12, 63, 2 , 80, 20, '0'),
(12, 60, 3 , 50, 220, '0'),
(12, 61, 3 , 20, 20, '0'),
(12, 62, 3 , 30, 220, '0'),
(12, 63, 3 , 80, 20, '0'),
(12, 60, 1 , 50, 220, '0'),
(12, 61, 1 , 20, 20, '0'),
(12, 62, 1 , 30, 220, '0'),
(12, 63, 1 , 80, 20, '0'),
(13, 64, 4, 90, 70, '3'),
(13, 68, 4, 120, 70, '3'),
(13, 74, 4, 100, 70, '3'),
(13, 83, 4, 90, 70, '3'),
(13, 86, 4, 120, 70, '3'),
(13, 100, 4, 150, 50, '3'),
(13, 124, 4, 190, 50, '3'),
(13, 64, 1, 90, 70, '3'),
(13, 68, 1, 120, 70, '3'),
(13, 74, 1, 100, 70, '3'),
(13, 83, 1, 90, 70, '3'),
(13, 86, 1, 120, 70, '3'),
(13, 100, 1, 150, 50, '3'),
(13, 124, 1, 190, 50, '3'),
(13, 64, 3, 90, 70, '3'),
(13, 68, 3, 120, 70, '3'),
(13, 74, 3, 100, 70, '3'),
(13, 83, 3, 90, 70, '3'),
(13, 86, 3, 120, 70, '3'),
(13, 100, 3, 150, 50, '3'),
(13, 124, 3, 190, 50, '3'),
(13, 64, 2, 90, 70, '3'),
(13, 68, 2, 120, 70, '3'),
(13, 74, 2, 100, 70, '3'),
(13, 83, 2, 90, 70, '3'),
(13, 86, 2, 120, 70, '3'),
(13, 100, 2, 150, 50, '3'),
(13, 124, 2, 190, 50, '3'),
(14, 77, 1, 45, 200, '6'),
(14, 77, 2, 45, 200, '6'),
(14, 77, 3, 45, 200, '6'),
(14, 77, 4, 45, 200, '6'),
(15, 91, 1, 15, 200, '0'),
(15, 92, 1, 20, 200, '0'),
(15, 93, 1, 20, 200, '0'),
(15, 94, 1, 20, 200, '0'),
(15, 95, 1, 20, 200, '0'),
(15, 96, 1, 20, 200, '0'),
(15, 97, 1, 20, 200, '0'),
(15, 98, 1, 20, 200, '0'),
(15, 91, 2, 15, 200, '0'),
(15, 92, 2, 20, 200, '0'),
(15, 93, 2, 20, 200, '0'),
(15, 94, 2, 20, 200, '0'),
(15, 95, 2, 20, 200, '0'),
(15, 96, 2, 20, 200, '0'),
(15, 97, 2, 20, 200, '0'),
(15, 98, 2, 20, 200, '0'),
(15, 91, 3, 15, 200, '0'),
(15, 92, 3, 20, 200, '0'),
(15, 93, 3, 20, 200, '0'),
(15, 94, 3, 20, 200, '0'),
(15, 95, 3, 20, 200, '0'),
(15, 96, 3, 20, 200, '0'),
(15, 97, 3, 20, 200, '0'),
(15, 98, 3, 20, 200, '0'),
(15, 91, 4, 15, 200, '0'),
(15, 92, 4, 20, 200, '0'),
(15, 93, 4, 20, 200, '0'),
(15, 94, 4, 20, 200, '0'),
(15, 95, 4, 20, 200, '0'),
(15, 96, 4, 20, 200, '0'),
(15, 97, 4, 20, 200, '0'),
(15, 98, 4, 20, 200, '0'),
(16, 109, 1, 10, 100, '0' ),
(16, 110, 1, 25, 180, '0' ),
(16, 119, 1, 10, 100, '0' ),
(16, 109, 2, 10, 100, '0' ),
(16, 110, 2, 25, 180, '0' ),
(16, 119, 2, 10, 100, '0' ),
(16, 109, 3, 10, 100, '0' ),
(16, 110, 3, 25, 180, '0' ),
(16, 119, 3, 10, 100, '0' ),
(16, 109, 4, 10, 100, '0' ),
(16, 110, 4, 25, 180, '0' ),
(16, 119, 4, 10, 100, '0' );


/* Clientes tenemos 38  */ 
INSERT INTO clientes (nombre_cliente, telefono, correo, direccion) VALUES
('Juan Pérez', 5551234567, 'juanperez@email.com', 'Calle Principal #123'),
('María García', 5559876543, 'mariagarcia@email.com', 'Avenida Independencia #456'),
('Carlos López', 5551112233, 'carloslopez@email.com', 'Boulevard de las Flores #789'),
('Roberto Rodríguez', 5554433221, 'robertorodriguez@email.com', 'Avenida del Bosque #890'),
('Laura Hernández', 5557766554, 'laurahernandez@email.com', 'Boulevard de las Palmeras #321'),
('Juan Pérez', 5559998888, 'juanperez2@email.com', 'Calle de la Luz #111'),
('Diego Sánchez', 5557771111, 'diegosanchez@email.com', 'Avenida del Parque #222'),
('Elena Gómez', 5558887777, 'elenagomez@email.com', 'Calle del Mar #333'),
('Carlos López', 5556665555, 'carloslopez2@email.com', 'Avenida de la Luna #444'),
('María García', 5554443333, 'mariagarcia2@email.com', 'Boulevard de las Estrellas #555'),
('Alejandra Martínez', 5552221111, 'alejandramartinez2@email.com', 'Calle de las Nubes #666'),
('Roberto Rodríguez', 5558889999, 'robertorodriguez2@email.com', 'Avenida de los Pinos #777'),
('Laura Hernández', 5557770000, 'laurahernandez2@email.com', 'Boulevard del Amanecer #888'),
('Diego Sánchez', 5558889999, 'diegosanchez@email.com', 'Calle de la Luna #234'),
('Elena Gómez', 5557778888, 'elenagomez@email.com', 'Avenida del Sol #765'),
('Sofía Torres', 5556667777, 'sofiatorres@email.com', 'Calle del Monte #876'),
('Luis Ramírez', 5555558888, 'luisramirez@email.com', 'Avenida de las Flores #987'),
('Paola Díaz', 5559992222, 'paoladiaz@email.com', 'Boulevard del Mar #654'),
('Ricardo Vargas', 5558881111, 'ricardovargas@email.com', 'Calle de la Montaña #543'),
('Carmen Ruiz', 5557774444, 'carmenruiz@email.com', 'Avenida de la Playa #432'),
('Javier Reyes', 5556663333, 'javierreyes@email.com', 'Calle de la Selva #321'),
('Ana Martín', 5555552222, 'anamartin@email.com', 'Avenida del Río #210'),
('Pedro Hernández', 5554441111, 'pedrohernandez@email.com', 'Boulevard del Lago #109'),
('Mónica Silva', 5553338888, 'monicasilva@email.com', 'Calle de la Ciudad #098'),
('Andrés González', 5552225555, 'andresgonzalez@email.com', 'Avenida de la Colina #087'),
('Valeria Soto', 5551117777, 'valeriasoto@email.com', 'Calle de la Plaza #076'),
('Fernando Castillo', 5559994444, 'fernandocastillo@email.com', 'Avenida del Parque #765'),
('Gabriela Ortega', 5558883333, 'gabrielaortega@email.com', 'Boulevard de la Fuente #654'),
('Roberto Núñez', 5557779999, 'robertonunez@email.com', 'Calle de la Alameda #543'),
('Natalia Herrera', 5556666666, 'nataliaherrera@email.com', 'Avenida de la Escuela #432'),
('Mateo Jiménez', 5555555555, 'mateojimenez@email.com', 'Boulevard del Templo #321'),
('Liliana Paredes', 5554444444, 'lilianaparedes@email.com', 'Calle de la Estación #210'),
('Héctor Castro', 5553333333, 'hectorcastro@email.com', 'Avenida del Mercado #109'),
('Carolina Mendoza', 5552222222, 'carolinamendoza@email.com', 'Calle del Teatro #098'),
('David Rosas', 5551111111, 'davidrosas@email.com', 'Boulevard de la Iglesia #087'),
('Julia Lozano', 5559990000, 'julialozano@email.com', 'Avenida del Hospital #076'),
('Marcos Flores', 5558880000, 'marcosflores@email.com', 'Calle de la Biblioteca #765'),
('Lucía Ríos', 5557770000, 'luciaríos@email.com', 'Boulevard de la Plaza #654');



/* Pedido */  
-- INSERT INTO pedido (id_producto, id_sucursal, cantidad, id_cliente, fecha_hora) VALUES 
-- (1, 2, 3, 5, '2023-10-15 08:30:00')  Ej: El cliente 5 compró 3 piezas del producto 1 en la sucursal 2 el día '2023-10-15 08:30:00'
-- la ferretería tiene un horario de 8:00 - 18:00 por lo que los pedidos sólo entrarán entre ese lapso de tiempo
INSERT INTO pedidos(id_producto, id_sucursal, cantidad, id_cliente,fecha_hora) VALUES 
(62,12,8,11,'2020-02-02 16:02:27'),
(13,10,2,34,'2020-06-28 11:08:41'),
(4,13,44,18,'2021-09-03 13:02:49'),
(25,6,13,21,'2021-09-20 16:11:11'),
(116,12,40,1,'2022-08-02 16:16:31'),
(24,11,90,37,'2023-07-23 11:07:40'),
(83,4,56,38,'2020-05-22 10:01:35'),
(10,3,63,33,'2021-12-22 13:24:43'),
(70,13,31,38,'2023-10-22 17:23:01'),
(2,6,12,21,'2023-09-20 16:11:11'),
(116,12,40,1,'2022-08-02 16:16:31'),
(13,11,46,21,'2023-08-18 14:09:34'),
(18,12,13,33,'2022-03-26 08:14:05'),
(1,5,40,27,'2021-10-19 14:49:11'),
(101,4,5,4,'2023-01-20 16:25:14'),
(112,5,31,10,'2020-11-04 11:33:19'),
(17,10,26,12,'2023-12-02 15:07:17'),
(6,11,51,16,'2022-07-12 17:04:14'),
(90,4,71,32,'2021-08-06 13:28:47'),
(13,10,2,36,'2020-06-28 11:08:41'),
(4,13,44,10,'2021-09-03 13:02:49'),
(95,12,100,17,'2020-07-01 15:57:38'),
(81,5,29,9,'2021-07-24 09:36:49'),
(71,11,32,6,'2023-10-03 11:26:36'),
(104,10,9,11,'2020-11-30 15:03:43'),
(80,5,66,30,'2023-10-13 10:56:26'),
(17,13,52,8,'2021-11-19 14:30:31'),
(83,8,23,24,'2021-04-19 10:28:30'),
(69,10,36,2,'2021-10-05 12:43:32'),
(111,11,94,16,'2021-07-29 12:22:11'),
(6,13,15,38,'2020-02-08 17:07:36'),
(53,2,79,30,'2020-09-14 14:58:30'),
(107,10,63,22,'2020-01-05 17:51:59'),
(10,13,30,8,'2022-03-07 12:47:08'),
(91,5,29,9,'2021-07-24 09:30:49'),
(61,11,32,6,'2023-10-03 11:29:36'),
(14,10,9,11,'2020-11-30 15:03:43'),
(87,5,66,30,'2023-10-13 12:56:26'),
(1,13,52,8,'2021-11-19 14:30:31'),
(3,8,23,24,'2021-04-19 10:28:30'),
(9,10,36,2,'2021-10-05 14:43:32'),
(25,6,13,21,'2021-08-20 16:20:11'),
(116,12,40,13,'2022-08-02 16:16:31');



/* Supongamos que se quiere reubicar una sucursal, con update podemos actualizar la informacion y seguir trabajando*/ 
UPDATE sucursales
SET ubicacion = 'Santa Fe'
WHERE id_sucursal = 1; /* actualizamos la ubicación de la sucursal 1*/



SELECT * FROM productos
WHERE categoria LIKE '%tornillo%'
ORDER BY marca; /*Regresa todos los productos cuya categoría contiene la palabra 
"tornillo" y los ordena alfabéticamente por marca.*/

SELECT id_cliente, RTRIM(nombre_cliente) AS nombre_cliente_sin_espacios
FROM clientes
ORDER BY nombre_cliente_sin_espacios; /* eliminamos los espacios a la derecha de los nombres de la tabla clientes*/

/*----------------------------------------------------------------------------------------------------
Subconsultas y funciones de agregación con LIMIT, MAX, MIN, PROMEDIO, CROSSTAB, etc.*/

SELECT p.id_ticket, CONCAT(c.nombre_cliente, ' - ', c.telefono) AS cliente_info, CONCAT(pr.descripcion, ' - ', pr.marca) AS producto_info
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN productos pr ON p.id_producto = pr.id_producto
LIMIT 5; /* Se obtienen los primeros 5 pedidos junto con la información del cliente 
y la descripción del producto, así podemos visualizar mejor la información, podemos modificar LIMIT*/

SELECT id_provedor, AVG(unidades) AS promedio_unidades
FROM proveedores
WHERE unidades IS NOT NULL
GROUP BY id_provedor; /* Obtiene el promedio de unidades de productos 
vendidos por los proveedores */

SELECT c.*
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE p.fecha_hora = (SELECT MAX(fecha_hora) FROM pedidos); /* Regresa la información del 
cliente que ha realizado el pedido más reciente */ 

SELECT s.nombre AS Sucursal,
       COUNT(CASE WHEN pr.categoria = 'Herramientas' THEN 1 END) AS Herramientas,
       COUNT(CASE WHEN pr.categoria = 'Construcción' THEN 1 END) AS Construccion,
       COUNT(CASE WHEN pr.categoria = 'Electricidad' THEN 1 END) AS Electricidad
FROM pedidos p
JOIN productos pr ON p.id_producto = pr.id_producto
JOIN sucursales s ON p.id_sucursal = s.id_sucursal
GROUP BY s.nombre;  /* Se obtiene un resumen de la cantidad de pedidos 
realizados por cada sucursal, organizado por categorías de los productos. */

/*----------------------------------------------------------------------------------
Consultas, subconsultas JOIN, UNION, CASE, ALIAS, COALESCE */
 

/*Para la siguiente consulta, agregaremos un campo a nuestra tabla de proveedores, para que 
de esta manera nos sea más fácil identificarlos no sólo por su id */
ALTER TABLE proveedores ADD COLUMN nombre_proveedor VARCHAR(250) not null;



UPDATE proveedores SET nombre_proveedor = 'Gimbel' WHERE id_provedor= 1;
UPDATE proveedores SET nombre_proveedor = 'Felisa' WHERE id_provedor =2;
UPDATE proveedores SET nombre_proveedor = 'Matusa' WHERE id_provedor =3;
UPDATE proveedores SET nombre_proveedor = 'PYSESA' WHERE id_provedor =4;
UPDATE proveedores SET nombre_proveedor = 'SAET' WHERE id_provedor =5;
UPDATE proveedores SET nombre_proveedor = 'CEREHOFE' WHERE id_provedor =6;
UPDATE proveedores SET nombre_proveedor = 'TUXPAM' WHERE id_provedor =7;
UPDATE proveedores SET nombre_proveedor = 'PROMAT' WHERE id_provedor =8;
UPDATE proveedores SET nombre_proveedor = 'PYASUR' WHERE id_provedor =9;
UPDATE proveedores SET nombre_proveedor = 'PRACTICO' WHERE id_provedor =10;
UPDATE proveedores SET nombre_proveedor = 'Fedeqro' WHERE id_provedor =11;
UPDATE proveedores SET nombre_proveedor = 'Ferreteria Acevedo' WHERE id_provedor =12;
UPDATE proveedores SET nombre_proveedor = 'Domos Copernico' WHERE id_provedor =13;
UPDATE proveedores SET nombre_proveedor = 'Basingen Group' WHERE id_provedor =14;
UPDATE proveedores SET nombre_proveedor = 'AmeTrade' WHERE id_provedor =15;
UPDATE proveedores SET nombre_proveedor = 'ACIMAX' WHERE id_provedor =16;

SELECT nombre_cliente AS nombre FROM clientes
UNION
SELECT nombre_proveedor AS nombre FROM proveedores; /* Obtener una lista de nombres de clientes 
y proveedores en una sola columna. */

SELECT pr.descripcion AS producto, pr.marca, s.nombre AS sucursal_proveedor
FROM productos pr
JOIN proveedores prov ON pr.id_producto = prov.id_producto
JOIN sucursales s ON prov.id_sucursal = s.id_sucursal; /* Regresa información de los productos 
junto con el nombre de la sucursal que los provee.*/

SELECT
    p.id_ticket,
    pr.descripcion AS producto,
    c.nombre_cliente AS cliente,
    COALESCE(c.correo, 'Sin correo') AS correo_cliente,
    CASE
        WHEN pr.categoria IS NOT NULL THEN pr.categoria
        ELSE 'Sin categoría'
    END AS categoria_producto
FROM pedidos p
LEFT JOIN clientes c ON p.id_cliente = c.id_cliente
LEFT JOIN productos pr ON p.id_producto = pr.id_producto; /* Muestra un resumen de los pedidos, 
indicando si el cliente proporcionó un correo electrónico y la categoría del producto.*/

/*---------------------------------------------------------------------------------------------
Vistas y funciones*/

CREATE VIEW vista_pedidos AS
SELECT
    p.id_ticket,
    pr.descripcion AS producto,
    c.nombre_cliente AS cliente,
    p.cantidad,
    p.fecha_hora
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN productos pr ON p.id_producto = pr.id_producto; /* Creación de una vista que muestra la 
información de los pedidos, con detalles de clientes y productos*/


CREATE VIEW vista_productos_sucursales AS
SELECT 
	s.nombre AS sucursal,
    s.ubicacion AS ubicacion,
    pr.descripcion AS producto,
    pr.marca AS marca,
    pro.unidades AS unidades,
    p.pieza AS precio_unidad,
    p.mayoreo AS precio_mayoreo
FROM precios p
JOIN productos pr ON p.id_producto = pr.id_producto
JOIN proveedores pro ON pro.id_producto=pr.id_producto
JOIN sucursales s ON pro.id_sucursal = s.id_sucursal; /* Creación de una vista que muestra los productos que tienen las sucursales, 
la cantidad y los precios.*/
	

CREATE VIEW vista_ventas AS
SELECT 
	s.nombre AS sucursal,
    s.ubicacion AS ubicacion,
    pr.descripcion AS producto,
    pr.marca AS marca,
    p.cantidad AS unidades
FROM pedidos p  
JOIN productos pr ON p.id_producto = pr.id_producto
JOIN sucursales s ON p.id_sucursal = s.id_sucursal; /* Creación de una vista que muestra las ventas por sucursal.*/


DELIMITER //
CREATE FUNCTION calcular_descuento(total INT, porcentaje_descuento INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    DECLARE descuento INT;
    SET descuento = total * porcentaje_descuento / 100;
    RETURN descuento;
END //
DELIMITER ;
SELECT calcular_descuento(100, 10) AS descuento;


/* ------------------------------------------------FUNCIONES CON FECHAS Y HORAS */ 

/* Para saber en que día estamos :p  */
select current_date; 

-- Función que devuelve la hora con más ventas
DELIMITER //
CREATE FUNCTION hora_mas_ventas() RETURNS TIME
DETERMINISTIC
NO SQL
BEGIN
    DECLARE hora_max TIME;
    
    SELECT TIME(fecha_hora) INTO hora_max
    FROM pedidos
    GROUP BY TIME(fecha_hora)
    ORDER BY COUNT(*) DESC
    LIMIT 1;
    
    RETURN hora_max;
END //
DELIMITER ;
Select hora_mas_ventas();  /* Dice que a las 4 de la tarde  */  

-- Función que devuelve el día con más ventas de un producto específico
DELIMITER //
CREATE FUNCTION dia_mas_ventas_producto(producto_id INT) RETURNS DATE
DETERMINISTIC
NO SQL
BEGIN
    DECLARE dia_max DATE;
    
    SELECT DATE(fecha_hora) INTO dia_max
    FROM pedidos
    WHERE id_producto = producto_id
    GROUP BY DATE(fecha_hora)
    ORDER BY COUNT(*) DESC
    LIMIT 1;
    
    RETURN dia_max;
END //
DELIMITER ;
SELECT dia_mas_ventas_producto(3);

-- Crear una función que devuelve los n productos más vendidos en un rango de k días
DELIMITER //
CREATE FUNCTION productos_mas_vendidos_en_rango(n INT, k INT) RETURNS VARCHAR(255)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE productos_mas_vendidos VARCHAR(255);
    
    SELECT GROUP_CONCAT(id_producto) INTO productos_mas_vendidos
    FROM (
        SELECT id_producto, COUNT(*) as total_ventas
        FROM pedidos
        WHERE date(fecha_hora) >= CURDATE() - INTERVAL k YEAR
        GROUP BY id_producto
        ORDER BY total_ventas DESC
        LIMIT n
    ) AS productos_top;
    
    RETURN productos_mas_vendidos;
END //
DELIMITER ;
SELECT productos_mas_vendidos_en_rango(5, 3); -- Obtener los 5 productos más vendidos en los últimos 3 años, nos da los id  

/* -- --------------------------------------------------------SQL dinamico e indices */

-- Crear un procedimiento almacenado para buscar productos según un criterio
DELIMITER //
CREATE PROCEDURE buscar_productos(IN criterio VARCHAR(255))
BEGIN
    SET @sql = CONCAT('SELECT * FROM productos WHERE ', criterio);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

CALL buscar_productos('descripcion LIKE "%Martillo%"');

/* Podemos ver los pedidos entre dos fechas  */
DELIMITER //
CREATE PROCEDURE pedidos_entre_fechas(IN fecha_inicio DATETIME, IN fecha_termino DATETIME)
BEGIN
	SELECT * 
    FROM pedidos
	WHERE fecha_hora BETWEEN fecha_inicio AND fecha_termino
	ORDER BY fecha_hora;
END //
DELIMITER;

#Vemos los pedidos hecho entre '2020-10-01' y'2020-12-29'
CALL pedidos_entre_fechas('2020-10-01','2020-12-29');






select * from productos;

CREATE INDEX idx_categoria
ON productos (categoria); -- para aguilizar la busqueda
