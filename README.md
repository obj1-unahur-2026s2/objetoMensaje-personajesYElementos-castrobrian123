# Juego con personajes y elementos

### Pautas para la resolución del ejercicio
Desarrollar la solución en el archivo:
- personajesElementos.wlk

No realizar cambios en nombre de archivo, ya que las correcciones solo tienen en cuenta los objetos modelados en los mismos. 
Respecto a los nombres de objetos y nombres de mensajes a utilizar en el modelado, remitirse al **glosario** de "nombres obligatorios" que está al pie de este documento (respetar mayúsculas y minúsculas). En caso que utilicen  nombres distintos, los test de las correcciones no funcionarán y restan puntos de la calificación. Tener en cuenta que pueden y algunas veces deben definir métodos y objetos auxiliares, pero los que figuran como obligatorios si o si tienen que existir para que corran los test, y deben cumplir la funcionalidad correcta.

---

### Enunciado
Nos piden modelar un juego en el que cada jugador maneja un conjunto de personajes (p.ej. guerreros, trabajadores, sacerdotes). En el juego hay distintos elementos (p.ej. casas, animales, ríos). Cuando un personaje se encuentra con un elemento, hace cosas que pueden afectar a ambos.

Como recién estamos empezando a aprender programación con objetos, vamos a modelar una situación muy reducida, en la que aparecen solamente:

- **luisa**, una _jugadora_,
- **floki**, un _personaje_ guerrero,
- **mario**, un _personaje_ trabajador,
- **ballesta** y **jabalina**, dos _armas_. `floki` tiene una de estas armas.
- **castillo**, **aurora** (que es una vaca) y **tipa** (que es un árbol), tres _elementos_. 

De cada elemento nos va a interesar la _altura_. El `castillo` mide 20 metros de alto, `aurora` 1 metro, la `tipa` arranca en 8 metros pero puede crecer (ya veremos cómo).
Además: debemos manejar el _nivel de defensa_ del `castillo` (un valor numérico que arranca en 150), y si `aurora` _está viva_ o no (nace viva).


<br>

## Encuentro entre personaje y elemento. 

El programa debe resolver el encuentro entre un personaje y un elemento.

Para eso, tanto `floki` como `mario` implementan el método `encontrar(elemento)`.


<br> 

### Floki 

Cuando `floki` encuentra un elemento, pasan dos cosas: el elemento recibe un ataque con un valor que es la potencia del arma, y el arma registra que ha sido usada. Hay una condición: que el arma esté cargada.

Veamos cómo debe reaccionar cada elemento al recibir un ataque:
- El `castillo` disminuye su nivel de defensa en la potencia del ataque (p.ej. si recibe un ataque de 30, disminuye el nivel de defensa en 30). 
- `aurora` muere si la potencia del ataque es 10 o más; si no, no le pasa nada. 
- a `tipa` no le pasa nada.

A su vez, respecto de las armas tenemos estas definiciones sobre la potencia, el uso, y cuándo se consideran cargadas:
- La `ballesta` nace con 10 flechas. Cada vez que se usa, pierde una flecha. Está cargada si tiene flechas. Su potencia es 4.
- La `jabalina` nace cargada. Se puede usar solamente una vez, o sea, con el primer uso deja de estar cargada. Su potencia es 30.


<br> 

### Mario

Pasemos ahora a describir que pasa cuando `mario` se encuentra con un elemento. 
Como es muy trabajador, nos va a interesar saber su valor recolectado, que arranca en cero y cuando se encuentra con algún elemento, éste le otorga puntos que va acumulando.

Veamos cómo es cada elemento respecto del valor que otorga cuando recibe un trabajo y lo que le pasa:
- El `castillo` otorga como valor el 20% de su defensa (o sea, su defensa / 5). 
  Al recibir un trabajo, aumenta su defensa en 20, hasta un tope de 200. O sea, si tiene 192 no pasa a 212, queda en 200 (atención acá: se puede usar `min`).
- `aurora` otorga como valor 15 unidades. Al recibir un trabajo, no le pasa nada.
- `tipa` otorga como valor el doble de su altura. Al recibir un trabajo, su altura crece en un metro (porque se supone que la riegan y le dan nitratos, ponele).

Se le tiene que poder preguntar a `mario` si _es feliz_ . <br> 
`mario` es feliz si: recolectó en total al menos 50 unidades de valor recolectado, o bien el último elemento con el que se encontró mide al menos 10 metros de alto. Arranca el juego sabiendo que `mario` estuvo con `aurora`.
¿que tiene que recordar también `mario`?

<br>

## Luisa

Es nuestra jugadora. En cada momento del juego, `luisa` está manejando uno de sus personajes, es el _personaje activo_. En este modelo reducido, el personaje activo de `luisa` puede ser o bien `floki` o bien `mario`. 

`luisa` debe entender el mensaje `aparece(unElemento)`. 
Cuando le llega este mensaje, `luisa` le dice a su personaje activo que encuentre al elemento. 
Luisa arranca con el personaje `mario` y puede cambiar de personaje las veces que quiera. 


### Glosario de nombres de objeto y mensajes obligatorios

#### **Objetos**
- luisa
- floki
- mario
- ballesta
- jabalina
- castillo
- aurora
- tipa

#### **Métodos**
- cambiarJugador
- aparece
- encontrar
- cambiarDeArma
- estaFeliz
- nivelDeDefesa
- recibirTrabajo
- altura
- recibirAtaque
- estaViva