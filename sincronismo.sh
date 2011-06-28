#!/bin/bash
#####################################################
##Script para sincronizar directorio /home/$usuario##
##Programado por: Darkomen                         ##
##Para uso: Domestico                              ##
##Clave publica: 0x3715BB0B en pgp.rediris.es      ##
#####################################################
##declaramos las variables
#direccion ip del servidor
SERVER=192.168.1.6
#la variable `usuario` la voy a tomar, para localizar el directorio /home
#y como usuario en el servidor remoto.
#con el comando `id -un` obtengo el usuaio actual en el equipo local
USUARIO=`id -un`
PASSWORD=
#esta va a ser la carpeta remota donde se va a sincronizar la carpeta del usuario
DESTINO=/mnt/datos/backup
##creamos un fichero con la fecha del dia que se hace la sincronización
##se hace primero, para que se copie al servidor.
FECHA=`date +%d-%m-%y`
echo "Sincronizacion realizada el dia "${FECHA}":" >>${FECHA}
rsync -v -u -a --delete --rsh=ssh --stats /home/${USUARIO}  ${USUARIO}@${SERVER}:${DESTINO}
