# Challenge para Banana Software 

Este proyecto es un challenge para Banana Software el cual consiste en 3 secciones: 
 - Login
 - Listado de productos
 - Detalle de producto

## Tecnologías utilizadas

Para realizar la aplicación utilice las tecnologias sugeridas en el challenge:

  - Flutter
  - Provider
  - Patron MVVM

## Estructura de carpetas

La estructura de carpetas es del patron MMVM, la cual consiste en 3 carpetas principales:

  - models
  - viewModels 
  - views
    - widgets
    - Routes

  A estro tambien le sumé: 
  - services
  - constants 

## Paquetes utilizados

  - `provider`: ^6.0.1
  - `carousel_slider`: ^4.2.1
  - `flutter_secure_storage`: ^8.0.0
  - `dio`: ^5.1.1
  - `easy_debounce`: ^2.0.3

`Provider` lo utilice para manejar el estado, dio para realizar las peticiones `http`, `easy_debounce` para evitar que se hagan multiples peticiones al mismo tiempo y `flutter_secure_storage` para guardar el token de autenticacion.

## API utilizada

Para realizar las peticiones utilice la API de dummyjson, la cual se encuentra en el siguiente link: https://dummyapi.io/data/api

## Como correr el proyecto

Para correr el proyecto es necesario tener instalado flutter, para mas informacion sobre como instalarlo se puede visitar el siguiente link: https://flutter.dev/docs/get-started/install

Una vez instalado flutter, se debe clonar el proyecto y ejecutar el siguiente comando en la carpeta del proyecto:

```properties
flutter pub get && flutter run
``` 
