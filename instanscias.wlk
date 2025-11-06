import roles.*
import localidadesYEjercitos.*
import razas.*

const humano1 = new Humano(fuerza=4, inteligencia=12, rol=cazador)
const humano2 = new Humano(fuerza=8, inteligencia=9, rol=guerrero)
const humano3 = new Humano(fuerza=7, inteligencia=9, rol=brujo)
const humano4 = new Humano(fuerza=9, inteligencia=7, rol=guerrero)
const humano5 = new Humano(fuerza=5, inteligencia=11, rol=brujo)
const humano6 = new Humano(fuerza=6, inteligencia=8, rol=guerrero)
const humano7 = new Humano(fuerza=4, inteligencia=9, rol=brujo)
const humano8 = new Humano(fuerza=6, inteligencia=10, rol=brujo)

const mascota1 = new Mascota(fuerza=3, edad=11, tieneGarras=true)

const orco1 = new Orco(fuerza=10, inteligencia=3, rol=guerrero)
const orco2 = new Orco(fuerza=9, inteligencia=6, rol=brujo)
const orco3 = new Orco(fuerza=11, inteligencia=4, rol=guerrero)
const orco4 = new Orco(fuerza=8, inteligencia=5, rol=brujo)
const orco5 = new Orco(fuerza=11, inteligencia=4, rol=guerrero)
const orco6 = new Orco(fuerza=12, inteligencia=3, rol=guerrero)

const aldea1 = new Aldea(tamaño=20, personajes=[humano1, humano2, humano3])
const ciudad1 = new CiudadGrande(personajes=[humano4, humano5, humano6, humano7, humano8])

const ejercitoInvasor1 = new EjercitoInvasor(personajes=[orco1, orco2,orco3, orco4, orco5, orco6])