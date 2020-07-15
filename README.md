# Template

Proyecto plantilla base de proyectos futuros de la UPE-DDIT/CGTI.

## Requerimientos

+ Ruby: 2.3.0
+ Ruby on Rails: 4.2.6
+ Rubygems: 2.4.7 o superior.
+ PostgreSQL: 9.4.1 o superior.
+ ImageMagick 6.9.1-1 o superior.

## Instalación

### Dependencias del sistema

Antes de poder ejecutar la aplicación es necesario tener un ambiente de Ruby debidamente instalado. Se recomienda
instalar un administrador de versiones de Ruby, tal como [RVM](https://rvm.io/) o [RBENV](http://rbenv.org/).

Una vez configurado el ambiente de Ruby, instalar las gemas necesarias mediante la ejecución de los siguientes pasos en
la terminal:

+ Dirigirse al directorio raíz del proyecto: `$ cd <directorio raíz del proyecto>`
+ Instalar las gemas mediante: `$ bundle install`

### Configuración inicial

#### Base de datos

##### Creación

El proyecto está pensado para hacer uso de las configuraciones predeterminadas de Ruby on Rails, por lo que no es
necesario modificar el archivo database.yml, únicamente es necesario contar con una instalación de PostgreSQL y de un
superusuario con el mismo nombre que el usuario de la sesión. (En el caso de Mac Os X es más sencillo si se ha instalado
Postgresapp, ya que el superusuario se crea automáticamente).

En la terminal, en el directorio raíz del proyecto ejecutar los siguientes comandos:

+ `$ rake db:create`
+ `$ rake db:migrate`

##### Inicialización

De igual manera, en la terminal, dirigirse al directorio raíz del proyecto y ejecutar:

+ `$ rake db:seed`

#### Mailer

El proyecto está configurado para utilizar cuentas de Gmail para envío de correos, esto debido a que realiza los envíos
a los distintos proveedores de correo sin problema alguno.

Para su correcta configuración deberán crearse las siguientes variables de entorno en el archivo application.yml. Puede
utilizar el archivo application.example.yml como base. Solamente renombre el archivo a application.yml y utilice la sintaxis
mostrada en los comentarios.

+ GMAIL_DOMAIN: Se refiere al dominio de Gmail. Generalmente basta con definir `gmail.com`.
+ GMAIL_USERNAME: Se refiere a la cuenta de Gmail y lleva el siguiente formato: `cuenta@gmail.com`.
+ GMAIL_PASSWORD: Es la contraseña de la cuenta de Gmail.

## Uso

Antes que nada, asegurarse que todas las tecnologías requeridas se encuentren debidamente instaladas y en ejecución:

+ PostgreSQL.

En la terminal, en el directorio raíz del proyecto, ejecutar:

+ `$ rails server`

## Deployment

Para una instalación en servidor, seguir los pasos especificados en la siguiente [Wiki](https://code.uach.mx/upe/cms/wikis/deployment).
