# Presupuesto de Hardware

# Dispositivos principales de la red

## Unifi
Para la mayoría de los dispositivos de red se comprará desde Unifi/Ubiquiti. Viene bien por las siguientes razones:
- El presupuesto es moderado, ideal para una empresa mediana que no se dedica directamente al sector tecnológico (comparado con Cisco, Fortinet etc.)
- Su ecosistema se integra completamente y se puede monitorizar y ver el estado de los dispositivos desde una aplicación (routers, switches, puntos acceso etc)
- Se puede integrar fácilmente VLANs
- Se puede integrar site-to-site VPN
- Sus switches PoE almacenan y provienen conexión al mismo tiempo a los puntos de acceso,
- Sus routers proporcionan seguridad avanzada, incluyendo firewalls stateful y nivel 7, IDS/IPS, bloqueo de publicidades etc.


## Servidores / NAS
- Ya que esta empresa no es una muy granda dedicada exclusivamente a la tecnología, tendría sentido usar un único servidor de torre con máquinas virtuales. Esta configuración se suele usar en empresas medianas - ahorra mucho dinero y se puede gestionar fácilmente tanto físicamente cómo lógicamente.
- En cuanto a NAS, no tiene que encargarse de las funcioines del servidor - solo backups de carpetas compartidas y redundancia.

