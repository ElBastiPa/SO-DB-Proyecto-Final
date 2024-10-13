#!/bin/bash

borrarTabla() {
    read -p "Ingrese el nombre de la base de datos: " DB_NAME

    #Verificación
    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME;" 2>/dev/null; then
        echo "La base de datos '$DB_NAME' no existe."
        return
    fi

    read -p "Ingrese el nombre de la tabla a borrar: " TABLE_NAME

    # Borrar la tabla
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "DROP TABLE $DB_NAME.$TABLE_NAME;"

    if [ $? -eq 0 ]; then
        echo "Tabla '$TABLE_NAME' borrada exitosamente de la base de datos '$DB_NAME'."
    else
        echo "Error al borrar la tabla '$TABLE_NAME'."
    fi
}
