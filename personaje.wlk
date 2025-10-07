import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const cultivos = #{}
	

	method sembrar(cultivo){
		cultivos.add(cultivo)
		cultivo.position(self.position())
		game.addVisual(cultivo)
	}

	method regar(){
		const parcelaDeCultivoActual = self.position()
		const cultivoActual = cultivos.findOrElse({cultivo => cultivo.position() == parcelaDeCultivoActual},{game.say(self ,"No hya plantas para regar")})
		cultivoActual.crecer()
	}

	
}