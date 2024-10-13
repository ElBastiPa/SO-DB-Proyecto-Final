#!/bin/bash

agregarFK() {
    read -p "Ingrese el nombre de la base de datos: " DB_NAME
    read -p "Ingrese el nombre de la tabla donde desea agregar la clave foránea: " tabla_origen
    read -p "Ingrese el nombre de la columna que será la clave foránea: " columna_foranea
    read -p "Ingrese el nombre de la tabla de referencia: " tabla_referencia
    read -p "Ingrese el nombre de la columna de referencia en la tabla '$tabla_referencia': " columna_referencia

    # Validar si la base de datos existe.
    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME;" 2>/dev/null; then
        echo "La base de datos '$DB_NAME' no existe."
        return
    fi

    # Verificar si las tablas y columnas existen.
    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME; SHOW COLUMNS FROM $tabla_origen LIKE '$columna_foranea';" 2>/dev/null; then
        echo "La columna '$columna_foranea' no existe en la tabla '$tabla_origen'."
        return
    fi

    if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME; SHOW COLUMNS FROM $tabla_referencia LIKE '$columna_referencia';" 2>/dev/null; then
        echo "La columna '$columna_referencia' no existe en la tabla '$tabla_referencia'."
        return
    fi

    # Crear la clave foránea.
    query="ALTER TABLE $tabla_origen ADD CONSTRAINT fk_${tabla_origen}_${columna_foranea} FOREIGN KEY ($columna_foranea) REFERENCES $tabla_referencia($columna_referencia) ON DELETE CASCADE ON UPDATE CASCADE;"

    if mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "USE $DB_NAME; $query"; then
        echo "Clave foránea agregada exitosamente de '$columna_foranea' en '$tabla_origen' referenciando '$columna_referencia' en '$tabla_referencia'."
    else
        echo "Error al agregar la clave foránea."
    fi
}
