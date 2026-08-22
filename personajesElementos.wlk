/*
    Jugador maneja Personajes
    Elementos -> personaje los encuentra y provoca efectos
*/

//---------- JUGADORA ------------------

/*
    Jugadora
    En todo momento tiene un personaje activo (floki o mario, arranca en mario)
    Puede cambiarlo en cualquier momento las veces que quiera
    Entiende aparece(unElemento)
    - Indica al personaje activo que encuentre a ese elemento
*/
object luisa {
    var personajeActivo = mario

    method cambiarPersonaje(nuevoPersonaje) { personajeActivo = nuevoPersonaje } //setter
    method aparece(unElemento) { personajeActivo.encontrar(unElemento) }
}

//---------- PERSONAJES ------------------

/*
    Personaje guerrero
    Tiene alguna de las dos armas
    Método encontrar(elemento)
    - El elemento recibe ataque con valor = potencia del arma
    - El arma registra que fue usada, siempre y cuando esté cargada
*/
object floki {
    var armaActual = ballesta

    method cambiarDeArma(armaNueva) { armaActual = armaNueva }
    method encontrar(elemento) {
        if (armaActual.estaCargada()) {
            elemento.recibirAtaque(armaActual.potencia())
            armaActual.registrarUso()
        }
    }
}

/*
    Personaje trabajador
    Interesa saber su valor recolectado, que arranca en 0
    Método encontrar(elemento)
    - El elemento le otorga puntos que Mario acumula en el valor recolectado
    Sabe responder si es feliz, es feliz cuando:
    - Tiene al menos 50 de valor recolectado
    o
    - Último elemento que encontró mide al menos 10 metros de altura (arranca en aurora)
*/

object mario {
    var valorRecolectado = 0
    var ultimoElementoEncontrado = aurora

    method encontrar(elemento) {
        valorRecolectado += elemento.puntosQueOtorga()
        elemento.recibirTrabajo()
        ultimoElementoEncontrado = elemento
    }
    method estaFeliz() = valorRecolectado >= 50 or ultimoElementoEncontrado.altura() >= 10

}

//---------- ARMAS ------------------

/*
    Arma 1
    Potencia 4
    "Nace" con 10 flechas, cada vez que se usa pierde 1
    Está cargada cuando tiene flechas...
*/
object ballesta {
    var cantidadDeFlechas = 10

    method potencia() = 4
    method registrarUso() { cantidadDeFlechas -= 1 }
    method estaCargada() = cantidadDeFlechas > 0
}

/*
    Arma 2
    Potencia 30
    "Nace" cargada
    Se puede usar solo una vez, al usarla deja de estar cargada
*/
object jabalina {
    /*
    Encapsulamiento: Principio que indica que el ESTADO INTERNO de un objeto
    DEBE PERMANECER OCULTO para el resto. A menos que sea ESTRICTAMENTE NECESARIO
    acceder al mismo para modificarlo o consultarlo desde fuera de dicho objeto.
    */
    var estaCargada = true

    method potencia() = 30
    method registrarUso() { estaCargada = false }
    method estaCargada() = estaCargada //getter
}


//---------- ELEMENTOS --------------
/*
    Elemento 1
    Altura 20 m
    Nivel de defensa - arranca en 150
    Al recibir un ataque, disminuye defensa tanto como es la potencia del arma
    Otorga valor 20% de su defensa
    Al recibir trabajo, aumenta defensa en 20, con tope 200
*/
object castillo {

}

/*
    Elemento 2 - vaca
    Altura 1 m
    Está viva? Arranca viva
    Al recibir un ataque, muere si potencia del ataque es 10 o más, si no, no pasa nada
    Otorga valor 15
    Al recibir trabajo no pasa nada
*/
object aurora {
    method recibirTrabajo() { }
}

/*
    Elemento 3 - árbol
    Altura arranca en 8 m
    Al recibir un ataque, no pasa nada
    Otorga valor doble de altura
    Al recibir trabajo, altura crece 1 metro
*/
object tipa {
    method recibirAtaque(potenciaDelArma) { }
}