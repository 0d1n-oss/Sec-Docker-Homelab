#!/bin/bash

# ==============================
#        CONFIGURACION
# ==============================

# Colores
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"
BOLD="\e[1m"
PURPLE="\e[35m"

# Lista de imágenes (nombre:tag)
IMAGES=(
  # Imagenes de sistema
  "traefik:v3.0"
  "portainer/portainer-ce:latest"
  "louislam/uptime-kuma:latest"
  # Imagenes vulnerables
  "sagikazarmark/dvwa:latest"
  "youyouorz/ssrf-vulnerable-lab:latest"
  "tssoffsec/dvws:latest"
  "raesene/bwapp:latest"
  "webgoat/webgoat:latest"
  "bkimminich/juice-shop:latest"
  "acgpiano/sqli-labs:latest"
  # Imagen de kali
  "h4shelldocker/pentester:latest"
)

# ==============================
#          FUNCIONES
# ==============================

show_banner() {
    clear
    echo "                                                     #                                         "
    echo "                                                   .###.					 "
    echo "                                                    #####.                                     "
    echo "                                         .#...      #####      ...#.				 "
    echo "                                           #####-   .###.   -#####                             "
    echo "                                           .###.    .###.    .###.				 "
    echo "                                             ###.###########.###                               "
    echo "                                              #################                                "
    echo "                                                     ...					 "
    echo "                                              #################                                "
    echo "                                                  .##########.				 "
    echo "                                                 ###....#########.                             "
    echo "                                        ..#########   .  ###########.				 "
    echo "                                    ..#############     .#############			 "
    echo "                                  ..################....###############.			 "
    echo "                                  ####################################.#                       "
    echo "                                .#               .####################.			 "
    echo "                                                   ##################+                         "
    echo "                                                    .##################			 "
    echo "                                                 .  .+##################                       "
    echo "                                                +#...###################			 "
    echo "                                            ..###  .####################			 "
    echo "                                        ..#####. +######..#######.#####.			 "
    echo "                                  ..########+########-  .#######  ####.			 "
    echo "                               -#################..   .#######.   ###.			 "
    echo "                           .###############...      .########.   .#-.				 "
    echo "                         .#########..             .########..   .-				 "
    echo "                       .#####...              ..#########.				 	 "
    echo "                     .###.                 .#########.					 "
    echo "                    .##.               ##########..						 "
    echo "                    #                                 	 				 "
    echo ""
    echo -e "${PURPLE}${BOLD}"
    echo "=============================================="
    echo "   DOCKER IMAGE AUTO-INSTALLER"
    echo "=============================================="
    echo -e "${RESET}"
    echo -e "${BLUE}Verificando e instalando imágenes necesarias...${RESET}"
    echo ""
}


check_docker() {
    if ! command -v docker &> /dev/null
    then
        echo -e "${RED}Docker no está instalado o no está en el PATH.${RESET}"
        exit 1
    fi
}

install_images() {
    for IMAGE in "${IMAGES[@]}"
    do
        echo -e "${YELLOW}Procesando: ${IMAGE}${RESET}"

        if docker image inspect "$IMAGE" > /dev/null 2>&1; then
            echo -e "${GREEN}✔ La imagen ${IMAGE} ya está instalada.${RESET}"
        else
            echo -e "${PURPLE}⬇ Descargando ${IMAGE}...${RESET}"
            if docker pull "$IMAGE"; then
                echo -e "${GREEN}✔ ${IMAGE} instalada correctamente.${RESET}"
            else
                echo -e "${RED}✖ Error al instalar ${IMAGE}.${RESET}"
            fi
        fi

        echo ""
    done
}

# ==============================
#           EJECUCIÓN
# ==============================

show_banner
check_docker
install_images

echo -e "${PURPLE}${BOLD}Proceso finalizado.${RESET}"
