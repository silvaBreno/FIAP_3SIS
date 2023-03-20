package br.com.fiap.moneymask

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import br.com.fiap.moneymask.databinding.ActivityMainBinding
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

//    val toggleButton : Button = findViewById(R.id.toggle_button)
    lateinit var binding: ActivityMainBinding
    private val mask: String = "******"
    private var value: String? = null
    private var buttonState : ButtonState = ButtonState.HIDE_VALUE

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //        toggle_button.setText("Text")
        binding = ActivityMainBinding.inflate(layoutInflater)
        //binding.moneyCurrency
        setContentView(binding.root)
        clickToggleButton()
    }

    override fun onStart() {
        super.onStart()
        showValue()
        binding.root.setBackgroundColor(resources.getColor(R.color.black))
    }

    override fun onResume() {
        super.onResume()
        showValue()
        binding.root.setBackgroundColor(resources.getColor(R.color.purple_200))
    }

    override fun onStop() {
        super.onStop()
        hideValue()
        binding.root.setBackgroundColor(resources.getColor(R.color.white))
    }

    override fun onPause() {
        super.onPause()
        hideValue()
        binding.root.setBackgroundColor(resources.getColor(R.color.teal_700))
    }

    fun clickToggleButton(){
        //value?.length
        value = binding.moneyValue.text.toString();
        binding.toggleButton.setOnClickListener{

            when(buttonState) {
                ButtonState.HIDE_VALUE -> {
                    hideValue()
                }
                ButtonState.SHOW_VALUE -> {
                    showValue()
                }
            }

        }
    }


    fun showValue(){
        binding.moneyValue.text = value
        buttonState = ButtonState.HIDE_VALUE
        binding.toggleButton.text = getString(buttonState.buttonTextResId)
    }

    fun hideValue(){

        binding.moneyValue.text = mask
        buttonState = ButtonState.SHOW_VALUE
        binding.toggleButton.text = getString(buttonState.buttonTextResId)
    }
}