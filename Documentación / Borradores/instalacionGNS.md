# Instalar GUI en Linux

1. Encontrar el enlace oficial de descarga
- https://docs.gns3.com/docs/getting-started/installation/linux/

2. Descargar la PPA y paquete
```bash
sudo add-apt-repository ppa:gns3/ppa
sudo apt update                                
sudo apt install gns3-gui gns3-server
```

3. Al entrar en la interfaz gráfica se selecciona "Run appliances on my local computer"

4. Seleccionar las configuraciones por defécto de server path, host binding, y port

# Instalar GNS VM para VirtualBox

1. Seleccionar la ISO que corresponda al hipervisor desde el enlace oficial
- https://gns3.com/software/download-vm

2. Descomprimir la carpeta y crea la máquina virtual (Importar - Seleccionar la OVA)

# Cambiar los ajustes de GNS para habilitar el uso de VM

1. Edit - Preferences

2. Habilitar VM

3. Servicio - VirtualBox

4. Nombre - GNS3 VM

5. Aplicar y aceptar

## Ajustes VirtualBox

1. Settings - tools - network

2. Host only adapter - DHCP - Habilitar



