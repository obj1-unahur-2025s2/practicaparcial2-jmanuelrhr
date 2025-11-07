
class Localidad{
  var property personajes 

  method potencialOfensivo() = personajes.fold(0, {acum, p => acum + p.potencialOfensivo()})

  method agregarPersonaje(unPersonaje){
    if(!personajes.contains(unPersonaje)){
      personajes.add(unPersonaje)
    }
  }

  const property ejercitoDefensivo = personajes 
  const property tamaño // metros cuadrados

  method dejarInvasoresEnLocalidad(listaInvasores)

  method serDesalojada(ejercitoInvasor){
    if(ejercitoInvasor.size() > tamaño){
        const listaInvasores = ejercitoInvasor.sortedBy({ p, pSig => p.potencialOfensivo() > pSig.potencialOfensivo() }) 

        self.dejarInvasoresEnLocalidad(listaInvasores)
    } else {
        personajes = ejercitoInvasor
    }
  }
}

class Aldea inherits Localidad{
    method noTieneLimiteDeHabitantes() = false
    const capacidadMaximaHabitantes = tamaño*2

    override method agregarPersonaje(unPersonaje){
        if(!personajes.contains(unPersonaje) and personajes.size() <= capacidadMaximaHabitantes){
          personajes.add(unPersonaje)
        }
    }

    method aumentarPotencialPorDefecto(){}

    override method dejarInvasoresEnLocalidad(listaInvasores){
      personajes = listaInvasores.take(capacidadMaximaHabitantes)
      EjercitoInvasor.sacarPersonajes(listaInvasores, (listaInvasores.size() - capacidadMaximaHabitantes))
    }
}

class CiudadGrande inherits Localidad{
    method noTieneLimiteDeHabitantes() = true

    var potencialPorDefecto = 0

    method aumentarPotencialPorDefecto(){
        potencialPorDefecto += 300 
    }

    override method potencialOfensivo() = super() + potencialPorDefecto

    override method dejarInvasoresEnLocalidad(listaInvasores){
      personajes = listaInvasores.take(10)
      EjercitoInvasor.sacarPersonajes(listaInvasores, 10)
    }
}

class EjercitoInvasor{
    var property personajes

    const property potencialOfensivo = personajes.sum({ p => p.potencialOfensivo() })

    method esSuperiorAlaDe(unaLocalidad){
        return(potencialOfensivo > unaLocalidad.potencialOfensivo())
    }

    method atacar(unaLocalidad){
        if(self.esSuperiorAlaDe(unaLocalidad)){
            unaLocalidad.serDesalojada(personajes)
        } else {
            unaLocalidad.aumentarPotencialPorDefecto()
        }
    }

    method sacarPersonajes(listaInvasores, cantidad){
      personajes = listaInvasores
      personajes = listaInvasores.drop(cantidad)
    }
}
