#!/bin/bash

P="\e[95m"
R="\e[0m"

trap 'echo -e "\n${P}[>>] Despliegue cancelado${R}"; exit 1' INT

echo -e "${P}"
echo "=================================="
echo "     Security Docker Homelab "
echo "=================================="
echo -e "${R}"

# -------------------------
# Verificar Docker
# -------------------------
if ! command -v docker >/dev/null 2>&1; then
    echo -e "${P}[>>] Docker no instalado${R}"
    exit 1
fi

if ! docker info >/dev/null 2>&1; then
    echo -e "${P}[>>] Docker no está corriendo${R}"
    exit 1
fi

# -------------------------
# Permisos
# -------------------------

chmod +x attackers.sh
chmod +x vulnerable.sh

# -------------------------
# Instalar máquinas atacante
# -------------------------

echo -e "${P}[>>] Instalando contenedores atacante...${R}"

./attackers.sh

# -------------------------
# Instalar maquinas vulnerables
# -------------------------

echo -e "${P}[>>] Instalando contenedores vulnerables...${R}"

./vulnerable.sh

# -------------------------
# Desplegar sistema
# -------------------------

echo -e "${P}[>>] Desplegando contenedores basicos...${R}"
docker-compose -f vulns.yml up -d

# -------------------------
# Mostrar resultado
# -------------------------

echo
echo -e "${P}[>>] Contenedores activos:${R}"

docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}"

echo
echo -e "${P}[>>] Red:${R} Sec-Docker-Homelab"
echo -e "${P}[>>] Despliegue completado${R}"
