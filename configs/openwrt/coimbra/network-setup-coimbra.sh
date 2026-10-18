#!/bin/sh

# NovaLingua School
# Configuración de red del router OpenWrt de Coimbra.
#
# Reconstruida a partir de la configuración documentada
# durante el proyecto original.

# ---------------------------------------------------------
# Enlace entre sedes
# ---------------------------------------------------------

# Coimbra -> Porto
uci set network.coimbra_porto=interface
uci set network.coimbra_porto.proto='static'
uci set network.coimbra_porto.device='eth1'
uci set network.coimbra_porto.ipaddr='10.255.2.2'
uci set network.coimbra_porto.netmask='255.255.255.252'

# Eliminar las interfaces WAN predeterminadas del appliance
uci delete network.wan
uci delete network.wan6

# ---------------------------------------------------------
# VLANs de Coimbra
# ---------------------------------------------------------

# VLAN 30 - Académico
uci set network.coimbra_vlan30=interface
uci set network.coimbra_vlan30.proto='static'
uci set network.coimbra_vlan30.device='eth2.30'
uci set network.coimbra_vlan30.ipaddr='10.30.30.1'
uci set network.coimbra_vlan30.netmask='255.255.255.0'

# VLAN 40 - Atención al Cliente
uci set network.coimbra_vlan40=interface
uci set network.coimbra_vlan40.proto='static'
uci set network.coimbra_vlan40.device='eth2.40'
uci set network.coimbra_vlan40.ipaddr='10.30.40.1'
uci set network.coimbra_vlan40.netmask='255.255.255.0'

# VLAN 60 - Invitados
uci set network.coimbra_vlan60=interface
uci set network.coimbra_vlan60.proto='static'
uci set network.coimbra_vlan60.device='eth2.60'
uci set network.coimbra_vlan60.ipaddr='10.30.60.1'
uci set network.coimbra_vlan60.netmask='255.255.255.0'

# VLAN 70 - Gestión
uci set network.coimbra_vlan70=interface
uci set network.coimbra_vlan70.proto='static'
uci set network.coimbra_vlan70.device='eth2.70'
uci set network.coimbra_vlan70.ipaddr='10.30.70.1'
uci set network.coimbra_vlan70.netmask='255.255.255.0'

# VLAN 80 - Wi-Fi Corporativo
uci set network.coimbra_vlan80=interface
uci set network.coimbra_vlan80.proto='static'
uci set network.coimbra_vlan80.device='eth2.80'
uci set network.coimbra_vlan80.ipaddr='10.30.80.1'
uci set network.coimbra_vlan80.netmask='255.255.255.0'

# ---------------------------------------------------------
# Guardar configuración
# ---------------------------------------------------------

uci commit network

# Activar reenvío IPv4
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p

# Reiniciar red
/etc/init.d/network restart

# ---------------------------------------------------------
# Verificación
# ---------------------------------------------------------

uci show network
ip addr
ip route