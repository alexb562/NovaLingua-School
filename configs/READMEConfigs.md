````markdown
# Configuraciones — NovaLingua School

Esta carpeta contiene configuraciones utilizadas durante la implementación de la infraestructura de **NovaLingua School**.

Los archivos incluidos han sido reconstruidos a partir de la configuración documentada durante el proyecto original. No representan exportaciones recientes de los sistemas o appliances, ya que el entorno original no se encuentra actualmente desplegado en el equipo utilizado para mantener este repositorio.

Las configuraciones se conservan como evidencia técnica de la implementación realizada durante el proyecto.

## Estructura

```text
configs/
├── openwrt/
│   ├── porto/
│   │   └── network-setup.sh
│   ├── braga/
│   │   └── network-setup.sh
│   └── coimbra/
│       └── network-setup.sh
├── ospf/
│   ├── porto-ospf.conf
│   ├── braga-ospf.conf
│   └── coimbra-ospf.conf
├── nftables/
│   ├── porto-firewall.sh
│   ├── braga-firewall.sh
│   └── coimbra-firewall.sh
└── sql/
    └── novalingua-schema.sql
```

## OpenWrt

Las configuraciones de OpenWrt incluyen:

- Enlaces punto a punto entre sedes.
- Direccionamiento IPv4.
- Configuración persistente mediante UCI.
- Subinterfaces asociadas a las VLANs.
- Activación del reenvío IPv4.

### Routers

- [Porto](openwrt/porto/network-setup-porto.sh)
- [Braga](openwrt/braga/network-setup-braga.sh)
- [Coimbra](openwrt/coimbra/network-setup-braga.sh)

## OSPF

El enrutamiento dinámico entre las tres sedes se implementó mediante **FRRouting y OSPF en área 0**.

Los archivos contienen los Router ID, enlaces entre sedes y redes VLAN anunciadas por cada router.

- [OSPF Porto](ospf/porto-ospf.conf)
- [OSPF Braga](ospf/braga-ospf.conf)
- [OSPF Coimbra](ospf/coimbra-ospf.conf)

## Firewall con nftables

Los routers OpenWrt también se utilizaron para aplicar políticas de filtrado entre VLANs mediante `nftables`.

Las principales políticas implementadas fueron:

- Aislamiento de la VLAN de invitados.
- Protección de las VLANs de gestión y servidores.
- Separación del Wi-Fi corporativo respecto a las VLANs cableadas.
- Permiso de tráfico perteneciente a conexiones `established,related`.

- [Firewall Porto](nftables/porto-firewall.sh)
- [Firewall Braga](nftables/braga-firewall.sh)
- [Firewall Coimbra](nftables/coimbra-firewall.sh)

> El firewall original utilizaba una política `accept` con reglas específicas de bloqueo. Por tanto, se trata de un modelo de filtrado selectivo y no de una política estricta de denegación por defecto.

## Base de datos MySQL

El archivo SQL contiene el esquema de la base de datos `novalingua_school`, utilizada para representar la gestión académica y administrativa de la escuela.

Incluye tablas para:

- Alumnos.
- Cursos.
- Profesores.
- Sedes.
- Matrículas.
- Material educativo.
- Progreso académico.
- Incidencias.
- Empleados.

También incluye claves primarias, índices, relaciones y restricciones de integridad mediante claves foráneas.

- [Esquema MySQL](sql/novalingua-schema.sql)

### Nota de seguridad

La implementación original utilizó credenciales de prueba durante el desarrollo.

Estas credenciales no se incluyen en la versión pública del repositorio. En una implementación actual, las contraseñas deberían almacenarse utilizando funciones de hash seguras y nunca como texto plano.
````