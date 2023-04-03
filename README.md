# Resumen del proyecto API-MARVEL
Este es un proyecto en Flutter que muestra un resumen del personaje Hulk de Marvel. Utiliza la API de Marvel para obtener información sobre el personaje.

## Funcionalidades
El proyecto muestra la siguiente información del personaje Hulk:

- Nombre
- Imagen
- Descripción
- Cantidad de cómics
- Cantidad de series
- Cantidad de historias
- Cantidad de eventos
- Nombre de las 3 primeras series del listado de series del personaje.

## Configuración
Para poder utilizar la API de Marvel, es necesario configurar las credenciales en un archivo ".env". El archivo debe contener las siguientes variables:

`MARVEL_PUBLIC_KEY=your_public_key`
`MARVEL_PRIVATE_KEY=your_private_key`
`MARVEL_HASH=your_hash`

Estas claves se pueden obtener en la [página de desarrolladores de Marvel] (https://developer.marvel.com/).

## Cómo ejecutar el proyecto
1. Clonar el repositorio
2. Configurar las credenciales de la API de Marvel en un archivo .env (ver sección anterior)
3. Ejecutar el comando flutter pub get para instalar las dependencias
4. Ejecutar el comando flutter run para ejecutar la aplicación

## Tecnologías utilizadas
- Flutter
- Dart
