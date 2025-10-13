import personaje.*
import wollok.game.*


class Aspersor{
	var property position = game.at(0,0)
	method image(){
		return "aspersor.png"
	}
	
}


class Maiz {
	var property position = game.at(0,0)
	var estado = "baby"
	method image() {
		return "corn_" + estado + ".png"
	}
	method crecer(){
		estado = "adult"
	}
	method validarRecoleccion(){
		if(estado == "baby"){
			self.error("Aun no esta maduro el maiz")
		}
	}
	method recolectar(){
		game.removeVisual(self)
	}
	method valor(){
		return 150
	}

}

class Trigo {
	var evolucion = 0
	var property position = game.at(0,0)

	method image(){
		return "wheat_" + evolucion + ".png"
	}
	method crecer(){
		if(evolucion <= 2){
		evolucion = evolucion + 1
		}
	}
	method validarRecoleccion(){
		if(evolucion < 2){
			self.error("El trigo no esta lo suficientemente evolucionado para recogerlo")
		}
	}
	method recolectar(){
		self.validarRecoleccion()
		game.removeVisual(self)
	}
	method valor() {
	  return (evolucion - 1) * 100
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

	method recolectar(){
		game.removeVisual(self)
	}

	method valor() {
	  return 80
	}
}