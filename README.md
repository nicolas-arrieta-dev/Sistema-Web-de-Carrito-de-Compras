# Sistema-Web-de-Carrito-de-Compras

Sistema web de comercio electrónico desarrollado con ASP.NET Core MVC, C#, SQL Server y PayPal, con gestión de productos, usuarios, carrito de compras y pagos en línea.

# Sistema Web de Carrito de Compras

Aplicación web de comercio electrónico desarrollada con arquitectura MVC, orientada a la gestión de productos y usuarios, permitiendo a los clientes explorar productos, agregarlos a un carrito de compras y realizar pagos mediante la integración con PayPal.

El proyecto cuenta con un módulo administrativo para la gestión de la información de la tienda y un módulo de tienda orientado a la experiencia de compra del usuario.

## Características

### Módulo de Administración

El sistema administrativo permite realizar la gestión de los principales elementos de la aplicación:

* Gestión de usuarios.
* Gestión de productos.
* Gestión de categorías.
* Gestión de marcas.
* Administración de la información utilizada por la tienda.

### Módulo de Tienda

Los usuarios pueden:

* Visualizar los productos disponibles.
* Consultar información y detalles de los productos.
* Agregar productos al carrito.
* Modificar las cantidades de los productos.
* Consultar el contenido del carrito.
* Realizar el proceso de compra.
* Realizar pagos mediante PayPal.

### Integración con PayPal

El proyecto integra la API REST de PayPal para gestionar el proceso de pago.

Entre las operaciones utilizadas se encuentran:

* Creación de órdenes.
* Captura de órdenes.
* Gestión del proceso de pago.

La integración permite simular un flujo de compra utilizando los servicios de PayPal.

## Tecnologías

* C#
* ASP.NET Core
* .NET Core
* Arquitectura MVC
* SQL Server
* Entity Framework
* PayPal REST API
* Bootstrap
* jQuery
* Font Awesome
* SweetAlert
* LoadingOverlay

## Arquitectura

El proyecto utiliza el patrón arquitectónico MVC (Model-View-Controller), separando las responsabilidades de la aplicación en diferentes componentes.

```text
Model
 └── Representación de datos y lógica relacionada con las entidades

View
 └── Interfaces utilizadas por el usuario

Controller
 └── Gestión de solicitudes y comunicación entre la vista y el modelo
```

La separación de responsabilidades facilita el mantenimiento, organización y escalabilidad del proyecto.

### Arquitectura por capas

La solución está organizada utilizando una arquitectura por capas, separando las responsabilidades de cada componente del sistema. Esta estructura permite mantener el código organizado y facilita su mantenimiento, reutilización y escalabilidad.

Las principales capas de la solución son:

#### Capa de Presentación - Administración

Esta capa contiene la interfaz y funcionalidades destinadas a los administradores del sistema.

Permite realizar operaciones de gestión sobre los diferentes elementos de la aplicación, como usuarios, productos, categorías y marcas.

Esta capa se encarga principalmente de recibir las acciones del administrador y comunicarse con la capa de negocio para ejecutar las operaciones correspondientes.

#### Capa de Presentación - Tienda

Esta capa contiene la interfaz destinada a los clientes de la tienda.

Permite a los usuarios consultar productos, visualizar sus detalles, agregar productos al carrito, modificar cantidades y realizar el proceso de compra.

Al igual que la capa de administración, esta capa se comunica con la capa de negocio para ejecutar las operaciones necesarias.

#### Capa de Negocio

La capa de negocio contiene la lógica y las reglas de negocio de la aplicación.

Su función es procesar las operaciones solicitadas desde las capas de presentación y determinar cómo deben ejecutarse.

Por ejemplo, puede encargarse de validar información, procesar operaciones relacionadas con el carrito de compras, gestionar usuarios, productos y coordinar el proceso de compra.

Esta capa permite mantener la lógica de negocio separada de las interfaces y del acceso directo a la base de datos.

#### Capa de Datos

La capa de datos es responsable de la comunicación con la base de datos SQL Server.

En esta capa se encuentran las operaciones necesarias para consultar, insertar, actualizar y eliminar información.

También permite abstraer el acceso a los datos para que las demás capas no tengan que comunicarse directamente con SQL Server.

#### Capa de Entidades

La capa de entidades contiene las clases que representan los objetos principales utilizados por el sistema.

