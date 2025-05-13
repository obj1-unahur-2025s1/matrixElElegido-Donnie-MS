//personajes
object neo {
    var energiaActual = 100
    method esElElegido() = true
    method energia() = energiaActual
    method energia(valor) {
        energiaActual = valor
    }
    method vitalidad() = energiaActual/10
    method saltar() {
        energiaActual *= 0.5
    }
}

object trinity {
    method esElElegido() = false
    method vitalidad() = 0
    method saltar() {
      
    }
}

object morfeo {
    var vitalidadActual = 8
    var estaDescansado = true
    method esElElegido() = false
    method vitalidad() = vitalidadActual
    method vitalidad(valor) {
        vitalidadActual = valor
    }
    method saltar() {
        estaDescansado = not estaDescansado
        
        vitalidadActual = (vitalidadActual - 1).max(0)
    }
}

object nave {
    const pasajeros = #{neo, morfeo, trinity}
    method subirALaNave(unPersonaje) {
        pasajeros.add(unPersonaje)
    }
    method bajarDeLaNave(unPersonaje) {
        pasajeros.remove(unPersonaje)
    }
    method cuantosPasajerosHay() {
        pasajeros.size()
    }
    method elPasajeroDeMayorVitalidad() {
        return pasajeros.max({pasajero => pasajero.vitalidad() })
    }
    method elPasajeroDeMenorVitalidad() {
        return pasajeros.min({pasajero => pasajero.vitalidad()})
    }
    method equilibradaEnVitalidad() {
        return self.elPasajeroDeMenorVitalidad() * 2 <= self.elPasajeroDeMayorVitalidad()
    }
    method elElegidoEsta() {
        return pasajeros.any({pasajero => pasajero.esElElegido()})
    }
    method chocar() {
        pasajeros.forEach({ p => p.saltar() })
        pasajeros.clear()
    }
    method acelarar() {
        pasajeros.filter({ p => not p.esElElegido() }).forEach({ p => p.saltar() })
        pasajeros.remove(neo)
    }
}