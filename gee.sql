-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Tiempo de generación: 03-09-2018 a las 19:56:32
-- Versión del servidor: 5.5.60-0+deb8u1-log
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gee`
--
CREATE DATABASE IF NOT EXISTS `gee` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gee`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistente`
--

CREATE TABLE `asistente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `apellidos` varchar(50) NOT NULL DEFAULT '',
  `correo` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asistente`
--

INSERT INTO `asistente` (`id`, `nombre`, `apellidos`, `correo`) VALUES
(1, 'José Luis', 'Vázquez Torres', 'usuario@correo.com'),
(2, 'Luis', 'Vázquez', 'usuario@correo.com'),
(3, 'Ernesto', 'Vargas Gil', 'usuario@correo.com'),
(4, 'Jessou Denise ', 'Jandette Torres ', 'usuario@correo.com'),
(5, 'Dorcas Lidia', 'González Balboa', 'usuario@correo.com'),
(6, 'Ivan', 'Salgado', 'usuario@correo.com'),
(7, 'sandra', 'flores', 'usuario@correo.com'),
(8, 'Eleand Daniela', 'Serrano Cruz', 'usuario@correo.com'),
(9, 'Roberto Carlos', 'Pavón Carreón', 'usuario@correo.com'),
(10, 'Marelly Stephanie', 'Galicia Vázquez', 'usuario@correo.com'),
(11, 'Maricruz', 'Bolaños Ramírez', 'usuario@correo.com'),
(12, 'Maribel', 'Sánchez Roldán', 'usuario@correo.com'),
(13, 'DIEGO', 'DIAZ YAÑEZ', 'usuario@correo.com'),
(14, 'Ana Luz', 'Rodriguez', 'usuario@correo.com'),
(15, 'NORA GUADALUPE', 'CARVAJAL SALAZAR', 'usuario@correo.com'),
(16, 'Jair Alberto ', 'Gómez De la Paz ', 'usuario@correo.com'),
(17, 'Zoila', 'Reyna García', 'usuario@correo.com'),
(18, 'Michelle Olimpia', 'Olmos Fabela', 'usuario@correo.com'),
(19, 'Karla Raquel', 'Martínez', 'usuario@correo.com'),
(20, 'Ana Lucía', 'Navarrete Rosas', 'usuario@correo.com'),
(21, 'Laura', 'Velasco Martínez', 'usuario@correo.com'),
(22, 'Yoltzi', 'Nava Hernández', 'usuario@correo.com'),
(23, 'Begoña ', 'Canut noval', 'usuario@correo.com'),
(24, 'Hussain ', 'Ismail', 'usuario@correo.com'),
(25, 'Kawa Arab Omar ', 'Omar ', 'usuario@correo.com'),
(26, 'Adán Jair ', 'Balderas Tecpan', 'usuario@correo.com'),
(27, 'Frida Paula', 'López Cornejo', 'usuario@correo.com'),
(28, 'Samantha', 'Baldovinos Arroyo', 'usuario@correo.com'),
(29, 'Olivia Viviana', 'Escobar Téllez', 'usuario@correo.com'),
(30, 'Leslie Viridiana', 'Domínguez Perez ', 'usuario@correo.com'),
(31, 'Orietta', 'Matamoros Olguin', 'usuario@correo.com'),
(32, 'Karla Shareni', 'Murillo Granados', 'usuario@correo.com'),
(33, 'Alicia', 'Domínguez García', 'usuario@correo.com'),
(34, 'Dulce Angélica', 'Chávez Juárez', 'usuario@correo.com'),
(35, 'Ricardo Jaziel ', 'Jiménez Méndez', 'usuario@correo.com'),
(36, 'Eli German', 'Flores Farias', 'usuario@correo.com'),
(37, 'Samanta ', 'Soto Duran ', 'usuario@correo.com'),
(38, 'José Francisco', 'Sánchez Padilla', 'usuario@correo.com'),
(39, 'Samantha ', 'Patiño galarza', 'usuario@correo.com'),
(40, 'Ariana', 'Ibañez', 'usuario@correo.com'),
(41, 'Maria Erika ', 'Ordoñez Delgado ', 'usuario@correo.com'),
(42, 'Fernando', 'Benitez Leal', 'usuario@correo.com'),
(43, 'Abi', 'Rivera Hernández', 'usuario@correo.com'),
(44, 'Karla', 'Rivera Tellez', 'usuario@correo.com'),
(45, 'Susan Osiris', 'Aguirre Medellín', 'usuario@correo.com'),
(46, 'Dulce Mariana', 'Rumualdo Flores', 'usuario@correo.com'),
(47, 'Andrea', 'Torres', 'usuario@correo.com'),
(48, 'Laila', 'Balanza', 'usuario@correo.com'),
(49, 'Francisco Manuel', 'Briseño Ramírez', 'usuario@correo.com'),
(50, 'Karen Guadalupe', 'Cabrera Rodriguez', 'usuario@correo.com'),
(51, 'Gabriel Uriel', 'Pérez Aragón', 'usuario@correo.com'),
(52, 'Magdalena', 'Ramírez Vázquez', 'usuario@correo.com'),
(53, 'Juan Manuel', 'García Morales', 'usuario@correo.com'),
(54, 'Diana Antonia', 'Alvarez Cuellar', 'usuario@correo.com'),
(55, 'Amadeo ', 'Segovia Guerrero', 'usuario@correo.com'),
(56, 'Pedro', 'Moguel', 'usuario@correo.com'),
(57, 'Silvia Regina', 'Delong', 'usuario@correo.com'),
(58, 'Lucila', 'Christen y Gracia', 'usuario@correo.com'),
(59, 'Martha Alicia', 'Méndez Murillo ', 'usuario@correo.com'),
(60, 'Francisco Javier', 'Cerón Luna', 'usuario@correo.com'),
(61, 'ARELY IVONNE', 'LOPEZ SOTO', 'usuario@correo.com'),
(62, 'Juan José', 'Alvarado Rodríguez', 'usuario@correo.com'),
(63, 'Lillyan Arey ', 'Pérez Alvarado ', 'usuario@correo.com'),
(64, 'Lourdes', 'Neri Flores', 'usuario@correo.com'),
(65, 'Sandra Paola ', 'Muñoz García', 'usuario@correo.com'),
(66, 'Marco Antonio', 'Flores Coronado', 'usuario@correo.com'),
(67, 'Sonia ', 'Acosta Domínguez', 'usuario@correo.com'),
(68, 'Julio Alberto', 'González Amador', 'usuario@correo.com'),
(69, 'Karina', 'Martínez Lira', 'usuario@correo.com'),
(70, 'Ivana Paola ', 'Lara De la Cruz ', 'usuario@correo.com'),
(71, 'Bárbara Elizabeth', 'Terán Flores', 'usuario@correo.com'),
(72, 'JONATHAN', 'ERASO NAJERA', 'usuario@correo.com'),
(73, 'Shamel ', 'Matilde Martínez', 'usuario@correo.com'),
(74, 'Ana Elena', 'Erape Baltazar', 'usuario@correo.com'),
(75, 'MIRIAM VIRGINIA', 'MATAMOROS SÁNCHEZ', 'usuario@correo.com'),
(76, 'Laura Xochitl', 'Segura Lira', 'usuario@correo.com'),
(77, 'Roxili Nairobi', 'Meneses Ramírez', 'usuario@correo.com'),
(78, 'Ulrich ', 'Schrader Krueger', 'usuario@correo.com'),
(79, 'Miroslava', 'Morales Delgado', 'usuario@correo.com'),
(80, 'Lorena', 'Molina', 'usuario@correo.com'),
(81, 'Valeria ', 'Aguilar Ocón', 'usuario@correo.com'),
(82, 'Mariana Denisse ', 'Morales Hernández', 'usuario@correo.com'),
(83, 'Josué Ehecatl', 'Moreno Gonzalez', 'usuario@correo.com'),
(84, 'Karol ', 'Percastre Esteban', 'usuario@correo.com'),
(85, 'FRANCISCO', 'RESENDIZ MARTINEZ', 'usuario@correo.com'),
(86, 'Andrea Sofía', 'Santiago Suárez', 'usuario@correo.com'),
(87, 'Erika Alicia', 'Ramírez Juárez', 'usuario@correo.com'),
(88, 'Laura Jeanette ', 'Álvarez Garcia ', 'usuario@correo.com'),
(89, 'Arturo', 'Hernández Camacho', 'usuario@correo.com'),
(90, 'Irma Lizeth', 'Melo Silva', 'usuario@correo.com'),
(91, 'Irma', 'Zamora Cucano', 'usuario@correo.com'),
(92, 'Ma. Concepción', 'Morales Corona', 'usuario@correo.com'),
(93, 'Paola Leticia', 'Rodríguez Maciel', 'usuario@correo.com'),
(94, 'Edith', 'Hernández Méndez', 'usuario@correo.com'),
(95, 'Erika Carmina', 'Reyes Rojas', 'usuario@correo.com'),
(96, 'Victor Manuel ', 'Arratia Méndez', 'usuario@correo.com'),
(97, 'Alondra Lezlie', 'Abundez González ', 'usuario@correo.com'),
(98, 'Amaranta', 'Rivero Gattelet', 'usuario@correo.com'),
(99, 'KARLA PAOLA', 'MIRANDA GARCIA', 'usuario@correo.com'),
(100, 'LUDMILA ', 'ORTEGA RANGEL', 'usuario@correo.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL,
  `asistenteId` int(11) NOT NULL DEFAULT '0',
  `dia` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id`, `asistenteId`, `dia`) VALUES