Estas entidades representan información como:

* Usuarios.
* Productos.
* Categorías.
* Marcas.
* Carritos.
* Órdenes.
* Detalles de órdenes.

Las entidades son utilizadas para transportar y representar la información entre las diferentes capas de la aplicación.

### Flujo de comunicación entre capas

La comunicación entre las diferentes capas sigue una estructura similar a:

```text
                    ┌─────────────────────────┐
                    │      Presentación       │
                    │                         │
                    │  Administración        │
                    │  Tienda                │
                    └────────────┬────────────┘
                                 │
                                 ▼
                    ┌─────────────────────────┐
                    │      Capa de Negocio    │
                    │                         │
                    │   Lógica de aplicación   │
                    └────────────┬────────────┘
                                 │
                                 ▼
                    ┌─────────────────────────┐
                    │       Capa de Datos     │
                    │                         │
                    │       SQL Server        │
                    └─────────────────────────┘

                    Capa de Entidades
              utilizada por las diferentes capas
                    para representar datos
```

Esta separación permite que cada capa tenga una responsabilidad específica, evitando concentrar toda la lógica de la aplicación en un único proyecto.

## Base de datos

La aplicación utiliza SQL Server como sistema de gestión de base de datos relacional.

La base de datos almacena información relacionada con:

* Usuarios.
* Productos.
* Categorías.
* Marcas.
* Carritos.
* Detalles de compra.
* Información relacionada con las órdenes.

## Instalación

Para ejecutar el proyecto localmente es necesario contar con:

* Visual Studio.
* .NET SDK compatible con la versión utilizada por el proyecto.
* SQL Server.
* SQL Server Management Studio, opcionalmente.
* Cuenta de PayPal Developer para utilizar la API.

### 1. Clonar el repositorio

### 2. Abrir el proyecto

Abre la solución del proyecto utilizando Visual Studio.

Restaura las dependencias del proyecto y verifica que la versión de .NET utilizada sea compatible con tu entorno.

### 3. Configurar la base de datos

En los archivos SQL esta todos las consultas que se utilizaron para la base de datos

### 4. Configurar PayPal

Para utilizar las funcionalidades de pago es necesario configurar las credenciales de PayPal Developer.

Las credenciales deben mantenerse fuera del código fuente y no deben publicarse en GitHub.

## Ejecución

Una vez configurada la base de datos y las credenciales necesarias:

1. Abre el proyecto en Visual Studio.
2. Verifica la cadena de conexión.
3. Configura las credenciales de PayPal.
4. Compila el proyecto.
5. Ejecuta la aplicación.
6. Accede al módulo administrativo o al módulo de tienda.

## Objetivo del proyecto

El objetivo del proyecto es desarrollar una aplicación web de comercio electrónico que permita gestionar productos y usuarios desde un módulo administrativo y ofrecer a los clientes una experiencia completa de compra mediante un carrito de compras.

El proyecto también permite aplicar conocimientos relacionados con arquitectura MVC, desarrollo backend con C#, manejo de bases de datos relacionales, consumo de APIs externas e integración de servicios de pago.

## Aprendizajes

Durante el desarrollo del proyecto se trabajaron conceptos relacionados con:

* Desarrollo de aplicaciones web con C# y ASP.NET Core.
* Arquitectura MVC.
* Diseño y manejo de bases de datos SQL Server.
* Desarrollo de operaciones CRUD.
* Integración y consumo de APIs REST.
* Integración de servicios de pago mediante PayPal.
* Manejo de sesiones y usuarios.
* Desarrollo de interfaces web.
* Organización de aplicaciones por responsabilidades.

## Créditos

Este proyecto fue desarrollado tomando como referencia material educativo y recursos publicados por:

Código Estudiante

https://codigoestudiante-pe.blogspot.com/


<img width="1894" height="776" alt="image" src="https://github.com/user-attachments/assets/c088d50e-e36a-4f73-b36c-b11dcb6d46e6" />


<img width="1908" height="777" alt="image" src="https://github.com/user-attachments/assets/f4a4c706-fc59-460b-b480-9bf45d6e2a4b" />


<img width="1623" height="808" alt="image" src="https://github.com/user-attachments/assets/b146983d-5cd5-45f4-b097-b44ac8f10cd0" />


