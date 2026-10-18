#!/bin/sh

# NovaLingua School
# Firewall nftables - Router Braga
#
# Reconstruido a partir de la configuración documentada
# durante el proyecto original.

# Esperar a que los servicios de red y OSPF estén operativos
sleep 30

# Eliminar la tabla anterior si ya existe
nft delete table inet labfw 2>/dev/null

# ---------------------------------------------------------
# Tabla y cadena principal
# ---------------------------------------------------------

nft add table inet labfw

nft 'add chain inet labfw forward { type filter hook forward priority 0; policy accept; }'

# ---------------------------------------------------------
# Tráfico establecido
# ---------------------------------------------------------

nft add rule inet labfw forward ct state established,related accept

# ---------------------------------------------------------
# VLAN 60 - Invitados
# Bloquear acceso hacia las redes internas
# ---------------------------------------------------------

nft add rule inet labfw forward ip saddr 10.20.60.0/24 ip daddr 10.0.0.0/8 drop

# ---------------------------------------------------------
# Proteger VLAN 70 - Gestión
# ---------------------------------------------------------

nft add rule inet labfw forward ip saddr 10.20.30.0/24 ip daddr 10.20.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.20.40.0/24 ip daddr 10.20.70.0/24 drop
nft add rule inet labfw forward ip saddr 10.20.80.0/24 ip daddr 10.20.70.0/24 drop

# ---------------------------------------------------------
# VLAN 80 - Wi-Fi Corporativo
# Bloquear acceso hacia VLANs cableadas
# ---------------------------------------------------------

nft add rule inet labfw forward ip saddr 10.20.80.0/24 ip daddr 10.20.30.0/24 drop
nft add rule inet labfw forward ip saddr 10.20.80.0/24 ip daddr 10.20.40.0/24 drop

# ---------------------------------------------------------
# Verificación
# ---------------------------------------------------------

nft list ruleset