package br.com.fiap.fibonacci

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
import kotlinx.coroutines.withContext

object CoroutineFactory {

    suspend fun calculateFibonacci(sequenceNumber: Int): Int{
        return withContext(Dispatchers.Default){
            async {
                //podemos colocar um delay para ele iniciar o calculo apenas dps de um determinado tempo
                calculate(sequenceNumber)
            }.await()
        }
    }

    private fun calculate(sequenceNumber: Int): Int {
        if(sequenceNumber <= 1){
            return sequenceNumber;
        } else {
            return calculate(sequenceNumber - 1) + calculate(sequenceNumber - 2)
        }
    }
}