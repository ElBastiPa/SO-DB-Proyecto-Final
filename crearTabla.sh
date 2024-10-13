#!/bin/bash

crearTabla() {
    read -p "Ingrese el nombre de la base de datos: " DB_NAME

    #Verificación.
    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME;" 2>/dev/null; then
        echo "La base de datos '$DB_NAME' no existe. Por favor, crea la base de datos primero."
        return
    fi

    # Lee el nombre de la tabla y los campos.
    read -p "Ingrese el nombre de la tabla: " TABLE_NAME
    read -p "Ingrese los campos de la tabla (ejemplo: Nombre VARCHAR(x), id INT AUTO_INCREMENT PK, etc): " TABLE_FIELDS

    # Crear la tabla en la base de datos seleccionada.
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "CREATE TABLE $DB_NAME.$TABLE_NAME ($TABLE_FIELDS);"

    if [ $? -eq 0 ]; then
        echo "Tabla '$TABLE_NAME' creada exitosamente en la base de datos '$DB_NAME'."
    else
        echo "Error al crear la tabla '$TABLE_NAME'."
    fi
}