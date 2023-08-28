package br.com.fiap.todoapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.com.fiap.todoapp.databinding.ActivityMainBinding
import br.com.fiap.todoapp.databinding.ViewFilterItemBinding

class MainActivity : AppCompatActivity() {

    //lateinit pq essa variavel vai ser iniciada dps
    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setupFilters()
    }

    private fun setupFilters(){
        //a funcao values retorna todos os valores q eu passei la no ENUM
        TaskStatus.values().forEach {
            val filterOption = ViewFilterItemBinding.inflate(
                layoutInflater,
                binding.taskFilters,
                false
            )
            //.filter pq eu dei o nome do id como "filter"
            filterOption.filter.text = it.title
            //a funcao addView espera que eu passe a view do Chip group como parametro para retornar a propria view
            binding.taskFilters.addView(filterOption.root)
        }
    }
}