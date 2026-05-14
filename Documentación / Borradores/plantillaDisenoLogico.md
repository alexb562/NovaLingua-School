# Plantilla para el diseño lógico de la red e infraestructura informática

Plantilla para el diseño lógico de la red e infraestructura informática de una empresa ficticia. Debes adaptarla a tu proyecto.

## 🧠 1. Topología de red

- **Tipo:** Estrella jerárquica (la más común)
- **Componentes lógicos:**
  - Router principal (salida a Internet)
  - Switch de distribución
  - Switches de acceso por planta o departamento
- **Separación por VLANs:**
  - VLAN 10: Administración
  - VLAN 20: IT
  - VLAN 30: Ventas
  - VLAN 40: Invitados (Wi-Fi)

📌 **Objetivo:** aislar departamentos por seguridad y gestión de tráfico.

## 🧩 2. Direcciones IP y Subredes

- **Rango general:** `192.168.0.0/24`
- **Ejemplo de asignación:**
  - Administración (VLAN 10): `192.168.10.0/24`
  - IT (VLAN 20): `192.168.20.0/24`
  - Ventas (VLAN 30): `192.168.30.0/24`
  - Invitados (Wi-Fi): `192.168.40.0/24`
- Servidor DHCP asigna IPs por cada red

## 🖥️ 3. Servidores y Servicios Lógicos

| Servicio | IP estimada | Sistema Operativo | Función principal |
|---|---|---|---|
| DNS interno | `192.168.20.2` | Windows Server | Resolución interna y reenvío externo |
| DHCP | `192.168.20.3` | Windows Server | Asignación de IPs por subred/VLAN |
| Active Directory | `192.168.20.4` | Windows Server | Control de dominio, políticas, login |
| Servidor de archivos | `192.168.20.5` | Linux (Samba) | Compartición de recursos internos |
| Base de datos | `192.168.20.6` | Linux (MySQL) | CRM, ERP o gestión interna |
| Web corporativa | Pública + interna | Linux (Apache) | Página web y/o intranet |

## 🔒 4. Seguridad Lógica

- **Firewall:** Controla tráfico entre VLANs e Internet
- **VPN:** Acceso remoto seguro para empleados en teletrabajo
- **Política de contraseñas y permisos por rol:** Vía Active Directory
- **Antivirus empresarial:** Instalado en clientes y servidores
- **Copias de seguridad:** En servidor NAS o en la nube (con planificación)

## ☁️ 5. Acceso a Internet y Servicios Externos

- Router/firewall con NAT y reglas personalizadas
- Servidor DNS externo (Google: `8.8.8.8`)
- Zona desmilitarizada (DMZ) opcional para el servidor web público

## 📐 6. Esquema lógico (diagrama)

En este punto, se elabora un diagrama lógico, no físico, que muestre:

- Router → Switch de distribución
- VLANs y sus segmentos IP
- Servidores con sus servicios
- Equipos de usuario por departamento
- Wi-Fi invitados y red aislada
- Conexiones lógicas (no cables ni modelos específicos)

📌 **Herramienta a utilizar:** Cisco Packet Tracer.  
**Propuesta de otras herramientas:** Lucidchart, Draw.io, PowerPoint o Visio para hacer este esquema.