# Conexión a una BDD con `odbc`


#### Objetivos
- Conectarse a una BDD utilizando `odbc`
- Lectura de  una BDD en `odbc`

#### Requisitos

- Tener instalados `R` y Rstudio
- Haber estudiado el Prework

#### Desarrollo

Consultar una base de datos desde un servidor que ejecuta __R__ requiere tres cosas:

1. Seguridad de red que te permita comunicarse a los dispositivos de cómputo.

1. Controladores instaladores en el servidor R.

1. Configuraciones que nos permitan conectarnos a la base de datos desde R.

En general, es mejor que el equipo de TI/Operaciones se encargue de la seguridad de la red y la instalación de los
controladores, ya que es probable que tengan procedimientos de seguridad. Te recomendamos usar los [controladores
profesionbales de RStudio](https://www.rstudio.com/products/drivers/), que son fáciles de instalar y están diseñados
para funcionar con cualquier paquete.

Cuando se trata de realizar la conexión de __R__ con una base de datos, recomendamos usar el paquete `odbc`, que es una
interfaz compatible con [DBI](http://db.rstudio.com/dbi/) para usar controladores ODBC. Puedes adquirir la última 
versión estable con:

```r
install.packages("odbc")
```

En general, para realizar la conexión con **cualquier servidor de bases de datos** debemos hacer algo como:

```r
library(odbc)
con <- dbConnect(odbc(),
                 Driver = "SQL Server",
                 Server = "host",
                 Database = "db",
                 UID = "user",
                 PWD = rstudioapi::askForPassword("password"),
                 Port = 1433)
```

La función `rstudioapi::askForPassword` solicita al usuario una contraseña y ayuda a reducir el almacenamiento explícito
de contraseñas en código. Para obtener más opciones sombre manejo de credenciales te dejamos el siguiente 
[artículo](https://db.rstudio.com/best-practices/managing-credentials/).

La [documentación](https://github.com/r-dbi/odbc) de odbc contiene varios ejemplos así como una sección específica por 
base de datos.
