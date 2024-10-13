#!/bin/bash

# Función para visualizar bases de datos
visualizarDB() {
    echo "Bases de datos disponibles:"
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "SHOW DATABASES;"
}