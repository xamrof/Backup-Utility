#!/bin/bash

# Directorio de origen que deseas respaldar
origen="/home/kali/Desktop/OriginData"

# Directorio de destino donde se almacenarán las copias de seguridad
destino="/home/kali/backups"
# Nombre del archivo de copia de seguridad con marca de tiempo
nombre_archivo="respaldo_$(date +\%Y\%m\%d_\%H\%M\%S).tar.gz"

# Comprimir y copiar los archivos de origen al directorio de destino
tar -czvf "$destino/$nombre_archivo" -C "$origen" .

cd $destino

curl -T $nombre_archivo ftp://ip-server --user user:pass

# Comprobar si la copia de seguridad se realizó con éxito
if [ $? -eq 0 ]; then
  echo "Copia de seguridad exitosa en $destino"
else
  echo "Error al realizar la copia de seguridad."
fi