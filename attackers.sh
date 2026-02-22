#!/bin/bash

# Colores
P="\e[95m"
R="\e[0m"

# Ctrl+C handler
trap 'echo -e "\n${P}[>>] Cancelado${R}"; exit 1' INT

# Verificar Docker instalado
if ! command -v docker >/dev/null 2>&1; then
    echo -e "${P}[>>] Docker no está instalado${R}"
    exit 1
fi

# Verificar Docker daemon activo
if ! docker info >/dev/null 2>&1; then
    echo -e "${P}[>>] Docker no está en ejecución${R}"
    exit 1
fi

echo -e "${P}"
echo "=========== DOCKER MENU ==========="
echo -e "${R}"

echo "1) Kali Basic       ==> kalilinux/kali-rolling:latest"
echo "2) Kali linuxserver ==> linuxserver/kali-linux:latest"
echo "3) Pentester        ==> h4shelldocker/pentester:latest"
echo "4) Kali Kasmweb     ==> kasmweb/kali-rolling-desktop:1.18.0"
echo "5) Parrot Basic     ==> parrotsec/core:latest"
echo "6) Parrot Security  ==> parrotsec/security:latest"
echo "7) Parrot Kasmweb   ==> kasmweb/parrotos-6-desktop:1.18.0"
echo "8) Blackarch        ==> blackarchlinux/blackarch:latest"

echo
echo -e "${P}ENTER = Pentester${R}"
echo

read -r -p "Opcion: " op

case "$op" in
    1) img="kalilinux/kali-rolling:latest" ;;
    2) img="linuxserver/kali-linux:latest" ;;
    3|"") img="h4shelldocker/pentester:latest" ;;
    4) img="kasmweb/kali-rolling-desktop:1.18.0" ;;
    5) img="parrotsec/core:latest" ;;
    6) img="parrotsec/security:latest" ;;
    7) img="kasmweb/parrotos-6-desktop:1.18.0" ;;
    8) img="blackarchlinux/blackarch:latest" ;;
    *)
        echo -e "${P}[>>] Opción inválida, usando Pentester${R}"
        img="h4shelldocker/pentester:latest"
    ;;
esac

echo -e "${P}[>>] Imagen seleccionada: ${img}${R}"

# Verificar si existe
if docker image inspect "$img" >/dev/null 2>&1; then

    echo -e "${P}[>>] La imagen ya existe${R}"

else

    echo -e "${P}[>>] Descargando imagen...${R}"

    if ! docker pull "$img"; then

        echo -e "${P}[>>] Error al descargar${R}"
        exit 1

    fi

fi

echo -e "${P}[>>] Listo${R}"
