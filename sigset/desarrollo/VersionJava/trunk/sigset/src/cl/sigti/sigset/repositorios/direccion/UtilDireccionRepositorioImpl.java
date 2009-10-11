package cl.sigti.sigset.repositorios.direccion;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import cl.sigti.sigset.modelo.Comuna;
import cl.sigti.sigset.modelo.Provincia;
import cl.sigti.sigset.modelo.Region;


@Repository
public class UtilDireccionRepositorioImpl implements UtilDireccionRepositorio  {

	private List<Region> regiones;  
	private List<Provincia> provincias;
	private List<Comuna> comunas;
	
	public UtilDireccionRepositorioImpl(){
		
	}
	
	private synchronized void loadRegiones(){
		regiones = new ArrayList<Region>();
		regiones.add(getNuevaRegion(1, "Región de Tarapacá"));
		regiones.add(getNuevaRegion(2, "Región de Antofagasta"));
		regiones.add(getNuevaRegion(3, "Región de Atacama"));
		regiones.add(getNuevaRegion(4, "Región de Coquimbo"));
		regiones.add(getNuevaRegion(5, "Región de Valparaiso"));
		regiones.add(getNuevaRegion(6, "Región del Libertador General Bernardo O Higgins"));
		regiones.add(getNuevaRegion(7, "Región del Maule"));
		regiones.add(getNuevaRegion(8, "Región del Bío-Bío"));
		regiones.add(getNuevaRegion(9, "Región del Araucanía"));
		regiones.add(getNuevaRegion(10, "Región de los Lagos"));
		regiones.add(getNuevaRegion(11, "Región de Aysén del General Carlos Ibáñez del Campo"));
		regiones.add(getNuevaRegion(12, "Región de Magallanes y la Antartica Chilena"));
		regiones.add(getNuevaRegion(13, "Región Metropolitana"));
		regiones.add(getNuevaRegion(14, "Región de los Ríos"));
		regiones.add(getNuevaRegion(15, "Región de Arica y Parinacota"));
	}
	
	private synchronized void loadProvincias(){
		provincias = new ArrayList<Provincia>();
		provincias.add(getNuevaProvincia(1,1, "Iquique"));
		provincias.add(getNuevaProvincia(2,2, "Tocopilla"));
		provincias.add(getNuevaProvincia(2,3, "El Loa"));
		provincias.add(getNuevaProvincia(2,4, "Antofagasta"));
		provincias.add(getNuevaProvincia(3,5, "Chañaral"));
		provincias.add(getNuevaProvincia(3,6, "Copiapó"));
		provincias.add(getNuevaProvincia(3,7, "Huasco"));
		provincias.add(getNuevaProvincia(4,8, "Elqui"));
		provincias.add(getNuevaProvincia(4,9, "Limarí"));
		provincias.add(getNuevaProvincia(4,10, "Choapa"));
		provincias.add(getNuevaProvincia(5,11, "Valparaiso"));
		provincias.add(getNuevaProvincia(5,12, "Petorca"));
		provincias.add(getNuevaProvincia(5,13, "Los Andes"));
		provincias.add(getNuevaProvincia(5,14, "San Felipe de Aconcagua"));
		provincias.add(getNuevaProvincia(5,15, "Quillota"));
		provincias.add(getNuevaProvincia(5,16, "San Antonio"));
		provincias.add(getNuevaProvincia(5,17, "Isla de Pascua"));
		provincias.add(getNuevaProvincia(6,18, "Cachapoal"));
		provincias.add(getNuevaProvincia(6,19, "Colchagua"));
		provincias.add(getNuevaProvincia(6,20, "Cardenal Caro"));
		provincias.add(getNuevaProvincia(7,21, "Curicó"));
		provincias.add(getNuevaProvincia(7,22, "Talca"));
		provincias.add(getNuevaProvincia(7,23, "Linares"));
		provincias.add(getNuevaProvincia(7,24, "Cauquenes"));
		provincias.add(getNuevaProvincia(8,25, "Ñuble"));
		provincias.add(getNuevaProvincia(8,26, "Bio Bio"));
		provincias.add(getNuevaProvincia(8,27, "Concepción"));
		provincias.add(getNuevaProvincia(8,28, "Arauco"));
		provincias.add(getNuevaProvincia(9,29, "Malleco"));
		provincias.add(getNuevaProvincia(9,30, "Cautin"));
		provincias.add(getNuevaProvincia(10,31, "Valdivia"));
		provincias.add(getNuevaProvincia(10,32, "Osorno"));
		provincias.add(getNuevaProvincia(10,33, "Llanquihue"));
		provincias.add(getNuevaProvincia(10,34, "Chiloé"));
		provincias.add(getNuevaProvincia(10,35, "Palena"));
		provincias.add(getNuevaProvincia(11,36, "Capitán Prat"));
		provincias.add(getNuevaProvincia(11,37, "Aysen"));
		provincias.add(getNuevaProvincia(11,38, "Coihaique"));
		provincias.add(getNuevaProvincia(11,39, "General Carrera"));
		provincias.add(getNuevaProvincia(12,40, "Ultima Esperanza"));
		provincias.add(getNuevaProvincia(12,41, "Magallanes"));
		provincias.add(getNuevaProvincia(12,42, "Tierra del Fuego"));
		provincias.add(getNuevaProvincia(12,43, "Antartica Chilena"));
		provincias.add(getNuevaProvincia(13,44, "Cordillera"));
		provincias.add(getNuevaProvincia(13,45, "Chacabuco"));
		provincias.add(getNuevaProvincia(13,46, "Maipo"));
		provincias.add(getNuevaProvincia(13,47, "Melipilla"));
		provincias.add(getNuevaProvincia(13,48, "Santiago"));
		provincias.add(getNuevaProvincia(13,49, "Talagante"));
		provincias.add(getNuevaProvincia(14,50, "Valdivia"));
		provincias.add(getNuevaProvincia(14,51, "Ranco"));
		provincias.add(getNuevaProvincia(15,52, "Arica"));
		provincias.add(getNuevaProvincia(15,53, "Parinacota"));
	}
	
