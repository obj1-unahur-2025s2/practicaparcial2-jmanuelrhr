
class Localidad{
  var property personajes 

  var property potencialOfensivoPorDefecto = 0

  method agregarPersonaje(unPersonaje){
    if(!personajes.contains(unPersonaje)){
      personajes.add(unPersonaje)
    }
  }

  method potencialOfensivoEjercito(){
    return (personajes.count({
        p => p.potencialOfensivo()
    }) + potencialOfensivoPorDefecto)
  }

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
}

class EjercitoInvasor{
    const property personajes

    method potencialOfensivo(){
      return (personajes.count({
       p => p.potencialOfensivo()
      }))
    }

    method atacarA(unaLocalidad){
        if(self.potencialOfensivo() < unaLocalidad.potencialOfensivoEjercito() and unaLocalidad.noTieneLimiteDeHabitantes()){
            unaLocalidad.potencialOfensivoPorDefecto() + 300
        } else {
            unaLocalidad.serDesalojada(personajes)
        }
    }
}
