# Proyecto Integrador — Infraestructura Informática NovaLingua School

## 1. Portada

**Título del proyecto:** Implementación de la infraestructura informática para NovaLingua School  
**Empresa ficticia:** NovaLingua School  
**Curso:** 2025-2026  
**Integrantes:** Beatriz Moreno y Alex Baier
**Fecha de entrega:** 2/6/2025


## 2. Índice

1. Introducción y tecnologías utilizadas
2. Análisis de requisitos  
3. Diseño lógico de la red  
4. Diseño físico e inventario  
5. Implementación técnica  
6. Pruebas y validación  
7. Manual técnico  
8. Manual de usuario  
9. Plan de mantenimiento y copias de seguridad  
10. Conclusión  
11. Anexos  


## 3. Introducción

Este proyecto consiste en el diseño e implementación de una infraestructura informática completa para **NovaLingua School**, una empresa ficticia dedicada a la enseñanza de idiomas. La solución propuesta incluye una red multisede con VLANs, direccionamiento IP, enrutamiento dinámico mediante OSPF, firewall, integración de un servidor, Active Directory, DNS interno, recursos compartidos, políticas de grupo, base de datos MySQL y servicios internos. El objetivo principal es presentar una infraestructura funcional, documentada y orientada a un entorno empresarial real.

### Tecnologías y herramientas utilizadas

En el desarrollo del proyecto se han utilizado diferentes tecnologías de virtualización, simulación de red, administración de sistemas, bases de datos y documentación. La elección de estas herramientas permite implementar una infraestructura empresarial completa en un entorno de laboratorio controlado.

#### 1. Virtualización

| Tecnología | Uso en el proyecto |
|---|---|
| **Oracle VirtualBox** | Plataforma de virtualización utilizada para ejecutar las máquinas virtuales del entorno, como Windows Server, el cliente Windows y la GNS3 VM. |
| **GNS3 VM** | Máquina virtual utilizada como backend de GNS3 para ejecutar routers OpenWrt, switches y nodos de red con mejor rendimiento. |
| **OVA / Exportación de máquinas virtuales** | Formato utilizado para exportar e importar máquinas virtuales como Windows Server entre distintos equipos. |
| **Snapshots** | Utilizados para guardar estados estables del proyecto y poder recuperar la configuración en caso de error. |

#### 2. Simulación y administración de red

| Tecnología | Uso en el proyecto |
|---|---|
| **GNS3** | Herramienta principal para diseñar, simular e implementar la topología de red multisede. |
| **OpenWrt** | Sistema utilizado en los routers virtuales de Porto, Braga y Coimbra. Permite configurar interfaces, VLANs, rutas, firewall y servicios de red. |
| **FRRouting / FRR** | Suite de enrutamiento utilizada dentro de OpenWrt para implementar OSPF entre las sedes. |
| **OSPF** | Protocolo de enrutamiento dinámico utilizado para intercambiar rutas entre Porto, Braga y Coimbra. |
| **VPCS** | Clientes ligeros utilizados en GNS3 para realizar pruebas de conectividad, gateway, VLANs y firewall. |
| **Switch Ethernet de GNS3** | Utilizado para simular switches de acceso y distribución con puertos access y trunk/dot1q. |

#### 3. VLANs y direccionamiento IP

| Tecnología / concepto | Uso en el proyecto |
|---|---|
| **VLAN 802.1Q** | Segmentación lógica de la red por departamentos y servicios. |
| **Subinterfaces VLAN** | Configuradas en OpenWrt, por ejemplo `eth3.20`, `eth3.70`, `eth2.80`, etc. |
| **Direccionamiento IPv4 privado** | Uso de redes privadas `10.x.x.x/24` para las VLANs y `/30` para enlaces punto a punto. |
| **Puertas de enlace por VLAN** | Cada VLAN tiene su gateway configurado en el router correspondiente. |
| **Enlaces punto a punto /30** | Usados para conectar Porto-Braga y Porto-Coimbra. |

#### 4. Seguridad y firewall

| Tecnología | Uso en el proyecto |
|---|---|
| **nftables** | Sistema de firewall utilizado en OpenWrt para aplicar reglas de filtrado entre VLANs. |
| **Reglas `drop`** | Utilizadas para bloquear tráfico no autorizado, como invitados hacia redes internas o usuarios hacia VLAN 70. |
| **Regla `ct state established,related accept`** | Permite el tráfico de respuesta de conexiones ya iniciadas, manteniendo el firewall con comportamiento stateful. |
| **Aislamiento de VLAN 60** | La red de invitados queda bloqueada frente a redes internas. |
| **Protección de VLAN 70** | La VLAN de gestión/servidores queda protegida frente a accesos directos desde VLANs de usuarios. |
| **Aislamiento de VLAN 80** | El Wi-Fi corporativo queda separado de las VLANs cableadas locales y de la VLAN 70. |

#### 5. Sistemas operativos

| Sistema | Uso en el proyecto |
|---|---|
| **Windows Server 2019** | Servidor principal de la empresa, ubicado en la VLAN 70 de Porto. Aloja Active Directory, DNS, recursos compartidos, GPOs y MySQL. |
| **Windows 10/11 Client** | Cliente integrado en el dominio para comprobar inicio de sesión, DNS, acceso a recursos compartidos y aplicación de GPOs. |
| **OpenWrt Linux** | Sistema operativo de los routers virtuales usados en GNS3. |

#### 6. Servicios de Windows Server

| Servicio | Uso en el proyecto |
|---|---|
| **Active Directory Domain Services / AD DS** | Implementación del dominio `novalingua.local` para administración centralizada de usuarios, equipos y políticas. |
| **DNS Server** | Servicio DNS interno requerido por Active Directory. Resuelve el dominio `novalingua.local` y registros SRV del controlador de dominio. |
| **File Server / Recursos compartidos** | Compartición de carpetas por departamento, como `Desarrollo`, `General`, `IT`, `Academico`, etc. |
| **Group Policy / GPO** | Aplicación de políticas corporativas como fondo de pantalla, restricciones de Panel de Control y mapeo de carpetas. |
| **Windows Defender Firewall** | Firewall del sistema Windows, ajustado cuando fue necesario para permitir pruebas como ICMP. |
| **DNS Forwarders** | Reenvío de consultas externas desde el DNS interno hacia `8.8.8.8`. |

#### 7. Active Directory y gestión de usuarios

| Elemento | Uso en el proyecto |
|---|---|
| **Dominio `novalingua.local`** | Dominio principal de la empresa. |
| **Controlador de dominio** | Windows Server actúa como controlador de dominio principal. |
| **Unidades Organizativas / OUs** | Estructura lógica para separar departamentos técnicos, no técnicos, IT, equipos y servidores. |
| **Usuarios de dominio** | Cuentas creadas para representar empleados de NovaLingua. |
| **Cliente unido al dominio** | Validación práctica de autenticación centralizada mediante Active Directory. |

#### 8. Recursos compartidos y carpetas corporativas

| Recurso | Uso en el proyecto |
|---|---|
| **Carpeta `C:\Compartido`** | Carpeta base donde se alojan los recursos compartidos. |
| **Rutas UNC** | Acceso a recursos mediante rutas como `\\10.10.70.100\Desarrollo`. |
| **Carpeta `Wallpapers`** | Almacena el fondo corporativo aplicado mediante GPO. |
| **Mapeo de unidades de red** | Configuración prevista mediante GPO para asignar letras de unidad a carpetas compartidas. |

#### 9. Base de datos

| Tecnología | Uso en el proyecto |
|---|---|
| **MySQL Community Server** | Servidor de base de datos utilizado para implementar la base de datos de NovaLingua. |
| **MySQL Command Line Client** | Herramienta usada para crear bases de datos, tablas, claves foráneas e insertar datos. |
| **MySQL Workbench** | Herramienta gráfica prevista para administrar la base de datos. |
| **novalingua_school** | Base de datos creada para gestionar sedes, alumnos, cursos, matrículas, empleados e incidencias. |
| **SQL** | Lenguaje utilizado para definir tablas, relaciones, inserciones y consultas. |
| **Claves foráneas** | Utilizadas para relacionar tablas como `matricula`, `curso`, `alumno_info`, `empleado` e `incidencia`. |

#### 10. Servicio web / LMS

| Tecnología | Uso en el proyecto |
|---|---|
| **IIS / Internet Information Services** | Servicio web previsto para alojar una página interna o simulación de plataforma LMS. |
| **HTTP** | Protocolo de acceso al servicio web interno. |
| **Navegador web** | Herramienta de cliente para comprobar el acceso al portal interno. |
| **SASS** | Preprocesador de CSS para mejorar el rendimiento del mismo. |
| **PHP** | Gestiona la relación entre la página pública, formularios, y la base de datos. |

#### 11. Herramientas de prueba y validación

| Herramienta / comando | Uso en el proyecto |
|---|---|
| **ping** | Comprobación de conectividad entre clientes, routers, VLANs y servidor. |
| **ipconfig /all** | Verificación de configuración IP en Windows. |
| **nslookup** | Verificación de resolución DNS y registros de Active Directory. |
| **nltest** | Comprobación de descubrimiento del controlador de dominio. |
| **gpupdate /force** | Forzar actualización de políticas de grupo. |
| **gpresult /r** | Comprobar qué GPOs se aplican al usuario o equipo. |
| **net use** | Verificación y mapeo manual de unidades de red. |
| **show ip ospf neighbor** | Verificación de vecinos OSPF en FRRouting. |
| **show ip route ospf** | Verificación de rutas aprendidas mediante OSPF. |
| **nft list ruleset** | Verificación de reglas de firewall activas. |

#### 12. Documentación y presentación

| Herramienta | Uso en el proyecto |
|---|---|
| **Microsoft Word / LibreOffice Writer** | Elaboración del documento final del proyecto. |
| **PowerPoint / LibreOffice Impress** | Preparación de la presentación final. |
| **Capturas de pantalla** | Evidencias de configuración, pruebas y funcionamiento de servicios. |
| **Markdown** | Estructuración previa del documento técnico. |
| **Export portable project de GNS3** | Exportación del proyecto para compartirlo o respaldarlo. |
| **Exportación OVA de VirtualBox** | Exportación de máquinas virtuales Windows. |

#### 13. Resumen de tecnologías principales

| Área | Tecnología principal |
|---|---|
| Virtualización | Oracle VirtualBox |
| Simulación de red | GNS3 |
| Routers | OpenWrt |
| Enrutamiento dinámico | OSPF con FRRouting |
| Segmentación | VLANs 802.1Q |
| Firewall | nftables |
| Servidor principal | Windows Server 2019 |
| Directorio activo | Active Directory Domain Services |
| DNS interno | Windows DNS |
| Cliente | Windows 10/11 |
| Base de datos | MySQL Community Server |
| Recursos compartidos | File Server de Windows |
| Políticas | Group Policy / GPO |
| Web interno | IIS |
| Documentación | Word / LibreOffice Writer |


## 4. Análisis de requisitos

### 4.1 Descripción de la empresa

NovaLingua School es una escuela de idiomas con varias sedes en Portugal. La empresa necesita una infraestructura informática que permita la comunicación segura entre departamentos, sedes y servicios internos. Aunque no es una empresa tecnológica en sí, dependerá de servicios críticos cómo la compartición de recursos y una página web pública (para dar información) y privada (para gestión interna de perfiles, clases, etc.)

### 4.2 Sedes

| Sede | Función principal |
|---|---|
| Porto | Sede principal, servidores, gestión central |
| Braga | Sede secundaria |
| Coimbra | Sede secundaria |

### 4.3 Departamentos

| Departamento | Función |
|---|---|
| Dirección / Administración | Gestión administrativa y dirección |
| IT / Sistemas | Administración técnica y soporte |
| Desarrollo / Plataforma | Desarrollo y mantenimiento de plataforma/LMS |
| Académico | Profesores, cursos y gestión educativa |
| Atención Cliente | Soporte a alumnos y clientes |
| Marketing / Ventas | Captación de clientes, campañas y ventas |

### 4.4 Necesidades tecnológicas

La empresa necesita:

- Red separada por departamentos mediante VLANs.
- Comunicación entre las sedes de Porto, Braga y Coimbra.
- Servidor Windows Server para Active Directory.
- DNS interno integrado con Active Directory.
- Servidor de archivos.
- Base de datos MySQL.
- Servicio web interno o LMS.
- Firewall y políticas de seguridad.
- Wi-Fi corporativo para empleados.
- Wi-Fi de invitados aislado de la red interna.
- Políticas de grupo mediante GPO.
- Documentación técnica y manual de usuario.


## 5. Diseño lógico de la red

### 5.1 Descripción general

La red se organiza en tres sedes conectadas mediante routers OpenWrt dentro de GNS3. La sede principal es Porto, donde se encuentra la VLAN de gestión y servidores. Braga y Coimbra se conectan a Porto mediante enlaces punto a punto. El enrutamiento entre sedes se realiza mediante OSPF en área 0.

### 5.2 Topología lógica
#### Esquema abstracta
![alt text](documentacion/esquematicas/esquematicaTeoricaPorto.drawio.svg)
- Esquema lógica de Porto

![alt text](documentacion/esquematicas/esquematicaTeoricaCoimbra.drawio.svg)
- Esquema lógica de Coimbra

![alt text](documentacion/esquematicas/esquematicaTeoricaBraga.drawio.svg)
- Esquema lógica de Braga


#### Esquema Packet Tracer
![alt text](documentacion/esquematicas/ptPorto.png)
![alt text](documentacion/esquematicas/ptCoimbra.png)
![alt text](documentacion/esquematicas/ptBraga.png)


#### Esquema GNS
![alt text](documentacion/esquematicas/esquemaGNS.png)

### 5.3 Tabla de VLANs
```text
Porto
 ├── VLAN 10 Dirección/Admin
 ├── VLAN 20 Desarrollo
 ├── VLAN 40 Atención Cliente
 ├── VLAN 50 Marketing/Ventas
 ├── VLAN 60 Invitados
 ├── VLAN 70 Gestión/Servidores
 └── VLAN 80 Wi-Fi Corporativo

Braga
 ├── VLAN 30 Académico
 ├── VLAN 40 Atención Cliente
 ├── VLAN 60 Invitados
 ├── VLAN 70 Gestión
 └── VLAN 80 Wi-Fi Corporativo

Coimbra
 ├── VLAN 30 Académico
 ├── VLAN 40 Atención Cliente
 ├── VLAN 60 Invitados
 ├── VLAN 70 Gestión
 └── VLAN 80 Wi-Fi Corporativo
```

### 5.4 Direccionamiento

#### Porto
| VLAN | Red             | Gateway      |
| ---: | --------------- | ------------ |
|   10 | `10.10.10.0/24` | `10.10.10.1` |
|   20 | `10.10.20.0/24` | `10.10.20.1` |
|   40 | `10.10.40.0/24` | `10.10.40.1` |
|   50 | `10.10.50.0/24` | `10.10.50.1` |
|   60 | `10.10.60.0/24` | `10.10.60.1` |
|   70 | `10.10.70.0/24` | `10.10.70.1` |
|   80 | `10.10.80.0/24` | `10.10.80.1` |

#### Braga
| VLAN | Red             | Gateway      |
| ---: | --------------- | ------------ |
|   30 | `10.20.30.0/24` | `10.20.30.1` |
|   40 | `10.20.40.0/24` | `10.20.40.1` |
|   60 | `10.20.60.0/24` | `10.20.60.1` |
|   70 | `10.20.70.0/24` | `10.20.70.1` |
|   80 | `10.20.80.0/24` | `10.20.80.1` |


#### Coimbra
| VLAN | Red             | Gateway      |
| ---: | --------------- | ------------ |
|   30 | `10.30.30.0/24` | `10.30.30.1` |
|   40 | `10.30.40.0/24` | `10.30.40.1` |
|   60 | `10.30.60.0/24` | `10.30.60.1` |
|   70 | `10.30.70.0/24` | `10.30.70.1` |
|   80 | `10.30.80.0/24` | `10.30.80.1` |

#### Enlaces WAN Internos
| Enlace        | Red             | IP Porto     | IP sede remota |
| ------------- | --------------- | ------------ | -------------- |
| Porto-Braga   | `10.255.1.0/30` | `10.255.1.1` | `10.255.1.2`   |
| Porto-Coimbra | `10.255.2.0/30` | `10.255.2.1` | `10.255.2.2`   |

### 5.5 Enrutamiento dinámico


El enrutamiento entre sedes se configura con OSPF.

```text
Router	Router ID
Porto	1.1.1.1
Braga	2.2.2.2
Coimbra	3.3.3.3
```

Comandos de verificación:
```bash
show ip ospf neighbor
show ip route ospf
```


## 6. Diseño Físico y Hardware

### 6.1 Dispositivos principales de la red

#### Unifi
Para la mayoría de los dispositivos de red se comprará desde Unifi/Ubiquiti. Viene bien por las siguientes razones:
- El presupuesto es moderado, ideal para una empresa mediana que no se dedica directamente al sector tecnológico (comparado con Cisco, Fortinet etc.)
- Su ecosistema se integra completamente y se puede monitorizar y ver el estado de los dispositivos desde una aplicación (routers, switches, puntos acceso etc)
- Se puede integrar fácilmente VLANs
- Se puede integrar site-to-site VPN
- Sus switches PoE almacenan y provienen conexión al mismo tiempo a los puntos de acceso,
- Sus routers proporcionan seguridad avanzada, incluyendo firewalls stateful y nivel 7, IDS/IPS, bloqueo de publicidades etc.


