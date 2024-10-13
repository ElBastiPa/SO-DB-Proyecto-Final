#!/bin/bash

insertarDatos() {
    read -p "Ingrese el nombre de la base de datos: " DB_NAME

    #Intenta hacer la conexión con las variables de entorno, redirige el mensaje de error a null para que si hay un error no se muestre en consola.
    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME;" 2>/dev/null; then
        echo "La base de datos '$DB_NAME' no existe."
        return
    fi

    read -p "Ingrese el nombre de la tabla: " TABLE_NAME
    read -p "Ingrese los datos a insertar (Por elemplo: 'Pepe', 'Rodriguez'): " DATA_VALUES

    # Comando MySQL para insertar datos en alguna tabla.
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "INSERT INTO $DB_NAME.$TABLE_NAME VALUES ($DATA_VALUES);"

    if [ $? -eq 0 ]; then
        echo "Datos insertados exitosamente en '$TABLE_NAME' en la base de datos '$DB_NAME'."
    else
        echo "Error al insertar datos en '$TABLE_NAME'."
    fi
}