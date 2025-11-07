
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

  method serDesalojada(ejercitoInvasor){
    if(ejercitoInvasor.size() > tamaño){
        personajes = ejercitoInvasor.take(10)
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
}

class CiudadGrande inherits Localidad{
    method noTieneLimiteDeHabitantes() = true

    var potencialPorDefecto = 0

    method aumentarPotencialPorDefecto(){
        potencialPorDefecto += 300 
    }

    override method potencialOfensivo() = super() + potencialPorDefecto
}

class EjercitoInvasor{
    const property personajes

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
}

