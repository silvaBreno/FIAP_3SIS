package br.com.fiap.fibonacci

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.lifecycle.lifecycleScope
import br.com.fiap.fibonacci.databinding.ActivityMainBinding
import kotlinx.coroutines.launch

class MainActivity : AppCompatActivity() {

    lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setupButton()
    }

    private fun incrementFibonacci(sequenceNumber : Int){
        lifecycleScope.launch{
            binding.buttonIncrementFibonacci.isEnabled = false
            //parafazer o botao ficar desabilitado até o momento que ele trazer o valor da conta e habilitar novamente
            val fibonacciNumber: Int = CoroutineFactory.calculateFibonacci(
                sequenceNumber
            )
            binding.labelFibonacciNumber.text = "Valor do Fibonacci: $fibonacciNumber"
            binding.buttonIncrementFibonacci.isEnabled = true
        }
    }

    private fun setupButton(){
        var countClick = binding.labelFibonacciSequence.text.toString().toInt()
        binding.buttonIncrementFibonacci.setOnClickListener {
            countClick++
            incrementFibonacci(countClick)
            binding.labelFibonacciSequence.text = "Sequencia de Fibonacci: $countClick"
        }
    }
}