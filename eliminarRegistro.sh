#!/bin/bash

eliminarRegistro() {
    read -p "Ingrese el nombre de la base de datos: " DB_NAME
    read -p "Ingrese el nombre de la tabla: " tabla
    read -p "Ingrese el ID del registro que desea eliminar: " id

    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME;" 2>/dev/null; then
        echo "La base de datos '$DB_NAME' no existe."
        return
    fi

    query="DELETE FROM $tabla WHERE id=$id;"

    if mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME; $query"; then
        echo "Registro eliminado con éxito."
    else
        echo "Error al eliminar el registro."
    fi
}