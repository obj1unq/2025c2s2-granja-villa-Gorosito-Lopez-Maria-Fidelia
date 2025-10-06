import wollok.game.*

class Maiz {
	var property position = game.at(0,0)
	method image() {
		// TODO: hacer que devuelva la imagen que corresponde
		return "corn_baby.png"
	}

}

class Trigo {
	var property evolucion = 0
	var property position = game.at(0,0)

	method image(){
		return "wheat_" + evolucion + ".png"
	}
}

class Tomaco {
	var property position = game.at(0,0)
	method image() {
	  return "tomaco.png"
	}
}