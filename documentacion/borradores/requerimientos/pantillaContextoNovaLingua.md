Plantilla para el análisis de requerimientos de la infraestructura informática de una empresa ficticia. Debes adaptarla a tu proyecto.
# 📋 Análisis de Requerimientos - Proyecto de Infraestructura Informática

## 1. Información General de la Empresa

- **Nombre de la empresa:** NovaLingua School
- **Sector de actividad:** Academia de idiomas
- **Número de empleados:** 60
- **Ubicación física:** Portugal
  - **Oficina principal:** Rua de Fernandes Tomás 557, 4000-049 Porto, Portugal
  - **Otras sedes:** Braga, Coímbra
- **¿Se permite teletrabajo?:** Sí

## 2. Estructura Organizativa

| Departamento                   | Nº usuarios | Ubicación principal      | Función principal                                           |
| ------------------------------ | ----------: | ------------------------ | ----------------------------------------------------------- |
| Dirección y Administración     |           8 | Porto                    | Gestión general, finanzas y tareas de RRHH                  |
| IT / Sistemas                  |           5 | Porto                    | Gestión de red, servidores, usuarios, seguridad y copias de seguridad |
| Desarrollo y Plataforma Online |           2 | Porto                    | Desarrollo y mantenimiento del sitio web, LMS y plataforma online |
| Equipo Académico               |          28 | Braga / Coimbra / remoto | Profesores, coordinadores académicos y clases online        |
| Atención al Cliente            |          11 | Porto / Braga / Coimbra  | Soporte a estudiantes, consultas sobre cursos e incidencias |
| Marketing y Ventas             |           6 | Porto                    | Publicidad, redes sociales, ventas y colaboraciones         |
| **Total**                      |      **60** |                          |                                                             |


## 3. Necesidades Funcionales

- **Servicios informáticos requeridos:**
  - [x] Almacenamiento y compartición de archivos
  - [x] Gestión de usuarios y permisos (Active Directory)
  - [x] Servidor de base de datos
  - [x] Aplicaciones específicas (si da tiempo - una aplicación móvil)
  - [x] Acceso remoto (VPN, Escritorio Remoto)

## 4. Requisitos Técnicos

### 4.1 Red

- **Topología deseada:** Estrella jerárquica 
- **Segmentación de red:** Sí - uso de VLANs
- **Firewall / Seguridad perimetral:** Sí
- **Wi-Fi corporativo:** Sí - acceso invitados separado


#### Diseño VLANs y IP
Rangos potenciales:
| Office  | Main range     |
| ------- | -------------- |
| Porto   | `10.10.0.0/16` |
| Braga   | `10.20.0.0/16` |
| Coimbra | `10.30.0.0/16` |

Para mantener una numeración coherente, se utilizará el mismo número de VLAN para la misma función en todas las sedes:

| VLAN | Función |
| ---: | ------- |
| 10 | Dirección y Administración |
| 20 | Desarrollo y Plataforma Online |
| 30 | Equipo Académico |
| 40 | Atención al Cliente |
| 50 | Marketing y Ventas |
| 60 | Invitados Wi-Fi |
| 70 | Gestión de red y Servidores |

- Es esencial dividir cada sitio en cuanto a su función para crear un nivel alto de seguridad. Por ejemplo, lo siguiente puede ser un ejemplo de cómo se dividiría cada sede:

##### VLANs - Porto
| VLAN | Nombre | Network | Gateway |
| ---: | ------ | ------- | ------- |
| 10 | Dirección-Administración | `10.10.10.0/24` | `10.10.10.1` |
| 20 | Desarrollo-Plataforma | `10.10.20.0/24` | `10.10.20.1` |
| 40 | Atención-Cliente | `10.10.40.0/24` | `10.10.40.1` |
| 50 | Marketing-Ventas | `10.10.50.0/24` | `10.10.50.1` |
| 60 | Invitados | `10.10.60.0/24` | `10.10.60.1` |
| 70 | Gestión de red y Servidores | `10.10.70.0/24` | `10.10.70.1` |

- Braga y Coímbra no necesitan tantas VLANs como Porto, ya que no alojan la infraestructura crítica principal. Se tendrá en cuenta la separación por acceso: la red de invitados no tendrá acceso al resto de la red interna. Por defecto se bloqueará la comunicación entre VLANs y solo se permitirán las conexiones necesarias. El departamento de IT / Sistemas tendrá acceso a la VLAN de gestión de red y servidores para tareas de administración. Dirección y Administración no tendrá acceso directo a los servidores internos; accederá únicamente a las aplicaciones autorizadas mediante la plataforma correspondiente. 

##### VLANs - Braga
| VLAN | Nombre | Network | Gateway |
| ---: | ------ | ------- | ------- |
| 30 | Académico | `10.20.30.0/24` | `10.20.30.1` |
| 40 | Atención-Cliente | `10.20.40.0/24` | `10.20.40.1` |
| 60 | Invitados | `10.20.60.0/24` | `10.20.60.1` |
| 70 | Gestión de red | `10.20.70.0/24` | `10.20.70.1` |

- Braga se centra en atención al cliente.

##### VLANs - Coímbra
| VLAN | Nombre | Network | Gateway |
| ---: | ------ | ------- | ------- |
| 30 | Académico | `10.30.30.0/24` | `10.30.30.1` |
| 40 | Atención-Cliente | `10.30.40.0/24` | `10.30.40.1` |
| 60 | Invitados | `10.30.60.0/24` | `10.30.60.1` |
| 70 | Gestión de red | `10.30.70.0/24` | `10.30.70.1` |

