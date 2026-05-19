# Presupuesto de Hardware
## Unifi
Para la mayoría de los dispositivos de red se comprará desde Unifi/Ubiquiti. Viene bien por las siguientes razones:
- El presupuesto es moderado, ideal para una empresa mediana que no se dedica directamente al sector tecnológico (comparado con Cisco, Fortinet etc.)
- Su ecosistema se integra completamente y se puede monitorizar y ver el estado de los dispositivos desde una aplicación (routers, switches, puntos acceso etc)
- Se puede integrar fácilmente VLANs
- Se puede integrar site-to-site VPN
- Sus switches PoE almacenan y provienen conexión al mismo tiempo a los puntos de acceso,
- Sus routers proporcionan seguridad avanzada, incluyendo firewalls stateful y nivel 7, IDS/IPS, bloqueo de publicidades etc.


## Servidor
- Ya que esta empresa no es una muy granda dedicada exclusivamente a la tecnología, tendría sentido usar un único servidor de torre con máquinas virtuales. Esta configuración se suele usar en empresas medianas - ahorra mucho dinero y se puede gestionar fácilmente tanto físicamente cómo lógicamente.

### Dell PowerEdge T360




## Porto

### Dispositivos de red

#### Router
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
### Dispositivos de red
#### Router
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
### Dispositivos de red
#### Router
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