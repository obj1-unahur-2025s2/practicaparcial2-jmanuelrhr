import razas.*

class Rol {
  method potencialFinal(unPersonaje)
  method esGroso(unPersonaje)
}

object guerrero inherits Rol{
  override method potencialFinal(unPersonaje) = (unPersonaje.fuerza() * 10 ) + 100
  override method esGroso(unPersonaje) = unPersonaje.fuerza() > 50
}

object cazador inherits Rol{
  method puedenTenerMascota() = true

  override method potencialFinal(unPersonaje){
    const mascotaDePersonaje = unPersonaje.mascota()

    if(!mascotaDePersonaje.tieneGarras()){ 
       return mascotaDePersonaje.fuerza()
    } else {
       return mascotaDePersonaje.fuerza() * 2
    }
  }

  override method esGroso(unPersonaje) = unPersonaje.mascota().esLongeva()
}

object brujo inherits Rol{
  override method potencialFinal(unPersonaje){
    var potencial = (unPersonaje.fuerza() * 10 )

    if(!unPersonaje.esInteligente()){
       potencial += potencial * 0.1 
    }

    return potencial
  }

  override method esGroso(unPersonaje) = true
}