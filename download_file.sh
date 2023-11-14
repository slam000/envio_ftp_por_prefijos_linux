#!/bin/bash

# Configuración del servidor FTP
FTP_SERVER="tu_servidor_ftp"
FTP_USER="usuario_ftp"
FTP_PASS="contraseña_ftp"
REMOTE_DIR="directorio_remoto"
LOCAL_DIR="directorio_respuestas_local"

# Iniciar sesión en el servidor FTP y descargar archivos
ftp -inv $FTP_SERVER <<EOF
user $FTP_USER $FTP_PASS
cd $REMOTE_DIR
mget *
lcd $LOCAL_DIR
bye
EOF

