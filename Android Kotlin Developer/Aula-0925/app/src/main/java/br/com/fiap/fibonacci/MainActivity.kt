package br.com.fiap.fibonacci

import androidx.appcompat.app.AppCompatActivity

import androidx.activity.viewModels
import androidx.lifecycle.Observer
import androidx.lifecycle.lifecycleScope
import br.com.fiap.fibonacci.databinding.ActivityMainBinding
import com.google.android.material.snackbar.Snackbar
import kotlinx.coroutines.Job
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch

class MainActivity : AppCompatActivity() {

    lateinit var binding: ActivityMainBinding
    private val viewModel by viewModels<FibonacciViewModel>()
    private var coroutine: Job? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setupButton()
        setObservers()
    }

    private fun setObservers(){
        viewModel.fibonacciIsFinished.observe(this, Observer { fibonacciNumber ->
            Snackbar.make(binding.buttonIncrementFibonacci, "$fibonacciNumber", Snackbar.LENGTH_SHORT).show()
        })
    }

    private fun incrementFibonacci(sequenceNumber : Int){
        coroutine = lifecycleScope.launch{
            binding.buttonIncrementFibonacci.isEnabled = false
            //parafazer o botao ficar desabilitado até o momento que ele trazer o valor da conta e habilitar novamente
            val fibonacciNumber: Int = viewModel.calculateFibonnacci(
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

        binding.buttonStopFibonacci.setOnClickListener{
            binding.buttonIncrementFibonacci.isEnabled = true
            coroutine?.cancel()
        }
    }
}