# Diseño físico y planificación de la implementación

Plantilla para el diseño físico y planificación de la implementación de la infraestructura informática de una empresa ficticia. Debes adaptarla a tu proyecto.

## 1. Diseño físico de la red

- **Elección de hardware:**
  - Switches: ¿gestionables o no?
  - Routers
  - Puntos de acceso Wi-Fi
  - Servidores físicos o virtuales

- **Plano físico:** *(si aplica)*
  - Ubicación de los dispositivos en oficinas
  - Racks
  - Salas técnicas

- **Esquema de cableado:**
  - Tipo de cables: Cat6, fibra, etc.
  - Tramos aproximados
  - Armarios de red

## 2. Especificaciones de los servidores

- ¿Se utilizará virtualización?
- Software de virtualización: Proxmox, VMware, VirtualBox, etc.
- RAM, CPU y disco por servidor
- Sistema operativo de cada servidor: Windows Server, Ubuntu, etc.

## 3. Plan de direccionamiento IP

- IPs fijas para:
  - Servidores
  - Impresoras
  - Dispositivos críticos

- Rango dinámico para clientes por VLAN

## 4. Plan de instalación

**Orden de despliegue:**

1. Infraestructura física: cableado, switches y router
2. Servidores base: DHCP, DNS y Active Directory
3. Clientes y estaciones de trabajo
4. Seguridad y copias de seguridad
5. Web, base de datos y aplicaciones

En paralelo puedes ir preparando documentación técnica y de usuario, como manuales, inventarios y procedimientos.