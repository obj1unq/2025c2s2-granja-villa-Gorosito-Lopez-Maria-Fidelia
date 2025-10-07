import wollok.game.*

class Maiz {
	var property position = game.at(0,0)
	var estado = "baby"
	method image() {
		return "corn_" + estado + ".png"
	}
	method crecer(){
		estado = "adult"
	}

}

class Trigo {
	var evolucion = 0
	var property position = game.at(0,0)

	method image(){
		return "wheat_" + evolucion + ".png"
	}
	method crecer(){
		evolucion = evolucion + 1
	}
}

class Tomaco {
	var property position = game.at(0,0)

	method image() {
	  return "tomaco.png"
	}

	method crecer(){
		const siguientePosicion = self.position().up(1)
		if(siguientePosicion.y() == game.height()){
			game.removeVisual(self)
			self.position(game.at(self.position().x(),0))
			game.addVisual(self)
		}else{
			game.removeVisual(self)
			self.position(self.position().up(1))
			game.addVisual(self)
		}
	}
}