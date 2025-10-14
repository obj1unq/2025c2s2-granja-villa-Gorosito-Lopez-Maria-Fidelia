import wollok.game.*
import cultivos.*

object personaje {
	var property position = game.center()
	var property  cultivos = #{}
	const plantasCosechadas = #{}
	var oroAcumulado = 0
	var property genero = "f"
	
	method cambiarPersonaje(){
		estado.cambiarPersonaje(self)
	}

	method image(){
		return genero + "player.png"
	}

	method cultivoActual(){
		return cultivos.find{cultivo => cultivo.position() == self.position()}
		//Aca puedo no poner el findOrDefault ya que uso validaciones antes de preguntar por el cultivo actual 
	}

	method parcelasDondeHayCultivos(){
		return cultivos.map{cultivo => cultivo.position()}
		
	}

	method sembrar(cultivo){
		self.validarCultivoParaSembrar()
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

	method validarCultivoParaSembrar(){
		if(self.parcelasDondeHayCultivos().contains(self.position())){
		self.error("Ya hay un cultivo aca, no se puede sembrar otro")
	  }
	}
	
	method vender(){
		oroAcumulado = oroAcumulado + (plantasCosechadas.map{planta => planta.valor()}).sum()
		plantasCosechadas.clear()
		game.say(self, "Vendi mis plantas recolectadas")
	}

	method informar(){
		//game.say(self , "algo")
		game.say(self, "Tengo " + oroAcumulado +" monedas, y "+ plantasCosechadas.size() + " plantas para vender" )
	}

	method ponerAspersor(aspersor){
		aspersor.position(self.position()) 
		game.addVisual(aspersor)
		aspersor.regar()
	}
}


object estado{
	method esMujer(pj){
		return pj.genero()== "f"
	}
	method cambiarPersonaje(persona){
		if (self.esMujer(persona)){
			persona.genero("m")
		}else{
			persona.genero("f")
		}
	}
}