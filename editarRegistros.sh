#!/bin/bash

editarRegistros() {
    read -p "Ingrese el nombre de la base de datos: " DB_NAME
    read -p "Ingrese el nombre de la tabla: " tabla
    read -p "Ingrese el ID del registro que desea editar: " id

    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME;" 2>/dev/null; then
        echo "La base de datos '$DB_NAME' no existe."
        return
    fi

    read -p "Ingrese el nombre de la columna que desea editar: " columna
    read -p "Ingrese el nuevo valor para la columna '$columna': " nuevo_valor

    query="UPDATE $tabla SET $columna='$nuevo_valor' WHERE id=$id;"

    if mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME; $query"; then
        echo "Registro actualizado con éxito."
    else
        echo "Error al actualizar el registro."
    fi
}