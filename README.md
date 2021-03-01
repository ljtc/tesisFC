# TesisFC
Una clase para las tesis de la facultad de ciencias de la UNAM

## Introducción
Muchas universidades tienen un diseño de tesis para obtener un estándar de este tipo de publicación. Nuestra universidad y en particular la facultad de ciencias no tienen tal cosa. Esta clase se escribió con el propósito de empezar a hacer un diseño común para nuestras tesis, al menos para las tesis en LaTeX. He tomado muchas desiciones respecto al diseño, las más notorias son la tipografía y la caja de texto. Todas ellas están a discusión para lograr un buen diseño de tesis.

## Portada
En la clase se definen los siguientes comandos que deben escribirse en el
preámbulo del documento:
* `\author{}`
* `\title{}`
* `\date{}`
* `\tipo{}`
* `\facultad{}`
* `\grado{}`
* `\tutor{}`
* `\logouni{}`
* `\logofac{}`

En realidad los primeros tres están definidos por LaTeX y se usó su "valor" en la portada.


El diseño es una modificación del código que proporcionaba la facultad hace algunos años con la adaptación necesaria para funcionar en la clase base de esta, `memoir`. Además es el mismo diseño que ofrece hoy el departamento  de computo, es decir, tiene el nombre de la facultad abajo el escudo.

Para la creación de la portada de usaron los paquetes `graphicx` y `xstring`, así que no hay necesidad de volver a cargarlos en el preámbulo de la tesis.

En cada uno de los comandos proporcionados para la creación de la portada se debe escribir la información como se espera que se imprima, es decir, la inicial de un nombre en mayúscula y las siguientes en minúsculas. La única exepción es `\tipo{}` donde se espera una entrada en minúsculas. Esto se debe a que la clase revisará los caracteres que hay en ese campo para imprimirlos según el diseño de la facultad. Esto es, en el caso de ser una tesis se esparcen las letras de manera uniforme para cubrir cierto espacio horizontal. En otro caso no se esparcen las letras y se genran dos renglones. En la página de [computo de la facultad de ciencias](https://pagina.fciencias.unam.mx/servicios-y-tramites/titulacion/formatos/portadas) se encuentran los ejemplos de donde se configuró esta opción.

Por último, la impresión de la portada en el documento se obtiene con el comando `\portadatesis`.

## La clase
Esta clase provee de algunas opciones que facilitan el trabajo de escribir una tesis y algunas variantes para los diferentes usos que pueda tener un archivo de tesis.

Empezaremos con la segunda. La tesis puede estar en tres versiones, una para verla en una pantalla. En este formato no hace falta poner cada capítulo nuevo en una página impar, podría estar en una página par y de hecho agiliza la lectura en un dispositivo así. Para obtener esta versión basta usar la opcion `openany` esto se hace escribiendo `\documentclass[openany]{tesisFC}`. Otra versión, la cual es la salida por defecto, es para una impersión en hojas tamaño carta. La intensión es que haya una versión "grande" e imprimible para la revisión de los sinodales. Finalmente, con la opción `imp` se obtiene una versión para la impresión en forma de libro —más chico que tamaño carta—. Esta opción hace más chica la caja de texto y pone marcas de corte para facilitar el trabajo de la imprenta y asegurar que no dejen un trabajo sin márgenes como he observado en algunos casos.

Para facilitar la escritura la clase carga por defecto algunos paquetes que son necesarios en casi cualquier posible tesis. Además detecta el tipo de compilación `pdfLaTeX` o `luaLaTeX` (se descartó `XeLaTeX` por no tener compatibilidad con `microtype` y porque su busqueda de fuentes no es tan buena como la de `luaLaTeX`. En este sentido podemos pensar a `luaLaTeX` como un supraconjunto de `XeLaTeX`) para cargar paquetes adecuados para cada tipo. La lista de paquetes para cada caso es:


| **pdfLaTeX**   | **luaLaTeX**   |
|:---------------|:---------------|
|`mathtools`     | `mathtools`    |
|`amsthm`        | `amsthm`       |
|                | `unicode-math` |
|`fontenc[T1]`   | `fontspec`     |
|`inputenc[utf8]`|                |
|`babel[mexico]` | `babel[mexico]`|
|`microtype`     | `microtype`    |
|`siunitx`       | `siunitx`      |

En el ejemplo adjunto con la clase se encuentra una breve descripción de la utilidad de cada uno de ellos. Además también hay ejemplos de algunos otros paquetes que pueden ser útiles para la creación de una tesis.

## Desiciones pendientes
En casi todas la tesis de matemáticas se usan deifiniciones, teoremas, proposiciones, etc. ¿Debería poner una definición de estos en la clase o dejar que el usuario decida los nombres en el preámbulo?
