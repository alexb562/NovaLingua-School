# Primer video - arranque y prueba de ping

## Cambio de simbolos

- clic derecho - change symbol

## Crear grid
- View - snap to grid - show grid

## Mostrar etiquetas de interfaces
- View - show/hide interfaces

## Encender la simulación con todos los dispositivos
- Pulsa el botón play
- hacer clic sobre un disposito 

## Poner IP
![alt text](fotosTutorial/asignarIP.png)
### Show ip
``` 
show ip 
```

### Save config
- no se guarda por defecto, hay que guardar en la consola con el comando save


# Segundo video - descargar un router
- file - new template - download to gns3 server - se selecciona el router que se quiere descargar (se recomienda openwrt) y se sube el archivo .img
- vyos, microtik, openwrt
- con vyos hay que crear un nuevo dispositivo mamaulmente añadiendo la ISO
- Hasta ahora no funcionan vyos ni mikrotik
- He cambiado en el archivo de config poniendo
```ini
[Qemu]
enable_kvm = false
```

# OpenWrt + VPCS - Comandos importantes para GNS3

| Categoría | Comando | Descripción |
|---|---|---|
| OpenWrt básico | `ip addr` | Ver interfaces de red y direcciones IP asignadas |
| OpenWrt básico | `ip link` | Ver el estado de las interfaces: activas o desactivadas |
| OpenWrt básico | `ip route` | Ver la tabla de rutas del router |
| OpenWrt básico | `ping 192.168.10.10` | Probar conectividad con otro dispositivo |
| OpenWrt básico | `clear` | Limpiar la pantalla de la terminal |
| OpenWrt básico | `reboot` | Reiniciar OpenWrt |
| OpenWrt básico | `poweroff` | Apagar OpenWrt |
| Configuración temporal OpenWrt | `ip addr add 192.168.10.1/24 dev eth0` | Asignar una IP temporal a `eth0` |
| Configuración temporal OpenWrt | `ip link set eth0 up` | Activar la interfaz `eth0` |
| Configuración temporal OpenWrt | `ip addr add 192.168.20.1/24 dev eth1` | Asignar una IP temporal a `eth1` |
| Configuración temporal OpenWrt | `ip link set eth1 up` | Activar la interfaz `eth1` |
| Configuración temporal OpenWrt | `ip addr del 192.168.10.1/24 dev eth0` | Eliminar una IP de una interfaz |
| Rutas estáticas OpenWrt | `ip route add 10.20.40.0/24 via 10.255.1.2` | Añadir una ruta estática hacia otra red |
| Rutas estáticas OpenWrt | `ip route del 10.20.40.0/24` | Eliminar una ruta estática |
| Rutas estáticas OpenWrt | `ip route add default via 192.168.1.1` | Añadir una ruta por defecto |
| UCI OpenWrt | `uci show network` | Ver la configuración de red guardada |
| UCI OpenWrt | `uci show dhcp` | Ver la configuración DHCP |
| UCI OpenWrt | `uci show firewall` | Ver la configuración del firewall |
| UCI OpenWrt | `/etc/init.d/network restart` | Reiniciar el servicio de red |
| UCI OpenWrt | `/etc/init.d/firewall restart` | Reiniciar el firewall |
| UCI OpenWrt | `/etc/init.d/dnsmasq restart` | Reiniciar el servicio DHCP/DNS |
| Configuración persistente OpenWrt | `uci set network.lan=interface` | Crear o modificar la interfaz lógica `lan` |
| Configuración persistente OpenWrt | `uci set network.lan.device='eth0'` | Asociar `lan` con la interfaz física `eth0` |
| Configuración persistente OpenWrt | `uci set network.lan.proto='static'` | Configurar la interfaz con IP estática |
| Configuración persistente OpenWrt | `uci set network.lan.ipaddr='192.168.10.1'` | Asignar IP persistente a la interfaz |
| Configuración persistente OpenWrt | `uci set network.lan.netmask='255.255.255.0'` | Asignar máscara de red persistente |
| Configuración persistente OpenWrt | `uci commit network` | Guardar cambios de configuración de red |
| Configuración persistente OpenWrt | `/etc/init.d/network restart` | Aplicar los cambios de red |
| Firewall OpenWrt | `nft flush ruleset` | Eliminar reglas temporales de firewall para pruebas |
| Firewall OpenWrt | `iptables -F` | Vaciar reglas de firewall si se usa iptables |
| Firewall OpenWrt | `iptables -t nat -F` | Vaciar reglas NAT si se usa iptables |
| Firewall OpenWrt | `iptables -P FORWARD ACCEPT` | Permitir reenvío de tráfico entre interfaces |
| Paquetes OpenWrt | `apk update` | Actualizar lista de paquetes |
| Paquetes OpenWrt | `apk add nombre-paquete` | Instalar un paquete |
| Paquetes OpenWrt | `apk del nombre-paquete` | Eliminar un paquete |
| Paquetes OpenWrt | `apk search nombre-paquete` | Buscar un paquete disponible |
| Paquetes OpenWrt | `apk info` | Ver paquetes instalados |
| FRR / OSPF | `apk add frr frr-ospfd frr-vtysh` | Instalar FRR y soporte OSPF |
| FRR / OSPF | `/etc/init.d/frr enable` | Activar FRR al iniciar el sistema |
| FRR / OSPF | `/etc/init.d/frr start` | Iniciar FRR |
| FRR / OSPF | `vtysh` | Entrar en la consola de configuración FRR |
| FRR / OSPF | `show ip route` | Ver rutas dentro de FRR |
| FRR / OSPF | `show ip ospf neighbor` | Ver vecinos OSPF |
| FRR / OSPF | `show ip route ospf` | Ver rutas aprendidas por OSPF |
| FRR / OSPF | `configure terminal` | Entrar en modo configuración de FRR |
| FRR / OSPF | `router ospf` | Entrar en configuración OSPF |
| FRR / OSPF | `network 10.10.0.0/16 area 0` | Anunciar una red mediante OSPF |
| FRR / OSPF | `write memory` | Guardar configuración FRR |
| VPCS | `show ip` | Ver configuración IP del PC virtual |
| VPCS | `ip 192.168.10.10/24 192.168.10.1` | Asignar IP, máscara y puerta de enlace |
| VPCS | `save` | Guardar configuración del VPCS |
| VPCS | `ping 192.168.10.1` | Probar conectividad desde el VPCS |
| VPCS | `clear ip` | Eliminar configuración IP del VPCS |
| VPCS | `?` | Ver ayuda de comandos disponibles |


# Configurando IP permanente en openwrp
```bash
uci set network.lan=interface
uci set network.lan.device='br-lan' # para la lan interior, sería eth1, eth2 etc para otros
uci set network.lan.proto='static'
uci set network.lan.ipaddr='10.0.0.1'
uci set network.lan.netmask='255.255.255.0'
uci commit network
/etc/init.d/network restart

ip addr show br-lan
ip addr show eth0
ip route
uci show network
```
