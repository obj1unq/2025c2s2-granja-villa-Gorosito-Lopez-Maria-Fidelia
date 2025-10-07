import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const cultivos = #{}
	const plantasCosechadas = #{}
 

	method cultivoActual(){
		return cultivos.find{cultivo => cultivo.position() == self.position()}
	}

	method parcelasDondeHayCultivos(){
		return cultivos.map{cultivo => cultivo.position()}
	}

	method sembrar(cultivo){
		cultivos.add(cultivo)
		cultivo.position(self.position())
		game.addVisual(cultivo)
	}

	method regar(){
		self.validarCultivo()
		self.cultivoActual().crecer()
	}

	method cosechar(){
		plantasCosechadas.add(self.cultivoActual())
		self.validarCultivo()
		self.cultivoActual().recolectar()
		cultivos.remove(self.cultivoActual())
	}

	method validarCultivo() {
	  if((self.parcelasDondeHayCultivos().contains(self.position())).negate()){
		self.error("No hay cultivo")
	  }
	}
	
}