-- -------------------------------------------------------------
-- TablePlus 3.12.8(368)
--
-- https://tableplus.com/
--
-- Database: good_old_videogames
-- Generation Time: 2021-06-10 16:54:30.2900
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `good_old_videogames`;
CREATE DATABASE `good_old_videogames` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `good_old_videogames`;

DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `founded_on` date NOT NULL,
  `location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `released_on` date NOT NULL,
  `company_id` int NOT NULL,
  `system_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `system_id` (`system_id`),
  CONSTRAINT `games_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `games_ibfk_2` FOREIGN KEY (`system_id`) REFERENCES `systems` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS `systems`;
CREATE TABLE `systems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `generation` tinyint NOT NULL,
  `released_on` date NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `systems_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `companies` (`id`, `name`, `founded_on`, `location`) VALUES
(1, 'SEGA', '1960-06-03', 'Shinagawa, Jap??n'),
(2, 'Nintendo', '1889-09-23', 'Kioto, Jap??n'),
(3, 'SNK', '1978-07-22', 'Osaka, Jap??n'),
(4, 'Electronic Arts', '1982-05-27', 'Redwood, EEUU'),
(5, 'Konami', '1969-03-21', 'Tokio, Jap??n'),
(6, 'Capcom', '1977-05-30', 'Osaka, Jap??n'),
(7, 'Aspect', '1991-03-25', 'Tokio, Jap??n'),
(8, 'Namco', '2006-03-31', 'Tokio, Jap??n'),
(9, 'Squaresoft', '1986-09-01', 'Tokio, Jap??n'),
(10, 'Rare', '1985-01-01', 'Twycross, Inglaterra');

INSERT INTO `games` (`id`, `title`, `type`, `released_on`, `company_id`, `system_id`) VALUES
(1, 'Alex Kidd in Miracle world', 'Plataformas', '1986-11-01', 1, 1),
(2, 'Phantasy Star', 'JRPG', '1987-12-20', 1, 1),
(3, 'Sonic 2', 'Plataformas', '1992-11-01', 7, 1),
(4, 'Columns', 'Puzzle', '1990-10-06', 1, 2),
(5, 'Sonic Chaos', 'Plataformas', '1993-11-19', 7, 2),
(6, 'Sonic Triple Trouble', 'Plataformas', '1994-11-11', 7, 2),
(7, 'Sonic 2', 'Plataformas', '1992-11-21', 1, 3),
(8, 'Phantasy Star 4', 'JRPG', '1993-12-17', 1, 3),
(9, 'Sonic 3', 'Plataformas', '1994-05-27', 1, 3),
(10, 'Panzer Dragoon Saga', 'JRPG', '1998-01-29', 1, 4),
(11, 'Shining Force III', 'JRPG', '1997-12-11', 1, 4),
(12, 'NiGHTS into Dreams', 'Acci??n', '1996-07-05', 1, 4),
(13, 'Sonic Adventure', 'Plataformas', '1998-12-23', 1, 5),
(14, 'Soul Calibur', 'Lucha', '1999-08-05', 8, 5),
(15, 'Shenmue 2', 'FREE', '2001-09-06', 1, 5),
(16, 'Super Mario Brothers 3', 'Plataformas', '1988-10-23', 2, 6),
(17, 'The Legend of Zelda', 'Acci??n', '1986-02-21', 2, 6),
(18, 'Super Mario Brothers', 'Plataformas', '1985-09-13', 2, 6),
(19, 'The Legend of Zelda: Link\'s Awakening', 'Acci??n', '1993-06-06', 2, 7),
(20, 'Pok??mon Rojo/Azul', 'JRPG', '1996-02-27', 2, 7),
(21, 'Super Mario land 2: 6 Golden Coins', 'Plataformas', '1992-10-21', 2, 7),
(22, 'Legend of Zelda: A Link to the Past', 'Acci??n', '1991-11-21', 2, 8),
(23, 'Super Mario World', 'Plataformas', '1990-11-21', 2, 8),
(24, 'Final Fantasy 6', 'JRPG', '1994-04-02', 9, 8),
(25, 'Super Mario 64', 'Plataformas', '1996-06-23', 2, 9),
(26, 'Mario Kart', 'Carreras', '1996-12-14', 2, 9),
(27, 'GoldenEye 007', 'Disparos', '1997-08-25', 10, 9),
(28, 'Pok??mon Rub??/Zafiro', 'JRPG', '2002-11-21', 2, 10),
(29, 'Pok??mon Rojo Fuego/Verde Hoja', 'JRPG', '2004-01-29', 2, 10),
(30, 'Pok??mon Esmeralda', 'JRPG', '2004-09-16', 2, 10),
(31, 'Super Smash Bros. Melee', 'Lucha', '2001-11-21', 2, 11),
(32, 'Mario Kart: Double Dash!!', 'Carreras', '2003-11-07', 2, 11),
(33, 'Super Mario Sunshine', 'Plataformas', '2002-06-19', 2, 11),
(37, 'Metal Slug', 'Run and gun', '1996-04-19', 3, 12),
(38, 'Garou: Mark of the Wolves', 'Lucha', '1999-11-26', 3, 12),
(39, 'Sengoku 3', 'Beat \'em up', '2001-07-18', 3, 12),
(40, 'SNK vs. Capcom: The Match of the Millennium', 'Lucha', '1999-11-30', 3, 13),
(41, 'SVC: Card Fighters 2', 'Cartas', '2001-09-13', 3, 13),
(42, 'Sonic the Hedgehog Pocket Adventure', 'Plataformas', '1999-11-04', 3, 13);

INSERT INTO `systems` (`id`, `name`, `description`, `generation`, `released_on`, `company_id`) VALUES
(1, 'Master System', 'Comercializada en Jap??n bajo el nombre SEGA Mark III, es una consola de videojuegos de 8 bits basada en cartuchos y tarjetas, que fue desarrollada por SEGA. Aunque estuvo muy por detr??s en ventas fuera de Europa, Brasil y con un ??xito moderado en Argentina, la experiencia sent?? los cimientos para que SEGA continuara con su liderazgo en esos mercados durante la siguiente generaci??n con la Mega Drive. Su cese de producci??n, con excepci??n de Brasil, fue en 1996.', 3, '1985-10-20', 1),
(2, 'Game Gear', 'Es una videoconsola port??til creada por Sega en respuesta a la Game Boy de Nintendo. Es la tercera consola port??til con pantalla en color de la historia, despu??s de la Atari Lynx y la Turbo Express. El proyecto comenz?? en 1989 bajo el nombre de \"Project Mercury\" y fue lanzada en Jap??n el 6 de octubre de 1990. En Am??rica y Europa fue lanzada en 1991 y en Australia en 1992. El soporte para este sistema se abandon?? a principios de 1997.', 4, '1990-10-06', 1),
(3, 'Mega Drive', 'Conocida en diversos territorios de Am??rica como Genesis, es una cl??sica videoconsola de sobremesa de 16 bits desarrollada por Sega Enterprises, Ltd. Mega Drive fue la tercera consola de Sega y la sucesora de Master System. Compiti?? contra la SNES de Nintendo, como parte de las videoconsolas de cuarta generaci??n. La primera versi??n fue lanzada en Jap??n en 1988, sucedida por el lanzamiento en Norteam??rica bajo el renombramiento de Genesis en 1989. En 1990, la consola fue distribuida como Mega Drive por Virgin Mastertronic en Europa, por Ozisoft en Australasia, y por Tec Toy en Brasil. En Corea del Sur, el sistema fue distribuido por Samsung y conocido como la Super Gam*Boy, y m??s tarde como Super Aladdin Boy.', 4, '1988-10-29', 1),
(4, 'Sega Saturn', 'Es la quinta videoconsola de sobremesa producida por Sega. Fue desarrollada para suceder a la Mega Drive/Genesis y competir contra la 3DO Interactive Multiplayer, Atari Jaguar, Neo Geo CD, PlayStation, y m??s adelante Nintendo 64, entre otras.', 5, '1994-11-22', 1),
(5, 'Dreamcast', 'Es la sexta y ??ltima consola de videojuegos hasta ahora producida por SEGA. Fue desarrollada en cooperaci??n con Hitachi y Microsoft. Dreamcast es la sucesora de Sega Saturn y fue lanzada al mercado para ganar terreno a PlayStation de Sony y Nintendo 64 de Nintendo, y competir con los sistemas sucesores a estos. Pertenece a la sexta generaci??n de consolas. Se detuvo su producci??n el 31 de marzo de 2001 tras la decisi??n de Sega de dedicarse en exclusiva a la programaci??n de videojuegos. Sus principales caracter??sticas son su lector ??ptico GD-ROM y su procesador Hitachi. El sistema fue el primero en tener un m??dem incorporado para jugar en l??nea. Otras, como su predecesora, Sega Saturn, lo ten??an como perif??rico opcional, y no en todos los pa??ses donde eran distribuidas. En esta versi??n, el m??dem se mejor?? y se pudo usar adem??s en Latinoam??rica.', 6, '1998-11-27', 1),
(6, 'NES', 'Nintendo Entertainment System (tambi??n conocida como Nintendo NES o simplemente NES)??? es la segunda consola de sobremesa de Nintendo, y es una videoconsola de ocho bits perteneciente a la tercera generaci??n en la industria de los videojuegos. Fue lanzada por Nintendo en Norteam??rica, Europa y Australia entre 1985 y 1987. En la mayor parte del continente asi??tico, incluyendo a Jap??n (donde se comercializ?? por primera vez en 1983), China, Vietnam, Singapur, Laos, Camboya y Filipinas se la conoci?? con el nombre de Family Computer, abreviado com??nmente como Famicom o simplemente FC). En Corea del Sur se llam?? Hyundai Comboy y fue distribuida por Hyundai Electronics, mientras que en regiones como Rusia y el sur de Asia pas?? a denominarse Dendy, una clon de la NES, y Tata Famicom, respectivamente. En 1990, la Super Nintendo reemplaz?? a la NES en el mercado. Fue descontinuada en 1995 (en Jap??n fue en 2003), y su ??ltimo t??tulo fue Wario\'s Woods. En el a??o 2013 Capcom lanz?? una edici??n limitada de 150 unidades de un cartucho original de NES de color dorado, con el juego Ducktales.', 3, '1983-07-15', 2),
(7, 'Game Boy', 'Game Boy es una videoconsola port??til desarrollada y comercializada por Nintendo, lanzada por primera vez en Jap??n y Am??rica del Norte en 1989, y en Europa un a??o despu??s. Perteneci?? a la l??nea de consolas Game Boy, siendo esta la primera de la serie. Fue dise??ada por el mismo equipo que desarroll?? la serie de videoconsolas port??tiles Game & Watch y el Nintendo Entertainment System: Satoru Okada, Gunpei Yokoi y Nintendo Research & Development 1.9??? La segunda consola port??til de Nintendo combin?? caracter??sticas del hardware del NES y de las Game & Watch, contando con una pantalla de matriz de puntos de color verde con un dial de contraste ajustable, cinco botones de control, un altavoz con dial de volumen ajustable y la salida de conector jack. Adem??s, utiliz?? cartuchos como medio f??sico para juegos.', 4, '1989-04-21', 2),
(8, 'Super NES', 'La Super Nintendo Entertainment System, conocida popularmente como la Super Nintendo, tambi??n llamada la Super Famicom en Jap??n??? (abreviada SFC) y la Hyundai Super Comboy en Corea del Sur,??? tambi??n nombrada oficialmente de forma abreviada como la Super NES o SNES en Am??rica y como la Super Nintendo en Europa es la tercera videoconsola de sobremesa de Nintendo y la sucesora de Nintendo Entertainment System (NES) en Am??rica y Europa. Mantuvo una gran rivalidad en todo el mundo con la Sega Mega Drive (o Sega Genesis) durante la era de 16 bits. Fue descontinuada en el a??o 1999 (2003 en Jap??n).', 4, '1990-11-21', 2),
(9, 'Nintendo 64', 'Es la cuarta videoconsola de sobremesa producida por Nintendo, desarrollada para suceder a la Super Nintendo y para competir con la Sega Saturn y la PlayStation de Sony. Incorpora en su arquitectura un procesador principal de 64 bits. El soporte de almacenamiento de los juegos es en forma de cartuchos, la mayor??a de ellos con memoria interna. El uso de este tipo de almacenamiento le supuso una seria desventaja comercial frente a sus competidores, ya que encarec??a los costes de producci??n lo que aumentaba el precio final, y adem??s, era de una capacidad de almacenamiento menor al de un CD-ROM.', 5, '1996-06-23', 2),
(10, 'Game Boy Advance', 'Abreviada como GBA, es una popular consola de videojuegos de la compa????a Nintendo, fabricada desde marzo de 2001 hasta 2008. Cuenta con un procesador ARM propio de 32 bits a 16,78 MHz, basado en la arquitectura RISC, con una potencia suficiente para permitir el desarrollo de juegos utilizando el lenguaje de programaci??n C. El microprocesador ARM es capaz de ejecutar tanto un juego de instrucciones con un tama??o de instrucci??n de 32 bits, como un juego de instrucciones llamado \"Thumb\" de un tama??o de 16 bits (pero igualmente, de 32 bits). Esta consola, adem??s, lleva el procesador CISC de 8 bits que tiene la Game Boy cl??sica y la Game Boy color (el LR35902). Este procesador lo usa para dar soporte al software de estas dos consolas anteriores. Estos dos procesadores no pueden estar funcionando a la vez debido a diferencias de voltaje y uso del bus de datos.', 6, '2001-03-21', 2),
(11, 'Game Cube', 'Nintendo Game Cube tambi??n llamada simplemente Game Cube y abreviada como GCN en Am??rica y NGC en Jap??n, es la quinta consola de sobremesa hecha por Nintendo. Es la sucesora de la Nintendo 64 y la predecesora del Wii. Sus principales caracter??sticas son su procesador central basado en un IBM PowerPC (tecnolog??a previa utilizada en computadoras personales y port??tiles), y su procesador gr??fico desarrollado por ATI Technologies. Nintendo, por primera vez, prescinde del cartucho como formato de almacenamiento, y adopta un formato ??ptico propio, el Nintendo Optical Disc. El nombre ??Game Cube?? se debe a que el sistema tiene la forma parecida a la de un cubo. Es adem??s la primera consola de Nintendo que no cuenta en su fecha de lanzamiento con un juego de Mario, mascota oficial de la compa????a.', 6, '2001-09-14', 2),
(12, 'Neo-Geo', 'Neo-Geo es el nombre de un sistema de 16 bits basado en cartuchos para arcades as?? como videoconsolas para el hogar lanzado en 1990 por la compa????a de videojuegos japonesa SNK (renombrado temporalmente a SNK Playmore). La tecnolog??a del sistema ofrec??a unos gr??ficos 2D, y una calidad de sonido muy superiores a la que ofrec??an otros sistemas caseros de su ??poca. En un principio el sistema Neo-Geo se cre?? como plataforma para m??quinas recreativas, m??s tarde tambi??n estaba disponible como videoconsola dom??stica a un precio demasiado elevado para muchos, 700 d??lares, dando lugar as?? a dos versiones del sistema: el sistema arcade, MVS, siglas de Multi Video System (Sistema Multi Video), y el sistema dom??stico, AES, siglas de Advanced Entertainment System (Sistema Avanzado de Entretenimiento).', 4, '1990-01-30', 3),
(13, 'Neo-Geo Pocket', 'La Neo Geo Pocket es una consola port??til de SNK. Fue lanzada en Jap??n hacia 1998, y descontinuada en 1999, para dar paso a la Neo Geo Pocket Color, debido a las bajas ventas del sistema monocromo. Aunque tuvo una corta vida, hay algunos juegos para el sistema que vale la pena mencionar como Samurai Shodown y King of Fighters R-1. En la Neo Geo Pocket se pueden jugar varios de los nuevos juegos en color. Existen excepciones notables como Sonic the Hedgehog Pocket Adventure o SNK vs. Capcom: Match Of The Millennium. La Neo Geo Pocket Color es totalmente compatible con los juegos antiguos de la Neo Geo Pocket.', 5, '1998-10-28', 3);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
