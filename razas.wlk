import roles.*

class Personaje{

  const property fuerza
  const property inteligencia
  var property rol 
  var property mascota = null

  method cambiarDeRol(nuevoRol){

    const roles = [guerrero, cazador, brujo]

    if(roles.contains(nuevoRol)){
     rol = nuevoRol
    }
  
  }

  method domar(unaMascota){
    if(self.rol().puedenTenerMascota()){
      mascota = unaMascota
    }
  }

  method potencialOfensivo(){
    return (rol.potencialFinal(self))
  }

  method esInteligente()

  method esGroso() = rol.esGroso(self)

}

class Orco inherits Personaje{
  override method esInteligente() = false
}

class Mascota{

  const property fuerza
  const property edad
  const property tieneGarras 

  method esLongeva() = edad > 10

}

class Humano inherits Personaje{
  override method esInteligente() = inteligencia > 50
}