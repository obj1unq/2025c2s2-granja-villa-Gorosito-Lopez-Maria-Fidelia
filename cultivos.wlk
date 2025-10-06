import wollok.game.*

class Maiz {
	method position() {
		// TODO: hacer que aparezca donde lo plante Hector
		return game.at(1, 1)
	}
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_baby.png"
	}

}

class Trigo {
	var property evolucion = 0
	method position(){
		return game.at(2,2)
	}

	method image(){
		return "wheat_" + evolucion + ".png"
	}
}

class Tomaco {
	method position() {
	  return game.at(3, 3)
	}
	method image() {
	  return "tomaco.png"
	}
}