import wollok.game.*
class Market{
	var property position 
	var mercaderia = []
	var property cantidadDeMonedas 

	method image(){
		return "market.png"
	}
	method agregarMercaderia(nuevaMercaderia){
		mercaderia = mercaderia + nuevaMercaderia
		cantidadDeMonedas = cantidadDeMonedas - (nuevaMercaderia.map{planta => planta.valor()}).sum()

	}

}