	private synchronized void loadComunas(){
		comunas = new ArrayList<Comuna>();
		comunas.add(getNuevaComuna(1, 1, "Iquique"));
		comunas.add(getNuevaComuna(1, 2, "Alto Hospicio"));
		comunas.add(getNuevaComuna(1, 3, "Huara"));
		comunas.add(getNuevaComuna(1, 4, "Camiña"));
		comunas.add(getNuevaComuna(1, 5, "Colchane"));
		comunas.add(getNuevaComuna(1, 6, "Pica"));
		comunas.add(getNuevaComuna(1, 7, "Pozo Almonte"));
		comunas.add(getNuevaComuna(2, 8, "Tocopilla"));
		comunas.add(getNuevaComuna(2, 9, "Maria Elena"));
		comunas.add(getNuevaComuna(3, 10, "Calama"));
		comunas.add(getNuevaComuna(3, 11, "Ollague"));
		comunas.add(getNuevaComuna(3, 12, "San Pedro de Atacama"));
		comunas.add(getNuevaComuna(4, 13, "Antofagasta"));
		comunas.add(getNuevaComuna(4, 14, "Mejillones"));
		comunas.add(getNuevaComuna(4, 15, "Sierra Gorda"));
		comunas.add(getNuevaComuna(4, 16, "Taltal"));
		comunas.add(getNuevaComuna(5, 17, "Chañaral"));
		comunas.add(getNuevaComuna(5, 18, "Diego de Almagro"));
		comunas.add(getNuevaComuna(6, 19, "Copiapó"));
		comunas.add(getNuevaComuna(6, 20, "Caldera"));
		comunas.add(getNuevaComuna(6, 21, "Tierra Amarilla"));
		comunas.add(getNuevaComuna(7, 22, "Vallenar"));
		comunas.add(getNuevaComuna(7, 23, "Freirina"));
		comunas.add(getNuevaComuna(7, 24, "Huasco"));
		comunas.add(getNuevaComuna(7, 25, "Alto del Carmen"));
		comunas.add(getNuevaComuna(8, 26, "La Serena"));
		comunas.add(getNuevaComuna(8, 27, "La Higuera"));
		comunas.add(getNuevaComuna(8, 28, "Coquimbo"));
		comunas.add(getNuevaComuna(8, 29, "Andacollo"));
		comunas.add(getNuevaComuna(8, 30, "Vicuña"));
		comunas.add(getNuevaComuna(8, 31, "Paihuano"));
		comunas.add(getNuevaComuna(9, 32, "Ovalle"));
		comunas.add(getNuevaComuna(9, 33, "Riio Hurtado"));
		comunas.add(getNuevaComuna(9, 34, "Monte Patria"));
		comunas.add(getNuevaComuna(9, 35, "Combarbalá"));
		comunas.add(getNuevaComuna(9, 36, "Punitaqui"));
		comunas.add(getNuevaComuna(10, 37, "Illapel"));
		comunas.add(getNuevaComuna(10, 38, "Salamanca"));
		comunas.add(getNuevaComuna(10, 39, "Los Vilos"));
		comunas.add(getNuevaComuna(10, 40, "Canela"));
		comunas.add(getNuevaComuna(11, 41, "Valparaíso"));
		comunas.add(getNuevaComuna(11, 42, "Casablanca"));
		comunas.add(getNuevaComuna(11, 43, "Concon"));
		comunas.add(getNuevaComuna(11, 44, "Juan Fernández"));
		comunas.add(getNuevaComuna(11, 45, "Puchuncavi"));
		comunas.add(getNuevaComuna(11, 46, "Quilpué"));
		comunas.add(getNuevaComuna(11, 47, "Quintero"));
		comunas.add(getNuevaComuna(11, 48, "Viña del Mar"));
		comunas.add(getNuevaComuna(12, 49, "Petorca"));
		comunas.add(getNuevaComuna(12, 50, "La Ligua"));
		comunas.add(getNuevaComuna(12, 51, "Cabildo"));
		comunas.add(getNuevaComuna(12, 52, "Papudo"));
		comunas.add(getNuevaComuna(12, 53, "Zapallar"));
		comunas.add(getNuevaComuna(13, 54, "Los Andes"));
		comunas.add(getNuevaComuna(13, 55, "San Esteban"));
		comunas.add(getNuevaComuna(13, 56, "Calle Larga"));
		comunas.add(getNuevaComuna(13, 57, "Rinconada"));
		comunas.add(getNuevaComuna(14, 58, "San Felipe"));
		comunas.add(getNuevaComuna(14, 59, "Catemu"));
		comunas.add(getNuevaComuna(14, 60, "Llay Llay"));
		comunas.add(getNuevaComuna(14, 61, "Panquehue"));
		comunas.add(getNuevaComuna(14, 62, "Putaendo"));
		comunas.add(getNuevaComuna(14, 63, "Santa Maria"));
		comunas.add(getNuevaComuna(15, 64, "Quillota"));
		comunas.add(getNuevaComuna(15, 65, "Calera"));
		comunas.add(getNuevaComuna(15, 66, "Hijuelas"));
		comunas.add(getNuevaComuna(15, 67, "Limache"));
		comunas.add(getNuevaComuna(15, 68, "La Cruz"));
		comunas.add(getNuevaComuna(15, 69, "Nogales"));
		comunas.add(getNuevaComuna(15, 70, "Olmué"));
		comunas.add(getNuevaComuna(16, 71, "San Antonio"));
		comunas.add(getNuevaComuna(16, 72, "Algarrobo"));
		comunas.add(getNuevaComuna(16, 73, "Cartagena"));
		comunas.add(getNuevaComuna(16, 74, "El Quisco"));
		comunas.add(getNuevaComuna(16, 75, "El Tabo"));
		comunas.add(getNuevaComuna(16, 76, "Santo Domingo"));
		comunas.add(getNuevaComuna(17, 77, "Isla de Pascua"));
		comunas.add(getNuevaComuna(18, 78, "Rancagua"));
		comunas.add(getNuevaComuna(18, 79, "Codegua"));
		comunas.add(getNuevaComuna(18, 80, "Coinco"));
		comunas.add(getNuevaComuna(18, 81, "Coltauco"));
		comunas.add(getNuevaComuna(18, 82, "Doñihue"));
		comunas.add(getNuevaComuna(18, 83, "Graneros"));
		comunas.add(getNuevaComuna(18, 84, "Las Cabras"));
		comunas.add(getNuevaComuna(18, 85, "Mostazal"));
		comunas.add(getNuevaComuna(18, 86, "Machali"));
		comunas.add(getNuevaComuna(18, 87, "Malloa"));
		comunas.add(getNuevaComuna(18, 88, "Olivar"));
		comunas.add(getNuevaComuna(18, 89, "Peumo"));
		comunas.add(getNuevaComuna(18, 90, "Pichidegua"));
		comunas.add(getNuevaComuna(18, 91, "Quinta de Tilcoco"));
		comunas.add(getNuevaComuna(18, 92, "Rengo"));
		comunas.add(getNuevaComuna(18, 93, "Requinoa"));
		comunas.add(getNuevaComuna(18, 94, "San Vicente"));
		comunas.add(getNuevaComuna(19, 95, "San Fernando"));
		comunas.add(getNuevaComuna(19, 96, "Chépica"));
		comunas.add(getNuevaComuna(19, 97, "Chimbarongo"));
		comunas.add(getNuevaComuna(19, 98, "Lolol"));
		comunas.add(getNuevaComuna(19, 99, "Nancagua"));
		comunas.add(getNuevaComuna(19, 100, "Palmilla"));
		comunas.add(getNuevaComuna(19, 101, "Peralillo"));
		comunas.add(getNuevaComuna(19, 102, "Placilla"));
		comunas.add(getNuevaComuna(19, 103, "Pumanque"));
		comunas.add(getNuevaComuna(19, 104, "Santa Cruz"));
		comunas.add(getNuevaComuna(20, 105, "Pichilemu"));
		comunas.add(getNuevaComuna(20, 106, "La Estrella"));
		comunas.add(getNuevaComuna(20, 107, "Litueche"));
		comunas.add(getNuevaComuna(20, 108, "Marchihue"));
		comunas.add(getNuevaComuna(20, 109, "Navidad"));
		comunas.add(getNuevaComuna(20, 110, "Paredones"));
		comunas.add(getNuevaComuna(21, 111, "Curicó"));
		comunas.add(getNuevaComuna(21, 112, "Teno"));
		comunas.add(getNuevaComuna(21, 113, "Romeral"));
		comunas.add(getNuevaComuna(21, 114, "Molina"));
		comunas.add(getNuevaComuna(21, 115, "Sagrada Familia"));
		comunas.add(getNuevaComuna(21, 116, "Hualañé"));
		comunas.add(getNuevaComuna(21, 117, "Licantén"));
		comunas.add(getNuevaComuna(21, 118, "Vichuquén"));
		comunas.add(getNuevaComuna(21, 119, "Rauco"));
		comunas.add(getNuevaComuna(22, 120, "Talca"));
		comunas.add(getNuevaComuna(22, 121, "Pelarco"));
		comunas.add(getNuevaComuna(22, 122, "Rio Claro"));
		comunas.add(getNuevaComuna(22, 123, "San Clemente"));
		comunas.add(getNuevaComuna(22, 124, "Maule"));
		comunas.add(getNuevaComuna(22, 125, "San Rafael"));
		comunas.add(getNuevaComuna(22, 126, "Empedrado"));
		comunas.add(getNuevaComuna(22, 127, "Pencahue"));
		comunas.add(getNuevaComuna(22, 128, "Constitucion"));
		comunas.add(getNuevaComuna(22, 129, "Curepto"));
		comunas.add(getNuevaComuna(23, 130, "Linares"));
		comunas.add(getNuevaComuna(23, 131, "Yerbas Buenas"));
		comunas.add(getNuevaComuna(23, 132, "Colbún"));
		comunas.add(getNuevaComuna(23, 133, "Longavi"));
		comunas.add(getNuevaComuna(23, 134, "Parral"));
		comunas.add(getNuevaComuna(23, 135, "Retiro"));
		comunas.add(getNuevaComuna(23, 136, "Villa Alegre"));
		comunas.add(getNuevaComuna(23, 137, "San Javier"));
		comunas.add(getNuevaComuna(24, 138, "Cauquenes"));
		comunas.add(getNuevaComuna(24, 139, "Pelluhue"));
		comunas.add(getNuevaComuna(24, 140, "Chanco"));
		comunas.add(getNuevaComuna(25, 141, "Chillán"));
		comunas.add(getNuevaComuna(25, 142, "Bulnes"));
		comunas.add(getNuevaComuna(25, 143, "Chillan Viejo"));
		comunas.add(getNuevaComuna(25, 144, "Cobquecura"));
		comunas.add(getNuevaComuna(25, 145, "Coelemu"));
		comunas.add(getNuevaComuna(25, 146, "Coihueco"));
		comunas.add(getNuevaComuna(25, 147, "El Carmen"));
		comunas.add(getNuevaComuna(25, 148, "Ninhue"));
		comunas.add(getNuevaComuna(25, 149, "Ñiquén"));
		comunas.add(getNuevaComuna(25, 150, "Pemuco"));
		comunas.add(getNuevaComuna(25, 151, "Pinto"));
		comunas.add(getNuevaComuna(25, 152, "Portezuelo"));
		comunas.add(getNuevaComuna(25, 153, "Quillón"));
		comunas.add(getNuevaComuna(25, 154, "Quirihue"));
		comunas.add(getNuevaComuna(25, 155, "Ranquil"));
		comunas.add(getNuevaComuna(25, 156, "San Carlos"));
		comunas.add(getNuevaComuna(25, 157, "San Fabián"));
		comunas.add(getNuevaComuna(25, 158, "San Ignacio"));
		comunas.add(getNuevaComuna(25, 159, "San Nicolás"));
		comunas.add(getNuevaComuna(25, 160, "Trehuaco"));
		comunas.add(getNuevaComuna(25, 161, "Yungay"));
		comunas.add(getNuevaComuna(26, 162, "Los Angeles"));
		comunas.add(getNuevaComuna(26, 163, "Alto Bio Bio"));
		comunas.add(getNuevaComuna(26, 164, "Antuco"));
		comunas.add(getNuevaComuna(26, 165, "Cabrero"));
		comunas.add(getNuevaComuna(26, 166, "Laja"));
		comunas.add(getNuevaComuna(26, 167, "Mulchén"));
		comunas.add(getNuevaComuna(26, 168, "Nacimiento"));
		comunas.add(getNuevaComuna(26, 169, "Negrete"));
		comunas.add(getNuevaComuna(26, 170, "Quilaco"));
		comunas.add(getNuevaComuna(26, 171, "Quilleco"));
		comunas.add(getNuevaComuna(26, 172, "Santa Bárbara"));
		comunas.add(getNuevaComuna(26, 173, "San Rosendo"));
		comunas.add(getNuevaComuna(26, 174, "Tucapel"));
		comunas.add(getNuevaComuna(26, 175, "Yumbel"));
		comunas.add(getNuevaComuna(27, 176, "Concepción"));
		comunas.add(getNuevaComuna(27, 177, "Chiguayante"));
		comunas.add(getNuevaComuna(27, 178, "Coronel"));
		comunas.add(getNuevaComuna(27, 179, "Florida"));
		comunas.add(getNuevaComuna(27, 180, "Hualpén"));
		comunas.add(getNuevaComuna(27, 181, "Hualqui"));
		comunas.add(getNuevaComuna(27, 182, "Lota"));
		comunas.add(getNuevaComuna(27, 183, "Penco"));
		comunas.add(getNuevaComuna(27, 184, "San Pedro de la Paz"));
		comunas.add(getNuevaComuna(27, 185, "Santa Juana"));
		comunas.add(getNuevaComuna(27, 186, "Talcahuano"));
		comunas.add(getNuevaComuna(27, 187, "Tomé"));
		comunas.add(getNuevaComuna(28, 188, "Arauco"));
		comunas.add(getNuevaComuna(28, 189, "Cañete"));
		comunas.add(getNuevaComuna(28, 190, "Contulmo"));
		comunas.add(getNuevaComuna(28, 191, "Curanilahue"));
		comunas.add(getNuevaComuna(28, 192, "Lebu"));
		comunas.add(getNuevaComuna(28, 193, "Los Alamos"));
		comunas.add(getNuevaComuna(28, 194, "Tirua"));
		comunas.add(getNuevaComuna(29, 195, "Angol"));
		comunas.add(getNuevaComuna(29, 196, "Collipulli"));
		comunas.add(getNuevaComuna(29, 197, "Curacautin"));
		comunas.add(getNuevaComuna(29, 198, "Ercilla"));
		comunas.add(getNuevaComuna(29, 199, "Lonquimay"));
		comunas.add(getNuevaComuna(29, 200, "Los Sauces"));
		comunas.add(getNuevaComuna(29, 201, "Lumaco"));
		comunas.add(getNuevaComuna(29, 202, "Purén"));
		comunas.add(getNuevaComuna(29, 203, "Renaico"));
		comunas.add(getNuevaComuna(29, 204, "Traiguén"));
		comunas.add(getNuevaComuna(29, 205, "Victoria"));
		comunas.add(getNuevaComuna(30, 206, "Temuco"));
		comunas.add(getNuevaComuna(30, 207, "Carahue"));
		comunas.add(getNuevaComuna(30, 208, "Cholchol"));
		comunas.add(getNuevaComuna(30, 209, "Cunco"));
		comunas.add(getNuevaComuna(30, 210, "Curarrehue"));
		comunas.add(getNuevaComuna(30, 211, "Freire"));
		comunas.add(getNuevaComuna(30, 212, "Galvarino"));
		comunas.add(getNuevaComuna(30, 213, "Gorbea"));
		comunas.add(getNuevaComuna(30, 214, "Lautaro"));
		comunas.add(getNuevaComuna(30, 215, "Loncoche"));
		comunas.add(getNuevaComuna(30, 216, "Melipeuco"));
		comunas.add(getNuevaComuna(30, 217, "Nueva Imperial"));
		comunas.add(getNuevaComuna(30, 218, "Padre las Casas"));
		comunas.add(getNuevaComuna(30, 219, "Perquenco"));
		comunas.add(getNuevaComuna(30, 220, "Pitrufquén"));
		comunas.add(getNuevaComuna(30, 221, "Pucón"));
		comunas.add(getNuevaComuna(30, 222, "Saavedra"));
		comunas.add(getNuevaComuna(30, 223, "Teodoro Schmidt"));
		comunas.add(getNuevaComuna(30, 224, "Toltén"));
		comunas.add(getNuevaComuna(30, 225, "Vilcún"));
		comunas.add(getNuevaComuna(30, 226, "Villarrica"));
		comunas.add(getNuevaComuna(31, 227, "Valdivia"));
		comunas.add(getNuevaComuna(31, 228, "Corral"));
		comunas.add(getNuevaComuna(31, 229, "Futrono"));
		comunas.add(getNuevaComuna(31, 230, "La Unión"));
		comunas.add(getNuevaComuna(31, 231, "Lago Ranco"));
		comunas.add(getNuevaComuna(31, 232, "Lanco"));
		comunas.add(getNuevaComuna(31, 233, "Los Lagos"));
		comunas.add(getNuevaComuna(31, 234, "Máfil"));
		comunas.add(getNuevaComuna(31, 235, "Mariquina"));
		comunas.add(getNuevaComuna(31, 236, "Paillaco"));
		comunas.add(getNuevaComuna(31, 237, "Panguipulli"));
		comunas.add(getNuevaComuna(31, 238, "Rio Bueno"));
		comunas.add(getNuevaComuna(32, 239, "Osorno"));
		comunas.add(getNuevaComuna(32, 240, "Puerto Octay"));
		comunas.add(getNuevaComuna(32, 241, "Purranque"));
		comunas.add(getNuevaComuna(32, 242, "Puyehue"));
		comunas.add(getNuevaComuna(32, 243, "Rio Negro"));
		comunas.add(getNuevaComuna(32, 244, "San Juan de la Costa"));
		comunas.add(getNuevaComuna(33, 245, "San Pablo"));
		comunas.add(getNuevaComuna(33, 246, "Calbuco"));
		comunas.add(getNuevaComuna(33, 247, "Cochamó"));
		comunas.add(getNuevaComuna(33, 248, "Fresia"));
		comunas.add(getNuevaComuna(33, 249, "Frutillar"));
		comunas.add(getNuevaComuna(33, 250, "Los Muermos"));
		comunas.add(getNuevaComuna(33, 251, "Llanquihue"));
		comunas.add(getNuevaComuna(33, 252, "Maullin"));
		comunas.add(getNuevaComuna(33, 253, "Puerto Montt"));
		comunas.add(getNuevaComuna(33, 254, "Puerto Varas"));
		comunas.add(getNuevaComuna(34, 255, "Ancud"));
		comunas.add(getNuevaComuna(34, 256, "Castro"));
		comunas.add(getNuevaComuna(34, 257, "Curaco de Vélez"));
		comunas.add(getNuevaComuna(34, 258, "Chonchi"));
		comunas.add(getNuevaComuna(34, 259, "Dalcahue"));
		comunas.add(getNuevaComuna(34, 260, "Puqueldón"));
		comunas.add(getNuevaComuna(34, 261, "Queilén"));
		comunas.add(getNuevaComuna(34, 262, "Quellón"));
		comunas.add(getNuevaComuna(34, 263, "Quemchi"));
		comunas.add(getNuevaComuna(34, 264, "Quinchao"));
		comunas.add(getNuevaComuna(35, 265, "Chaitén"));
		comunas.add(getNuevaComuna(35, 266, "Futaleufú"));
		comunas.add(getNuevaComuna(35, 267, "Hualaihué"));
		comunas.add(getNuevaComuna(35, 268, "Palena"));
		comunas.add(getNuevaComuna(36, 269, "Cachrane"));
		comunas.add(getNuevaComuna(36, 270, "O'Higgins"));
		comunas.add(getNuevaComuna(36, 271, "Tortel"));
		comunas.add(getNuevaComuna(37, 272, "Aysén"));
		comunas.add(getNuevaComuna(37, 273, "Cisnes"));
		comunas.add(getNuevaComuna(37, 274, "Guaitecas"));
		comunas.add(getNuevaComuna(38, 275, "Coyhaique"));
		comunas.add(getNuevaComuna(38, 276, "Lago Verde"));
		comunas.add(getNuevaComuna(39, 277, "Chile Chico"));
		comunas.add(getNuevaComuna(39, 278, "Rio Ibañez"));
		comunas.add(getNuevaComuna(40, 279, "Natales"));
		comunas.add(getNuevaComuna(40, 280, "Torres del Paine"));
		comunas.add(getNuevaComuna(41, 281, "Punta Arenas"));
		comunas.add(getNuevaComuna(41, 282, "Rio Verde"));
		comunas.add(getNuevaComuna(41, 283, "Laguna Blanca"));
		comunas.add(getNuevaComuna(41, 284, "San Gregorio"));
		comunas.add(getNuevaComuna(42, 285, "Porvenir"));
		comunas.add(getNuevaComuna(42, 286, "Primavera"));
		comunas.add(getNuevaComuna(42, 287, "Timaukel"));
		comunas.add(getNuevaComuna(43, 288, "Navarino"));
		comunas.add(getNuevaComuna(43, 289, "Antartica"));
		comunas.add(getNuevaComuna(44, 290, "Pirque"));
		comunas.add(getNuevaComuna(44, 291, "San José de Maipo"));
		comunas.add(getNuevaComuna(44, 292, "Puente Alto"));
		comunas.add(getNuevaComuna(45, 293, "Colina"));
		comunas.add(getNuevaComuna(45, 294, "Lampa"));
		comunas.add(getNuevaComuna(45, 295, "Til-Til"));
		comunas.add(getNuevaComuna(46, 296, "Paine"));
		comunas.add(getNuevaComuna(46, 297, "Buín"));
		comunas.add(getNuevaComuna(46, 298, "San Bernardo"));
		comunas.add(getNuevaComuna(46, 299, "Calera de Tango"));
		comunas.add(getNuevaComuna(47, 300, "Alhué"));
		comunas.add(getNuevaComuna(47, 301, "Curacaví"));
		comunas.add(getNuevaComuna(47, 302, "San Pedro"));
		comunas.add(getNuevaComuna(47, 303, "María Pinto"));
		comunas.add(getNuevaComuna(47, 304, "Melipilla"));
		comunas.add(getNuevaComuna(48, 305, "Cerrillos"));
		comunas.add(getNuevaComuna(48, 306, "Cerro Navia"));
		comunas.add(getNuevaComuna(48, 307, "Estación Central"));
		comunas.add(getNuevaComuna(48, 308, "Conchalí"));
		comunas.add(getNuevaComuna(48, 309, "El Bosque"));
		comunas.add(getNuevaComuna(48, 310, "Huechuraba"));
		comunas.add(getNuevaComuna(48, 311, "Independencia"));
		comunas.add(getNuevaComuna(48, 312, "La Cisterna"));
		comunas.add(getNuevaComuna(48, 313, "La Granja"));
		comunas.add(getNuevaComuna(48, 314, "La Florida"));
		comunas.add(getNuevaComuna(48, 315, "La Pintana"));
		comunas.add(getNuevaComuna(48, 316, "Las Condes"));
		comunas.add(getNuevaComuna(48, 317, "Lo Barnechea"));
		comunas.add(getNuevaComuna(48, 318, "La Reina"));
		comunas.add(getNuevaComuna(48, 319, "Lo Espejo"));
		comunas.add(getNuevaComuna(48, 320, "Lo Prado"));
		comunas.add(getNuevaComuna(48, 321, "Maipú"));
		comunas.add(getNuevaComuna(48, 322, "Macul"));
		comunas.add(getNuevaComuna(48, 323, "Pedro Aguirre Cerda"));
		comunas.add(getNuevaComuna(48, 324, "Ñuñoa"));
		comunas.add(getNuevaComuna(48, 325, "Peñalolén"));
		comunas.add(getNuevaComuna(48, 326, "Providencia"));
		comunas.add(getNuevaComuna(48, 327, "Pudahuel"));
		comunas.add(getNuevaComuna(48, 328, "Quilicura"));
		comunas.add(getNuevaComuna(48, 329, "Renca"));
		comunas.add(getNuevaComuna(48, 330, "Recoleta"));
		comunas.add(getNuevaComuna(48, 331, "Quinta Normal"));
		comunas.add(getNuevaComuna(48, 332, "San Ramón"));
		comunas.add(getNuevaComuna(48, 333, "San Joaquín"));
		comunas.add(getNuevaComuna(48, 334, "San Miguel"));
		comunas.add(getNuevaComuna(48, 335, "Santiago"));
		comunas.add(getNuevaComuna(48, 336, "Vitacura"));
		comunas.add(getNuevaComuna(49, 337, "Isla de Maipo"));
		comunas.add(getNuevaComuna(49, 338, "Padre Hurtado"));
		comunas.add(getNuevaComuna(49, 339, "Peñaflor"));
		comunas.add(getNuevaComuna(49, 340, "El Monte"));
		comunas.add(getNuevaComuna(49, 341, "Talagante"));
		comunas.add(getNuevaComuna(50, 342, "Valdivia"));
		comunas.add(getNuevaComuna(50, 343, "Corral"));
		comunas.add(getNuevaComuna(50, 344, "Lanco"));
		comunas.add(getNuevaComuna(50, 345, "Los Lagos"));
		comunas.add(getNuevaComuna(50, 346, "Mafil"));
		comunas.add(getNuevaComuna(50, 347, "Mariquina"));
		comunas.add(getNuevaComuna(50, 348, "Paillaco"));
		comunas.add(getNuevaComuna(50, 349, "Panguipulli"));
		comunas.add(getNuevaComuna(51, 350, "La Union"));
		comunas.add(getNuevaComuna(51, 351, "Futrono"));
		comunas.add(getNuevaComuna(51, 352, "Lago Ranco"));
		comunas.add(getNuevaComuna(51, 353, "Rio Bueno"));
		comunas.add(getNuevaComuna(52, 354, "Arica"));
		comunas.add(getNuevaComuna(52, 355, "Camarones"));
		comunas.add(getNuevaComuna(53, 356, "Putre"));
		comunas.add(getNuevaComuna(53, 357, "General Lagos"));
	}
	