#### Servidores / NAS
- Ya que esta empresa no es una muy granda dedicada exclusivamente a la tecnología, tendría sentido usar un único servidor de torre con máquinas virtuales. Esta configuración se suele usar en empresas medianas - ahorra mucho dinero y se puede gestionar fácilmente tanto físicamente cómo lógicamente.
- En cuanto a NAS, no tiene que encargarse de las funcioines del servidor - solo backups de carpetas compartidas y redundancia.

##### Dell PowerEdge T360
[URL][https://www.pccomponentes.com/dell-poweredge-t360-intel-xeon-e-2478-16gb-480gb-ssd]

| Especificación        | Dell PowerEdge T360                                                     |
| --------------------- | ----------------------------------------------------------------------- |
| Tipo                  | Servidor torre empresarial                                              |
| Uso en el proyecto    | Servidor físico principal en Porto para virtualización                  |
| Formato               | Torre 4.5U, apto para oficina o sala técnica                            |
| Procesador            | 1 × Intel Xeon E-2400 / Xeon 6300 Series, hasta 8 núcleos               |
| RAM máxima            | Hasta 128 GB DDR5 ECC UDIMM (viene con 16)                              |
| RAM recomendada       | 64 GB ECC DDR5, ampliable a 128 GB                                      |
| Bahías de disco       | Hasta 4 u 8 discos frontales, según configuración                       |
| Almacenamiento máximo | Hasta 128 TB con discos SAS/SATA (viene con 480GB)                      |
| Controladora RAID     | Compatible con PERC / HBA según configuración                           |
| Red                   | Puertos Ethernet integrados, ampliable con tarjetas adicionales         |
| Gestión remota        | iDRAC / Dell OpenManage                                                 |
| Servicios previstos   | Active Directory, DNS, DHCP, archivos, web/LMS, base de datos y backups |
| Virtualización        | Proxmox VE                                                              |
| Precio estimado       | 2.649                                                                   |

##### RAM y almacenamiento extra
- Según calculaciones de IA, se recomienda usar: 
2x480GB de almacenamiento SSD de Proxmox (programa de virtualización)
- 2x2TB SSD para las máquinas virtuales
- Por lo menos 64GB RAM

##### RAM
##### RAM servidor

RigidRAM / Dell compatible 32GB DDR5 ECC UDIMM 4800MHz x2  
[URL][https://www.amazon.com/RigidRAM-Replacement-SNPP0YCGC-AC027076-PowerEdge/dp/B0D8B2H2SK]

| Especificación        | RigidRAM / Dell compatible 32GB DDR5 ECC UDIMM |
| --------------------- | ---------------------------------------------- |
| Capacidad             | 32 GB por módulo                               |
| Configuración         | 2 × 32 GB                                      |
| Capacidad total       | 64 GB                                          |
| Tipo                  | DDR5 ECC UDIMM                                 |
| ECC                   | Sí                                             |
| Registered / Buffered | No, UDIMM / Unbuffered                         |
| Velocidad             | 4800 MHz / PC5-38400                           |
| Voltaje               | 1.1 V                                          |
| Formato               | 288-pin DIMM                                   |
| Referencia compatible | Dell SNPP0YCGC/32G / AC027076                  |
| Uso recomendado       | Ampliación de RAM para servidor Dell PowerEdge |
| Precio estimado       | 1.000                                |


##### Almacenamiento
Patriot 2TB SSD x2
[URL][https://www.pccomponentes.com/disco-duro-patriot-p210-2-5-ssd-2tb-sata-3]

| Especificación                | Patriot P210 SSD 2TB SATA III                          |
| ----------------------------- | ------------------------------------------------------ |
| Tipo                          | SSD interno                                            |
| Capacidad                     | 2 TB                                                   |
| Formato                       | 2.5"                                                   |
| Altura                        | 7 mm                                                   |
| Interfaz                      | SATA III 6 Gb/s                                        |
| NVMe                          | No                                                     |
| Velocidad de lectura          | Hasta 500 MB/s                                         |
| Velocidad de escritura        | Hasta 400 MB/s                                         |
| TRIM                          | Sí                                                     |
| SMART                         | Sí                                                     |
| Temperatura de funcionamiento | 0 °C – 70 °C                                           |
| Peso                          | 46 g                                                   |
| Garantía                      | 3 años                                                 |
| Precio PcComponentes          | 478 €                                               |
| Uso recomendado               | Almacenamiento SATA económico para datos o VMs ligeras |


##### NAS
Synology DS923+
[URL][https://www.amazon.com/Synology-DS923-Diskstation-Dual-Core-LAN-Port/dp/B0BKPXZDCY]


##### Almacenamiento

| Especificación           | Synology DS923+                                   |
| ------------------------ | ------------------------------------------------- |
| Tipo                     | NAS de sobremesa                                  |
| Bahías                   | 4 bahías SATA                                     |
| RAM incluida             | 4 GB DDR4 ECC                                     |
| RAM máxima               | Hasta 32 GB                                       |
| Red                      | 2 × 1GbE                                          |
| Expansión de red         | Compatible con módulo 10GbE opcional              |
| Ranuras M.2              | 2 × M.2 NVMe para caché SSD                       |
| RAID soportado           | RAID 0, 1, 5, 6, 10, SHR                          |
| Sistema                  | Synology DSM                                      |
| Uso en el proyecto       | NAS principal en Porto y NAS de respaldo en Braga |
| Precio aprox. sin discos (x2) | **1400 €**                                   |

##### Almacenamiento NAS

Seagate IronWolf 8TB NAS HDD x8  
[URL][https://www.pccomponentes.com/]

| Especificación                | Seagate IronWolf 8TB NAS HDD                          |
| ----------------------------- | ----------------------------------------------------- |
| Tipo                          | Disco duro interno NAS                                |
| Capacidad                     | 8 TB                                                  |
| Formato                       | 3.5"                                                  |
| Interfaz                      | SATA III 6 Gb/s                                       |
| NVMe                          | No                                                    |
| Velocidad de rotación         | 5400 / 7200 RPM, según modelo                         |
| Caché                         | 256 MB aprox.                                         |
| Uso 24/7                      | Sí                                                    |
| Tecnología                    | CMR, recomendada para NAS                             |
| Compatibilidad RAID           | Sí                                                    |
| Uso recomendado               | NAS, copias de seguridad y almacenamiento compartido  |
| Cantidad para Porto           | 4 discos                                              |
| Cantidad para Braga           | 4 discos                                              |
| Cantidad total                | 8 discos                                              |
| Capacidad bruta total         | 64 TB                                                 |
| Capacidad útil estimada       | 24 TB por NAS en RAID 5 / 16 TB por NAS en RAID 6     |
| Precio unitario aprox.        | 300 €                                         |
| Precio total aprox.           | 2.400 €                                     |


#### UPS/SAI
- Es esencial tener un SAI en cada sede. No obstante, no tienen que ser los mismos, ya que cada sede tiene requerimientos y hardware diferentes.
- Se utilizarán SAI/UPS de la marca APC debido a su fiabilidad, disponibilidad de modelos profesionales y compatibilidad con entornos de servidores y red. En la sede principal de Porto se instalarán modelos Smart-UPS en formato rack para proteger el servidor, NAS, firewall y switches principales. En Braga y Coimbra se utilizarán modelos de menor capacidad para proteger los equipos de red críticos. Esta solución permite evitar apagados inesperados, proteger frente a picos de tensión y garantizar un apagado controlado de los sistemas en caso de corte eléctrico prolongado.


| Sede | Modelo recomendado | Cantidad | Precio unitario aprox. | Subtotal | Uso |
|---|---|---:|---:|---:|---|
| Porto | APC Smart-UPS C 1500VA LCD RM 2U 230V | 2 | 783 € | 1.566 € | Protección del servidor, NAS, firewall, switch core y switches principales |
| Braga | APC Back-UPS Pro 1600VA | 1 | 455 € | 455 € | Protección del firewall, switch, APs y NAS de respaldo |
| Coimbra | APC Back-UPS 1600VA Tower 230V | 1 | 247 € | 247 € | Protección del firewall, switch y puntos de acceso |
| **Total UPS/SAI** |  | **4** |  | **2.268 €** |  |


##### UPS / SAI Porto

APC Smart-UPS C 1500VA LCD RM 2U 230V x2  
[URL][https://www.apc.com/]

| Especificación | APC Smart-UPS C 1500VA LCD RM 2U 230V |
|---|---|
| Tipo | SAI / UPS rack 2U |
| Capacidad | 1500 VA |
| Formato | Rackmount 2U |
| Uso principal | Protección eléctrica para servidor, NAS, firewall y switches principales |
| Tecnología | Line-interactive |
| Pantalla | LCD |
| Instalación | Rack principal de Porto |
| Cantidad | 2 unidades |
| Precio unitario aprox. | 783 € |
| Precio total aprox. | 1.566 € |
| Uso recomendado | Infraestructura crítica de la sede principal |

##### UPS / SAI Braga

APC Back-UPS Pro 1600VA x1  
[URL][https://www.apc.com/]

| Especificación | APC Back-UPS Pro 1600VA |
|---|---|
| Tipo | SAI / UPS torre |
| Capacidad | 1600 VA |
| Formato | Torre |
| Uso principal | Protección eléctrica para router/firewall, switch, puntos de acceso y NAS de respaldo |
| Tecnología | Line-interactive |
| Pantalla | LCD |
| Instalación | Armario de comunicaciones / zona técnica de Braga |
| Cantidad | 1 unidad |
| Precio unitario aprox. | 455 € |
| Precio total aprox. | 455 € |
| Uso recomendado | Infraestructura de red y NAS de respaldo en sede secundaria |

##### UPS / SAI Coímbra

APC Back-UPS 1600VA Tower 230V x1  
[URL][https://www.apc.com/]

| Especificación | APC Back-UPS 1600VA Tower 230V |
|---|---|
| Tipo | SAI / UPS torre |
| Capacidad | 1600 VA |
| Formato | Torre |
| Uso principal | Protección eléctrica para router/firewall, switch y puntos de acceso |
| Tecnología | Line-interactive |
| Pantalla | Indicadores LED / pantalla según modelo |
| Instalación | Armario de comunicaciones / zona técnica de Coímbra |
| Cantidad | 1 unidad |
| Precio unitario aprox. | 247 € |
| Precio total aprox. | 247 € |
| Uso recomendado | Infraestructura básica de red en sede secundaria |


### 6.2 Infraestructura física
#### Racks
##### Rack Porto

| Equipo                       | Cantidad | U por unidad | Total U aprox. |
| ---------------------------- | -------: | -----------: | -------------: |
| Ubiquiti Dream Machine Pro   |        1 |           1U |             1U |
| UniFi Switch 48 PoE          |        1 |           1U |             1U |
| UniFi Switch 24 PoE          |        3 |           1U |             3U |
| APC Smart-UPS C 1500VA RM 2U |        2 |           2U |             4U |
| Dell PowerEdge T360          |        1 |         4.5U |           4.5U |
| Patch panel Cat6             |        2 |           1U |             2U |
| Organizador de cables        |        2 |           1U |             2U |
| **Total usado**              |          |              |      **17.5U** |

| Concepto                    | U recomendado |
| --------------------------- | ------------: |
| Infraestructura actualmente planeada |           18U |
| Flujo de aire        |            2U |
| Expansión en el futuro            |         3U–4U |
| **Tamaño recomendado**   |       **24U** |


Se utilizará un rack estándar de 19” en la sede principal de Porto, ya que este formato es el estándar profesional para equipos de red y servidores. El rack permitirá alojar y organizar el router/firewall, switches gestionables, patch panels, organizadores de cable y SAI/UPS. Esto facilita el mantenimiento, mejora la ventilación, permite un cableado más ordenado y ofrece una instalación más segura y escalable.

##### Rack Porto

StarTech.com 24U Server Rack Cabinet  
[URL][https://www.amazon.com/StarTech-com-24U-Server-Rack-Cabinet/dp/B071KW98RM]

| Especificación | StarTech.com 24U Server Rack Cabinet |
|---|---|
| Modelo | RK2433BKM |
| Tipo | Armario rack cerrado |
| Formato | 19” estándar |
| Altura | 24U |
| Profundidad | 85,3 cm aprox. |
| Ancho | 60 cm aprox. |
| Capacidad de carga | Hasta 450 kg |
| Puertas | Delantera y trasera con cerradura |
| Ventilación | Malla para ventilación pasiva |
| Raíles | Ajustables en profundidad |
| Accesorios | Bandeja 1U, ruedas, patas niveladoras y gestión de cableado |
| Uso en el proyecto | Rack principal de Porto |
| Precio aprox. | 1.000 € |


##### Rack Braga
- Braga tendrá menos infraestructura que Porto. Sólo se necesitará un rack entre 6 - 9U (9 si queremos dejar espacio para expansión).

Rack Mural 19" 9U F450mm Puerta de Cristal  
[URL][https://ekanet.es/rack-9u-puerta-cristal/49-rack-mural-19-9u-f450mm-sin-accesorios-puerta-de-cristal.html]

| Especificación | Rack Mural 19" 9U F450mm Puerta de Cristal |
|---|---|
| Tipo | Armario rack mural |
| Formato | 19” estándar |
| Altura | 9U |
| Fondo exterior | 450 mm |
| Fondo útil | 362 mm |
| Ancho exterior | 600 mm |
| Altura exterior | 501 mm |
| Puerta | Cristal templado con cerradura |
| Laterales | Desmontables |
| Entrada de cableado | Panel trasero y base inferior |
| Capacidad de carga | 60 kg |
| Color | Negro RAL 9004 |
| Instalación | Pared o suelo |
| Accesorios incluidos | Tornillería y llaves |
| Precio aprox. | 99 € sin IVA |
| Uso en el proyecto | Rack secundario de Braga para switch, patch panel, gateway y cableado |

##### Rack Coimbra

Rack Mural 19" 6U F450mm Puerta Perforada  
[URL][https://ekanet.es/rack-6u-puerta-perforada/1901-rack-mural-6u-f450mm-sin-accesorios-puerta-perforada-19.html]

| Especificación | Rack Mural 19" 6U F450mm Puerta Perforada |
|---|---|
| Tipo | Armario rack mural |
| Formato | 19” estándar |
| Altura | 6U |
| Fondo exterior | 450 mm |
| Fondo útil máximo | 362 mm |
| Ancho exterior | 600 mm |
| Altura exterior | 368 mm |
| Puerta | Metálica perforada con cerradura |
| Laterales | Desmontables |
| Entrada de cableado | Panel trasero y base inferior |
| Instalación | Pared o suelo |
| Accesorios incluidos | Tornillería y juego de llaves |
| Precio aprox. | 94,50 € sin IVA |
| Uso en el proyecto | Rack secundario de Coimbra para switch, patch panel, gateway y cableado |


### 6.3 Dispositivos de red


#### Porto
##### Router
Dream Machine Pro
[URL][https://eu.store.ui.com/eu/en/category/cloud-gateways-large-scale/products/udm-pro]

| Especificación                | Ubiquiti UniFi Dream Machine Pro                                         |
| ----------------------------- | ------------------------------------------------------------------------ |
| Tipo de dispositivo           | Router/firewall empresarial                                              |
| Formato                       | Rack 1U                                                                  |
| Precio aprox.                 | 360 € sin IVA                                                            |
| Puertos WAN                   | 1 × RJ45 GbE + 1 × SFP+ 10G                                              |
| Puertos LAN                   | 8 × RJ45 GbE + 1 × SFP+ 10G                                              |
| Rendimiento IDS/IPS           | Hasta 3,5 Gbps                                                           |
| Clientes soportados           | Más de 1.000 clientes                                                    |
| Dispositivos UniFi soportados | Más de 100 dispositivos                                                  |
| Funciones de seguridad        | Firewall, IDS/IPS, filtrado de contenido, segmentación VLAN              |
| VPN                           | Site-to-site, IPsec, OpenVPN, WireGuard, L2TP                            |
| Gestión                       | Plataforma UniFi Network                                                 |
| Uso en el proyecto            | Gateway principal de Porto, firewall, VPN entre sedes y gestión de VLANs |


##### Switch central
Standard 48 PoE
[URL][https://eu.store.ui.com/eu/en/category/switching-standard/products/usw-48-poe]

| Especificación      | Ubiquiti UniFi Switch 48 PoE                              |
| ------------------- | --------------------------------------------------------- |
| Modelo              | USW-48-POE                                                |
| Tipo                | Switch gestionable Layer 2                                |
| Puertos             | 48 puertos RJ45 Gigabit                                   |
| PoE                 | Sí, presupuesto total de 195W                             |
| Precio aprox.       | 561 € sin IVA                                             |
| Refrigeración       | Fanless / silencioso                                      |
| Uso recomendado     | Switch principal o switch de acceso grande                |
| Gestión             | UniFi Network                                             |
| Adecuado para VLANs | Sí                                                        |
| Uso en el proyecto  | Conectar PCs, APs, impresoras y distribuir VLANs en Porto |

##### Switches access
Standard 24 PoE
[URL][https://eu.store.ui.com/eu/en/category/switching-standard/products/usw-24-poe]

| Especificación     | Ubiquiti UniFi Switch 24 PoE                                                   |
| ------------------ | ------------------------------------------------------------------------------ |
| Modelo             | USW-24-POE                                                                     |
| Tipo               | Switch gestionable Layer 2                                                     |
| Puertos            | 24 puertos RJ45 Gigabit                                                        |
| PoE                | Sí                                                                             |
| Presupuesto PoE    | 95W                                                                            |
| Refrigeración      | Fanless / silencioso                                                           |
| Precio aprox.      | 360 € x3 = 1080                                                   |
| Gestión            | UniFi Network                                                                  |
| Soporte VLAN       | Sí                                                                             |
| Uso en el proyecto | Switches de acceso para conectar PCs, APs, impresoras y VLANs por departamento |

##### Punto de acceso
U6+ 
[URL][https://eu.store.ui.com/eu/en/category/wifi-flagship/products/u6-plus]

| Especificación     | Ubiquiti UniFi U6+                                              |
| ------------------ | --------------------------------------------------------------- |
| Tipo               | Punto de acceso Wi-Fi 6                                         |
| Uso recomendado    | Oficinas, aulas pequeñas, zonas comunes                         |
| Gestión            | UniFi Network                                                   |
| Alimentación       | PoE                                                             |
| VLAN/SSID          | Compatible con varias redes Wi-Fi, como corporativa e invitados |
| Precio aprox.      | 94€ x4 = 376                                                       |
| Uso en el proyecto | Wi-Fi corporativo y red de invitados en Porto, Braga y Coimbra  |


#### Braga
##### Router
Cloud Gateway Ultra 
[URL][https://eu.store.ui.com/eu/en/category/all-cloud-gateways]


| Especificación                | Ubiquiti UniFi Cloud Gateway Ultra                                    |
| ----------------------------- | --------------------------------------------------------------------- |
| Modelo                        | UCG-Ultra                                                             |
| Tipo de dispositivo           | Gateway/firewall compacto                                             |
| Precio aprox.                 | 95 € sin IVA / desde 214,80 € con IVA en listado comparativo          |
| Dispositivos UniFi soportados | Más de 30                                                             |
| Clientes soportados           | Más de 300                                                            |
| Rendimiento IDS/IPS           | Hasta 1 Gbps                                                          |
| Multi-WAN                     | Sí, con balanceo de carga                                             |
| Gestión                       | UniFi Network                                                         |
| Uso recomendado               | Sedes secundarias como Braga y Coimbra                                |
| Función en el proyecto        | Firewall local, salida a Internet, VLANs y VPN site-to-site con Porto |

##### Switch gestionable
Standard 24 PoE
[URL][https://eu.store.ui.com/eu/en/category/switching-standard/products/usw-24-poe]

| Especificación     | Ubiquiti UniFi Switch 24 PoE                                                   |
| ------------------ | ------------------------------------------------------------------------------ |
| Modelo             | USW-24-POE                                                                     |
| Tipo               | Switch gestionable Layer 2                                                     |
| Puertos            | 24 puertos RJ45 Gigabit                                                        |
| PoE                | Sí                                                                             |
| Presupuesto PoE    | 95W                                                                            |
| Refrigeración      | Fanless / silencioso                                                           |
| Precio aprox.      | 360 €                                                  |
| Gestión            | UniFi Network                                                                  |
| Soporte VLAN       | Sí                                                                             |
| Uso en el proyecto | Switches de acceso para conectar PCs, APs, impresoras y VLANs por departamento |

##### Punto de acceso
| Especificación     | Ubiquiti UniFi U6+                                              |
| ------------------ | --------------------------------------------------------------- |
| Tipo               | Punto de acceso Wi-Fi 6                                         |
| Uso recomendado    | Oficinas, aulas pequeñas, zonas comunes                         |
| Gestión            | UniFi Network                                                   |
| Alimentación       | PoE                                                             |
| VLAN/SSID          | Compatible con varias redes Wi-Fi, como corporativa e invitados |
| Precio aprox.      | 94€ x2 = 188                                                       |
| Uso en el proyecto | Wi-Fi corporativo y red de invitados en Porto, Braga y Coimbra  |


#### Coimbra
##### Router
Cloud Gateway Ultra 
[URL][https://eu.store.ui.com/eu/en/category/all-cloud-gateways]


| Especificación                | Ubiquiti UniFi Cloud Gateway Ultra                                    |
| ----------------------------- | --------------------------------------------------------------------- |
| Modelo                        | UCG-Ultra                                                             |
| Tipo de dispositivo           | Gateway/firewall compacto                                             |
| Precio aprox.                 | 95 € sin IVA / desde 214,80 € con IVA en listado comparativo          |
| Dispositivos UniFi soportados | Más de 30                                                             |
| Clientes soportados           | Más de 300                                                            |
| Rendimiento IDS/IPS           | Hasta 1 Gbps                                                          |
| Multi-WAN                     | Sí, con balanceo de carga                                             |
| Gestión                       | UniFi Network                                                         |
| Uso recomendado               | Sedes secundarias como Braga y Coimbra                                |
| Función en el proyecto        | Firewall local, salida a Internet, VLANs y VPN site-to-site con Porto |

##### Switch Gestionable
Standard 24 PoE
[URL][https://eu.store.ui.com/eu/en/category/switching-standard/products/usw-24-poe]

| Especificación     | Ubiquiti UniFi Switch 24 PoE                                                   |
| ------------------ | ------------------------------------------------------------------------------ |
| Modelo             | USW-24-POE                                                                     |
| Tipo               | Switch gestionable Layer 2                                                     |
| Puertos            | 24 puertos RJ45 Gigabit                                                        |
| PoE                | Sí                                                                             |
| Presupuesto PoE    | 95W                                                                            |
| Refrigeración      | Fanless / silencioso                                                           |
| Precio aprox.      |  360€                                               |
| Gestión            | UniFi Network                                                                  |
| Soporte VLAN       | Sí                                                                             |
| Uso en el proyecto | Switches de acceso para conectar PCs, APs, impresoras y VLANs por departamento |

##### Punto de acceso
| Especificación     | Ubiquiti UniFi U6+                                              |
| ------------------ | --------------------------------------------------------------- |
| Tipo               | Punto de acceso Wi-Fi 6                                         |
| Uso recomendado    | Oficinas, aulas pequeñas, zonas comunes                         |
| Gestión            | UniFi Network                                                   |
| Alimentación       | PoE                                                             |
| VLAN/SSID          | Compatible con varias redes Wi-Fi, como corporativa e invitados |
| Precio aprox.      | 94€                                                        |
| Uso en el proyecto | Wi-Fi corporativo y red de invitados en Porto, Braga y Coimbra  |

### 6.4 Cableado y organización
#### Cableado, patch panels y accesorios

| Elemento | Modelo / referencia | Cantidad estimada | Precio unitario aprox. | Subtotal aprox. | Ubicación | Uso |
|---|---|---:|---:|---:|---|---|
| Patch panel Cat6 24 puertos | Intellinet 24x RJ45 Cat6 UTP Patch Panel | 4 | 36 € | 144 € | Todas las sedes | Organización de tomas de red en los racks |
| Cable Cat6 bobina 305 m | Gembird Cat 6 UTP Network Cable 305 m | 3 | 77 € | 231 € | Todas las sedes | Cableado estructurado para puestos, APs e impresoras |
| Latiguillos Cat6 1 m | Latiguillo UTP CAT6 1m | 60 | 1,40 € | 84 € | Todas las sedes | Conexión entre patch panel, switches y equipos |
| Latiguillos Cat6 2 m | Latiguillo UTP CAT6 2m / equivalente | 40 | 2 € | 80 € | Todas las sedes | Conexión final de PCs, impresoras y otros dispositivos |
| PDU rack 19” 8 tomas | OEM Schuko PDU 19” 1U 8-port | 3 | 25 € | 75 € | Todas las sedes | Distribución eléctrica dentro de los racks |
| Organizador de cables 1U | Bysecur Organizador de cables Horizontal 1U | 5 | 7 € | 35 € | Todas las sedes | Ordenar cableado dentro del rack |
| Bandeja rack 19” 1U | Rack Tray 19” 1U | 3 | 25 € | 75 € | Todas las sedes | Colocar dispositivos pequeños como Cloud Gateway Ultra |
| Módulos Keystone Cat6 | Lanberg Cat6 Keystone Module | 40 | 1,50 € | 60 € | Todas las sedes | Terminación de puntos de red RJ45 |
| Tomas de red RJ45 Cat6 dobles | Toma de Red 2 RJ45 CAT6 | 25 | 29 € | 725 € | Todas las sedes | Puntos de red de pared para usuarios y dispositivos |
| Conectores RJ45 Cat6 | Cable Matters Cat6 RJ45 Connectors | 1 pack | 15 € | 15 € | Todas las sedes | Conectores para terminaciones o reparaciones |
| Canaleta PVC para cableado | KOTARBAU / equivalente | 10 | 21 € | 210 € | Todas las sedes | Guiado y protección del cableado visible |
| Bridas, etiquetas y velcro | Lote genérico | 1 lote | 50 € | 50 € | Todas las sedes | Etiquetado y organización de cables |
| **Total estimado cableado y accesorios** |  |  |  | **1.784 €** |  |  |


### 6.5 Equipos usuario
- Se usuarán 3 perfiles según necesidad de rendimiento por cada departamento.

| Perfil           | Usuarios                                     | Cantidad | Tipo de equipo                    |
| ---------------- | -------------------------------------------- | -------: | --------------------------------- |
| Equipo estándar  | Dirección/Admin, Atención Cliente, Marketing |       25 | Portátil empresarial básico       |
| Equipo académico | Profesores / Equipo Académico                |       28 | Portátil con buena webcam/headset |
| Equipo técnico   | IT / Sistemas + Desarrollo                   |        7 | Portátil más potente              |

#### Equipos portátiles por departamento

| Departamento | Modelo recomendado | Cantidad | Precio unitario aprox. | Subtotal aprox. | Motivo |
|---|---|---:|---:|---:|---|
| Dirección y Administración | Dell Latitude 5540, i5, 16GB RAM, 512GB SSD | 8 | 499 € | 3.992 € | Equipo empresarial equilibrado para gestión, documentación, correo y tareas administrativas |
| IT / Sistemas | HP ProBook 450 G9, i7, 32GB RAM, 1TB SSD | 5 | 1.014 € | 5.070 € | Equipo más potente para administración de sistemas, soporte, pruebas y herramientas técnicas |
| Desarrollo y Plataforma Online | HP ProBook 450 G9, i7, 32GB RAM, 1TB SSD | 2 | 1.014 € | 2.028 € | Más RAM y almacenamiento para desarrollo, pruebas locales y trabajo con plataformas |
| Equipo Académico | HP ProBook 440 G10, i7, 16GB RAM, 512GB SSD | 28 | 899 € | 25.172 € | Portátil profesional para clases online, videollamadas, gestión de materiales y acceso al LMS |
| Atención al Cliente | Dell Latitude 5440, i5, 16GB RAM, 512GB SSD | 11 | 714 € | 7.854 € | Equipo fiable para CRM, incidencias, correo, llamadas y soporte a estudiantes |
| Marketing y Ventas | Lenovo ThinkPad E14 Gen 5 | 6 | 649 € | 3.894 € | Equipo ligero y profesional para redes sociales, campañas, presentaciones y ventas |
| **Total estimado portátiles** |  | **60** |  | **48.010 €** |  |

#### Equipos extra
| Tipo de equipo de reserva | Cantidad | Precio unitario aprox. | Subtotal aprox. | Uso |
|---|---:|---:|---:|---|
| Portátil estándar de reserva | 3 | 700 € | 2.100 € | Sustitución temporal para administración, atención al cliente, académico o marketing |
| Portátil técnico de reserva | 2 | 1.014 € | 2.028 € | Sustitución para IT / Sistemas y Desarrollo |
| **Total equipos de reserva** | **5** |  | **4.128 €** |  |

#### Monitores, periféricos etc
##### Monitores, periféricos y equipamiento audiovisual

| Elemento | Modelo / referencia | Cantidad total | Porto | Braga | Coimbra | Precio unitario aprox. | Subtotal aprox. | Uso |
|---|---|---:|---:|---:|---:|---:|---:|---|
| Monitor 24” | Dell P2425H Monitor | 35 | 16 | 13 | 6 | 155 € | 5.425 € | Puestos fijos de oficina |
| Teclado y ratón inalámbrico | Logitech MK235 Wireless Keyboard and Mouse | 35 | 16 | 13 | 6 | 33 € | 1.155 € | Puestos con monitor externo |
| Docking station USB-C | Lenovo ThinkPad Universal USB-C Dock / equivalente | 25 | 12 | 9 | 4 | 156 € | 3.900 € | Conectar portátil a monitor, red, teclado y ratón |
| Auriculares con micrófono | Logitech H390 USB Headset | 45 | 18 | 18 | 9 | 37 € | 1.665 € | Clases online, atención al cliente, reuniones y soporte |
| Webcam Full HD | Logitech C920s HD Pro Webcam | 20 | 8 | 8 | 4 | 58 € | 1.160 € | Mejorar calidad de vídeo en clases online y reuniones |
| **Total estimado periféricos** |  |  |  |  |  |  | **13.305 €** |  |

#### Impresoras
##### Impresoras multifunción

Se utilizarán impresoras multifunción láser para cubrir las necesidades de impresión, escaneo y copia en las tres sedes. Al tratarse de una academia de idiomas, el volumen de impresión no será extremadamente alto, pero será necesario imprimir documentación interna, material administrativo, informes, contratos y documentos académicos puntuales.

| Elemento | Modelo / referencia | Cantidad total | Porto | Braga | Coimbra | Precio unitario aprox. | Subtotal aprox. | Uso |
|---|---|---:|---:|---:|---:|---:|---:|---|
| Impresora multifunción láser color | Brother MFC-L8690CDW / equivalente | 4 | 2 | 1 | 1 | 450 € | 1.800 € | Impresión, escaneo y copia de documentación administrativa y académica |


### 6.6 Resumen final del presupuesto de componentes físicos

| Categoría | Total aproximado |
|---|---:|
| Servidor principal | 2.649 € |
| RAM servidor | 1.000 € |
| Almacenamiento SSD servidor | 478 € |
| NAS | 1.400 € |
| Discos NAS | 2.400 € |
| UPS/SAI | 2.268 € |
| Racks | 1.193,50 € |
| Dispositivos de red | 3.278 € |
| Cableado y accesorios | 1.784 € |
| Portátiles | 48.010 € |
| Equipos de reserva | 4.128 € |
| Monitores y periféricos | 13.305 € |
| Impresoras | 1.800 € |
| **Total estimado** | **83.693,50 €** |

### 6.7 Costes adicionales mensuales/anuales
#### Presupuesto de software, licencias e Internet

| Elemento | Producto recomendado | Cantidad | Precio unitario aprox. | Subtotal aprox. | Tipo de coste | Uso |
|---|---|---:|---:|---:|---|---|
| Suite ofimática y correo | Microsoft 365 Empresa Estándar | 60 usuarios | 10,83 €/mes | 649,80 €/mes / 7.797,60 €/año | Mensual/anual | Correo corporativo, Office, OneDrive, Teams y colaboración |
| Sistema operativo servidor | Windows Server Standard | 1 licencia | 1.100 € - 1.300 € | 1.200 € aprox. | Compra inicial | Active Directory, DNS, DHCP y servicios internos |
| CALs de usuario | Windows Server User CAL | 60 usuarios | 35 € - 45 € | 2.400 € aprox. | Compra inicial | Permitir acceso legal de usuarios a servicios Windows Server |
| Virtualización | Proxmox VE | 1 servidor | 0 € | 0 € | Gratis | Plataforma de virtualización para las máquinas virtuales |
| Soporte Proxmox opcional | Proxmox VE Community | 1 CPU socket | 120 €/año | 120 €/año | Anual opcional | Repositorio empresarial y soporte básico |
| Antivirus/EDR | Bitdefender / ESET / Microsoft Defender for Business | 65 dispositivos | 30 € - 50 €/año | 2.600 € aprox. | Anual | Protección de portátiles y servidores |
| Backup software | Synology Active Backup / Hyper Backup | Incluido con NAS | 0 € | 0 € | Incluido | Copias de seguridad y replicación entre NAS |
| Dominio web | Dominio `.com` / `.pt` | 1 | 15 € - 25 €/año | 20 €/año | Anual | Dominio público de la empresa |
| Certificado SSL | Let’s Encrypt | 1 | 0 € | 0 € | Gratis | HTTPS para web y plataforma |
| Internet empresarial Porto | Fibra empresarial | 1 línea | 80 € - 120 €/mes | 1.200 €/año aprox. | Mensual/anual | Conexión principal sede Porto |
| Internet empresarial Braga | Fibra empresarial | 1 línea | 60 € - 100 €/mes | 960 €/año aprox. | Mensual/anual | Conexión sede Braga |
| Internet empresarial Coimbra | Fibra empresarial | 1 línea | 60 € - 100 €/mes | 960 €/año aprox. | Mensual/anual | Conexión sede Coimbra |
| IP fija | IP fija pública | 3 sedes | 10 €/mes | 360 €/año | Mensual/anual | VPN site-to-site y servicios corporativos |

#### Totales
| Tipo de coste | Total aproximado |
|---|---:|
| Costes iniciales software/licencias | 3.600 € |
| Costes anuales software/servicios | 16.000 € - 17.000 €/año |
| Costes mensuales aproximados | 1.300 € - 1.500 €/mes |

### 6.8 Esquema física
![alt text](documentacion/esquematicas/racksFinalPT.png)
- Desde la izquierda a la derecha - Porto, Braga, Coimbra


## 7. Implementación en GNS
### OpenWrt como sistema operativo de red

OpenWrt es un sistema operativo basado en Linux diseñado principalmente para dispositivos de red, como routers, puntos de acceso y firewalls. En este proyecto se ha utilizado OpenWrt dentro de GNS3 para simular los routers principales de las sedes de Porto, Braga y Coimbra.

A diferencia de un router comercial cerrado, OpenWrt permite acceder directamente al sistema mediante terminal y configurar manualmente interfaces, rutas, VLANs, servicios y reglas de firewall. Esto lo convierte en una herramienta útil para entornos de laboratorio, aprendizaje y simulación de redes empresariales.

---

#### Relación entre OpenWrt y Linux

OpenWrt funciona de forma similar a una distribución Linux, ya que utiliza el kernel de Linux y muchas herramientas comunes de administración del sistema. Por este motivo, se pueden usar comandos habituales de Linux para consultar interfaces, rutas, procesos y servicios.

Algunos comandos utilizados en el proyecto fueron:

```bash
ip addr
ip route
ping
ps
cat
nano
```

Estos comandos permitieron comprobar el estado de las interfaces, verificar las rutas instaladas, probar conectividad y editar archivos de configuración.

Aunque OpenWrt se parece a Linux, está optimizado para equipos de red. Por ello, su configuración se centra especialmente en interfaces, VLANs, routing, firewall, DHCP, DNS, NAT y servicios de red.

---

#### Gestión de interfaces y VLANs

OpenWrt permite crear interfaces físicas y subinterfaces VLAN. En este proyecto se utilizaron subinterfaces para separar los departamentos de la empresa mediante VLANs.

Ejemplo de creación de una VLAN en OpenWrt:

```bash
ip link add link eth3 name eth3.20 type vlan id 20
ip link set eth3.20 up
ip addr add 10.10.20.1/24 dev eth3.20
```

En este caso, se crea la subinterfaz `eth3.20`, que representa la VLAN 20 sobre la interfaz física `eth3`. Esta subinterfaz funciona como puerta de enlace de la red `10.10.20.0/24`.

Este mismo método se utilizó para crear las VLANs de usuarios, invitados, gestión, servidores y Wi-Fi corporativo.

Ejemplo de VLANs configuradas en Porto:

| Subinterfaz | VLAN | Red | Uso |
|---|---:|---|---|
| `eth3.10` | 10 | `10.10.10.0/24` | Dirección/Admin |
| `eth3.20` | 20 | `10.10.20.0/24` | Desarrollo |
| `eth3.40` | 40 | `10.10.40.0/24` | Atención Cliente |
| `eth3.50` | 50 | `10.10.50.0/24` | Marketing/Ventas |
| `eth3.60` | 60 | `10.10.60.0/24` | Invitados |
| `eth3.70` | 70 | `10.10.70.0/24` | Gestión/Servidores |
| `eth3.80` | 80 | `10.10.80.0/24` | Wi-Fi Corporativo |

---

#### Configuración persistente con UCI

Una diferencia importante entre OpenWrt y una distribución Linux tradicional es el uso de **UCI** (*Unified Configuration Interface*). UCI permite guardar configuraciones de red de forma permanente para que no se pierdan al reiniciar el router.

Ejemplo de configuración persistente de una VLAN:

```bash
uci set network.porto_vlan20=interface
uci set network.porto_vlan20.proto='static'
uci set network.porto_vlan20.device='eth3.20'
uci set network.porto_vlan20.ipaddr='10.10.20.1'
uci set network.porto_vlan20.netmask='255.255.255.0'
uci commit network
```

Después de aplicar estos comandos, la configuración queda guardada en OpenWrt. Esto fue necesario para mantener las VLANs y direcciones IP después de reiniciar los routers o el proyecto de GNS3.

Comandos de comprobación:

```bash
uci show network
ip addr
ip route
```

---

#### Enrutamiento con FRRouting

Para implementar enrutamiento dinámico entre sedes se instaló **FRRouting** en OpenWrt. FRRouting permite utilizar protocolos de routing como OSPF.

En este proyecto, OSPF se utilizó para que los routers de Porto, Braga y Coimbra intercambiaran rutas automáticamente.

Los Router ID utilizados fueron:

| Router | Router ID |
|---|---|
| Porto | `1.1.1.1` |
| Braga | `2.2.2.2` |
| Coimbra | `3.3.3.3` |

Ejemplo de configuración OSPF:

```bash
vtysh
configure terminal
router ospf
 ospf router-id 1.1.1.1
 network 10.255.1.0/30 area 0
 network 10.255.2.0/30 area 0
 network 10.10.20.0/24 area 0
exit
copy running-config startup-config
```

Comandos de comprobación:

```bash
show ip ospf neighbor
show ip route ospf
```

Con estos comandos se verificó que los routers aprendían rutas de otras sedes y que los vecinos OSPF se encontraban en estado correcto.

---

#### Firewall con nftables

OpenWrt también se utilizó como firewall entre VLANs. Para ello se configuraron reglas con `nftables`, una herramienta moderna de filtrado de paquetes en Linux.

En el proyecto se creó una tabla de firewall llamada `labfw`, donde se añadieron reglas para controlar qué redes podían comunicarse entre sí.

Ejemplo de creación de tabla y cadena de firewall:

```bash
nft add table inet labfw
nft 'add chain inet labfw forward { type filter hook forward priority 0; policy accept; }'
```

Ejemplo de regla para bloquear invitados:

```bash
nft add rule inet labfw forward ip saddr 10.10.60.0/24 ip daddr 10.0.0.0/8 drop
```

Esta regla bloquea el tráfico desde la VLAN 60 de invitados hacia las redes internas de la empresa.

Las reglas principales aplicadas fueron:

| Tráfico | Acción |
|---|---|
| VLAN 60 Invitados hacia redes internas | Bloqueado |
| VLANs de usuarios hacia VLAN 70 | Bloqueado salvo servicios necesarios |
| VLAN 80 Wi-Fi Corporativo hacia VLANs cableadas | Bloqueado |
| VLAN 70 Gestión/Servidores hacia redes internas | Permitido |
| Tráfico establecido o relacionado | Permitido |

---

#### Regla `established,related`

Se añadió una regla `established,related` para permitir respuestas a conexiones ya iniciadas desde redes autorizadas.

```bash
nft add rule inet labfw forward ct state established,related accept
```

Esta regla permite que, si el servidor o una red autorizada inicia una conexión, las respuestas puedan volver correctamente. Esto evita bloquear tráfico legítimo de retorno.

Ejemplo:

| Comunicación | Resultado |
|---|---|
| Windows Server VLAN 70 → PC Desarrollo | Permitido |
| Respuesta PC Desarrollo → Windows Server | Permitido por `established,related` |
| PC Desarrollo → Windows Server como conexión nueva | Bloqueado salvo servicios necesarios |

---

#### Automatización mediante `/etc/rc.local`

Para cargar automáticamente las reglas de firewall al iniciar el router, se utilizó el archivo:

```bash
/etc/rc.local
```

Este archivo permite ejecutar comandos automáticamente durante el arranque del sistema.

Se añadió un retraso inicial para evitar que el firewall se cargara antes de que OSPF estuviera funcionando correctamente:

```bash
sleep 30
```

Después se añadieron las reglas `nftables` necesarias. Esto permitió mantener las políticas de seguridad después de reiniciar los routers.

Ejemplo simplificado:

```bash
#!/bin/sh

sleep 30

nft delete table inet labfw 2>/dev/null

nft add table inet labfw
nft 'add chain inet labfw forward { type filter hook forward priority 0; policy accept; }'

nft add rule inet labfw forward ct state established,related accept
nft add rule inet labfw forward ip saddr 10.10.60.0/24 ip daddr 10.0.0.0/8 drop

exit 0
```

---

#### Resolución de problemas en OpenWrt

Durante las pruebas, algunos problemas aparecieron después de reiniciar los routers. En algunos casos, OSPF no formaba vecinos correctamente porque el firewall se cargaba antes de que FRR estuviera completamente operativo.

Procedimiento de recuperación utilizado:

```bash
nft delete table inet labfw
nft flush ruleset
/etc/init.d/frr restart
```

Después de esperar unos segundos, se comprobaba OSPF:

```bash
vtysh
show ip ospf neighbor
show ip route ospf
```

Cuando OSPF volvía a funcionar correctamente, se recargaba el firewall:

```bash
exit
/etc/rc.local
nft list ruleset
```

---

#### Ventajas de usar OpenWrt en el proyecto

El uso de OpenWrt permitió simular routers empresariales de forma flexible y realista dentro de GNS3.

| Ventaja | Descripción |
|---|---|
| Basado en Linux | Permite utilizar comandos y herramientas conocidas de Linux. |
| Ligero | Consume pocos recursos en comparación con otros sistemas. |
| Flexible | Permite configurar interfaces, VLANs, rutas, firewall y servicios. |
| Compatible con GNS3 | Se integra fácilmente como router virtual. |
| Soporta routing dinámico | Permite instalar FRRouting y usar OSPF. |
| Soporta firewall avanzado | Permite crear reglas con `nftables`. |
| Configuración persistente | UCI permite guardar configuraciones de red de forma permanente. |

---

#### Papel de OpenWrt en NovaLingua School

En la infraestructura de NovaLingua School, OpenWrt cumple el papel de router y firewall en cada sede.

Cada router se encarga de:

- Actuar como puerta de enlace de las VLANs locales.
- Enrutar tráfico entre departamentos.
- Conectar la sede con el resto de sedes.
- Participar en OSPF.
- Aplicar reglas de firewall.
- Proteger la VLAN de gestión y servidores.
- Aislar la red de invitados.
- Separar el tráfico Wi-Fi corporativo de las redes cableadas.

Gracias a OpenWrt, la red simulada en GNS3 se comporta de forma similar a una infraestructura empresarial real, con segmentación, enrutamiento dinámico y control de seguridad entre redes.

---

#### Resumen del uso de OpenWrt en el proyecto

| Función | Implementación |
|---|---|
| Routing entre VLANs | Subinterfaces VLAN en OpenWrt |
| Routing entre sedes | OSPF mediante FRRouting |
| Seguridad | Firewall con `nftables` |
| Persistencia de red | Configuración UCI |
| Arranque automático de firewall | `/etc/rc.local` |
| Verificación | `ip addr`, `ip route`, `show ip ospf neighbor`, `nft list ruleset` |


### Implementación de la red en GNS3

### 7.1 Instalación de GNS3 y GNS3 VM

Se instaló la interfaz gráfica de GNS3 y el servidor local en Linux.

```bash
sudo add-apt-repository ppa:gns3/ppa
sudo apt update
sudo apt install gns3-gui gns3-server
```

Al iniciar GNS3 se seleccionó:

```text
Run appliances on my local computer
```

Después se importó la **GNS3 VM** en VirtualBox desde el archivo OVA oficial y se habilitó en GNS3:

```text
Edit → Preferences → GNS3 VM → Enable the GNS3 VM
Virtualization engine: VirtualBox
VM name: GNS3 VM
```

En VirtualBox se activó el adaptador **Host-only** con DHCP.

---

### 7.2 Configuración inicial entre routers

Se configuraron enlaces punto a punto entre las sedes.

#### Porto

```bash
ip addr add 10.255.1.1/30 dev eth1
ip link set eth1 up

ip addr add 10.255.2.1/30 dev eth2
ip link set eth2 up
```

#### Braga

```bash
ip addr add 10.255.1.2/30 dev eth1
ip link set eth1 up
```

#### Coimbra

```bash
ip addr add 10.255.2.2/30 dev eth1
ip link set eth1 up
```

---

### 7.3 Configuración LAN inicial

#### Porto

```bash
ip addr flush dev eth3
ip link set eth3 up
ip addr add 10.10.70.1/24 dev eth3
```

PC de prueba:

```bash
ip 10.10.70.10/24 10.10.70.1
save
```

#### Braga

```bash
ip addr flush dev eth2
ip link set eth2 up
ip addr add 10.20.30.1/24 dev eth2
```

PC de prueba:

```bash
ip 10.20.30.10/24 10.20.30.1
save
```

#### Coimbra

```bash
ip addr flush dev eth2
ip link set eth2 up
ip addr add 10.30.30.1/24 dev eth2
```

PC de prueba:

```bash
ip 10.30.30.10/24 10.30.30.1
save
```

---

### 7.4 Instalación de FRR y activación de OSPF

En cada router se conectó temporalmente un nodo NAT para instalar los paquetes necesarios.

```bash
ip link set eth4 up
udhcpc -i eth4
echo "nameserver 8.8.8.8" > /etc/resolv.conf

apk update
apk add frr frr-ospfd nano
```

Se activó el reenvío IP:

```bash
sysctl -w net.ipv4.ip_forward=1
```

Se activó FRR:

```bash
/etc/init.d/frr enable
/etc/init.d/frr start
```

Si OSPF no iniciaba correctamente, se editó el archivo de demonios:

```bash
nano /etc/frr/daemons
```

Cambio realizado:

```text
ospfd=no
```

por:

```text
ospfd=yes
```

Reinicio de FRR:

```bash
/etc/init.d/frr stop
killall watchfrr
killall zebra
killall ospfd
/etc/init.d/frr start
```

Verificación:

```bash
ps | grep ospf
ps | grep frr
vtysh
show ip ospf
show ip ospf neighbor
```

---

### 7.5 Configuración OSPF inicial

#### Porto

```bash
vtysh
configure terminal
router ospf
 ospf router-id 1.1.1.1
 network 10.255.1.0/30 area 0
 network 10.255.2.0/30 area 0
 network 10.10.70.0/24 area 0
exit
copy running-config startup-config
exit
```

#### Braga

```bash
vtysh
configure terminal
router ospf
 ospf router-id 2.2.2.2
 network 10.255.1.0/30 area 0
 network 10.20.30.0/24 area 0
exit
copy running-config startup-config
exit
```

#### Coimbra

```bash
vtysh
configure terminal
router ospf
 ospf router-id 3.3.3.3
 network 10.255.2.0/30 area 0
 network 10.30.30.0/24 area 0
exit
copy running-config startup-config
exit
```

---

### 7.6 Configuración permanente de enlaces entre routers

#### Porto

```bash
uci set network.porto_braga=interface
uci set network.porto_braga.proto='static'
uci set network.porto_braga.device='eth1'
uci set network.porto_braga.ipaddr='10.255.1.1'
uci set network.porto_braga.netmask='255.255.255.252'

uci set network.porto_coimbra=interface
uci set network.porto_coimbra.proto='static'
uci set network.porto_coimbra.device='eth2'
uci set network.porto_coimbra.ipaddr='10.255.2.1'
uci set network.porto_coimbra.netmask='255.255.255.252'

uci delete network.wan
uci delete network.wan6

uci commit network
/etc/init.d/network restart
```

#### Braga

```bash
uci set network.braga_porto=interface
uci set network.braga_porto.proto='static'
uci set network.braga_porto.device='eth1'
uci set network.braga_porto.ipaddr='10.255.1.2'
uci set network.braga_porto.netmask='255.255.255.252'

uci delete network.wan
uci delete network.wan6

uci commit network
/etc/init.d/network restart
```

#### Coimbra

```bash
uci set network.coimbra_porto=interface
uci set network.coimbra_porto.proto='static'
uci set network.coimbra_porto.device='eth1'
uci set network.coimbra_porto.ipaddr='10.255.2.2'
uci set network.coimbra_porto.netmask='255.255.255.252'

uci delete network.wan
uci delete network.wan6

uci commit network
/etc/init.d/network restart
```

En todos los routers:

```bash
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p
```

Comprobación:

```bash
uci show network
ip addr
ip route
```

---

### 7.7 Creación de VLANs

#### Braga

```bash
ip addr flush dev eth2
ip link set eth2 up

ip link add link eth2 name eth2.30 type vlan id 30
ip link set eth2.30 up
ip addr add 10.20.30.1/24 dev eth2.30

ip link add link eth2 name eth2.40 type vlan id 40
ip link set eth2.40 up
ip addr add 10.20.40.1/24 dev eth2.40

ip link add link eth2 name eth2.60 type vlan id 60
ip link set eth2.60 up
ip addr add 10.20.60.1/24 dev eth2.60

ip link add link eth2 name eth2.70 type vlan id 70
ip link set eth2.70 up
ip addr add 10.20.70.1/24 dev eth2.70

ip link add link eth2 name eth2.80 type vlan id 80
ip link set eth2.80 up
ip addr add 10.20.80.1/24 dev eth2.80
```

Puertos del switch Braga:

| Puerto | Uso               | VLAN | Tipo   |
| ------ | ----------------- | ---: | ------ |
| eth1   | Router            |    1 | dot1q  |
| eth2   | Académico         |   30 | access |
| eth3   | Atención Cliente  |   40 | access |
| eth4   | Gestión           |   70 | access |
| eth5   | Invitados Wi-Fi   |   60 | access |
| eth6   | Wi-Fi Corporativo |   80 | access |

Añadir VLANs a OSPF:

```bash
vtysh
configure terminal
router ospf
 network 10.20.40.0/24 area 0
 network 10.20.60.0/24 area 0
 network 10.20.70.0/24 area 0
 network 10.20.80.0/24 area 0
end
copy running-config startup-config
show ip route ospf
```

---

#### Coimbra

```bash
ip addr flush dev eth2
ip link set eth2 up

ip link add link eth2 name eth2.30 type vlan id 30
ip link set eth2.30 up
ip addr add 10.30.30.1/24 dev eth2.30

ip link add link eth2 name eth2.40 type vlan id 40
ip link set eth2.40 up
ip addr add 10.30.40.1/24 dev eth2.40

ip link add link eth2 name eth2.60 type vlan id 60
ip link set eth2.60 up
ip addr add 10.30.60.1/24 dev eth2.60

ip link add link eth2 name eth2.70 type vlan id 70
ip link set eth2.70 up
ip addr add 10.30.70.1/24 dev eth2.70

ip link add link eth2 name eth2.80 type vlan id 80
ip link set eth2.80 up
ip addr add 10.30.80.1/24 dev eth2.80
```

Puertos del switch Coimbra:

| Puerto | Uso               | VLAN | Tipo   |
| ------ | ----------------- | ---: | ------ |
| eth1   | Router            |    1 | dot1q  |
| eth2   | Académico         |   30 | access |
| eth3   | Atención Cliente  |   40 | access |
| eth4   | Gestión           |   70 | access |
| eth5   | Invitados Wi-Fi   |   60 | access |
| eth6   | Wi-Fi Corporativo |   80 | access |

Añadir VLANs a OSPF:

```bash
vtysh
configure terminal
router ospf
 network 10.30.40.0/24 area 0
 network 10.30.60.0/24 area 0
 network 10.30.70.0/24 area 0
 network 10.30.80.0/24 area 0
end
copy running-config startup-config
show ip route ospf
```

---

#### Porto

```bash
ip addr flush dev eth3
ip link set eth3 up

ip link add link eth3 name eth3.10 type vlan id 10
ip link set eth3.10 up
ip addr add 10.10.10.1/24 dev eth3.10

ip link add link eth3 name eth3.20 type vlan id 20
ip link set eth3.20 up
ip addr add 10.10.20.1/24 dev eth3.20

ip link add link eth3 name eth3.40 type vlan id 40
ip link set eth3.40 up
ip addr add 10.10.40.1/24 dev eth3.40

ip link add link eth3 name eth3.50 type vlan id 50
ip link set eth3.50 up
ip addr add 10.10.50.1/24 dev eth3.50

ip link add link eth3 name eth3.60 type vlan id 60
ip link set eth3.60 up
ip addr add 10.10.60.1/24 dev eth3.60

ip link add link eth3 name eth3.70 type vlan id 70
ip link set eth3.70 up
ip addr add 10.10.70.1/24 dev eth3.70

ip link add link eth3 name eth3.80 type vlan id 80
ip link set eth3.80 up
ip addr add 10.10.80.1/24 dev eth3.80
```

Switch central:

| Puerto | Conectado a       | VLAN | Tipo  |
| ------ | ----------------- | ---: | ----- |
| e3     | Router Porto eth3 |    1 | dot1q |
| e5     | Switch acceso 1   |    1 | dot1q |
| e4     | Switch acceso 2   |    1 | dot1q |
| e2     | Switch servidores |    1 | dot1q |

Switch servidores:

| Puerto | Conectado a        | VLAN | Tipo   |
| ------ | ------------------ | ---: | ------ |
| e1     | Switch central     |    1 | dot1q  |
| e2     | Servidor / PC test |   70 | access |

Switch acceso 1:

| Puerto | Conectado a       | VLAN | Tipo   |
| ------ | ----------------- | ---: | ------ |
| e1     | Switch central    |    1 | dot1q  |
| e2     | PC Desarrollo     |   20 | access |
| e3     | PC Invitados      |   60 | access |
| e4     | PC Gestión / IT   |   70 | access |
| e5     | Wi-Fi Corporativo |   80 | access |

Switch acceso 2:

| Puerto | Conectado a         | VLAN | Tipo   |
| ------ | ------------------- | ---: | ------ |
| e1     | Switch central      |    1 | dot1q  |
| e2     | PC Dirección/Admin  |   10 | access |
| e3     | PC Atención Cliente |   40 | access |
| e4     | PC Marketing/Ventas |   50 | access |

Añadir VLANs de Porto a OSPF:

```bash
vtysh
configure terminal
router ospf
 network 10.10.10.0/24 area 0
 network 10.10.20.0/24 area 0
 network 10.10.40.0/24 area 0
 network 10.10.50.0/24 area 0
 network 10.10.60.0/24 area 0
 network 10.10.70.0/24 area 0
 network 10.10.80.0/24 area 0
end
copy running-config startup-config
show ip route ospf
```

---

### 7.8 Guardar VLANs permanentemente

#### Porto

```bash
uci set network.porto_vlan10=interface
uci set network.porto_vlan10.proto='static'
uci set network.porto_vlan10.device='eth3.10'
uci set network.porto_vlan10.ipaddr='10.10.10.1'
uci set network.porto_vlan10.netmask='255.255.255.0'

uci set network.porto_vlan20=interface
uci set network.porto_vlan20.proto='static'
uci set network.porto_vlan20.device='eth3.20'
uci set network.porto_vlan20.ipaddr='10.10.20.1'
uci set network.porto_vlan20.netmask='255.255.255.0'

uci set network.porto_vlan40=interface
uci set network.porto_vlan40.proto='static'
uci set network.porto_vlan40.device='eth3.40'
uci set network.porto_vlan40.ipaddr='10.10.40.1'
uci set network.porto_vlan40.netmask='255.255.255.0'

uci set network.porto_vlan50=interface
uci set network.porto_vlan50.proto='static'
uci set network.porto_vlan50.device='eth3.50'
uci set network.porto_vlan50.ipaddr='10.10.50.1'
uci set network.porto_vlan50.netmask='255.255.255.0'

uci set network.porto_vlan60=interface
uci set network.porto_vlan60.proto='static'
uci set network.porto_vlan60.device='eth3.60'
uci set network.porto_vlan60.ipaddr='10.10.60.1'
uci set network.porto_vlan60.netmask='255.255.255.0'

uci set network.porto_vlan70=interface
uci set network.porto_vlan70.proto='static'
uci set network.porto_vlan70.device='eth3.70'
uci set network.porto_vlan70.ipaddr='10.10.70.1'
uci set network.porto_vlan70.netmask='255.255.255.0'

uci set network.porto_vlan80=interface
uci set network.porto_vlan80.proto='static'
uci set network.porto_vlan80.device='eth3.80'
uci set network.porto_vlan80.ipaddr='10.10.80.1'
uci set network.porto_vlan80.netmask='255.255.255.0'

uci commit network
uci show network | grep porto_vlan
```

#### Braga

```bash
uci set network.braga_vlan30=interface
uci set network.braga_vlan30.proto='static'
uci set network.braga_vlan30.device='eth2.30'
uci set network.braga_vlan30.ipaddr='10.20.30.1'
uci set network.braga_vlan30.netmask='255.255.255.0'

uci set network.braga_vlan40=interface
uci set network.braga_vlan40.proto='static'
uci set network.braga_vlan40.device='eth2.40'
uci set network.braga_vlan40.ipaddr='10.20.40.1'
uci set network.braga_vlan40.netmask='255.255.255.0'

uci set network.braga_vlan60=interface
uci set network.braga_vlan60.proto='static'
uci set network.braga_vlan60.device='eth2.60'
uci set network.braga_vlan60.ipaddr='10.20.60.1'
uci set network.braga_vlan60.netmask='255.255.255.0'

uci set network.braga_vlan70=interface
uci set network.braga_vlan70.proto='static'
uci set network.braga_vlan70.device='eth2.70'
uci set network.braga_vlan70.ipaddr='10.20.70.1'
uci set network.braga_vlan70.netmask='255.255.255.0'

uci set network.braga_vlan80=interface
uci set network.braga_vlan80.proto='static'
uci set network.braga_vlan80.device='eth2.80'
uci set network.braga_vlan80.ipaddr='10.20.80.1'
uci set network.braga_vlan80.netmask='255.255.255.0'

uci commit network
uci show network | grep braga_vlan
```

#### Coimbra

```bash
uci set network.coimbra_vlan30=interface
uci set network.coimbra_vlan30.proto='static'
uci set network.coimbra_vlan30.device='eth2.30'
uci set network.coimbra_vlan30.ipaddr='10.30.30.1'
uci set network.coimbra_vlan30.netmask='255.255.255.0'

uci set network.coimbra_vlan40=interface
uci set network.coimbra_vlan40.proto='static'
uci set network.coimbra_vlan40.device='eth2.40'
uci set network.coimbra_vlan40.ipaddr='10.30.40.1'
uci set network.coimbra_vlan40.netmask='255.255.255.0'

uci set network.coimbra_vlan60=interface
uci set network.coimbra_vlan60.proto='static'
uci set network.coimbra_vlan60.device='eth2.60'
uci set network.coimbra_vlan60.ipaddr='10.30.60.1'
uci set network.coimbra_vlan60.netmask='255.255.255.0'

uci set network.coimbra_vlan70=interface
uci set network.coimbra_vlan70.proto='static'
uci set network.coimbra_vlan70.device='eth2.70'
uci set network.coimbra_vlan70.ipaddr='10.30.70.1'
uci set network.coimbra_vlan70.netmask='255.255.255.0'

uci set network.coimbra_vlan80=interface
uci set network.coimbra_vlan80.proto='static'
uci set network.coimbra_vlan80.device='eth2.80'
uci set network.coimbra_vlan80.ipaddr='10.30.80.1'
uci set network.coimbra_vlan80.netmask='255.255.255.0'

uci commit network
uci show network | grep coimbra_vlan
```

---

### 7.9 Verificación después de reiniciar

Después de reiniciar routers o el proyecto:

```bash
ip addr
ip route
vtysh
show ip ospf neighbor
show ip route ospf
```

Si OSPF o los pings fallan:

```bash
nft flush ruleset
/etc/init.d/frr restart
```

Volver a comprobar:

```bash
vtysh
show ip ospf neighbor
show ip route ospf
```

---

### 7.10 Reglas de firewall

Se usó `nftables` para separar redes y limitar accesos.

#### Crear tabla y cadena base

En cada router:

```bash
nft add table inet labfw
nft 'add chain inet labfw forward { type filter hook forward priority 0; policy accept; }'
nft list ruleset
```

---

#### Bloquear VLAN 60 hacia redes internas

##### Porto

```bash
nft add rule inet labfw forward ip saddr 10.10.60.0/24 ip daddr 10.0.0.0/8 drop
```

##### Braga

```bash
nft add rule inet labfw forward ip saddr 10.20.60.0/24 ip daddr 10.0.0.0/8 drop
```

##### Coimbra

```bash
nft add rule inet labfw forward ip saddr 10.30.60.0/24 ip daddr 10.0.0.0/8 drop
```

---

#### Bloquear VLANs de usuarios hacia VLAN 70

##### Porto

```bash
nft add rule inet labfw forward ip saddr 10.10.20.0/24 ip daddr 10.10.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.10.0/24 ip daddr 10.10.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.40.0/24 ip daddr 10.10.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.50.0/24 ip daddr 10.10.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.80.0/24 ip daddr 10.10.70.0/24 drop
```

##### Braga

```bash
nft add rule inet labfw forward ip saddr 10.20.30.0/24 ip daddr 10.20.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.20.40.0/24 ip daddr 10.20.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.20.80.0/24 ip daddr 10.20.70.0/24 drop
```

##### Coimbra

```bash
nft add rule inet labfw forward ip saddr 10.30.30.0/24 ip daddr 10.30.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.30.40.0/24 ip daddr 10.30.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.30.80.0/24 ip daddr 10.30.70.0/24 drop
```

---

#### Bloquear VLAN 80 hacia VLANs cableadas

##### Porto

```bash
nft add rule inet labfw forward ip saddr 10.10.80.0/24 ip daddr 10.10.10.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.80.0/24 ip daddr 10.10.20.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.80.0/24 ip daddr 10.10.40.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.80.0/24 ip daddr 10.10.50.0/24 drop
```

##### Braga

```bash
nft add rule inet labfw forward ip saddr 10.20.80.0/24 ip daddr 10.20.30.0/24 drop
nft add rule inet labfw forward ip saddr 10.20.80.0/24 ip daddr 10.20.40.0/24 drop
```

##### Coimbra

```bash
nft add rule inet labfw forward ip saddr 10.30.80.0/24 ip daddr 10.30.30.0/24 drop
nft add rule inet labfw forward ip saddr 10.30.80.0/24 ip daddr 10.30.40.0/24 drop
```

---

### 7.11 Guardar firewall permanentemente

Se añadió el firewall en `/etc/rc.local`.

#### Porto

```bash
#!/bin/sh

sleep 30

nft delete table inet labfw 2>/dev/null

nft add table inet labfw
nft 'add chain inet labfw forward { type filter hook forward priority 0; policy accept; }'

nft add rule inet labfw forward ct state established,related accept

nft add rule inet labfw forward ip saddr 10.10.60.0/24 ip daddr 10.0.0.0/8 drop

nft add rule inet labfw forward ip saddr 10.10.10.0/24 ip daddr 10.10.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.20.0/24 ip daddr 10.10.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.40.0/24 ip daddr 10.10.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.50.0/24 ip daddr 10.10.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.80.0/24 ip daddr 10.10.70.0/24 drop

nft add rule inet labfw forward ip saddr 10.10.80.0/24 ip daddr 10.10.10.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.80.0/24 ip daddr 10.10.20.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.80.0/24 ip daddr 10.10.40.0/24 drop
nft add rule inet labfw forward ip saddr 10.10.80.0/24 ip daddr 10.10.50.0/24 drop
```

#### Braga

```bash
#!/bin/sh

sleep 30

nft delete table inet labfw 2>/dev/null

nft add table inet labfw
nft 'add chain inet labfw forward { type filter hook forward priority 0; policy accept; }'

nft add rule inet labfw forward ct state established,related accept

nft add rule inet labfw forward ip saddr 10.20.60.0/24 ip daddr 10.0.0.0/8 drop

nft add rule inet labfw forward ip saddr 10.20.30.0/24 ip daddr 10.20.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.20.40.0/24 ip daddr 10.20.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.20.80.0/24 ip daddr 10.20.70.0/24 drop

nft add rule inet labfw forward ip saddr 10.20.80.0/24 ip daddr 10.20.30.0/24 drop
nft add rule inet labfw forward ip saddr 10.20.80.0/24 ip daddr 10.20.40.0/24 drop
```

#### Coimbra

```bash
#!/bin/sh

sleep 30

nft delete table inet labfw 2>/dev/null

nft add table inet labfw
nft 'add chain inet labfw forward { type filter hook forward priority 0; policy accept; }'

nft add rule inet labfw forward ct state established,related accept

nft add rule inet labfw forward ip saddr 10.30.60.0/24 ip daddr 10.0.0.0/8 drop

nft add rule inet labfw forward ip saddr 10.30.30.0/24 ip daddr 10.30.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.30.40.0/24 ip daddr 10.30.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.30.80.0/24 ip daddr 10.30.70.0/24 drop

nft add rule inet labfw forward ip saddr 10.30.80.0/24 ip daddr 10.30.30.0/24 drop
nft add rule inet labfw forward ip saddr 10.30.80.0/24 ip daddr 10.30.40.0/24 drop
```

Si hay problemas con el firewall:

```bash
nft delete table inet labfw
nft flush ruleset
/etc/init.d/frr restart
/etc/rc.local
```

---

### 7.12 Configuración del servidor Windows

Se añadió un servidor Windows en la VLAN 70 de Porto.

```text
Hostname: ServerNovaLingua
IP:       10.10.70.100
Mask:     255.255.255.0
Gateway:  10.10.70.1
DNS:      10.10.70.100
```

Para permitir pruebas de ping, se activó ICMP en PowerShell:

```powershell
New-NetFirewallRule -DisplayName "Allow ICMPv4 Echo" -Protocol ICMPv4 -IcmpType 8 -Action Allow
```

Después se instalaron los roles:

```text
Active Directory Domain Services
DNS
```

Se promovió el servidor como controlador de dominio con el bosque:

```text
novalingua.local
```

---

### 7.13 Pruebas de conectividad

| Prueba                                               | Resultado esperado |
| ---------------------------------------------------- | ------------------ |
| Router Porto → Windows Server `10.10.70.100`         | Funciona           |
| Windows Server → gateway `10.10.70.1`                | Funciona           |
| Windows Server VLAN 70 → PC Desarrollo `10.10.20.10` | Funciona           |
| PC Desarrollo → Windows Server                       | Bloqueado          |
| VLAN 60 Invitados → gateway propio                   | Funciona           |
| VLAN 60 Invitados → redes internas                   | Bloqueado          |
| VLAN 80 Wi-Fi Corporativo → gateway propio           | Funciona           |
| VLAN 80 Wi-Fi Corporativo → VLANs cableadas          | Bloqueado          |
| VLAN 70 Gestión → redes internas                     | Funciona           |
| OSPF entre routers                                   | Funciona           |

---

### 7.14 Comandos finales de comprobación

```bash
ip addr
ip route
uci show network
nft list ruleset
```

```bash
vtysh
show ip ospf neighbor
show ip route ospf
```

---

### 7.15 Pruebas de Active Directory y DNS

Desde el cliente Windows:
```bash
ipconfig /all
ping 10.10.20.1
ping 10.10.70.100
nslookup novalingua.local
nslookup -type=SRV _ldap._tcp.dc._msdcs.novalingua.local
```

Resultado esperado:
```bash
novalingua.local → 10.10.70.100
_ldap._tcp.dc._msdcs.novalingua.local → servernovalingua.novalingua.local
servernovalingua.novalingua.local → 10.10.70.100
```
### 7.18 Configuración del cliente Windows

Cliente en VLAN 20:
| Parámetro | Valor            |
| --------- | ---------------- |
| IP        | 10.10.20.60      |
| Máscara   | 255.255.255.0    |
| Gateway   | 10.10.20.1       |
| DNS       | 10.10.70.100     |
| Dominio   | novalingua.local |


Comprobaciones:

```bash
ipconfig
ping 10.10.20.1
ping 10.10.70.100
nslookup novalingua.local
```

Unión al dominio:

Panel de control
→ Sistema y seguridad
→ Sistema
→ Configuración avanzada del sistema
→ Nombre de equipo
→ Cambiar
→ Dominio: novalingua.local

Credenciales utilizadas:

Administrador@novalingua.local


### 7.19 Pruebas de conectividad y firewall
| Prueba                                                        | Resultado esperado                       | Resultado |
| ------------------------------------------------------------- | ---------------------------------------- | --------- |
| Router Porto → Windows Server 10.10.70.100                    | Funciona                                 | Superado  |
| Windows Server 10.10.70.100 → gateway 10.10.70.1              | Funciona                                 | Superado  |
| Windows Server VLAN 70 → PC Desarrollo 10.10.20.10            | Funciona tras añadir established,related | Superado  |
| PC Desarrollo 10.10.20.10 → Windows Server 10.10.70.100       | Falla / bloqueado                        | Superado  |
| VLAN 60 Invitados → su propia puerta de enlace                | Funciona                                 | Superado  |
| VLAN 60 Invitados → redes internas / VLAN 70                  | Falla / bloqueado                        | Superado  |
| VLAN 80 Wi-Fi Corporativo → su propia puerta de enlace        | Funciona                                 | Superado  |
| VLAN 80 Wi-Fi Corporativo → VLANs cableadas locales / VLAN 70 | Falla / bloqueado                        | Superado  |
| VLAN 70 Gestión → VLANs internas                              | Funciona                                 | Superado  |

### 7.19 Política de firewall final
| Origen                                                                                     | Destino                                                                                  | Acción                                   | Motivo                                                                  |
| ------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------- | ---------------------------------------- | ----------------------------------------------------------------------- |
| Tráfico `established,related`                                                              | Cualquier red                                                                            | Permitir                                 | Permite respuestas a conexiones ya iniciadas y autorizadas              |
| VLAN 60 Invitados Porto `10.10.60.0/24`                                                    | Redes internas `10.0.0.0/8`                                                              | Denegar                                  | Aislar invitados de la red corporativa                                  |
| VLAN 60 Invitados Braga `10.20.60.0/24`                                                    | Redes internas `10.0.0.0/8`                                                              | Denegar                                  | Aislar invitados de la red corporativa                                  |
| VLAN 60 Invitados Coimbra `10.30.60.0/24`                                                  | Redes internas `10.0.0.0/8`                                                              | Denegar                                  | Aislar invitados de la red corporativa                                  |
| VLANs de usuarios Porto `10.10.10.0/24`, `10.10.20.0/24`, `10.10.40.0/24`, `10.10.50.0/24` | Servidor principal `10.10.70.100`                                                        | Permitir servicios necesarios            | Permitir AD, DNS, GPOs y carpetas compartidas                           |
| VLANs de usuarios Porto `10.10.10.0/24`, `10.10.20.0/24`, `10.10.40.0/24`, `10.10.50.0/24` | VLAN 70 Porto `10.10.70.0/24`                                                            | Denegar por defecto                      | Evitar acceso libre a la red de gestión/servidores                      |
| VLAN 80 Wi-Fi Corporativo Porto `10.10.80.0/24`                                            | VLAN 70 Porto `10.10.70.0/24`                                                            | Denegar por defecto                      | Proteger servidores y gestión                                           |
| VLAN 80 Wi-Fi Corporativo Porto `10.10.80.0/24`                                            | VLANs cableadas Porto `10.10.10.0/24`, `10.10.20.0/24`, `10.10.40.0/24`, `10.10.50.0/24` | Denegar                                  | Separar Wi-Fi corporativo de clientes cableados                         |
| VLANs de usuarios Braga `10.20.30.0/24`, `10.20.40.0/24`                                   | VLAN 70 Braga `10.20.70.0/24`                                                            | Denegar                                  | Proteger red local de gestión                                           |
| VLAN 80 Wi-Fi Corporativo Braga `10.20.80.0/24`                                            | VLAN 70 Braga `10.20.70.0/24`                                                            | Denegar                                  | Proteger red local de gestión                                           |
| VLAN 80 Wi-Fi Corporativo Braga `10.20.80.0/24`                                            | VLANs cableadas Braga `10.20.30.0/24`, `10.20.40.0/24`                                   | Denegar                                  | Separar Wi-Fi corporativo de clientes cableados                         |
| VLANs de usuarios Coimbra `10.30.30.0/24`, `10.30.40.0/24`                                 | VLAN 70 Coimbra `10.30.70.0/24`                                                          | Denegar                                  | Proteger red local de gestión                                           |
| VLAN 80 Wi-Fi Corporativo Coimbra `10.30.80.0/24`                                          | VLAN 70 Coimbra `10.30.70.0/24`                                                          | Denegar                                  | Proteger red local de gestión                                           |
| VLAN 80 Wi-Fi Corporativo Coimbra `10.30.80.0/24`                                          | VLANs cableadas Coimbra `10.30.30.0/24`, `10.30.40.0/24`                                 | Denegar                                  | Separar Wi-Fi corporativo de clientes cableados                         |
| VLAN 70 Gestión/Servidores                                                                 | Redes internas corporativas                                                              | Permitir                                 | Permitir administración y conexiones iniciadas desde servidores/gestión |
| OSPF entre routers                                                                         | Enlaces WAN internos `10.255.1.0/30`, `10.255.2.0/30`                                    | Permitir                                 | Mantener el enrutamiento dinámico entre sedes                           |
| Cualquier tráfico no definido                                                              | Según política por defecto / limitado                                                    | Denegar o no permitir acceso innecesario | Aplicar principio de mínimo privilegio                                  |


## 8. Pruebas y validación

Durante la implementación se realizaron pruebas de conectividad, enrutamiento, firewall, Active Directory, DNS, recursos compartidos y base de datos.  
Los resultados generales fueron correctos y se documentan de forma detallada en el **Anexo A — Pruebas y resultados**.

| Área probada | Resultado general |
|---|---|
| Conectividad entre VLANs | Correcto |
| OSPF entre sedes | Correcto |
| Firewall entre VLANs | Correcto |
| Integración Windows Server | Correcto |
| Active Directory y DNS | Correcto |
| Cliente unido al dominio | Correcto |
| Recursos compartidos | Parcial (problemas con interfaz gráfica) |
| MySQL | Correcto |
| GPOs | Correcto |

## 9. Diseño de AD

### 9.1 Estructura de la organización
```text
novalingua.local
└── NovaLingua
    ├── Departamentos_Tecnicos
    │   └── Desarrollo-Plataforma
    ├── Departamentos_No_Tecnicos
    │   ├── Direccion-Administracion
    │   ├── Academico
    │   ├── Atencion-Cliente
    │   └── Marketing-Ventas
    ├── IT_Sistemas
    ├── Equipos
    │   ├── Porto
    │   ├── Braga
    │   └── Coimbra
    └── Servidores
```

### 9.2 Justificación
| Unidad organizativa         | Contenido                                                 | Justificación                                                                          |
| --------------------------- | --------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `Departamentos_Tecnicos`    | Usuarios del área de desarrollo/plataforma                | Estos usuarios requieren más permisos técnicos que los departamentos no técnicos.      |
| `Departamentos_No_Tecnicos` | Dirección, Académico, Atención Cliente y Marketing/Ventas | Agrupa usuarios con necesidades comunes y restricciones similares.                     |
| `IT_Sistemas`               | Personal técnico de administración y soporte              | Se mantiene separado para evitar aplicar restricciones destinadas a usuarios normales. |
| `Equipos`                   | Equipos unidos al dominio, organizados por sede           | Facilita la administración de estaciones de trabajo por ubicación.                     |
| `Servidores`                | Servidores de la infraestructura                          | Permite separar servidores de equipos cliente y aplicar políticas específicas.         |

### 9.3 Usuarios
#### Académico
- José Antonio
#### Atención Cliente
##### Braga
- María Fernández
##### Coimbra
- Pilar Rubio
##### Porto
Javier González
#### Marketing y ventas
- Jhony Uribe
#### Direccion-Admin
- Marcos Politano
#### Desarrollo
- Brian Lopez
#### IT Sistemas
- Mar Vargas

## 10. Políticas de seguridad
| GPO                                    | Aplicada a                              | Configuración principal                                                | Objetivo                                                                       |
| -------------------------------------- | --------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| **Política de Contraseñas**            | Dominio `novalingua.local`              | Longitud mínima, complejidad de contraseña y bloqueo de cuenta         | Mejorar la seguridad de las cuentas del dominio                                |
| **Bloquear Panel Control**             | Departamentos no técnicos               | Bloqueo del Panel de Control y Configuración                           | Evitar que usuarios no técnicos modifiquen ajustes del sistema                 |
| **Fondo Pantalla Corporativo**         | Usuarios / OUs seleccionadas            | Fondo corporativo desde la carpeta compartida de wallpapers            | Aplicar identidad visual corporativa                                           |
| **Mapeo Carpetas**                     | Usuarios / departamentos seleccionados  | Mapeo de carpetas compartidas como `General`, `Desarrollo`, `IT`, etc. | Facilitar el acceso a recursos compartidos                                     |
| **Mensaje Inicio Sesión**              | Dominio o usuarios del dominio          | Aviso legal/de seguridad antes del inicio de sesión                    | Informar que el acceso está restringido a usuarios autorizados                 |
| **Bloquear CMD**                       | Departamentos no técnicos               | Bloqueo del Símbolo del sistema                                        | Evitar el uso de línea de comandos por usuarios no técnicos                    |
| **Bloquear Vista de la Última Sesión** | Equipos del dominio / OUs seleccionadas | Ocultar el último nombre de usuario que inició sesión en el equipo     | Mejorar la privacidad y evitar que se revele información de cuentas anteriores |


## 11. Creación de la base de datos
### Resumen de la base de datos NovaLingua School

La base de datos `novalingua_school` tiene como objetivo gestionar la información principal de una escuela de idiomas. Permite almacenar datos de alumnos, profesores, cursos, sedes, matrículas, materiales educativos, progreso académico e incidencias.

El diseño está orientado a simular el funcionamiento interno de NovaLingua School, especialmente en la gestión académica y administrativa de los cursos.

---

#### Objetivo de la base de datos

La base de datos permite:

- Registrar alumnos de la escuela.
- Gestionar cursos de idiomas.
- Asignar profesores a cursos.
- Relacionar cursos con sedes.
- Registrar la matrícula de alumnos en cursos.
- Controlar el progreso de los alumnos.
- Asociar materiales educativos a cursos.
- Registrar incidencias académicas, técnicas o administrativas.
- Gestionar empleados responsables de incidencias o tareas internas.

---

#### Tablas principales

| Tabla | Función |
|---|---|
| `alumno_info` | Almacena la información personal y de acceso de los alumnos. |
| `curso` | Guarda la información de los cursos disponibles, como nivel, modalidad, horario, profesor y sede. |
| `alumno_curso` | Relaciona alumnos con cursos y registra la matrícula, estado y progreso inicial. |
| `profesor` | Almacena los datos de los profesores y su especialidad de idioma. |
| `sede` | Guarda las sedes físicas de NovaLingua School. |
| `material` | Almacena materiales asociados a cursos, como PDF, audio o vídeo. |
| `progreso_alumno` | Registra el porcentaje de progreso de un alumno en un curso. |
| `incidencia` | Permite registrar problemas o solicitudes de alumnos, como incidencias académicas, técnicas o de facturación. |
| `empleado` | Almacena información de empleados internos que pueden gestionar incidencias. |

---

#### Relaciones entre tablas

La base de datos utiliza claves foráneas para relacionar las entidades principales.

| Relación | Descripción |
|---|---|
| `alumno_curso.id_alumno` → `alumno_info.id_alumno` | Un alumno puede estar matriculado en uno o varios cursos. |
| `alumno_curso.id_curso` → `curso.id_curso` | Un curso puede tener varios alumnos matriculados. |
| `curso.id_profesor` → `profesor.id_profesor` | Cada curso puede estar asignado a un profesor. |
| `curso.id_sede` → `sede.id_sede` | Cada curso puede impartirse en una sede concreta. |
| `material.id_curso` → `curso.id_curso` | Cada material pertenece a un curso. |
| `progreso_alumno.id_alumno` → `alumno_info.id_alumno` | El progreso se asocia a un alumno concreto. |
| `progreso_alumno.id_curso` → `curso.id_curso` | El progreso se mide dentro de un curso concreto. |
| `incidencia.id_alumno` → `alumno_info.id_alumno` | Una incidencia puede estar asociada a un alumno. |
| `incidencia.id_empleado` → `empleado.id_empleado` | Una incidencia puede ser gestionada por un empleado. |

---

#### Explicación general del modelo

El núcleo de la base de datos está formado por las tablas `alumno_info`, `curso` y `alumno_curso`.

La tabla `alumno_info` guarda los datos de los alumnos. La tabla `curso` contiene los cursos disponibles, incluyendo nivel, modalidad, horario, profesor y sede. Como un alumno puede estar matriculado en varios cursos, y un curso puede tener varios alumnos, se utiliza la tabla intermedia `alumno_curso`.

Esta tabla intermedia permite representar una relación de muchos a muchos entre alumnos y cursos.

```text
alumno_info  →  alumno_curso  ←  curso
```

Además, cada curso puede estar relacionado con un profesor y una sede:

```text
profesor  →  curso  ←  sede
```

Los materiales educativos se asocian directamente a los cursos:

```text
curso  →  material
```

El progreso académico se registra relacionando al alumno con el curso:

```text
alumno_info  →  progreso_alumno  ←  curso
```

Por último, las incidencias permiten registrar problemas o solicitudes. Estas pueden estar asociadas a un alumno y, opcionalmente, a un empleado encargado de gestionarlas:

```text
alumno_info  →  incidencia  ←  empleado
```

---

#### Tipo de relaciones

| Relación | Tipo |
|---|---|
| Alumno - Curso | Muchos a muchos mediante `alumno_curso` |
| Profesor - Curso | Uno a muchos |
| Sede - Curso | Uno a muchos |
| Curso - Material | Uno a muchos |
| Alumno - Progreso | Uno a muchos |
| Curso - Progreso | Uno a muchos |
| Alumno - Incidencia | Uno a muchos |
| Empleado - Incidencia | Uno a muchos |

---

#### Reglas de integridad

La base de datos utiliza restricciones de clave foránea para mantener la coherencia de los datos.

Por ejemplo:

- Si se elimina un alumno, sus matrículas y registros de progreso asociados pueden eliminarse automáticamente mediante `ON DELETE CASCADE`.
- Si se elimina un curso, sus matrículas, materiales y registros de progreso asociados también pueden eliminarse.
- Si se elimina un profesor o una sede, el curso no se elimina, pero el campo correspondiente se establece en `NULL` mediante `ON DELETE SET NULL`.
- Si se elimina un alumno o empleado relacionado con una incidencia, la incidencia se conserva, pero la referencia se establece en `NULL`.

Esto permite mantener un historial de información sin romper las relaciones internas de la base de datos.

---

#### Conclusión

La base de datos `novalingua_school` permite representar de forma sencilla el funcionamiento académico y administrativo de NovaLingua School. El modelo cubre alumnos, cursos, profesores, sedes, materiales, progreso e incidencias, permitiendo simular una plataforma interna de gestión educativa.

Gracias al uso de claves primarias, claves foráneas e índices, la base de datos mantiene relaciones coherentes entre las tablas y permite realizar consultas útiles para la gestión diaria de la escuela.

### 11.1 Comandos de creación
```sql
CREATE DATABASE novalingua_school;
USE novalingua_school;

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

--
-- Dumping data for table `alumno_curso`
--

INSERT INTO `alumno_curso` (`id_alumno_curso`, `id_alumno`, `id_curso`, `fecha_matricula`, `estado`, `nivel`, `nombre_curso`, `progreso`) VALUES
(2, 11, 1, '2026-06-01 10:13:56', 'Activo', NULL, NULL, 0),
(3, 10, 1, '2026-06-01 10:13:56', 'Activo', NULL, NULL, NULL),
(4, 10, 4, '2026-06-01 10:13:56', 'Activo', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `alumno_info`
--

CREATE TABLE `alumno_info` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `contrasenia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alumno_info`
--

INSERT INTO `alumno_info` (`id_alumno`, `nombre`, `apellidos`, `telefono`, `fecha_nacimiento`, `email`, `contrasenia`) VALUES
(1, 'María', 'López', '+34600112233', '2001-05-15', 'maria@email.com', '123456'),
(2, 'prueba', 'funcionamiento registro', '34 600666666', '2004-06-10', 'prueba2@gmail.com', '123456'),
(3, 'prueba3', ':)', '34 600 600 600', '2000-10-10', 'prueba3@gmail.com', '123456'),
(4, 'prueba4@gmail.com', ':)', '600 609 900', '2003-02-10', 'prueba4@gmail.com', '123456'),
(5, 'prueba5@gmail.com', '', '', NULL, 'prueba5@gmail.com', '123456'),
(6, 'prueba6', '', '', NULL, 'prueba6@gmail.com', '123456'),
(7, 'prueba7', '', '', NULL, 'prueba7@gmail.com', '123456'),
(8, 'prueba8', '', '', NULL, 'prueba8@gmail.com', '123456'),
(9, 'prueba9@gmail.com', '', '', NULL, 'prueba9@gmail.com', '123456'),
(10, 'prueba10@gmail.com', '', '', NULL, 'prueba10@gmail.com', '123456'),
(11, 'prueba11@gmail.com', '', '', NULL, 'prueba11@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

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

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`id_curso`, `descripcion`, `nivel`, `modalidad`, `dias_semana`, `franja_horaria`, `id_profesor`, `id_sede`) VALUES
(1, 'Curso Intensivo de Inglés B2', 'B2', 'Presencial', 'Lunes-Miércoles', '18:00 - 19:30', 1, 1),
(2, 'Curso Avanzado de Inglés C1', 'C1', 'Online', 'Martes-Jueves', '19:30 - 21:00', 1, 1),
(3, 'Iniciación al Francés A2', 'A2', 'Presencial', 'Lunes-Miércoles', '17:00 - 18:30', 1, 1),
(4, 'Perfeccionamiento Alemán B1', 'B1', 'Online', 'Viernes', '16:00 - 19:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `sede` enum('Oporto','Braga','Coímbra','Online') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `incidencia`
--

CREATE TABLE `incidencia` (
  `id_incidencia` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `tipo` enum('Técnico','Académico','Facturación','Otros') NOT NULL,
  `estado` enum('Abierto','En Proceso','Resuelto','Cerrado') DEFAULT 'Abierto',
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `id_alumno` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `incidencia`
--

INSERT INTO `incidencia` (`id_incidencia`, `descripcion`, `tipo`, `estado`, `fecha_creacion`, `id_alumno`, `id_empleado`) VALUES
(1, 'contenido no subido a la plataforma', 'Académico', 'Abierto', '2026-06-01 11:50:53', 11, NULL),
(2, 'aaaaaa', 'Facturación', 'Abierto', '2026-06-01 12:00:33', 11, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id_material` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `tipo` enum('pdf','audio','video') NOT NULL,
  `url_descarga` varchar(255) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `especialidad_idioma` enum('Inglés','Francés','Alemán','Portugués','Español') NOT NULL,
  `modalidad` enum('Presencial','Online','Híbrido') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `nombre`, `apellidos`, `telefono`, `email`, `especialidad_idioma`, `modalidad`) VALUES
(1, 'John', 'Smith', '+351912345678', 'john.smith@novalingua.com', 'Inglés', 'Híbrido');

-- --------------------------------------------------------

--
-- Table structure for table `progreso_alumno`
--

CREATE TABLE `progreso_alumno` (
  `id_progreso` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `porcentaje` int(11) NOT NULL DEFAULT 0
) ;

-- --------------------------------------------------------

--
-- Table structure for table `sede`
--

CREATE TABLE `sede` (
  `id_sede` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `ciudad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sede`
--

INSERT INTO `sede` (`id_sede`, `nombre`, `direccion`, `ciudad`) VALUES
(1, 'Sede Central', 'Rua de Santa Catarina 123', 'Oporto');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumno_curso`
--
ALTER TABLE `alumno_curso`
  ADD PRIMARY KEY (`id_alumno_curso`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indexes for table `alumno_info`
--
ALTER TABLE `alumno_info`
  ADD PRIMARY KEY (`id_alumno`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `id_sede` (`id_sede`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `incidencia`
--
ALTER TABLE `incidencia`
  ADD PRIMARY KEY (`id_incidencia`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id_material`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indexes for table `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `progreso_alumno`
--
ALTER TABLE `progreso_alumno`
  ADD PRIMARY KEY (`id_progreso`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indexes for table `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id_sede`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alumno_curso`
--
ALTER TABLE `alumno_curso`
  MODIFY `id_alumno_curso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `alumno_info`
--
ALTER TABLE `alumno_info`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `incidencia`
--
ALTER TABLE `incidencia`
  MODIFY `id_incidencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id_material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id_profesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `progreso_alumno`
--
ALTER TABLE `progreso_alumno`
  MODIFY `id_progreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sede`
--
ALTER TABLE `sede`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumno_curso`
--
ALTER TABLE `alumno_curso`
  ADD CONSTRAINT `alumno_curso_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno_info` (`id_alumno`) ON DELETE CASCADE,
  ADD CONSTRAINT `alumno_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE;

--
-- Constraints for table `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`) ON DELETE SET NULL,
  ADD CONSTRAINT `curso_ibfk_2` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`) ON DELETE SET NULL;

--
-- Constraints for table `incidencia`
--
ALTER TABLE `incidencia`
  ADD CONSTRAINT `incidencia_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno_info` (`id_alumno`) ON DELETE SET NULL,
  ADD CONSTRAINT `incidencia_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE SET NULL;

--
-- Constraints for table `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `material_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE;

--
-- Constraints for table `progreso_alumno`
--
ALTER TABLE `progreso_alumno`
  ADD CONSTRAINT `progreso_alumno_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno_info` (`id_alumno`) ON DELETE CASCADE,
  ADD CONSTRAINT `progreso_alumno_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
```


## 12. Contratos, acuerdos, herramientas y habilidades necesarias por departamento

Para garantizar el correcto funcionamiento de NovaLingua School, es necesario definir los contratos, acuerdos, herramientas y habilidades que necesita cada departamento. La empresa cuenta con varias sedes, permite ciertos modelos de teletrabajo y trabaja con información personal de alumnos, profesores, empleados y proveedores, por lo que debe organizar correctamente tanto su estructura laboral como su seguridad informática y administrativa.

Esta sección describe los contratos necesarios, los acuerdos internos y externos, y las herramientas y competencias principales requeridas para cada área de la empresa.

---

### 12.1 Contratos necesarios

NovaLingua School necesitará diferentes tipos de contratos según la función del personal, la duración del trabajo y el tipo de servicio prestado.

### 12.2 Contratos laborales

Los contratos laborales se utilizarán para el personal interno de la empresa. Estos empleados forman parte de la actividad diaria de NovaLingua School y trabajan de forma estable en las diferentes sedes o en modalidad remota autorizada.

Los departamentos que normalmente tendrán contratos indefinidos son:

| Departamento                   | Tipo de contrato recomendado | Justificación                                                                |
| ------------------------------ | ---------------------------- | ---------------------------------------------------------------------------- |
| Dirección y Administración     | Indefinido                   | Es un departamento estable y necesario para la gestión diaria de la empresa. |
| IT / Sistemas                  | Indefinido                   | Mantiene la infraestructura informática, red, servidores y seguridad.        |
| Desarrollo y Plataforma Online | Indefinido                   | Gestiona la plataforma LMS, web corporativa y base de datos.                 |
| Atención al Cliente            | Indefinido                   | Atiende consultas, incidencias y soporte a alumnos.                          |
| Marketing y Ventas             | Indefinido                   | Gestiona campañas, captación de alumnos y comunicación externa.              |

En el caso del **Equipo Académico**, podrán existir diferentes modalidades:

| Perfil                           | Tipo de contrato | Justificación                                                   |
| -------------------------------- | ---------------- | --------------------------------------------------------------- |
| Profesores permanentes           | Indefinido       | Imparten clases de forma continua durante el curso académico.   |
| Profesores para cursos concretos | Temporal         | Se contratan para cursos específicos o de duración limitada.    |
| Sustituciones                    | Temporal         | Cubren bajas, vacaciones o necesidades puntuales.               |
| Coordinadores académicos         | Indefinido       | Organizan cursos, horarios, profesores y seguimiento académico. |

### 12.3 Contratos temporales

Los contratos temporales serán útiles cuando la empresa necesite cubrir necesidades concretas durante un periodo limitado.

Ejemplos:

* Cursos intensivos de verano.
* Sustitución de profesores.
* Refuerzo temporal en Atención al Cliente durante campañas de matrícula.
* Apoyo puntual en Marketing durante campañas promocionales.
* Contratación de personal para eventos o jornadas de puertas abiertas.

### 12.4 Contratos de prestación de servicios

NovaLingua School también podrá contratar a profesionales externos o empresas especializadas para tareas que no se realizan de forma continua dentro de la organización.

Ejemplos de servicios externos:

| Servicio externo        | Justificación                                                     |
| ----------------------- | ----------------------------------------------------------------- |
| Auditorías de seguridad | Revisar vulnerabilidades en red, servidores y plataforma online.  |
| Reparación de hardware  | Resolver averías en equipos, servidores o periféricos.            |
| Consultoría informática | Apoyo especializado para proyectos técnicos concretos.            |
| Diseño gráfico          | Creación de material promocional y corporativo.                   |
| Campañas publicitarias  | Gestión de publicidad online o redes sociales.                    |
| Desarrollo puntual      | Nuevas funcionalidades para la plataforma LMS o web.              |
| Soporte legal o fiscal  | Asesoramiento sobre contratos, protección de datos o facturación. |

### 12.5 Contratos técnicos con proveedores

La empresa necesitará contratos con proveedores tecnológicos para garantizar la continuidad de los servicios informáticos.

| Servicio contratado             | Finalidad                                                                 |
| ------------------------------- | ------------------------------------------------------------------------- |
| Internet y telecomunicaciones   | Conexión de las sedes de Porto, Braga y Coímbra.                          |
| Hosting web                     | Alojamiento de la página web corporativa o plataforma externa.            |
| Licencias de software           | Uso legal de sistemas operativos, herramientas ofimáticas y aplicaciones. |
| Mantenimiento informático       | Soporte técnico para servidores, equipos y red.                           |
| Servicio de copias de seguridad | Protección de datos ante fallos o pérdida de información.                 |
| Soporte con SLA                 | Definición de tiempos de respuesta y responsabilidades del proveedor.     |
| Servicios de correo corporativo | Comunicación interna y externa de la empresa.                             |
| Seguridad informática           | Antivirus, monitorización, firewall avanzado o auditorías.                |

El SLA o acuerdo de nivel de servicio es importante porque permite definir tiempos máximos de respuesta ante incidencias, disponibilidad mínima del servicio y responsabilidades del proveedor.

---

### 12.6 Acuerdos necesarios

Además de los contratos, NovaLingua School deberá contar con acuerdos específicos para proteger la información, regular el trabajo remoto y garantizar un uso correcto de los sistemas.

#### Acuerdo de confidencialidad

Todos los empleados, proveedores y colaboradores que tengan acceso a información interna deberán firmar un acuerdo de confidencialidad.

Este acuerdo es necesario porque la empresa maneja información sensible como:

* Datos personales de alumnos.
* Datos de profesores y empleados.
* Matrículas.
* Horarios.
* Pagos y facturación.
* Incidencias.
* Información interna de la empresa.
* Documentación técnica.
* Accesos a sistemas informáticos.

El objetivo de este acuerdo es evitar la divulgación no autorizada de información y proteger la privacidad de la empresa y de sus usuarios.

#### Acuerdo de protección de datos

La empresa deberá firmar acuerdos de protección de datos con aquellos proveedores que traten información personal en nombre de NovaLingua School.

Ejemplos de proveedores afectados:

| Proveedor           | Datos que podría tratar                               |
| ------------------- | ----------------------------------------------------- |
| Hosting web         | Datos de usuarios de la plataforma o formularios web. |
| Correo electrónico  | Comunicaciones internas y externas.                   |
| Copias de seguridad | Información de alumnos, empleados y cursos.           |
| Plataforma LMS      | Datos académicos, accesos y progreso de alumnos.      |
| CRM                 | Información comercial y de atención al cliente.       |

Este acuerdo permite regular el tratamiento de datos personales y ayuda a cumplir con la normativa de protección de datos.

#### Acuerdo de teletrabajo

Como NovaLingua School permite el teletrabajo en algunos puestos, los empleados autorizados deberán firmar un acuerdo específico.

Este acuerdo debe incluir:

* Condiciones del trabajo remoto.
* Horarios y disponibilidad.
* Uso de equipos corporativos.
* Uso obligatorio de VPN si procede.
* Normas de seguridad de la información.
* Responsabilidades del trabajador.
* Protección de credenciales.
* Prohibición de compartir dispositivos o cuentas.
* Obligación de reportar incidencias técnicas o de seguridad.

El teletrabajo debe estar especialmente controlado en departamentos con acceso a información sensible, como Dirección, Administración, IT, Desarrollo y Atención al Cliente.

---

### 12.7 Herramientas y habilidades necesarias por departamento

Cada departamento necesita herramientas y habilidades diferentes según sus funciones, su ubicación y el nivel de acceso que tenga a los sistemas de la empresa.

---

### 12.8 Dirección y Administración

#### Herramientas necesarias

El departamento de Dirección y Administración necesita herramientas orientadas a la gestión empresarial, comunicación, facturación y organización interna.

| Herramienta                         | Uso                                                             |
| ----------------------------------- | --------------------------------------------------------------- |
| Microsoft Word / LibreOffice Writer | Redacción de documentos, informes y comunicaciones internas.    |
| Microsoft Excel / LibreOffice Calc  | Control financiero, listados, presupuestos y análisis de datos. |
| PowerPoint / Impress                | Presentaciones internas y reuniones.                            |
| Correo electrónico corporativo      | Comunicación con empleados, proveedores y clientes.             |
| Carpetas compartidas                | Almacenamiento de documentos administrativos.                   |
| Sistema de facturación              | Gestión de pagos, recibos y facturas.                           |
| Herramientas de RRHH                | Gestión de empleados, contratos y horarios.                     |
| Impresoras y escáneres              | Digitalización y gestión documental.                            |
| Acceso remoto mediante VPN          | Acceso seguro a recursos internos en caso de teletrabajo.       |

#### Habilidades necesarias

El personal de Dirección y Administración debe contar con habilidades relacionadas con:

* Gestión empresarial.
* Organización interna.
* Facturación.
* Finanzas.
* Recursos humanos.
* Uso de herramientas ofimáticas.
* Gestión documental.
* Comunicación profesional.
* Uso correcto del correo corporativo.
* Acceso a carpetas compartidas.
* Protección de datos.
* Confidencialidad.
* Uso seguro de sistemas informáticos.

#### Nivel de acceso recomendado

Este departamento puede necesitar acceso a información sensible de la empresa, pero no debe tener permisos técnicos de administración sobre servidores o red.

| Recurso                      | Acceso recomendado           |
| ---------------------------- | ---------------------------- |
| Carpetas administrativas     | Lectura y escritura          |
| Carpetas generales           | Lectura                      |
| Sistemas de facturación      | Acceso autorizado            |
| Servidores                   | Sin acceso administrativo    |
| Panel de control del sistema | Restringido                  |
| VPN                          | Permitida si hay teletrabajo |

---

### 12.9 IT / Sistemas

#### Herramientas necesarias

El departamento de IT / Sistemas necesita herramientas técnicas para administrar la infraestructura informática de NovaLingua School.

| Herramienta                    | Uso                                                         |
| ------------------------------ | ----------------------------------------------------------- |
| Active Directory               | Gestión centralizada de usuarios, equipos y políticas.      |
| Windows Server                 | Servicios de dominio, DNS, archivos, GPOs y administración. |
| OpenWrt                        | Routing, firewall, VLANs y conectividad entre sedes.        |
| GNS3                           | Simulación de red y pruebas de infraestructura.             |
| DNS                            | Resolución de nombres internos.                             |
| DHCP                           | Asignación automática de direcciones IP.                    |
| Firewall / nftables            | Control de tráfico entre VLANs.                             |
| VPN remota                     | Acceso seguro para teletrabajo.                             |
| VPN site-to-site               | Comunicación segura entre sedes.                            |
| Antivirus centralizado         | Protección de equipos y servidores.                         |
| NAS / sistema de backups       | Copias de seguridad centralizadas.                          |
| Herramientas de monitorización | Supervisión de red, servidores y servicios.                 |
| Sistema de tickets             | Gestión de incidencias técnicas.                            |

#### Habilidades necesarias

El personal de IT / Sistemas debe tener conocimientos técnicos en:

* Administración de usuarios y permisos.
* Active Directory.
* DNS y DHCP.
* Configuración de servidores.
* Redes TCP/IP.
* VLANs.
* OSPF y routing.
* Firewall.
* VPN.
* Copias de seguridad.
* Restauración ante fallos.
* Seguridad informática.
* Resolución de incidencias.
* Documentación técnica.

#### Responsabilidades principales

El departamento de IT / Sistemas será responsable de:

* Mantener la conexión entre Porto, Braga y Coímbra.
* Administrar servidores.
* Gestionar usuarios y permisos.
* Mantener Active Directory y DNS.
* Aplicar GPOs.
* Proteger la red mediante firewall.
* Gestionar copias de seguridad.
* Resolver incidencias técnicas.
* Documentar cambios y configuraciones.
* Mantener la disponibilidad de los servicios internos.

#### Nivel de acceso recomendado

| Recurso              | Acceso recomendado        |
| -------------------- | ------------------------- |
| Servidores           | Administración            |
| Routers/firewalls    | Administración            |
| Active Directory     | Administración            |
| Carpetas compartidas | Administración            |
| GPOs                 | Administración            |
| Base de datos        | Acceso técnico controlado |
| Equipos cliente      | Soporte técnico           |

---

### 12.10 Desarrollo y Plataforma Online

#### Herramientas necesarias

El departamento de Desarrollo y Plataforma Online necesita herramientas relacionadas con programación, base de datos, control de versiones y mantenimiento del LMS.

| Herramienta             | Uso                                      |
| ----------------------- | ---------------------------------------- |
| Visual Studio Code      | Desarrollo de código.                    |
| Git / GitHub            | Control de versiones y colaboración.     |
| Angular                 | Desarrollo frontend.                     |
| Spring Boot             | Desarrollo backend.                      |
| MySQL / MariaDB         | Gestión de base de datos.                |
| Apache / Nginx / IIS    | Servidor web o publicación de servicios. |
| Herramientas de pruebas | Verificación de funcionalidades.         |
| Plataforma LMS          | Gestión de cursos y alumnos.             |
| Navegador web           | Pruebas de la plataforma.                |
| Documentación técnica   | Registro de cambios y procedimientos.    |

#### Habilidades necesarias

Este departamento requiere habilidades como:

* Programación web.
* Desarrollo frontend.
* Desarrollo backend.
* Diseño y consumo de APIs.
* Gestión de bases de datos.
* SQL.
* Seguridad en aplicaciones web.
* Control de versiones.
* Pruebas de software.
* Mantenimiento de plataformas.
* Resolución de errores.
* Documentación de código.

#### Responsabilidades principales

El departamento de Desarrollo y Plataforma Online se encargará de:

* Mantener la página web corporativa.
* Mantener la plataforma de alumnos.
* Administrar funcionalidades del LMS.
* Gestionar cambios en la base de datos junto con IT.
* Implementar mejoras en la plataforma.
* Revisar errores de aplicación.
* Asegurar que el sistema pueda crecer según las necesidades de la academia.

#### Nivel de acceso recomendado

| Recurso                | Acceso recomendado                 |
| ---------------------- | ---------------------------------- |
| Carpeta Desarrollo     | Lectura y escritura                |
| Base de datos          | Acceso técnico controlado          |
| Servidor web/LMS       | Acceso de mantenimiento            |
| Servidores de red      | Sin administración completa        |
| Herramientas de código | Acceso completo                    |
| Panel de control       | Permitido o parcialmente permitido |

---

### 12.11 Equipo Académico

#### Herramientas necesarias

El Equipo Académico necesita herramientas orientadas a la enseñanza, organización de clases y seguimiento de alumnos.

| Herramienta                    | Uso                                              |
| ------------------------------ | ------------------------------------------------ |
| Plataforma LMS                 | Gestión de cursos, materiales y seguimiento.     |
| Videoconferencia               | Clases online y tutorías.                        |
| Correo electrónico corporativo | Comunicación con alumnos y coordinación interna. |
| Calendario compartido          | Organización de clases y reuniones.              |
| Carpetas compartidas           | Almacenamiento de materiales académicos.         |
| Recursos digitales             | Apoyo para clases presenciales y online.         |
| Plataforma de seguimiento      | Consulta del progreso de alumnos.                |

#### Habilidades necesarias

El personal académico debe contar con habilidades relacionadas con:

* Enseñanza de idiomas.
* Planificación de clases.
* Creación de materiales educativos.
* Uso de plataformas LMS.
* Uso de videoconferencia.
* Seguimiento del progreso de alumnos.
* Comunicación con alumnos.
* Organización de horarios.
* Uso seguro de herramientas digitales.
* Protección de datos académicos.

#### Responsabilidades principales

El Equipo Académico será responsable de:

* Impartir clases.
* Preparar materiales.
* Consultar horarios.
* Realizar seguimiento del progreso de los alumnos.
* Registrar información académica.
* Utilizar correctamente la plataforma educativa.
* Trabajar de forma segura desde sedes o en remoto.

#### Nivel de acceso recomendado

| Recurso                   | Acceso recomendado                      |
| ------------------------- | --------------------------------------- |
| Carpeta Académico         | Lectura y escritura                     |
| LMS                       | Acceso docente                          |
| Datos de alumnos          | Acceso limitado a información académica |
| Configuración del sistema | Restringida                             |
| Base de datos directa     | Sin acceso directo                      |

---

### 3.5 Atención al Cliente

#### Herramientas necesarias

El departamento de Atención al Cliente necesita herramientas para gestionar consultas, incidencias y comunicación con alumnos.

| Herramienta                    | Uso                                            |
| ------------------------------ | ---------------------------------------------- |
| Correo electrónico corporativo | Respuesta a consultas de alumnos.              |
| Teléfono o centralita          | Atención directa.                              |
| CRM                            | Gestión de clientes y seguimiento comercial.   |
| Sistema de tickets             | Registro y seguimiento de incidencias.         |
| Base de datos de alumnos       | Consulta de información básica.                |
| Calendario de cursos           | Consulta de horarios y disponibilidad.         |
| Plataforma LMS                 | Consulta de problemas de acceso o incidencias. |
| Carpetas compartidas           | Documentación interna y procedimientos.        |

#### Habilidades necesarias

El personal de Atención al Cliente debe tener habilidades en:

* Comunicación.
* Atención al público.
* Resolución de problemas.
* Gestión de consultas.
* Uso de CRM.
* Uso de sistema de tickets.
* Consulta de datos básicos de alumnos.
* Gestión de horarios y matrículas.
* Protección de datos.
* Trato profesional con clientes.

#### Responsabilidades principales

Este departamento se encargará de:

* Atender consultas de alumnos.
* Registrar incidencias.
* Escalar problemas técnicos al departamento IT.
* Consultar información de cursos y matrículas.
* Ayudar con problemas de acceso a la plataforma.
* Mantener comunicación clara con alumnos y profesores.

#### Nivel de acceso recomendado

| Recurso                       | Acceso recomendado  |
| ----------------------------- | ------------------- |
| CRM                           | Acceso de usuario   |
| Sistema de tickets            | Lectura y escritura |
| Información básica de alumnos | Acceso limitado     |
| Carpeta Atención Cliente      | Lectura y escritura |
| Configuración del sistema     | Restringida         |
| Base de datos directa         | Sin acceso directo  |

---

### 3.6 Marketing y Ventas

#### Herramientas necesarias

El departamento de Marketing y Ventas necesita herramientas para promocionar cursos, captar alumnos y gestionar campañas.

| Herramienta                          | Uso                                                |
| ------------------------------------ | -------------------------------------------------- |
| Redes sociales                       | Promoción de cursos y comunicación externa.        |
| CRM                                  | Seguimiento de posibles clientes y campañas.       |
| Canva u otras herramientas de diseño | Creación de contenido visual.                      |
| Email marketing                      | Envío de campañas y comunicaciones comerciales.    |
| Herramientas de análisis             | Medición de resultados y métricas.                 |
| Página web corporativa               | Publicación de información y captación de alumnos. |
| Plataformas publicitarias            | Campañas en buscadores o redes sociales.           |
| Carpetas compartidas                 | Almacenamiento de contenido digital.               |
| Calendario de publicaciones          | Organización de campañas y contenidos.             |

#### Habilidades necesarias

El personal de Marketing y Ventas debe contar con habilidades en:

* Promoción de cursos.
* Captación de alumnos.
* Comunicación comercial.
* Gestión de redes sociales.
* Diseño básico de contenido.
* Email marketing.
* Análisis de métricas.
* Estrategias de venta.
* Uso de CRM.
* Organización de campañas.
* Colaboración con empresas o instituciones.

#### Responsabilidades principales

Este departamento será responsable de:

* Promocionar los cursos de NovaLingua School.
* Gestionar redes sociales.
* Crear campañas publicitarias.
* Analizar resultados.
* Diseñar contenido promocional.
* Coordinar acciones comerciales.
* Gestionar contactos con empresas o instituciones.
* Apoyar la captación de nuevos alumnos.

#### Nivel de acceso recomendado

| Recurso                   | Acceso recomendado          |
| ------------------------- | --------------------------- |
| Carpeta Marketing/Ventas  | Lectura y escritura         |
| CRM                       | Acceso comercial            |
| Página web                | Acceso limitado a contenido |
| Herramientas de diseño    | Acceso completo             |
| Base de datos directa     | Sin acceso directo          |
| Configuración del sistema | Restringida                 |

---

### 4. Resumen por departamento

| Departamento                   | Herramientas principales                             | Habilidades clave                                          | Nivel de acceso                    |
| ------------------------------ | ---------------------------------------------------- | ---------------------------------------------------------- | ---------------------------------- |
| Dirección y Administración     | Ofimática, facturación, correo, carpetas compartidas | Gestión, finanzas, organización, protección de datos       | Alto a información administrativa  |
| IT / Sistemas                  | AD, DNS, DHCP, firewall, VPN, NAS, servidores        | Redes, servidores, seguridad, soporte, backups             | Administración técnica             |
| Desarrollo y Plataforma Online | VS Code, Git, MySQL, Angular, Spring Boot, LMS       | Programación, bases de datos, APIs, seguridad web          | Técnico limitado                   |
| Equipo Académico               | LMS, videoconferencia, calendario, materiales        | Docencia, planificación, seguimiento académico             | Acceso académico                   |
| Atención al Cliente            | CRM, tickets, correo, teléfono, LMS                  | Comunicación, resolución de problemas, atención al público | Acceso limitado a datos de alumnos |
| Marketing y Ventas             | Redes sociales, CRM, Canva, email marketing          | Promoción, ventas, diseño, análisis de métricas            | Acceso comercial                   |

---

### 5. Relación con la infraestructura informática

Los contratos, herramientas y habilidades definidos están relacionados directamente con la infraestructura implementada en el proyecto.

| Necesidad empresarial            | Solución técnica implementada o propuesta |
| -------------------------------- | ----------------------------------------- |
| Gestión centralizada de usuarios | Active Directory                          |
| Control de permisos              | OUs, usuarios y GPOs                      |
| Acceso seguro a recursos         | Carpetas compartidas y firewall           |
| Separación por departamentos     | VLANs                                     |
| Seguridad de red                 | OpenWrt y nftables                        |
| Comunicación entre sedes         | OSPF entre Porto, Braga y Coímbra         |
| Acceso a plataforma online       | Servidor web / LMS                        |
| Gestión de datos académicos      | Base de datos MySQL                       |
| Copias de seguridad              | NAS o carpeta de backups                  |
| Teletrabajo seguro               | VPN propuesta                             |
| Atención de incidencias          | Sistema de tickets o tabla de incidencias |

---

### 6. Conclusión

La definición de contratos, acuerdos, herramientas y habilidades permite que NovaLingua School funcione de forma organizada, segura y profesional. Cada departamento tiene necesidades diferentes, por lo que es importante asignar herramientas y permisos adecuados según sus funciones.

Los departamentos técnicos, como IT / Sistemas y Desarrollo, se encargan de mantener la red, los servidores, la seguridad, la plataforma online, las copias de seguridad y la base de datos. El resto de departamentos utilizan estos sistemas para gestionar la academia, atender a los alumnos, impartir clases y promocionar los cursos.

Además, los acuerdos de confidencialidad, protección de datos y teletrabajo ayudan a proteger la información interna y a regular el acceso a los sistemas de la empresa.

De esta manera, NovaLingua School puede proteger mejor sus datos, repartir responsabilidades y asegurar un funcionamiento correcto en sus sedes de Porto, Braga y Coímbra, además de permitir el teletrabajo de forma controlada y segura.


## Anexo A — Pruebas y resultados

### A.1 Pruebas de conectividad

| Nº | Prueba | Comando usado | Resultado esperado | Resultado obtenido | Estado |
|---:|---|---|---|---|---|
| 1 | Cliente VLAN 20 → gateway | `ping 10.10.20.1` | Respuesta del gateway | Responde | Superado |
| 2 | Cliente VLAN 20 → servidor | `ping 10.10.70.100` | Respuesta del servidor | Responde | Superado |
| 3 | Servidor → gateway VLAN 70 | `ping 10.10.70.1` | Respuesta del gateway | Responde | Superado |
| 4 | Router Porto → servidor | `ping 10.10.70.100` | Respuesta del servidor | Responde | Superado |

### A.2 Pruebas de DNS y Active Directory

| Nº | Prueba | Comando usado | Resultado esperado | Resultado obtenido | Estado |
|---:|---|---|---|---|---|
| 1 | Resolución del dominio | `nslookup novalingua.local` | Resuelve `10.10.70.100` | Correcto | Superado |
| 2 | Registro SRV LDAP | `nslookup -type=SRV _ldap._tcp.dc._msdcs.novalingua.local` | Devuelve el controlador de dominio | Devuelve `servernovalingua.novalingua.local` | Superado |
| 3 | Unión del cliente al dominio | Interfaz de Windows | Cliente unido a `novalingua.local` | Correcto | Superado |
| 4 | Inicio de sesión con usuario de dominio | Login Windows | Usuario accede al dominio | Correcto | Superado |

### A.3 Pruebas de recursos compartidos

| Nº | Prueba | Comando usado | Resultado esperado | Resultado obtenido | Estado |
|---:|---|---|---|---|---|
| 1 | Acceso a carpeta Desarrollo | `dir \\10.10.70.100\Desarrollo` | Muestra el contenido de la carpeta | Muestra carpeta `Pruebas` | Superado |
| 2 | Acceso al servidor de archivos | `\\10.10.70.100` | Muestra recursos compartidos | Correcto | Superado |
| 3 | Mapeo de unidad por GPO | `net use` / Explorador | Unidad de red visible | Parcial | En revisión |

### A.4 Pruebas de firewall

| Nº | Prueba | Resultado esperado | Resultado obtenido | Estado |
|---:|---|---|---|---|
| 1 | VLAN 60 Invitados → redes internas | Bloqueado | Bloqueado | Superado |
| 2 | VLAN 60 Invitados → gateway propio | Permitido | Funciona | Superado |
| 3 | VLAN 80 Wi-Fi Corporativo → VLANs cableadas | Bloqueado | Bloqueado | Superado |
| 4 | VLAN 80 Wi-Fi Corporativo → VLAN 70 | Bloqueado | Bloqueado | Superado |
| 5 | VLAN 70 Gestión → redes internas | Permitido | Funciona | Superado |
| 6 | Tráfico de retorno `established,related` | Permitido | Funciona | Superado |

### A.5 Pruebas de GPO

| Nº | Prueba | Resultado esperado | Resultado obtenido | Estado |
|---:|---|---|---|---|
| 1 | Bloquear Panel Control | Usuario no técnico no puede acceder | Configurado | Superado |
| 2 | Fondo corporativo | Se aplica wallpaper corporativo | Configurado | Superado |
| 3 | Mapeo de carpetas | Se asigna unidad de red | Parcial | Problemas con interfaz gráfica |
| 4 | Bloquear CMD | Usuario no técnico no puede abrir CMD | Configurado |
| 5 | Mensaje inicio sesión | Aparece aviso legal | Configurado | Superado |

### A.6 Pruebas de MySQL

| Nº | Prueba | Comando usado | Resultado esperado | Resultado obtenido | Estado |
|---:|---|---|---|---|---|
| 1 | Ver bases de datos | `SHOW DATABASES;` | Aparece `novalingua_school` | Correcto | Superado |
| 2 | Seleccionar base de datos | `USE novalingua_school;` | Base seleccionada | Correcto | Superado |
| 3 | Ver tablas | `SHOW TABLES;` | Muestra tablas creadas | Correcto | Superado |
| 4 | Importar script SQL | `SOURCE novalingua_fixed.sql;` | Importación sin error de collation | Correcto | Superado |

### A.7 Pruebas del servicio web

| Nº | Prueba | URL / comando | Resultado esperado | Resultado obtenido | Estado |
|---:|---|---|---|---|---|
| 1 | Acceso local en servidor | `http://localhost/novalingua-php/index.php` | Carga la web | Correcto | Superado |
| 2 | Acceso desde cliente | `http://10.10.70.100/novalingua-php/` | Carga la web desde la red | Pendiente / en prueba | En revisión |
