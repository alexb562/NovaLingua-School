# Landing Page — NovaLingua School

Sitio web desarrollado para **NovaLingua School** como parte del proyecto de infraestructura informática multisede.

La aplicación web forma parte del entorno simulado de la empresa y representa la presencia web de NovaLingua School dentro del proyecto.

## Tecnologías

El proyecto está desarrollado utilizando:

- **Astro**
- **TypeScript**
- HTML
- CSS
- Node.js / npm

## Estructura del proyecto

```text
landing-page-novalingua/
├── public/              # Recursos públicos y archivos estáticos
├── src/                 # Código fuente del sitio web
├── astro.config.mjs     # Configuración de Astro
├── package.json         # Dependencias y scripts del proyecto
├── package-lock.json    # Versiones bloqueadas de dependencias
├── tsconfig.json        # Configuración de TypeScript
└── README.md
```

Los directorios generados durante la instalación o compilación, como `node_modules/`, `dist/` y `.astro/`, no se incluyen en el repositorio.

## Instalación

Para ejecutar el proyecto localmente es necesario disponer de **Node.js** y **npm**.

Primero, instalar las dependencias:

```bash
npm install
```

## Ejecución en desarrollo

Para iniciar el servidor de desarrollo:

```bash
npm run dev
```

Astro mostrará en la terminal la dirección local desde la que se puede acceder al sitio web.

## Compilación

Para generar una versión de producción:

```bash
npm run build
```

Los archivos generados se almacenarán en el directorio:

```text
dist/
```

## Vista previa de producción

Después de realizar la compilación, se puede comprobar el resultado mediante:

```bash
npm run preview
```

## Integración con NovaLingua School

Este sitio web fue desarrollado como parte de la infraestructura general de **NovaLingua School**.

El proyecto principal también incluye:

- Red multisede con GNS3.
- VLANs y segmentación de red.
- OpenWrt y nftables.
- OSPF mediante FRRouting.
- Windows Server 2019.
- Active Directory y DNS.
- Políticas de grupo.
- MySQL.
- Servicios internos y recursos compartidos.

La documentación completa de la infraestructura se encuentra en el repositorio principal del proyecto.

## Autoría

El desarrollo, configuración y pruebas del sitio web fueron realizados por **Beatriz Moreno** como parte del proyecto NovaLingua School.

La integración del sitio web dentro del proyecto general se realizó en colaboración con la infraestructura implementada para el entorno de laboratorio.

## Estado

El proyecto conserva la estructura utilizada durante el desarrollo original de NovaLingua School y se incluye en este repositorio como parte de la documentación y evidencia técnica del proyecto.
