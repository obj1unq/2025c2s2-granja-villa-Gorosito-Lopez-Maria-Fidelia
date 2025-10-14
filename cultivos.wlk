import personaje.*
import wollok.game.*


class Aspersor{
	var property pj = personaje
	var property  position = game.at(0,0)
	const cultivos = pj.cultivos()

	method image(){
		return "aspersor.png"
	}

	/*Que quiero? que por cada direccion siguiente del aspersor riegue
	Que necesito? La posicion del aspersor actual, sus siguientes direcciones
	poder regar segun direccion, regar depende del cultivo ya que crecer entiende
	solo cultivos*/
	
	method regar(){
		game.onTick(1000, "regar cada un segundo" ,{self.regarAlrededor()})
	}

	method regarAlrededor(){
		const alrededor = [position.up(1),position.down(1),position.right(1),position.left(1)]
		alrededor.forEach({direccion =>  const planta = cultivos.findOrDefault({ p => p.position() == direccion }, 0)
		if(planta != 0){
			planta.crecer()
		}})
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