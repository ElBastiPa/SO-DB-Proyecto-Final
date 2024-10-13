#!/bin/bash

editarTabla() {
    read -p "Ingrese el nombre de la base de datos: " DB_NAME
    read -p "Ingrese el nombre de la tabla a editar: " tabla

    # Validar si la base de datos existe
    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME;" 2>/dev/null; then
        echo "La base de datos '$DB_NAME' no existe."
        return
    fi

    # Verificar si la tabla existe
    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME; SHOW TABLES LIKE '$tabla';" 2>/dev/null; then
        echo "La tabla '$tabla' no existe en la base de datos '$DB_NAME'."
        return
    fi

    echo "Seleccione qué desea hacer en la tabla '$tabla':"
    echo "1) Agregar columna"
    echo "2) Modificar columna existente"
    echo "3) Eliminar columna"
    read -p "Opción: " accion

    case $accion in
        1)
            read -p "Ingrese el nombre de la nueva columna: " nueva_columna
            read -p "Ingrese el tipo de dato (por ejemplo, INT, VARCHAR(100)): " tipo_dato
            query="ALTER TABLE $tabla ADD $nueva_columna $tipo_dato;"
            ;;
        2)
            read -p "Ingrese el nombre de la columna a modificar: " columna
            read -p "Ingrese el nuevo tipo de dato para la columna: " nuevo_tipo
            query="ALTER TABLE $tabla MODIFY COLUMN $columna $nuevo_tipo;"
            ;;
        3)
            read -p "Ingrese el nombre de la columna a eliminar: " columna_eliminar
            query="ALTER TABLE $tabla DROP COLUMN $columna_eliminar;"
            ;;
        *)
            echo "Opción inválida."
            return
            ;;
    esac

    # Ejecutar la consulta de edición de la tabla
    if mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME; $query"; then
        echo "La tabla '$tabla' ha sido modificada correctamente."
    else
        echo "Error al modificar la tabla '$tabla'."
    fi
}