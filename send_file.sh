#!/bin/bash

# Directorio donde SAP almacena los archivos
DIR_SAP="/ruta/al/directorio/de/sap"

# Archivo de configuración con los prefijos y credenciales
CONFIG_FILE="config.txt"

# Configura el servidor FTP y el directorio remoto
FTP_SERVER="tu_servidor_ftp"
REMOTE_DIR="tu_directorio_remoto"

# Función para enviar archivo por FTP
send_file() {
    local archivo=$1
    local usuario=$2
    local contrasena=$3

    ftp -inv $FTP_SERVER <<EOF
user $usuario $contrasena
cd $REMOTE_DIR
put $archivo
bye
EOF
}

# Leer cada archivo en el directorio de SAP
for archivo in "$DIR_SAP"/*; do
    [ -e "$archivo" ] || continue

    PREFIJO="${archivo##*/}"
    PREFIJO="${PREFIJO:0:3}"

    while IFS=':' read -r prefijo usuario contrasena
    do
        if [ "$PREFIJO" == "$prefijo" ]; then
            send_file "$archivo" $usuario $contrasena
            # Mover o eliminar el archivo después de enviarlo, si es necesario
            # mv "$archivo" "/ruta/directorio/archivos_enviados/"
            break
        fi
    done < "$CONFIG_FILE"
done

