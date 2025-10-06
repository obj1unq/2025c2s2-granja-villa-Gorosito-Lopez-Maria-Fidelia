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
	var property evolucion = 0
	var property position = game.at(0,0)

	method image(){
		return "wheat_" + evolucion + ".png"
	}
	method crecer(){
		evolucion =+ 1 
	}
}

class Tomaco {
	var property position = game.at(0,0)
	method image() {
	  return "tomaco.png"
	}
	method crecer(){
		if(self.position().up(1) == game.height()){
			self.position(game.at(self.position().x(),0))
			game.addVisual(self)
		}else{
			self.position().up(1)
		}
	}
}