(1, 1, '2018-08-27'),
(2, 1, '2018-08-29'),
(3, 1, '2018-08-30'),
(4, 70, '2018-08-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catModalidad`
--

CREATE TABLE `catModalidad` (
  `id` int(11) NOT NULL,
  `modalidad` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `catModalidad`
--

INSERT INTO `catModalidad` (`id`, `modalidad`) VALUES
(2, 'Ponencia'),
(3, 'Mesa redonda'),
(4, 'Taller'),
(12, 'Plenaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ponente`
--

CREATE TABLE `ponente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `apellidos` varchar(50) NOT NULL DEFAULT '',
  `institucion` varchar(128) NOT NULL DEFAULT '',
  `biodata` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ponente`
--

INSERT INTO `ponente` (`id`, `nombre`, `apellidos`, `institucion`, `biodata`) VALUES
(8, 'María del Rosario', 'Aragón López', 'Mediateca del CELE', 'es egresada de la licenciatura en Filosofía. Se ha especializado en el uso educativo de medios y tecnologías de la información, derechos de autor y educación a distancia. Es técnico académico de la Mediateca y tutora del diplomado en línea \"Formación de Asesores de Centros de Autoacceso\" de la ENALLT, UNAM.'),
(12, 'Eréndira Dolores', 'Camarena Ortiz', 'Universidad Nacional Autónoma de México', 'es licenciada en Arqueología por la ENAH, maestra en Estudios Mesoamericanos por la UNAM, doctora, con reconocimiento Cum Laude, en Didáctica de la Lengua por la Universidad de Barcelona, España, además, doctora en Antropología por la UNAM.'),
(25, 'Ana María', 'Mendoza Batista', 'CCH SUR', 'es licenciada en Humanidades por la UAM y maestra en Tecnología Educativa por el Tec de Monterrey. Cuenta con los cursos Formación de Profesores y ALAD, del CELE-UNAM. Ha sido maestra de intercambio en Carolina del Norte, EE.UU. Actualmente se desempeña como catedrática en la UAM Iztapalapa, el CCH Sur y la Facultad de Ciencias Políticas.'),
(30, 'María Teresa', 'Mallén Estebaranz', 'Centro de Enseñanza de Lenguas Extranjeras', 'es licenciada en Literatura Latinoamericana y maestra en Lingüística Aplicada. Desde 1987 se desempeña como profesora de inglés en la UNAM, asimismo, como formadora de profesores e investigadora, a partir del año 2000, en el Departamento de Lingüística Aplicada. Ha participado en varios proyectos sobre evaluación, cultura y educación a distancia.'),
(35, 'Haydée', 'Silva Ochoa', 'Colegio de Letras Modernas, Facultad de Filosofía y Letras, Universidad Nacional Autónoma de México', 'estudió Teoría literaria, Didáctica, Traducción, Interpretación y Ciencias del juego. Es autora de dos libros y coautora de tres más. Cuenta con cerca de 120 artículos publicados. Ha impartido más de 200 talleres pedagógicos, principalmente relacionados con el juego en el aula de idiomas. Está adscrita a la Facultad de Filosofía y Letras de la UNAM.'),
(37, 'María de la Paz Adelia', 'Peña Clavel', 'Escuela Nacional de Lenguas Lingüística y Traducción', 'es coordinadora de la Mediateca de la ENALLT-UNAM. Maestra en Tecnología Educativa por el ITESM y en Entornos Virtuales de Aprendizaje por la Universidad de Panamá y Virtual Educa. Sus principales áreas de interés son: Teletándem; desarrollo de la autonomía, y el aprendizaje mediado por tecnología.'),
(49, 'Sonia', 'Cruz Techica', 'UNAM', 'es licenciada y maestra en Ingeniería en Computación por la UNAM. Ha colaborado en la CUAED y desempeñado actividades como asesora en línea, además, ha impartido ponencias sobre el uso de tecnologías en la enseñanza. En la actualidad desarrolla proyectos de educación a distancia en la CED de la ENALLT .');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retroalimentacion`
--

CREATE TABLE `retroalimentacion` (
  `id` int(11) NOT NULL,
  `trabajoId` int(11) NOT NULL DEFAULT '0',
  `asistenteId` int(11) NOT NULL DEFAULT '0',
  `calificacion` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `usuarioId` int(11) DEFAULT NULL,
  `token` char(18) DEFAULT NULL,
  `caduca` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajo`
--

CREATE TABLE `trabajo` (
  `id` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL DEFAULT '',
  `sinopsis` longtext NOT NULL,
  `modalidadId` smallint(2) UNSIGNED ZEROFILL NOT NULL DEFAULT '00',
  `ponenteId` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `trabajo`
--

INSERT INTO `trabajo` (`id`, `titulo`, `sinopsis`, `modalidadId`, `ponenteId`) VALUES
(1, 'Nuevo diseño y contenidos en el sitio de la mediateca de la ENALLT, UNAM', 'El sitio web de la Mediateca de la ENALLT es un puente entre el público usuario y la institución; valiéndose de los recursos tecnológicos actuales, se abre un espacio digital de comunicación que requería una evolución de su primer versión en 2006 a la actualidad, ya que desde el punto de vista funcional las necesidades de los usuarios han cambiado dado que su perfil y cotidianidad son diferentes a los de anteriores generaciones. En esta mesa redonda se presenta el nuevo sitio desde cuatro visiones diferentes: la comunicación escrita, la comunicación visual, la tecnología y la proyección a futuro, así como los diversos procesos en los que hemos transitado desde la planeación, el diseño y el desarrollo.', 03, 8),
(2, 'Didáctica de lenguas extranjeras para ciegos y débiles visuales', 'El trabajo docente con alumnos ciegos o débiles visuales es un reto que debemos enfrentar. En esta ponencia hablaremos de las primeras experiencias de enseñanza-aprendizaje de lenguas extranjeras con alumnos con discapacidad visual. La meta es lograr que la ENALLT paulatinamente se articule en un sistema que ofrezca opciones de inclusión para la educación para la vida, el trabajo y la sobre todo la educación incluyendo a las personas con capacidades diferentes.', 02, 12),
(3, 'Enhancing Writing and Speaking Skills Through a Webquest in Two Context Settings ', 'El aprendizaje a distancia ha tenido un marcado desarrollo en el ámbito educativo. Con el propósito de hacer más dinámico el aprendizaje se ha recurrido a actividades metodológicas en línea como lo es el uso de las <i>webquests</i>. El objetivo del presente proyecto es compartir la experiencia de trabajo de dos grupo en forma diacrónica en los centros de idiomas de dos universidades distintas (UV- CELEX UAM-I) enfatizando las habilidades orales y escritas a través de la <i>webquest</i>.', 02, 25),
(4, '<i>Reading Tools</i>: Un mooc para comprensión de lectura y preparación de examen de requisito', '¿Das clases de comprensión de lectura en lengua extranjera? ¿Tus alumnos tienen que pasar un examen de requisito de esta habilidad para graduarse? ¿Estás interesado en ayudarles a mejorar sus estrategias, gramática, vocabulario y conocimiento de formatos de exámenes? Acompáñanos en esta presentación donde conocerás el curso abierto gratuito masivo a distancia (mooc) <i>Reading Tools</i>, diseñado en la ENALLT para apoyar a los estudiantes a mejorar sus habilidades de lectura y que adquieran confianza para presentar su examen de requisito.', 02, 30),
(5, 'Hacia una perspectiva balanceada de la evaluación', 'La evaluación de lenguas extranjeras es una actividad compleja que tiene varias aristas. ¿Cómo entender mejor esta complejidad y sensibilizarse ante lo que implican diversas formas de evaluación? ¿Cómo experimentar personalmente y sopesar las ventajas y desventajas de la evaluación cuantitativa y cualitativa, y lograr un balance entre ambas? En esta sesión compartiremos algunas de las actividades que nos han ayudado a lograrlo en el módulo de Evaluación del Curso de Formación de Profesores de la ENALLT.', 02, 30),
(6, 'Didáctofilos. Ideas y materiales plurilingües sobre Didáctica de la lengua y la literatura', 'Presentaremos aquí Didáctofilos, un sitio electrónico creado por el equipo docente del área de Didáctica de la lengua y la literatura del Colegio de Letras Modernas de la Facultad de Filosofía y Letras de la Universidad Nacional Autónoma de México. Tiene por objetivo apoyar a todos aquellos interesados por la didáctica de lenguas y culturas con ideas y materiales de diversa índole, además de proporcionar noticias actualizadas y un espacio de intercambio.', 02, 35),
(7, '¿Qué hacer y qué no? Una historia de aciertos y errores en el teletándem', 'Este trabajo tiene como objetivo ofrecer una introducción a los profesores que deseen implementar sesiones tándem. Para ello, se presentará una panorama de lo que implica realizar este tipo de una sesiones, así como recomendaciones de lo que se debe o no hacer para tener un buen resultado. Los contenidos están basados en la experiencia de la presentado y sustentados en la metodología <i>tándem</i>, la pedagogía de la autonomía y la teoría sociocultural.', 11, 37),
(8, 'Educaplay para la enseñanza de lenguas ', 'En este taller mostraremos el uso de Educaplay, herramienta web de acceso libre para la elaboración de actividades educativas en la enseñanza de lenguas. Daremos ejemplos prácticos de su aplicación pedagógica para un mejor aprovechamiento en la práctica docente. Al término de este taller, los profesores podrán generar sus propias actividades interactivas con la posibilidad de agregarlas a una plataforma de aprendizaje o integrar los recursos a su página web o blog.', 04, 49);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistente`
--
ALTER TABLE `asistente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catModalidad`
--
ALTER TABLE `catModalidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ponente`
--
ALTER TABLE `ponente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `retroalimentacion`
--
ALTER TABLE `retroalimentacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trabajo`
--
ALTER TABLE `trabajo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistente`
--
ALTER TABLE `asistente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `catModalidad`
--
ALTER TABLE `catModalidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `ponente`
--
ALTER TABLE `ponente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `retroalimentacion`
--
ALTER TABLE `retroalimentacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trabajo`
--
ALTER TABLE `trabajo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
