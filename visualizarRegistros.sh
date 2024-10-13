#!/bin/bash

visualizarRegistros() {
    read -p "Ingrese el nombre de la base de datos: " DB_NAME

    # Verificar si la base de datos existe
    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME;" 2>/dev/null; then
        echo "La base de datos '$DB_NAME' no existe."
        return
    fi

    read -p "Ingrese el nombre de la tabla: " TABLE_NAME

    # Verificar si la tabla existe
    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME; SELECT * FROM $TABLE_NAME LIMIT 1;" 2>/dev/null; then
        echo "La tabla '$TABLE_NAME' no existe en la base de datos '$DB_NAME'."
        return
    fi

    # Mostrar los registros de la tabla
    echo "Registros de la tabla '$TABLE_NAME':"
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "SELECT * FROM $DB_NAME.$TABLE_NAME;"
}