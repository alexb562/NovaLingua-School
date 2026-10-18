# Proyecto GNS3

Esta carpeta contiene la exportación del proyecto de red de **NovaLingua School** utilizada durante la implementación de la infraestructura multisede.

## Contenido

El proyecto incluye la topología de las sedes de:

- Porto
- Braga
- Coimbra

La red utiliza routers virtuales con **OpenWrt**, VLANs, enlaces punto a punto y enrutamiento dinámico mediante **OSPF / FRRouting**.

## Requisitos

Para abrir correctamente el proyecto se recomienda disponer de:

- GNS3
- GNS3 VM
- VirtualBox
- Imagen compatible de OpenWrt utilizada en el laboratorio
- FRRouting instalado en los routers OpenWrt

## Importación

El proyecto puede importarse desde GNS3 utilizando la opción de importación de proyecto portable/exportado.

Las imágenes de máquinas virtuales y appliances no se incluyen en este repositorio para evitar archivos de gran tamaño y posibles problemas de redistribución.