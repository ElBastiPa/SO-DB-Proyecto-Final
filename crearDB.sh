#!/bin/bash

crearDB() {
    # read -p es como un scanner en java, hace que lo que se escriba, se guarda en la varible que se estipula al final.
    read -p "Ingrese el nombre de la base de datos: " DB_NAME
    # Crear la base de datos
    # myslp para estipular que es un comando para mysql
    # -h es para estipular el host
    # -u para estipular usuario
    # -p para estipular constraseña
    # -e el comando
    # CREATE DATABASE es un comando de mysql que crea DB, le pasamos la variable DB_NAME para que le ponga ese nombre que querramos a la DB
    mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "CREATE DATABASE $DB_NAME;"

    if [ $? -eq 0 ]; then
        echo "Base de datos '$DB_NAME' creada exitosamente."
    else
        echo "Error al crear la base de datos '$DB_NAME'."
    fi
}