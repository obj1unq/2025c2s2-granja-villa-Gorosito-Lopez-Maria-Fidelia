import personaje.*
import wollok.game.*

class Aspersor{
	const pj = personaje
	var property  position = game.at(0,0)
	const cultivos = pj.cultivos()

	method image(){
		return "aspersor.png"
	}
	
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