#!/bin/bash

borrarDB() {
    read -p "Ingrese el nombre de la base de datos a borrar: " DB_NAME

    # Comando pa borrar.
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "DROP DATABASE $DB_NAME;"

    if [ $? -eq 0 ]; then
        echo "Base de datos '$DB_NAME' borrada exitosamente."
    else
        echo "Error al borrar la base de datos '$DB_NAME'."
    fi
}
