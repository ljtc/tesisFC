# TesisFC
Una clase para las tesis de la facultad de ciencias de la UNAM

## Introducción
Muchas universidades tienen un diseño de tesis para obtener un estándar de este tipo de publicación. Nuestra universidad y en particular la facultad de ciencias no tienen tal cosa. Esta clase se escribió con el propósito de empezar a hacer un diseño común para nuestras tesis, al menos para las tesis en LaTeX. He tomado muchas decisiones respecto al diseño, las más notorias son la tipografía y la caja de texto. Todas ellas están a discusión para lograr un buen diseño de tesis y podrían cambiarse.

Además la clase se escribió modificando la clase `memoir` así que todos los aspectos están escritos en "nivel alto" y son fáciles de modificar.

## Advertencia
Una de las desiciones más importantes respecto al diseño del documento es la fuente. Para este documento se eligió usar [Stix Two](https://www.stixfonts.org/) (Scientific and Technical Information Exchange). En la página del proyecto de fuente podrás encontrar algunas buenas razones para usar esta fuente. Otra razón por la cual se eligió esta fuente es porque es una fuente tipo Times, así es peada y compacta. Estas dos cualidades de la fuente hacen que se vea bien en impresiones de baja calidad y no usa tanto espacio por lo que reduce el número de páginas (como fue la intención del periódico *Times* al desarrollar su fuente Times New Roman). 

El problema de la fuente es que en algunas instalaciones de MikTeX no instala esta por defecto esta fuente. Así, si se compila con LuaLeTeX se generarán errores diciendo que no se encontró la fuente. En este caso habrá que instalarla manualmente siguiendo las instrucciones de la [página oficial](https://www.stixfonts.org/).

Gracias a Bryan por usar y compartir retroalimentación.

## Portada
En la clase se definen los siguientes comandos que deben escribirse en el
preámbulo del documento:
* `\author{}`
* `\title{}`
* `\date{}`
* `\tipo{}`
* `\grado{}`
* `\tutorW{}`
* `\tutor{}`

En realidad los primeros tres están definidos por LaTeX y se usó su "valor" en la portada.

El tipo puede ser `tesis`, `reporte de investigación`, `reporte de actividad docente`, `reporte de trabajo profesional`, `reporte de servicio social` o `reporte de divulgación`. Estos son todos los posibles métodos de titulación que requieren un trabajo escrito. No es necesario escribir en mayúsculas, en el diseño se usa `\MakeTextUppercase` para forzar una salida en mayúsculas. El comando `\tutorW{}` sirve para escribir la palabra "TUTOR" o "TUTORA", así que el valor que se le pasa debería ser `tutor` o `tutora`. De nuevo, no importa si se pasa en mayúsculas o minúsculas, la clase lo pondrá en mayúsculas.

El diseño de la portada es una modificación del código que proporcionaba la facultad hace algunos años con la adaptación necesaria para funcionar en la clase base de esta, `memoir`. Además es el mismo diseño que ofrece hoy el ![departamento  de computo](https://www.fciencias.unam.mx/sites/default/files/2020-08/caratulas.pdf), es decir, tiene el nombre de la facultad abajo del escudo. Además, en la misma página se puede ver que cuando se trata de una tesis la palabra "tesis" aparece diferente al resto de tipos de trabajo. La clase también puede ver el tipo de trabajo para escribirlo de acuerdo al diseño del departamento de computo.

Para la creación de la portada de usaron los paquetes `graphicx` y `xstring`, así que no hay necesidad de volver a cargarlos en el preámbulo de la tesis.

Por último, la impresión de la portada en el documento se obtiene con el comando `\portadatesis`.

## La clase
Esta clase provee de algunas opciones que facilitan el trabajo de escribir una tesis y algunas variantes para los diferentes usos que pueda tener un archivo de tesis.

Empezaremos con la segunda. La tesis puede estar en tres versiones, una para verla en una pantalla. En este formato no hace falta poner cada capítulo nuevo en una página impar, podría estar en una página par y de hecho agiliza la lectura en un dispositivo así. Para obtener esta versión basta usar la opcion `openany` esto se hace escribiendo `\documentclass[openany]{tesisFC}`. Otra versión, la cual es la salida por defecto, es para una impresión en hojas tamaño carta. La intensión es que haya una versión "grande" e imprimible para la revisión de los sinodales. Finalmente, con la opción `imp` se obtiene una versión para la impresión en forma de libro —más chico que tamaño carta—. Lo ideal sería usar esta opción junto con `showtrims` para que ponga marcas de corte. Las marcas de corte facilitaran el trabajo de la imprenta y nos aseguraremos que no quiten completamente los márgenes de la tesis. Finalmente, en la opción `imp` queda muy poco margen por lo que las imágenes que se hayan escrito en el margen del documento son trasladadas al cuerpo del documento de manera automática. Para cargar la clase con estas opciones se escribe `\documentclass[imp,showtrims]{tesisFC}`.

Para facilitar la escritura la clase carga por defecto algunos paquetes que son necesarios en casi cualquier posible tesis, taratando de cargar los menos posibles. Además detecta el tipo de compilación `pdfLaTeX` o `LuaLaTeX` (se descartó `XeLaTeX` por no tener compatibilidad con `microtype` y porque su búsqueda de fuentes no es tan buena como la de `LuaLaTeX`. En este sentido podemos pensar a `LuaLaTeX` como un supraconjunto de `XeLaTeX`) para cargar paquetes adecuados para cada tipo. La lista de paquetes para cada caso es:


| **pdfLaTeX**      | **luaLaTeX**      |
|:------------------|:------------------|
|`mathtools`        | `mathtools`       |
|`amsthm`           | `amsthm`          |
|                   | `unicode-math`    |
|`fontenc[T1]`      | `fontspec`        |
|`babel[...mexico]` | `babel[...mexico]`|
|`microtype`        | `microtype`       |
|`siunitx`          | `siunitx`         |

En el ejemplo adjunto con la clase se encuentra una breve descripción de la utilidad de cada uno de ellos. Además también hay ejemplos de algunos otros paquetes que pueden ser útiles para la creación de una tesis.

## ¿Será buena idea incluir lo siguiente en el ejemplo?
- [ ] Ejemplos básicos de Tikz (tal vez [latexdraw](https://latexdraw.com/) es suficiente)
- [ ] Ejemplos de diagramas conmutativos con `tikz-cd`
- [ ] Gráficas (de teoría de graficas) con `tkz-graph`
- [ ] Algo de geometría con `tkz-euclide`
- [ ] Ejemplos de enlaces y moléculas con `chemfig`
- [ ] Escribir código con `tcolorbox`
- [ ] Dibujar diagramas de Feynman con `tikz-feynman`
- [ ] Máquinas de Turing y circuitos eléctricos
- [ ] Animaciones con `animate` (aunque se requiere un visor de pdf específico)


---

La clase se puso a prueba en Linux con TeXLive y en MacOS con MacTeX (de nuevo TeXLive). Como no tengo acceso a ninguna computadora con Windows y MikTeX, es posible que haya algún problema. En este caso, o para cualquier otro problema puedes contactarme en `ljtc@ciencias.unam.mx` o por Telegram al usuario https://t.me/ljtc108
