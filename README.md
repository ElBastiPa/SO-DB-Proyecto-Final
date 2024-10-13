# SO-DB-Proyecto-Final
Este es el proyecto final combinado de Sistemas Operativos 2 y Bases de Datos 1.

Institución: Escuela Técnica Superior Las Piedras, 2BE
Integrantes: Lucas Camejo, Iván Morales, Facundo López.

El sistema consiste de un menú con la capacidad de crear bases de datos y operar con ellas a trabés de comandos MySQL, manipulando un sistema MariaDB (Debido a la inexistencia de un cliente MySQL en Linux).

El proyecto está enteramente porgramado en Bash, implementándole sentancias MySQL para la creación y manipulación de bases de datos. Usamos funciones y múltiples archivos que son prosteriormente llamados en un archivo "Main.sh" para hacer el sistema lo más modular posible. El flujo de código es bastante recursivo, refiriéndose a que se han usado múltiples veces las mismas lineas de código para evitar problemas de integridad, por ejemplo a la hora de hacer verificaciones con las bases de datos, tablas, registros, etc.

Como entorno de purebas se usó un sistema operativo ArchLinux, un sistema gestor de Bases de Datos MariaDB, como editor de código Visual Studio Code.
Las bases de datos fueron montadas en el localhost del equipo Arch.

El sistema tiene 13 opciones válidas:
1) Crear base de datos
2) Crear tabla
3) Insertar registro
4) Editar registro
5) Eliminar registro
6) Borrar tabla
7) Borrar base de datos
8) Visualizar bases de datos
9) Visualizar tablas de una base de datos
10) Visualizar registros de una tabla
11) Agregar clave foránea
12) Editar tabla
13) Salir