	private Comuna getNuevaComuna(int idProvincia, int id, String nombre){
		Comuna nuevaComuna = new Comuna();
		nuevaComuna.setIdProvincia(getProviniciaPorId(idProvincia));
		nuevaComuna.setId(new  BigDecimal(idProvincia));
		nuevaComuna.setNombre(nombre);
		return nuevaComuna;
	}
	
	private Provincia getProviniciaPorId(int idProvincia) {
		for(Provincia r : provincias){
			if(r.getId().intValue() == idProvincia){
				return r;
			}
		}
		return null;
	}

	private Provincia getNuevaProvincia(int idRegion,int id, String nombre){
		Provincia provincia = new Provincia();
		provincia.setId(new BigDecimal(id));
		provincia.setNombre(nombre);
		provincia.setIdRegion(getRegionPorId(idRegion));
		return provincia;
	}
	
	private Region getRegionPorId(int idRegion){
		for(Region r : regiones){
			if(r.getId().intValue() == idRegion){
				return r;
			}
		}
		return null;
	}
	
	private Region getNuevaRegion(int id, String nombre){
		Region nuevaRegion = new Region();
		nuevaRegion.setId(new BigDecimal(id));
		nuevaRegion.setNombre(nombre);
		return nuevaRegion;
	}
	

