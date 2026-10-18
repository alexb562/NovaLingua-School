-- =========================================================
-- NovaLingua School
-- Esquema de base de datos MySQL
--
-- Reconstruido a partir de la base de datos documentada
-- durante el proyecto original.
--
-- Los datos de prueba y credenciales utilizados durante
-- el desarrollo original se han omitido de esta versión
-- pública del repositorio.
-- =========================================================

CREATE DATABASE novalingua_school;
USE novalingua_school;

-- ---------------------------------------------------------
-- Tabla: alumno_curso
-- ---------------------------------------------------------

CREATE TABLE `alumno_curso` (
  `id_alumno_curso` bigint(20) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `fecha_matricula` datetime DEFAULT current_timestamp(),
  `estado` varchar(255) DEFAULT NULL,
  `nivel` varchar(255) DEFAULT NULL,
  `nombre_curso` varchar(255) DEFAULT NULL,
  `progreso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------
-- Tabla: alumno_info
-- ---------------------------------------------------------

CREATE TABLE `alumno_info` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `contrasenia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------
-- Tabla: curso
-- ---------------------------------------------------------

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `nivel` enum('A1','A2','B1','B2','C1','C2') NOT NULL,
  `modalidad` enum('Presencial','Online','Híbrido') NOT NULL,
  `dias_semana` enum('Lunes-Miércoles','Martes-Jueves','Viernes','Sábado') NOT NULL,
  `franja_horaria` varchar(50) NOT NULL,
  `id_profesor` int(11) DEFAULT NULL,
  `id_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------
-- Tabla: empleado
-- ---------------------------------------------------------

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `sede` enum('Oporto','Braga','Coímbra','Online') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------
-- Tabla: incidencia
-- ---------------------------------------------------------

CREATE TABLE `incidencia` (
  `id_incidencia` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `tipo` enum('Técnico','Académico','Facturación','Otros') NOT NULL,
  `estado` enum('Abierto','En Proceso','Resuelto','Cerrado') DEFAULT 'Abierto',
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `id_alumno` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------
-- Tabla: material
-- ---------------------------------------------------------

CREATE TABLE `material` (
  `id_material` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `tipo` enum('pdf','audio','video') NOT NULL,
  `url_descarga` varchar(255) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------
-- Tabla: profesor
-- ---------------------------------------------------------

CREATE TABLE `profesor` (
  `id_profesor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `especialidad_idioma` enum(
    'Inglés',
    'Francés',
    'Alemán',
    'Portugués',
    'Español'
  ) NOT NULL,
  `modalidad` enum(
    'Presencial',
    'Online',
    'Híbrido'
  ) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ---------------------------------------------------------
-- Tabla: progreso_alumno
-- ---------------------------------------------------------

CREATE TABLE `progreso_alumno` (
  `id_progreso` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `porcentaje` int(11) NOT NULL DEFAULT 0
);

-- ---------------------------------------------------------
-- Tabla: sede
-- ---------------------------------------------------------

CREATE TABLE `sede` (
  `id_sede` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `ciudad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =========================================================
-- Índices y claves primarias
-- =========================================================

ALTER TABLE `alumno_curso`
  ADD PRIMARY KEY (`id_alumno_curso`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_curso` (`id_curso`);

ALTER TABLE `alumno_info`
  ADD PRIMARY KEY (`id_alumno`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `id_sede` (`id_sede`);

ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `incidencia`
  ADD PRIMARY KEY (`id_incidencia`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_empleado` (`id_empleado`);

ALTER TABLE `material`
  ADD PRIMARY KEY (`id_material`),
  ADD KEY `id_curso` (`id_curso`);

ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `progreso_alumno`
  ADD PRIMARY KEY (`id_progreso`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_curso` (`id_curso`);

ALTER TABLE `sede`
  ADD PRIMARY KEY (`id_sede`);

-- =========================================================
-- AUTO_INCREMENT
-- =========================================================

ALTER TABLE `alumno_curso`
  MODIFY `id_alumno_curso` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `alumno_info`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `incidencia`
  MODIFY `id_incidencia` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `material`
  MODIFY `id_material` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `profesor`
  MODIFY `id_profesor` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `progreso_alumno`
  MODIFY `id_progreso` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sede`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT;

-- =========================================================
-- Relaciones y claves foráneas
-- =========================================================

ALTER TABLE `alumno_curso`
  ADD CONSTRAINT `alumno_curso_ibfk_1`
    FOREIGN KEY (`id_alumno`)
    REFERENCES `alumno_info` (`id_alumno`)
    ON DELETE CASCADE,

  ADD CONSTRAINT `alumno_curso_ibfk_2`
    FOREIGN KEY (`id_curso`)
    REFERENCES `curso` (`id_curso`)
    ON DELETE CASCADE;

ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1`
    FOREIGN KEY (`id_profesor`)
    REFERENCES `profesor` (`id_profesor`)
    ON DELETE SET NULL,

  ADD CONSTRAINT `curso_ibfk_2`
    FOREIGN KEY (`id_sede`)
    REFERENCES `sede` (`id_sede`)
    ON DELETE SET NULL;

ALTER TABLE `incidencia`
  ADD CONSTRAINT `incidencia_ibfk_1`
    FOREIGN KEY (`id_alumno`)
    REFERENCES `alumno_info` (`id_alumno`)
    ON DELETE SET NULL,

  ADD CONSTRAINT `incidencia_ibfk_2`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `empleado` (`id_empleado`)
    ON DELETE SET NULL;

ALTER TABLE `material`
  ADD CONSTRAINT `material_ibfk_1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `curso` (`id_curso`)
    ON DELETE CASCADE;

ALTER TABLE `progreso_alumno`
  ADD CONSTRAINT `progreso_alumno_ibfk_1`
    FOREIGN KEY (`id_alumno`)
    REFERENCES `alumno_info` (`id_alumno`)
    ON DELETE CASCADE,

  ADD CONSTRAINT `progreso_alumno_ibfk_2`
    FOREIGN KEY (`id_curso`)
    REFERENCES `curso` (`id_curso`)
    ON DELETE CASCADE;

COMMIT;