- Coímbra se centra principalmente en el contenido académico y contará con una pequeña presencia de atención al cliente. 


### 4.2 Servidores

| Servicio | ¿Necesario? | Tipo de servidor | Observaciones |
|---|---|---|---|
| Active Directory | Sí | Windows Server | Gestión centralizada de usuarios, grupos, permisos y políticas de seguridad |
| Archivos compartidos | Sí | Windows/Linux / NAS | Almacenamiento compartido para departamentos, material académico, documentación interna y copias de seguridad |
| Web corporativa y plataforma online | Sí | Apache/Nginx | Página pública de la empresa y acceso privado para estudiantes, profesores y administración |
| Base de datos | Sí | MySQL/MariaDB | Almacenamiento de usuarios, cursos, matrículas, e horarios de la plataforma |

### 4.3 Seguridad

- **Políticas de acceso:** Autenticación centralizada mediante Active Directory, con usuarios agrupados por departamento y permisos basados en roles. Se aplicará el principio de mínimo privilegio, de forma que cada empleado solo pueda acceder a los recursos necesarios para su trabajo. Dirección y Administración no tendrá acceso directo a los servidores internos; accederá únicamente a las aplicaciones y datos necesarios mediante la plataforma autorizada. El departamento de IT / Sistemas tendrá acceso a la gestión de red, servidores y administración de sistemas.

- **Backups:** Se realizará **una copia incremental diaria** y **una copia completa semanal** de servidores, base de datos, plataforma online y carpetas compartidas. Las copias principales se almacenarán en el NAS local de Porto y se mantendrá una **replicación externa** hacia el NAS de respaldo ubicado en Braga.

| Tipo de copia | Frecuencia | Ubicación | Objetivo |
|---|---|---|---|
| Incremental | Diaria | NAS local en Porto | Guardar los cambios diarios |
| Completa | Semanal | NAS local en Porto | Mantener una copia completa de los datos críticos |
| Replicación externa | Diaria | NAS de respaldo en Braga | Disponer de una copia fuera de la sede principal |

- **Antivirus / Antimalware:** Se utilizará una solución antivirus/antimalware centralizada para equipos y servidores, con actualizaciones automáticas y protección en tiempo real.

- **VPN:** Sí. Se configurará una VPN site-to-site para conectar de forma segura las tres sedes de la empresa. Además, se habilitará acceso VPN remoto para empleados autorizados que trabajen fuera de la oficina.


## 5. Base de Datos

- **Tipo de información a almacenar:**  
  La base de datos almacenará información relacionada con alumnos, profesores, niveles de idiomas, y información sobre las clases.

- **Número estimado de registros:**  
  Se estima un volumen inicial aproximado de 5.000 a 8.000 registros, incluyendo:
  - Alumnos: numero expediente, nombre, información de contacto (número teléfono, correo),
  - Dirección / Profesores: - número identificador, nombre, información de contacto (número teléfono, correo), código de clase.
  - Clases / Horarios - código integrador de clase, nombre de clase, idioma, nivel de idioma, día de la semana, hora de empezar, hora de terminar.
  - Asignación - relación entre todas las entidades
- La base de datos deberá ser escalable para permitir el crecimiento de la empresa durante los próximos años.

- **Usuarios con acceso a la BD:**  
  El acceso directo a la base de datos estará limitado al departamento de IT / Sistemas y al equipo de Desarrollo. El resto de usuarios accederá a la información mediante la plataforma online, con permisos según su rol:
  - **Administración:** acceso a datos administrativos necesarios mediante la plataforma, sin acceso directo a los servidores internos.
  - **Equipo Académico:** acceso a clases, horarios y listado de alumnos.

## 6. Sitio Web

- **Tipo de web:**
  - [x] Informativa
  - [x] Acceso a usuarios registrados
  - [x] Catálogo de productos/servicios
- **Tecnología deseada:** Angular (Frontend), Spring Boot(Backend), MySQL(BD), Astro-Wordpress (landing page)

### Ejemplos iniciales de inicio (generados por IA)
![alt text](../ejemplosDiseno/logo.png)
- Logo
![alt text](../ejemplosDiseno/vistaMovil.png)
- Vista de móvil
![alt text](../ejemplosDiseno/landingPage.png)
- Landing page

## 7. Otros Requisitos

- **Presupuesto estimado:**  
  Se estima una inversión inicial aproximada de **80.000 €** para la implantación de la infraestructura informática de la empresa. Este presupuesto incluye equipos de usuario, servidores, almacenamiento, dispositivos de red, cableado, seguridad, licencias básicas y puesta en marcha de los servicios principales.

- **Crecimiento previsto:**  
  Se prevé la incorporación de nuevos profesores, alumnos y personal de soporte durante los próximos años, debido al aumento de la demanda de formación online. La infraestructura deberá ser escalable para permitir la creación de nuevas cuentas de usuario, ampliación del almacenamiento, crecimiento de la base de datos y aumento del número de clases online.

- **Mantenimiento:**  
  El mantenimiento será principalmente **interno**, gestionado por el departamento de IT / Sistemas. Este departamento se encargará de la administración de usuarios, servidores, red, copias de seguridad, seguridad informática y soporte técnico básico. Para tareas especializadas, como ampliaciones importantes, auditorías de seguridad o reparaciones de hardware, se podrá recurrir a proveedores externos.
