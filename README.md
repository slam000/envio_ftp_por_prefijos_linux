# Proyecto de Automatización FTP

## Descripción
Este proyecto implementa un sistema automatizado para la transferencia y descarga de archivos utilizando FTP. Consiste en dos scripts principales: uno para enviar archivos a un servidor FTP y otro para descargar archivos desde el servidor. La selección de las credenciales para la transferencia se basa en el prefijo del nombre del archivo, utilizando un archivo de configuración para estas asociaciones.

## Scripts

### 1. Script para Enviar Archivos a FTP
Este script supervisa un directorio específico para archivos generados por SAP y los envía a un servidor FTP utilizando credenciales específicas basadas en el prefijo del nombre del archivo.

- **Ruta:** `send_file.sh`
- **Cron:** Configurable (ejemplo: cada hora).

### 2. Script para Descargar Archivos de FTP
Este script se conecta a un servidor FTP, verifica archivos en un directorio remoto y los descarga a un directorio local.

- **Ruta:** `download_file.sh`
- **Cron:** Configurable (ejemplo: cada hora).

## Archivo de Configuración
`config.txt` contiene mapeos de prefijos de archivo a usuarios y contraseñas de FTP. Formato por línea: `prefijo:usuario:contraseña`.

## Seguridad
- Las contraseñas se almacenan en texto plano en `config.txt`. Se recomienda mejorar el manejo de credenciales.
- Considerar SFTP para mayor seguridad.
- Restringir permisos de archivos de script y configuración.

## Notas
Los scripts y el archivo de configuración son ejemplos básicos y pueden requerir ajustes para entornos de producción específicos.

