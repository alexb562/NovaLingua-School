#!/bin/sh

# NovaLingua School
# Configuración de red del router OpenWrt de Porto.
#
# Reconstruida a partir de la configuración documentada
# durante el proyecto original.

# ---------------------------------------------------------
# Enlaces entre sedes
# ---------------------------------------------------------

# Porto -> Braga
uci set network.porto_braga=interface
uci set network.porto_braga.proto='static'
uci set network.porto_braga.device='eth1'
uci set network.porto_braga.ipaddr='10.255.1.1'
uci set network.porto_braga.netmask='255.255.255.252'

# Porto -> Coimbra
uci set network.porto_coimbra=interface
uci set network.porto_coimbra.proto='static'
uci set network.porto_coimbra.device='eth2'
uci set network.porto_coimbra.ipaddr='10.255.2.1'
uci set network.porto_coimbra.netmask='255.255.255.252'

# Eliminar las interfaces WAN predeterminadas del appliance
uci delete network.wan
uci delete network.wan6

# ---------------------------------------------------------
# VLANs de Porto
# ---------------------------------------------------------

# VLAN 10 - Dirección / Administración
uci set network.porto_vlan10=interface
uci set network.porto_vlan10.proto='static'
uci set network.porto_vlan10.device='eth3.10'
uci set network.porto_vlan10.ipaddr='10.10.10.1'
uci set network.porto_vlan10.netmask='255.255.255.0'

# VLAN 20 - Desarrollo
uci set network.porto_vlan20=interface
uci set network.porto_vlan20.proto='static'
uci set network.porto_vlan20.device='eth3.20'
uci set network.porto_vlan20.ipaddr='10.10.20.1'
uci set network.porto_vlan20.netmask='255.255.255.0'

# VLAN 40 - Atención al Cliente
uci set network.porto_vlan40=interface
uci set network.porto_vlan40.proto='static'
uci set network.porto_vlan40.device='eth3.40'
uci set network.porto_vlan40.ipaddr='10.10.40.1'
uci set network.porto_vlan40.netmask='255.255.255.0'

# VLAN 50 - Marketing / Ventas
uci set network.porto_vlan50=interface
uci set network.porto_vlan50.proto='static'
uci set network.porto_vlan50.device='eth3.50'
uci set network.porto_vlan50.ipaddr='10.10.50.1'
uci set network.porto_vlan50.netmask='255.255.255.0'

# VLAN 60 - Invitados
uci set network.porto_vlan60=interface
uci set network.porto_vlan60.proto='static'
uci set network.porto_vlan60.device='eth3.60'
uci set network.porto_vlan60.ipaddr='10.10.60.1'
uci set network.porto_vlan60.netmask='255.255.255.0'

# VLAN 70 - Gestión / Servidores
uci set network.porto_vlan70=interface
uci set network.porto_vlan70.proto='static'
uci set network.porto_vlan70.device='eth3.70'
uci set network.porto_vlan70.ipaddr='10.10.70.1'
uci set network.porto_vlan70.netmask='255.255.255.0'

# VLAN 80 - Wi-Fi Corporativo
uci set network.porto_vlan80=interface
uci set network.porto_vlan80.proto='static'
uci set network.porto_vlan80.device='eth3.80'
uci set network.porto_vlan80.ipaddr='10.10.80.1'
uci set network.porto_vlan80.netmask='255.255.255.0'

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