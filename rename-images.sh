#!/bin/bash

# Directorio principal por defecto
BASE_DIRECTORY="$HOME/Pictures"

# Verificar si se proporcionó una palabra clave y un subdirectorio
if [ $# -lt 2 ]; then
    echo "Uso: $0 <palabra clave> <subdirectorio>"
    exit 1
fi

# Palabra clave proporcionada por el usuario
KEYWORD=$1

# Subdirectorio proporcionado por el usuario
SUBDIRECTORY=$2

# Directorio completo a utilizar
DIRECTORY="$BASE_DIRECTORY/$SUBDIRECTORY"

# Verificar si el subdirectorio existe
if [ ! -d "$DIRECTORY" ]; then
    echo "El subdirectorio '$SUBDIRECTORY' no existe en $BASE_DIRECTORY"
    exit 1
fi

# Obtener la fecha actual
DATE=$(date +%Y%m%d)

# Contador de archivos
COUNT=1

# Renombrar las imágenes
for FILE in "$DIRECTORY"/*.{jpg,jpeg,png,gif}; do
    if [ -f "$FILE" ]; then
        EXTENSION="${FILE##*.}"
        NEW_NAME=$(printf "%s/%02d_%s_%s.%s" "$DIRECTORY" "$COUNT" "$KEYWORD" "$DATE" "$EXTENSION")
        mv "$FILE" "$NEW_NAME"
        COUNT=$((COUNT + 1))
    fi
done

echo "Renombrado completado. Total de archivos renombrados: $((COUNT - 1))"

