
class Localidad{
  var property personajes 

  method potencialOfensivo() = personajes.fold(0, {acum, p => acum + p.potencialOfensivo()})

  method agregarPersonaje(unPersonaje){
    if(!personajes.contains(unPersonaje)){
      personajes.add(unPersonaje)
    }
  }

  const property ejercitoDefensivo = personajes 

  method serDesalojada(ejercitoInvasor)
}

class Aldea inherits Localidad{
    method noTieneLimiteDeHabitantes() = false
    const property tamaño // metros cuadrados
    const capacidadMaximaHabitantes = tamaño.div(personajes.size() / 2)

    override method agregarPersonaje(unPersonaje){
        if(!personajes.contains(unPersonaje) and personajes.size() <= capacidadMaximaHabitantes){
          personajes.add(unPersonaje)
        }
    }
    
    override method serDesalojada(ejercitoInvasor){
        personajes = ejercitoInvasor
    }
}

class CiudadGrande inherits Localidad{
    method noTieneLimiteDeHabitantes() = true

    override method serDesalojada(ejercitoInvasor){
        personajes = ejercitoInvasor
    }

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
        } else if(!self.esSuperiorAlaDe(unaLocalidad) and unaLocalidad.noTieneLimiteDeHabitantes()) {
            unaLocalidad.aumentarPotencialPorDefecto()
        }
    }
}
