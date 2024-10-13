#!/bin/bash

# Creo variables para hacer la conexión a la base de datos.
DB_HOST="localhost"
DB_USER="root"
DB_PASS="55980568"

# Muestro el menú.
mostrar_menu() {
    echo "Seleccione una opción:"
    echo "1) Crear base de datos"
    echo "2) Crear tabla"
    echo "3) Insertar registro"
    echo "4) Editar registro"
    echo "5) Eliminar registro"
    echo "6) Borrar tabla"
    echo "7) Borrar base de datos"
    echo "8) Visualizar bases de datos"
    echo "9) Visualizar tablas de una base de datos"
    echo "10) Visualizar registros de una tabla"
    echo "11) Agregar clave foránea"
    echo "12) Editar tabla"
    echo "13) Salir"
    read -p "Opción: " opcion
}

# -ne = "not equals".
# Bucle principal para el menú.
# m es una variable de control pa que el bucle no haga cosas raras.
m=0
while [ $m -ne 13 ]; do
    clear  # Limpio la consola antes de mostrar el menú.
    mostrar_menu
    case $opcion in
        1)
            source ./crearDB.sh
            crearDB
            ;;
        2)
            source ./crearTabla.sh
            crearTabla
            ;;
        3)
            source ./insertarDatos.sh
            insertarDatos
            ;;
        4)
            source ./editarRegistros.sh
            editarRegistros
            ;;
        5)
            source ./eliminarRegistro.sh
            eliminarRegistro
            ;;
        6)
            source ./borrarTabla.sh
            borrarTabla
            ;;
        7)
            source ./borrarDB.sh
            borrarDB
            ;;
        8)
            source ./visualizarDB.sh
            visualizarDB
            ;;
        9)
            source ./visualizarTablas.sh
            visualizarTablas
            ;;
        10)
            source ./visualizarRegistros.sh
            visualizarRegistros
            ;;
        11)
            source ./agregarFK.sh
            agregarFK
            ;;
        12)
            source ./editarTabla.sh
            editarTabla
            ;;
        13)
            echo "Saliendo..."
            m=13  # Lo hago valer 13 para que con 13 salga de la app.
            ;;
        *)
            echo "Opción inválida. Por favor, seleccione una opción válida."
            ;;
    esac
    read -p "Presione Enter para continuar..."  # Pausa para que el usuario pueda leer la salida antes de continuar.
done

# Con "source" incluyo archivos a este script.
