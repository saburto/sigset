INSERT INTO dbo.Region(Id, Nombre)
  VALUES(1, 'Región de Tarapacá')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(2, 'Región de Antofagasta')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(3, 'Región de Atacama')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(4, 'Región de Coquimbo')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(5, 'Región de Valparaiso')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(6, 'Región del Libertador General Bernardo O Higgins')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(7, 'Región del Maule')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(8, 'Región del Bío-Bío')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(9, 'Región del Araucanía')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(10, 'Región de los Lagos')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(11, 'Región de Aysén del General Carlos Ibáñez del Campo')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(12, 'Región de Magallanes y la Antartica Chilena')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(13, 'Región Metropolitana')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(14, 'Región de los Ríos')
GO
INSERT INTO dbo.Region(Id, Nombre)
  VALUES(15, 'Región de Arica y Parinacota')
GO


INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(1, 1, 'Iquique')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(2, 2, 'Tocopilla')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(3, 2, 'El Loa')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(4, 2, 'Antofagasta')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(5, 3, 'Chañaral')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(6, 3, 'Copiapó')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(7, 3, 'Huasco')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(8, 4, 'Elqui')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(9, 4, 'Limarí')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(10, 4, 'Choapa')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(11, 5, 'Valparaiso')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(12, 5, 'Petorca')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(13, 5, 'Los Andes')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(14, 5, 'San Felipe de Aconcagua')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(15, 5, 'Quillota')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(16, 5, 'San Antonio')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(17, 5, 'Isla de Pascua')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(18, 6, 'Cachapoal')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(19, 6, 'Colchagua')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(20, 6, 'Cardenal Caro')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(21, 7, 'Curicó')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(22, 7, 'Talca')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(23, 7, 'Linares')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(24, 7, 'Cauquenes')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(25, 8, 'Ñuble')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(26, 8, 'Bio Bio')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(27, 8, 'Concepción')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(28, 8, 'Arauco')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(29, 9, 'Malleco')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(30, 9, 'Cautin')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(31, 10, 'Valdivia')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(32, 10, 'Osorno')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(33, 10, 'Llanquihue')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(34, 10, 'Chiloé')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(35, 10, 'Palena')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(36, 11, 'Capitán Prat')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(37, 11, 'Aysen')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(38, 11, 'Coihaique')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(39, 11, 'General Carrera')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(40, 12, 'Ultima Esperanza')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(41, 12, 'Magallanes')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(42, 12, 'Tierra del Fuego')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(43, 12, 'Antartica Chilena')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(44, 13, 'Cordillera')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(45, 13, 'Chacabuco')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(46, 13, 'Maipo')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(47, 13, 'Melipilla')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(48, 13, 'Santiago')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(49, 13, 'Talagante')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(50, 14, 'Valdivia')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(51, 14, 'Ranco')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(52, 15, 'Arica')
GO
INSERT INTO dbo.Provincia(Id, Id_Region, nombre)
  VALUES(53, 15, 'Parinacota')
GO





INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(1, 1, 'Iquique')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(2, 1, 'Alto Hospicio')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(3, 1, 'Huara')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(4, 1, 'Camiña')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(5, 1, 'Colchane')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(6, 1, 'Pica')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(7, 1, 'Pozo Almonte')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(8, 2, 'Tocopilla')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(9, 2, 'Maria Elena')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(10, 3, 'Calama')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(11, 3, 'Ollague')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(12, 3, 'San Pedro de Atacama')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(13, 4, 'Antofagasta')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(14, 4, 'Mejillones')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(15, 4, 'Sierra Gorda')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(16, 4, 'Taltal')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(17, 5, 'Chañaral')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(18, 5, 'Diego de Almagro')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(19, 6, 'Copiapó')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(20, 6, 'Caldera')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(21, 6, 'Tierra Amarilla')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(22, 7, 'Vallenar')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(23, 7, 'Freirina')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(24, 7, 'Huasco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(25, 7, 'Alto del Carmen')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(26, 8, 'La Serena')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(27, 8, 'La Higuera')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(28, 8, 'Coquimbo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(29, 8, 'Andacollo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(30, 8, 'Vicuña')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(31, 8, 'Paihuano')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(32, 9, 'Ovalle')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(33, 9, 'Riio Hurtado')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(34, 9, 'Monte Patria')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(35, 9, 'Combarbalá')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(36, 9, 'Punitaqui')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(37, 10, 'Illapel')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(38, 10, 'Salamanca')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(39, 10, 'Los Vilos')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(40, 10, 'Canela')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(41, 11, 'Valparaíso')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(42, 11, 'Casablanca')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(43, 11, 'Concon')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(44, 11, 'Juan Fernández')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(45, 11, 'Puchuncavi')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(46, 11, 'Quilpué')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(47, 11, 'Quintero')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(48, 11, 'Viña del Mar')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(49, 12, 'Petorca')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(50, 12, 'La Ligua')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(51, 12, 'Cabildo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(52, 12, 'Papudo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(53, 12, 'Zapallar')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(54, 13, 'Los Andes')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(55, 13, 'San Esteban')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(56, 13, 'Calle Larga')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(57, 13, 'Rinconada')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(58, 14, 'San Felipe')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(59, 14, 'Catemu')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(60, 14, 'Llay Llay')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(61, 14, 'Panquehue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(62, 14, 'Putaendo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(63, 14, 'Santa Maria')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(64, 15, 'Quillota')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(65, 15, 'Calera')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(66, 15, 'Hijuelas')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(67, 15, 'Limache')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(68, 15, 'La Cruz')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(69, 15, 'Nogales')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(70, 15, 'Olmué')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(71, 16, 'San Antonio')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(72, 16, 'Algarrobo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(73, 16, 'Cartagena')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(74, 16, 'El Quisco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(75, 16, 'El Tabo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(76, 16, 'Santo Domingo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(77, 17, 'Isla de Pascua')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(78, 18, 'Rancagua')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(79, 18, 'Codegua')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(80, 18, 'Coinco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(81, 18, 'Coltauco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(82, 18, 'Doñihue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(83, 18, 'Graneros')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(84, 18, 'Las Cabras')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(85, 18, 'Mostazal')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(86, 18, 'Machali')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(87, 18, 'Malloa')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(88, 18, 'Olivar')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(89, 18, 'Peumo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(90, 18, 'Pichidegua')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(91, 18, 'Quinta de Tilcoco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(92, 18, 'Rengo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(93, 18, 'Requinoa')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(94, 18, 'San Vicente')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(95, 19, 'San Fernando')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(96, 19, 'Chépica')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(97, 19, 'Chimbarongo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(98, 19, 'Lolol')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(99, 19, 'Nancagua')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(100, 19, 'Palmilla')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(101, 19, 'Peralillo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(102, 19, 'Placilla')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(103, 19, 'Pumanque')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(104, 19, 'Santa Cruz')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(105, 20, 'Pichilemu')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(106, 20, 'La Estrella')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(107, 20, 'Litueche')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(108, 20, 'Marchihue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(109, 20, 'Navidad')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(110, 20, 'Paredones')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(111, 21, 'Curicó')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(112, 21, 'Teno')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(113, 21, 'Romeral')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(114, 21, 'Molina')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(115, 21, 'Sagrada Familia')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(116, 21, 'Hualañé')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(117, 21, 'Licantén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(118, 21, 'Vichuquén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(119, 21, 'Rauco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(120, 22, 'Talca')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(121, 22, 'Pelarco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(122, 22, 'Rio Claro')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(123, 22, 'San Clemente')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(124, 22, 'Maule')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(125, 22, 'San Rafael')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(126, 22, 'Empedrado')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(127, 22, 'Pencahue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(128, 22, 'Constitucion')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(129, 22, 'Curepto')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(130, 23, 'Linares')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(131, 23, 'Yerbas Buenas')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(132, 23, 'Colbún')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(133, 23, 'Longavi')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(134, 23, 'Parral')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(135, 23, 'Retiro')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(136, 23, 'Villa Alegre')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(137, 23, 'San Javier')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(138, 24, 'Cauquenes')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(139, 24, 'Pelluhue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(140, 24, 'Chanco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(141, 25, 'Chillán')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(142, 25, 'Bulnes')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(143, 25, 'Chillan Viejo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(144, 25, 'Cobquecura')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(145, 25, 'Coelemu')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(146, 25, 'Coihueco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(147, 25, 'El Carmen')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(148, 25, 'Ninhue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(149, 25, 'Ñiquén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(150, 25, 'Pemuco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(151, 25, 'Pinto')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(152, 25, 'Portezuelo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(153, 25, 'Quillón')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(154, 25, 'Quirihue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(155, 25, 'Ranquil')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(156, 25, 'San Carlos')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(157, 25, 'San Fabián')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(158, 25, 'San Ignacio')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(159, 25, 'San Nicolás')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(160, 25, 'Trehuaco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(161, 25, 'Yungay')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(162, 26, 'Los Angeles')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(163, 26, 'Alto Bio Bio')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(164, 26, 'Antuco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(165, 26, 'Cabrero')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(166, 26, 'Laja')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(167, 26, 'Mulchén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(168, 26, 'Nacimiento')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(169, 26, 'Negrete')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(170, 26, 'Quilaco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(171, 26, 'Quilleco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(172, 26, 'Santa Bárbara')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(173, 26, 'San Rosendo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(174, 26, 'Tucapel')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(175, 26, 'Yumbel')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(176, 27, 'Concepción')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(177, 27, 'Chiguayante')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(178, 27, 'Coronel')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(179, 27, 'Florida')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(180, 27, 'Hualpén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(181, 27, 'Hualqui')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(182, 27, 'Lota')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(183, 27, 'Penco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(184, 27, 'San Pedro de la Paz')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(185, 27, 'Santa Juana')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(186, 27, 'Talcahuano')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(187, 27, 'Tomé')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(188, 28, 'Arauco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(189, 28, 'Cañete')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(190, 28, 'Contulmo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(191, 28, 'Curanilahue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(192, 28, 'Lebu')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(193, 28, 'Los Alamos')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(194, 28, 'Tirua')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(195, 29, 'Angol')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(196, 29, 'Collipulli')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(197, 29, 'Curacautin')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(198, 29, 'Ercilla')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(199, 29, 'Lonquimay')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(200, 29, 'Los Sauces')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(201, 29, 'Lumaco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(202, 29, 'Purén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(203, 29, 'Renaico')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(204, 29, 'Traiguén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(205, 29, 'Victoria')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(206, 30, 'Temuco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(207, 30, 'Carahue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(208, 30, 'Cholchol')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(209, 30, 'Cunco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(210, 30, 'Curarrehue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(211, 30, 'Freire')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(212, 30, 'Galvarino')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(213, 30, 'Gorbea')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(214, 30, 'Lautaro')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(215, 30, 'Loncoche')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(216, 30, 'Melipeuco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(217, 30, 'Nueva Imperial')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(218, 30, 'Padre las Casas')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(219, 30, 'Perquenco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(220, 30, 'Pitrufquén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(221, 30, 'Pucón')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(222, 30, 'Saavedra')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(223, 30, 'Teodoro Schmidt')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(224, 30, 'Toltén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(225, 30, 'Vilcún')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(226, 30, 'Villarrica')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(227, 31, 'Valdivia')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(228, 31, 'Corral')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(229, 31, 'Futrono')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(230, 31, 'La Unión')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(231, 31, 'Lago Ranco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(232, 31, 'Lanco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(233, 31, 'Los Lagos')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(234, 31, 'Máfil')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(235, 31, 'Mariquina')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(236, 31, 'Paillaco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(237, 31, 'Panguipulli')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(238, 31, 'Rio Bueno')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(239, 32, 'Osorno')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(240, 32, 'Puerto Octay')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(241, 32, 'Purranque')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(242, 32, 'Puyehue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(243, 32, 'Rio Negro')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(244, 32, 'San Juan de la Costa')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(245, 33, 'San Pablo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(246, 33, 'Calbuco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(247, 33, 'Cochamó')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(248, 33, 'Fresia')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(249, 33, 'Frutillar')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(250, 33, 'Los Muermos')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(251, 33, 'Llanquihue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(252, 33, 'Maullin')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(253, 33, 'Puerto Montt')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(254, 33, 'Puerto Varas')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(255, 34, 'Ancud')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(256, 34, 'Castro')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(257, 34, 'Curaco de Vélez')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(258, 34, 'Chonchi')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(259, 34, 'Dalcahue')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(260, 34, 'Puqueldón')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(261, 34, 'Queilén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(262, 34, 'Quellón')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(263, 34, 'Quemchi')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(264, 34, 'Quinchao')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(265, 35, 'Chaitén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(266, 35, 'Futaleufú')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(267, 35, 'Hualaihué')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(268, 35, 'Palena')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(269, 36, 'Cachrane')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(270, 36, 'O''Higgins')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(271, 36, 'Tortel')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(272, 37, 'Aysén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(273, 37, 'Cisnes')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(274, 37, 'Guaitecas')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(275, 38, 'Coyhaique')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(276, 38, 'Lago Verde')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(277, 39, 'Chile Chico')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(278, 39, 'Rio Ibañez')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(279, 40, 'Natales')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(280, 40, 'Torres del Paine')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(281, 41, 'Punta Arenas')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(282, 41, 'Rio Verde')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(283, 41, 'Laguna Blanca')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(284, 41, 'San Gregorio')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(285, 42, 'Porvenir')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(286, 42, 'Primavera')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(287, 42, 'Timaukel')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(288, 43, 'Navarino')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(289, 43, 'Antartica')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(290, 44, 'Pirque')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(291, 44, 'San José de Maipo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(292, 44, 'Puente Alto')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(293, 45, 'Colina')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(294, 45, 'Lampa')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(295, 45, 'Til-Til')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(296, 46, 'Paine')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(297, 46, 'Buín')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(298, 46, 'San Bernardo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(299, 46, 'Calera de Tango')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(300, 47, 'Alhué')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(301, 47, 'Curacaví')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(302, 47, 'San Pedro')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(303, 47, 'María Pinto')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(304, 47, 'Melipilla')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(305, 48, 'Cerrillos')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(306, 48, 'Cerro Navia')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(307, 48, 'Estación Central')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(308, 48, 'Conchalí')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(309, 48, 'El Bosque')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(310, 48, 'Huechuraba')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(311, 48, 'Independencia')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(312, 48, 'La Cisterna')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(313, 48, 'La Granja')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(314, 48, 'La Florida')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(315, 48, 'La Pintana')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(316, 48, 'Las Condes')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(317, 48, 'Lo Barnechea')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(318, 48, 'La Reina')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(319, 48, 'Lo Espejo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(320, 48, 'Lo Prado')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(321, 48, 'Maipú')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(322, 48, 'Macul')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(323, 48, 'Pedro Aguirre Cerda')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(324, 48, 'Ñuñoa')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(325, 48, 'Peñalolén')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(326, 48, 'Providencia')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(327, 48, 'Pudahuel')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(328, 48, 'Quilicura')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(329, 48, 'Renca')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(330, 48, 'Recoleta')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(331, 48, 'Quinta Normal')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(332, 48, 'San Ramón')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(333, 48, 'San Joaquín')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(334, 48, 'San Miguel')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(335, 48, 'Santiago')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(336, 48, 'Vitacura')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(337, 49, 'Isla de Maipo')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(338, 49, 'Padre Hurtado')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(339, 49, 'Peñaflor')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(340, 49, 'El Monte')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(341, 49, 'Talagante')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(342, 50, 'Valdivia')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(343, 50, 'Corral')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(344, 50, 'Lanco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(345, 50, 'Los Lagos')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(346, 50, 'Mafil')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(347, 50, 'Mariquina')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(348, 50, 'Paillaco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(349, 50, 'Panguipulli')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(350, 51, 'La Union')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(351, 51, 'Futrono')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(352, 51, 'Lago Ranco')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(353, 51, 'Rio Bueno')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(354, 52, 'Arica')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(355, 52, 'Camarones')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(356, 53, 'Putre')
GO
INSERT INTO dbo.Comuna(Id, Id_Provincia, Nombre)
  VALUES(357, 53, 'General Lagos')

