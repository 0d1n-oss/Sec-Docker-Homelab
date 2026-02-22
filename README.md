# Security docker homelab

Esto es solo una configuracion para un servidor de cyberseguridad, pudiendo practicar cyberseguridad, resolver maquinas, etc...

El lab consta de un equipo con un GNU linux (kali linux) adaptado con herramientas de cyberseguridad, siendo un entorno para un uso comodo respesto a resolver CTF, explorar vulnerabilidades, probar tacticas de pentesting, y todo respecto a hacking.

![logo](https://github.com/0d1n-oss/Sec-Docker-Homelab/blob/main/images/logo.png)

---

## Recursos
Este lab esta creado para desplegarse en forma de servidor, siendo su principal caracteristica el poder desplegar todo desde docker, pudiendo usarse desde cualquier lugar que pueda correr docker.

Aunque en este caso esta centrado en un GNU linux basado en debian (siendo apto para cualquier pc vieja con linux, una raspberry pi o similares)

**laptop aprix**

-   4 Gigas de ram
-   128 Gigas de disco SSD
-   SO Kali linux

---

## Instalacion

### Recursos de el sistema

#### Docker

``` bash
# Instalar docker
apt install -y docker.io docker-compose

# habilitar docker en el sistema
systemctl enable docker
systemctl start docker
```

#### Openssh

``` bash
# Instalar ssh como servidor
apt install -y openssh-server

# Habilitar ssh en el sistema
systemctl enable ssh
```
 
### Recursos de docker

#### Kuma

``` bash
docker pull louislam/uptime-kuma
```

#### Portainer

``` bash
docker pull portainer/portainer
```

#### Traefik

``` bash
docker pull traefik/traefik
```

![programs](https://github.com/0d1n-oss/Sec-Docker-Homelab/blob/main/images/programs.png)

## Configuracion extra

Esta configuracion sirve para habilitar los servicios de docker y ssh.
Asegurando que los servicios se inicien inmediatamente se inicie el equipo.

``` bash
#Habilitar ssh
sudo systemctl enable ssh
sudo systemctl start ssh

#Habilitar docker
sudo systemctl enable docker
sudo systemctl start docker
```
---

## Despliegue

### Automatico
Usando el archivo [**run.sh**](run.sh) se puede instalar el Homelab de manera automatica.
Instalando las imagenes vulnerables y las imagenes atacantes, teniendo el lab configurado y listo para usarse.

> [Nota]
> Durante la instalacion automatica hay que seleccionar el contenedor atacante que se desea.
> Hay varias imagenes recomendadas, aunque solo son eso, recomendaciones. 

![install](https://github.ycom/0d1n-oss/Sec-Docker-Homelab/blob/main/images/install.png)

### Manual

Para desplegar el systema se usa el archivo [**system.yml**](system.yml), el cual contiene los servicios de monitoreo y demas.
Estos servicios monitorean y manipulan el sistema de manera mas comoda.
``` bash
docker-compose -f system.yml up -d
```

El archivo [**vulns.yml**](vulns.yml) contiene las imagenes vulnerables listas para desplegar.
En este se encuentran todas las imagenes, puertos y demas recursos para desplegarse de manera efectiva y rapida.

``` bash
docker-compose -f vulns.yml up -d
```

En caso de querer desplegar los servicios de manera individual el archivo images.md contiene todas las imagenes, descripcones y comandos para desplegarse.
Asegurando el desplegar las imagenes de manera controlada.

---

## Acceso

`Nota`
`Las direcciones ip en estas demostraciones son locales, hay que modificarlas a la direccion ip de la maquina`

### Linux

Editar el archivo hosts con sudo.

```
sudo nano /etc/hosts
```

Agrega las direcciones con sus dominios.

```
127.0.0.1 portainer.local
127.0.0.1 kuma.local
```

Guarda con Ctrl + X

---

### Windows

Editar el archivo hosts con el blog de notas.

```
C:\Windows\System32\drivers\etc\hosts
```

Agrega las mismas líneas que en Linux, usando la IP de tu servidor (localhost si es la misma máquina, o IP de tu PC en la red si es otra):

```
127.0.0.1 portainer.local
127.0.0.1 kuma.local
```

Guarda el archivo.

Abre el navegador y prueba http://portainer.local o http://kuma.local.

---

### macOS

Abre Terminal.

Edita el archivo /etc/hosts con sudo:

```
sudo nano /etc/hosts


127.0.0.1 portainer.local
127.0.0.1 kuma.local
```

Guarda y sal (Ctrl+O, Enter, Ctrl+X).

Limpia la caché DNS del sistema:

```
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
```

Abre navegador y accede a http://portainer.local.


| Portainer | Kuma |
|----------|----------|
| ![portainer](https://github.com/0d1n-oss/Sec-Docker-Homelab/blob/main/images/portainer.png) | ![kuma](https://github.com/0d1n-oss/Sec-Docker-Homelab/blob/main/images/kuma.png) |

---

## Maquinas atacantes.

Todos los contenedores pueden ser resueltos y se puede interactuar con las webs y demas usando el entorno nativo.
Pero para mayor comodidad se puede desplegar un contenedor atacante, ya sea uno con las herramientas necesarias, un contenedor vacio configurable o uno con un entorno completo.

Se pueden encontrar otras opciones recomendables para desplegarse en este lab en el archivo [**pentesters.md**](pentesters.md)
Este archivo muestra ejemplos de despliegue de imagenes basicas, con entornos graficos, herramientas configuradas, etc...

La imagen **pentest** es una imagen de kali configurada para pruebas de penetracion.
Contando con herramientas basicas para pruebas de penetracion, escaneo y demas.

### Pentest

``` bash
sudo docker run -d --name pentester-desktop \
  -p 8444:8444 \
  -p 2222:22 \
  --privileged \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_ADMIN \
  pentester:latest
```

![kali](https://github.com/0d1n-oss/Sec-Docker-Homelab/blob/main/images/kali.png)
