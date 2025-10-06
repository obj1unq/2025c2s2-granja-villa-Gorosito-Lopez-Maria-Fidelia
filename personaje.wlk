import wollok.game.*

object personaje {
	var property position = game.center()
	const property image = "fplayer.png"

	method sembrar(cultivo){
		cultivo.position(self.position())
		game.addVisual(cultivo)
	}

	
}