### Dell PowerEdge T360
[url][https://www.pccomponentes.com/dell-poweredge-t360-intel-xeon-e-2478-16gb-480gb-ssd]

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

#### RAM y almacenamiento extra
- Según calculaciones de IA, se recomienda usar: 
2x480GB de almacenamiento SSD de Proxmox (programa de virtualización)
- 2x2TB SSD para las máquinas virtuales
- Por lo menos 64GB RAM

##### RAM
##### RAM servidor

RigidRAM / Dell compatible 32GB DDR5 ECC UDIMM 4800MHz x2  
[url][https://www.amazon.com/RigidRAM-Replacement-SNPP0YCGC-AC027076-PowerEdge/dp/B0D8B2H2SK]

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
[url][https://www.pccomponentes.com/disco-duro-patriot-p210-2-5-ssd-2tb-sata-3]

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


### NAS
Synology DS923+
[url][https://www.amazon.com/Synology-DS923-Diskstation-Dual-Core-LAN-Port/dp/B0BKPXZDCY]


#### Almacenamiento

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
[url][https://www.pccomponentes.com/]

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


## UPS/SAI
- Es esencial tener un SAI en cada sede. No obstante, no tienen que ser los mismos, ya que cada sede tiene requerimientos y hardware diferentes.
- Se utilizarán SAI/UPS de la marca APC debido a su fiabilidad, disponibilidad de modelos profesionales y compatibilidad con entornos de servidores y red. En la sede principal de Porto se instalarán modelos Smart-UPS en formato rack para proteger el servidor, NAS, firewall y switches principales. En Braga y Coimbra se utilizarán modelos de menor capacidad para proteger los equipos de red críticos. Esta solución permite evitar apagados inesperados, proteger frente a picos de tensión y garantizar un apagado controlado de los sistemas en caso de corte eléctrico prolongado.


| Sede | Modelo recomendado | Cantidad | Precio unitario aprox. | Subtotal | Uso |
|---|---|---:|---:|---:|---|
| Porto | APC Smart-UPS C 1500VA LCD RM 2U 230V | 2 | 783 € | 1.566 € | Protección del servidor, NAS, firewall, switch core y switches principales |
| Braga | APC Back-UPS Pro 1600VA | 1 | 455 € | 455 € | Protección del firewall, switch, APs y NAS de respaldo |
| Coimbra | APC Back-UPS 1600VA Tower 230V | 1 | 247 € | 247 € | Protección del firewall, switch y puntos de acceso |
| **Total UPS/SAI** |  | **4** |  | **2.268 €** |  |


### UPS / SAI Porto

APC Smart-UPS C 1500VA LCD RM 2U 230V x2  
[url][https://www.apc.com/]

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

### UPS / SAI Braga

APC Back-UPS Pro 1600VA x1  
[url][https://www.apc.com/]

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

### UPS / SAI Coímbra

APC Back-UPS 1600VA Tower 230V x1  
[url][https://www.apc.com/]

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


## Infraestructura física
### Racks
#### Rack Porto

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

#### Rack Porto

StarTech.com 24U Server Rack Cabinet  
[url][https://www.amazon.com/StarTech-com-24U-Server-Rack-Cabinet/dp/B071KW98RM]

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



#### Rack Braga
- Braga tendrá menos infraestructura que Porto. Sólo se necesitará un rack entre 6 - 9U (9 si queremos dejar espacio para expansión).

Rack Mural 19" 9U F450mm Puerta de Cristal  
[url][https://ekanet.es/rack-9u-puerta-cristal/49-rack-mural-19-9u-f450mm-sin-accesorios-puerta-de-cristal.html]

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

#### Rack Coimbra

Rack Mural 19" 6U F450mm Puerta Perforada  
[url][https://ekanet.es/rack-6u-puerta-perforada/1901-rack-mural-6u-f450mm-sin-accesorios-puerta-perforada-19.html]

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


# Dispositivos de red


## Porto
### Router
Dream Machine Pro
[url][https://eu.store.ui.com/eu/en/category/cloud-gateways-large-scale/products/udm-pro]

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


#### Switch central
Standard 48 PoE
[url][https://eu.store.ui.com/eu/en/category/switching-standard/products/usw-48-poe]

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

#### Switches access
Standard 24 PoE
[url][https://eu.store.ui.com/eu/en/category/switching-standard/products/usw-24-poe]

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

#### Punto de acceso
U6+ 
[url][https://eu.store.ui.com/eu/en/category/wifi-flagship/products/u6-plus]

| Especificación     | Ubiquiti UniFi U6+                                              |
| ------------------ | --------------------------------------------------------------- |
| Tipo               | Punto de acceso Wi-Fi 6                                         |
| Uso recomendado    | Oficinas, aulas pequeñas, zonas comunes                         |
| Gestión            | UniFi Network                                                   |
| Alimentación       | PoE                                                             |
| VLAN/SSID          | Compatible con varias redes Wi-Fi, como corporativa e invitados |
| Precio aprox.      | 94€ x4 = 376                                                       |
| Uso en el proyecto | Wi-Fi corporativo y red de invitados en Porto, Braga y Coimbra  |











## Braga
### Router
Cloud Gateway Ultra 
[url][https://eu.store.ui.com/eu/en/category/all-cloud-gateways]


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

#### Switch gestionable
Standard 24 PoE
[url][https://eu.store.ui.com/eu/en/category/switching-standard/products/usw-24-poe]

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

#### Punto de acceso
| Especificación     | Ubiquiti UniFi U6+                                              |
| ------------------ | --------------------------------------------------------------- |
| Tipo               | Punto de acceso Wi-Fi 6                                         |
| Uso recomendado    | Oficinas, aulas pequeñas, zonas comunes                         |
| Gestión            | UniFi Network                                                   |
| Alimentación       | PoE                                                             |
| VLAN/SSID          | Compatible con varias redes Wi-Fi, como corporativa e invitados |
| Precio aprox.      | 94€ x2 = 188                                                       |
| Uso en el proyecto | Wi-Fi corporativo y red de invitados en Porto, Braga y Coimbra  |







## Coimbra
### Router
Cloud Gateway Ultra 
[url][https://eu.store.ui.com/eu/en/category/all-cloud-gateways]


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

#### Switch Gestionable
Standard 24 PoE
[url][https://eu.store.ui.com/eu/en/category/switching-standard/products/usw-24-poe]

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

#### Punto de acceso
| Especificación     | Ubiquiti UniFi U6+                                              |
| ------------------ | --------------------------------------------------------------- |
| Tipo               | Punto de acceso Wi-Fi 6                                         |
| Uso recomendado    | Oficinas, aulas pequeñas, zonas comunes                         |
| Gestión            | UniFi Network                                                   |
| Alimentación       | PoE                                                             |
| VLAN/SSID          | Compatible con varias redes Wi-Fi, como corporativa e invitados |
| Precio aprox.      | 94€                                                        |
| Uso en el proyecto | Wi-Fi corporativo y red de invitados en Porto, Braga y Coimbra  |

# Cableado y organización
## Cableado, patch panels y accesorios

## Cableado, patch panels y accesorios

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


# Equipos usuario
- Se usuarán 3 perfiles según necesidad de rendimiento por cada departamento.

| Perfil           | Usuarios                                     | Cantidad | Tipo de equipo                    |
| ---------------- | -------------------------------------------- | -------: | --------------------------------- |
| Equipo estándar  | Dirección/Admin, Atención Cliente, Marketing |       25 | Portátil empresarial básico       |
| Equipo académico | Profesores / Equipo Académico                |       28 | Portátil con buena webcam/headset |
| Equipo técnico   | IT / Sistemas + Desarrollo                   |        7 | Portátil más potente              |

## Equipos portátiles por departamento

| Departamento | Modelo recomendado | Cantidad | Precio unitario aprox. | Subtotal aprox. | Motivo |
|---|---|---:|---:|---:|---|
| Dirección y Administración | Dell Latitude 5540, i5, 16GB RAM, 512GB SSD | 8 | 499 € | 3.992 € | Equipo empresarial equilibrado para gestión, documentación, correo y tareas administrativas |
| IT / Sistemas | HP ProBook 450 G9, i7, 32GB RAM, 1TB SSD | 5 | 1.014 € | 5.070 € | Equipo más potente para administración de sistemas, soporte, pruebas y herramientas técnicas |
| Desarrollo y Plataforma Online | HP ProBook 450 G9, i7, 32GB RAM, 1TB SSD | 2 | 1.014 € | 2.028 € | Más RAM y almacenamiento para desarrollo, pruebas locales y trabajo con plataformas |
| Equipo Académico | HP ProBook 440 G10, i7, 16GB RAM, 512GB SSD | 28 | 899 € | 25.172 € | Portátil profesional para clases online, videollamadas, gestión de materiales y acceso al LMS |
| Atención al Cliente | Dell Latitude 5440, i5, 16GB RAM, 512GB SSD | 11 | 714 € | 7.854 € | Equipo fiable para CRM, incidencias, correo, llamadas y soporte a estudiantes |
| Marketing y Ventas | Lenovo ThinkPad E14 Gen 5 | 6 | 649 € | 3.894 € | Equipo ligero y profesional para redes sociales, campañas, presentaciones y ventas |
| **Total estimado portátiles** |  | **60** |  | **48.010 €** |  |

### Equipos extra
| Tipo de equipo de reserva | Cantidad | Precio unitario aprox. | Subtotal aprox. | Uso |
|---|---:|---:|---:|---|
| Portátil estándar de reserva | 3 | 700 € | 2.100 € | Sustitución temporal para administración, atención al cliente, académico o marketing |
| Portátil técnico de reserva | 2 | 1.014 € | 2.028 € | Sustitución para IT / Sistemas y Desarrollo |
| **Total equipos de reserva** | **5** |  | **4.128 €** |  |

## Monitores, periféricos etc
## Monitores, periféricos y equipamiento audiovisual

| Elemento | Modelo / referencia | Cantidad total | Porto | Braga | Coimbra | Precio unitario aprox. | Subtotal aprox. | Uso |
|---|---|---:|---:|---:|---:|---:|---:|---|
| Monitor 24” | Dell P2425H Monitor | 35 | 16 | 13 | 6 | 155 € | 5.425 € | Puestos fijos de oficina |
| Teclado y ratón inalámbrico | Logitech MK235 Wireless Keyboard and Mouse | 35 | 16 | 13 | 6 | 33 € | 1.155 € | Puestos con monitor externo |
| Docking station USB-C | Lenovo ThinkPad Universal USB-C Dock / equivalente | 25 | 12 | 9 | 4 | 156 € | 3.900 € | Conectar portátil a monitor, red, teclado y ratón |
| Auriculares con micrófono | Logitech H390 USB Headset | 45 | 18 | 18 | 9 | 37 € | 1.665 € | Clases online, atención al cliente, reuniones y soporte |
| Webcam Full HD | Logitech C920s HD Pro Webcam | 20 | 8 | 8 | 4 | 58 € | 1.160 € | Mejorar calidad de vídeo en clases online y reuniones |
| **Total estimado periféricos** |  |  |  |  |  |  | **13.305 €** |  |

# Impresoras
## Impresoras multifunción

Se utilizarán impresoras multifunción láser para cubrir las necesidades de impresión, escaneo y copia en las tres sedes. Al tratarse de una academia de idiomas, el volumen de impresión no será extremadamente alto, pero será necesario imprimir documentación interna, material administrativo, informes, contratos y documentos académicos puntuales.

| Elemento | Modelo / referencia | Cantidad total | Porto | Braga | Coimbra | Precio unitario aprox. | Subtotal aprox. | Uso |
|---|---|---:|---:|---:|---:|---:|---:|---|
| Impresora multifunción láser color | Brother MFC-L8690CDW / equivalente | 4 | 2 | 1 | 1 | 450 € | 1.800 € | Impresión, escaneo y copia de documentación administrativa y académica |



# Resumen final del presupuesto

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