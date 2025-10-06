import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const cultivos = #{}
	const parcelasDeCultivos = cultivos.map({cultivo => cultivo.position()})

	method sembrar(cultivo){
		cultivos.add(cultivo)
		cultivo.position(self.position())
		game.addVisual(cultivo)
	}

	method regar(){
		const parcelaDeCultivoActual = self.position()
		const cultivoActual = cultivos.find{cultivo => cultivo.position() == parcelaDeCultivoActual}
		//self.validarCultivoParaRegar(parcelaDeCultivoActual)
		//NO anda pq la validacion rompe :D
		cultivoActual.crecer()
	}

	method validarCultivoParaRegar(cultivo){
		if(not(parcelasDeCultivos.contains(cultivo))){
			self.error("No hay planta para regar"+ cultivos)
		}
	}
}