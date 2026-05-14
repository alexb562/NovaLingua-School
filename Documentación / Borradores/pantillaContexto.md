Plantilla para el análisis de requerimientos de la infraestructura informática de una empresa ficticia. Debes adaptarla a tu proyecto.

# 📋 Análisis de Requerimientos - Proyecto de Infraestructura Informática

## 1. Información General de la Empresa

- **Nombre de la empresa:** NovaLingua School
- **Sector de actividad:** Academia de idiomas
- **Número de empleados:** 65
- **Ubicación física:** Portugal
  - **Oficina principal:** Rua de Fernandes Tomás 557, 4000-049 Porto, Portugal
  - **Otras sedes:** Braga, Coímbra
- **¿Se permite teletrabajo?:** Sí

## 2. Estructura Organizativa

| Departamento                   | Nº usuarios | Ubicación principal      | Función principal                                           |
| ------------------------------ | ----------: | ------------------------ | ----------------------------------------------------------- |
| Dirección y Administración     |           8 | Porto                    | Gestión general, finanzas, facturación y tareas de RRHH     |
| IT / Sistemas                  |           5 | Porto                    | Servidores, red, usuarios, seguridad y copias de seguridad  |
| Desarrollo y Plataforma Online |           8 | Porto                    | Sitio web, LMS, plataforma de alumnos y base de datos       |
| Equipo Académico               |          28 | Braga / Coimbra / remoto | Profesores, coordinadores académicos y clases online        |
| Atención al Cliente            |          10 | Porto / Braga            | Soporte a estudiantes, consultas sobre cursos e incidencias |
| Marketing y Ventas             |           6 | Porto                    | Publicidad, redes sociales, ventas y colaboraciones         |
| **Total**                      |      **65** |                          |                                                             |


## 3. Necesidades Funcionales

- **Servicios informáticos requeridos:**
  - [x] Correo electrónico empresarial
  - [x] Almacenamiento y compartición de archivos
  - [x] Servidor web corporativo
  - [x] Gestión de usuarios y permisos (Active Directory)
  - [x] Servidor de base de datos
  - [x] Aplicaciones específicas (si da tiempo - una aplicación móvil)
  - [x] Acceso remoto (VPN, Escritorio Remoto)

## 4. Requisitos Técnicos

### 4.1 Red

- **Topología deseada:** Estrella
- **Segmentación de red:** Sí - uso de VLANs
- **Firewall / Seguridad perimetral:** Sí
- **Wi-Fi corporativo:** Sí - acceso invitados separado


### 4.2 Servidores

| Servicio | ¿Necesario? | Tipo de servidor | Observaciones |
|---|---|---|---|
| DNS | Sí | Windows/Linux | Resolución interna de nombres para equipos, servidores y servicios de la empresa |
| DHCP | Sí | Windows/Linux | Asignación automática de direcciones IP en las distintas sedes y VLANs |
| Active Directory | Sí | Windows Server | Gestión centralizada de usuarios, grupos, permisos y políticas de seguridad |
| Archivos compartidos | Sí | Windows/Linux / NAS | Almacenamiento compartido para departamentos, material académico, documentación interna y copias de seguridad |
| Web corporativa y plataforma online | Sí | Apache/Nginx | Página pública de la empresa y acceso privado para estudiantes, profesores y administración |
| Base de datos | Sí | MySQL/MariaDB | Almacenamiento de usuarios, cursos, matrículas, horarios, pagos, incidencias y contenidos de la plataforma |

### 4.3 Seguridad

- **Políticas de acceso:** Autenticación centralizada mediante Active Directory, con usuarios agrupados por departamento y permisos basados en roles. Se aplicará el principio de mínimo privilegio, de forma que cada empleado solo pueda acceder a los recursos necesarios para su trabajo. El personal de administración tendrá acceso a documentación interna y facturación, el equipo académico a materiales docentes, atención al cliente a incidencias y datos básicos de alumnos, y el departamento de IT a la administración de sistemas.

- **Backups:** Se realizarán copias incrementales diarias y copias completas semanales de servidores, bases de datos, plataforma online y carpetas compartidas. Las copias se almacenarán en un NAS local en la sede principal de Porto y se replicarán en un servicio cloud externo. Se conservarán copias durante 30 días y se realizarán pruebas periódicas de restauración.

- **Antivirus / Antimalware:** Se utilizará una solución antivirus/antimalware centralizada para equipos y servidores, con protección en tiempo real, actualizaciones automáticas, análisis programados y alertas gestionadas por el departamento de IT.

- **VPN:** Sí. Se configurará una VPN site-to-site para conectar de forma segura las tres sedes de la empresa. Además, se habilitará acceso VPN remoto para empleados autorizados que trabajen fuera de la oficina, usando credenciales corporativas y autenticación segura.

## 5. Base de Datos

## 5. Base de Datos

- **Tipo de información a almacenar:**  
  La base de datos almacenará información relacionada con alumnos, profesores, cursos, matrículas, horarios de clases, pagos, incidencias de soporte, materiales académicos y usuarios de la plataforma online.

- **Número estimado de registros:**  
  Se estima un volumen inicial aproximado de 10.000 a 15.000 registros, incluyendo alumnos activos e históricos, profesores, cursos, matrículas, sesiones de clase, incidencias y pagos. La base de datos deberá ser escalable para permitir el crecimiento de la empresa durante los próximos años.

- **Usuarios con acceso a la BD:**  
  El acceso directo a la base de datos estará limitado al departamento de IT y Desarrollo. El resto de usuarios accederá a la información mediante la plataforma online, con permisos según su rol:
  - **Administración:** acceso a datos de alumnos, matrículas, facturación y pagos.
  - **Equipo Académico:** acceso a cursos, horarios, materiales y seguimiento académico de alumnos.
  - **Profesores:** acceso limitado a sus clases, alumnos asignados y materiales docentes.
  - **Atención al Cliente:** acceso a datos básicos de alumnos e incidencias.
  - **Marketing y Ventas:** acceso limitado a información comercial y estadísticas, sin acceso a datos sensibles.

## 6. Sitio Web

- **Tipo de web:**
  - [x] Informativa
  - [x] Acceso a usuarios registrados
  - [x] Catálogo de productos/servicios
- **Tecnología deseada:** Angular (Frontend), Spring Boot(Backend), MySQL(BD), Astro-Wordpress (landing page)

## 7. Otros Requisitos

- **Presupuesto estimado:** 60.000
- **Crecimiento previsto:** Se previste añadir más profesores en los próximos años, ya que la demanada es alta. 
- **Mantenimiento:** Interno