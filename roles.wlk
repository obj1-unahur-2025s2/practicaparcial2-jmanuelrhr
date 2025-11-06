import razas.*

class Rol {
  method potencialExtra(personaje)
  method esGroso(personaje)
}

object guerrero inherits Rol{
  override method potencialExtra(personaje) = 100

  override method esGroso(personaje) = personaje.fuerza() > 50
}

object cazador inherits Rol{
  method puedenTenerMascota() = true

  override method potencialExtra(personaje){
    const mascotaDePersonaje = personaje.mascota()

    if(!mascotaDePersonaje.tieneGarras()){ 
       return mascotaDePersonaje.fuerza()
    } else {
       return mascotaDePersonaje.fuerza() * 2
    }
  }

  override method esGroso(personaje) = personaje.mascota().esLongeva()
}

object brujo inherits Rol{
  override method potencialExtra(personaje){
    if(personaje != Orco){
       return
    } else {
       return personaje.potencialOfensivo() * 0.1 
    }
  }

  override method esGroso(personaje) = true
}