    /* (non-Javadoc)
	 * @see cl.sigti.sigset.repositorios.direccion.UtilDireccionRepositorio#getRegionesPorNombre(java.lang.String)
	 */
    public List<Region> getRegionesPorNombre(String regionNombre)
    {
    	loadRegiones();
    	 List<Region> listaRegiones = new ArrayList<Region>();
    	 for(Region r : this.regiones){
    		 if(r.getNombre().toLowerCase().contains(regionNombre.toLowerCase())){
    			 listaRegiones.add(r);
    		 }
    	 }
    	 return listaRegiones;
    }
    
    /* (non-Javadoc)
	 * @see cl.sigti.sigset.repositorios.direccion.UtilDireccionRepositorio#getProvinciasByRegion(int, java.lang.String)
	 */
    public List<Provincia> getProvinciasByRegion(int regionId, String nombreAlcance )
    {
    	
    	loadRegiones();
    	loadProvincias();
    	List<Provincia> listaProvincias = new ArrayList<Provincia>();
    	for(Provincia p: provincias){
    		if(p.getIdRegion().getId().intValue() == regionId){
    			if(p.getNombre().toLowerCase().contains(nombreAlcance.toLowerCase())){
    				listaProvincias.add(p);
    			}
    		}
    	}
		return listaProvincias;
    }

    /* (non-Javadoc)
	 * @see cl.sigti.sigset.repositorios.direccion.UtilDireccionRepositorio#getComunasByProvincia(int, java.lang.String)
	 */
    public List<Comuna> getComunasByProvincia(int idProvincia, String nombreAlcance)
    {
    	loadRegiones();
    	loadProvincias();
    	loadComunas();
    	List<Comuna> listaComunas = new ArrayList<Comuna>();
    	for(Comuna c: comunas){
    		if(c.getIdProvincia().getId().intValue() == idProvincia){
    			if(c.getNombre().toLowerCase().contains(nombreAlcance.toLowerCase())){
    				listaComunas.add(c);
    			}
    		}
    	}
		return listaComunas;
    }
}
