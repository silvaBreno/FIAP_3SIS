package br.com.fiap.todoapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.com.fiap.todoapp.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    //lateinit pq essa variavel vai ser iniciada dps
    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}