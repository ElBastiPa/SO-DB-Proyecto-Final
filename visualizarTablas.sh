#!/bin/bash

# Función para visualizar tablas de una base de datos
visualizarTablas() {
    read -p "Ingrese el nombre de la base de datos: " DB_NAME

        # Verificar si la base de datos existe
    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME;" 2>/dev/null; then
        echo "La base de datos '$DB_NAME' no existe."
        return
    fi

    echo "Tablas en la base de datos '$DB_NAME':"
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "SHOW TABLES IN $DB_NAME;"
}