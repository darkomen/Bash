#!/bin/sh

# directorio del telefono (version ingles)
DIR=Pictures/camera_semc
OBEXFILES=`obexftp -b 00:0F:DE:39:03:CD -i -c $DIR -l`
FILES=`echo "$OBEXFILES" | grep file | cut -d""" -f2`

# solo dejar los archivos que no se encuentran localmente
for FILE in $FILES
do
# obexrename es un script propio para transformar el nombre
    LOCALFILE=`obexrename.sh $FILE`
    if [ ! -f $LOCALFILE ]; then
        OLDFILES=$NEWFILES
        NEWFILES="$OLDFILES $FILE"
    fi
done

# obtener los archivos desde el telefono
if [ ! -z "$NEWFILES" ]; then
    obexftp -i -c $DIR -g $NEWFILES
fi

# filtrar las fotos si la camara no es muy buena
#mkdir -p backup

#for FILE in $NEWFILES
#do
#    LOCALFILE=`obexrename.sh $FILE`
#    echo "Converting... $LOCALFILE"
#    convert $FILE -despeckle  -enhance -monitor $LOCALFILE
#    mv $FILE backup/$FILE
#done
echo "sync ok"
