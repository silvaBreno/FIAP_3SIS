package br.com.fiap.chatgpt

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import br.com.fiap.chatgpt.databinding.ActivityChatBinding
import br.com.fiap.chatgpt.databinding.ActivityMainBinding

class ChatActivity : AppCompatActivity() {

    lateinit var binding: ActivityChatBinding

//    private val sharedMessage =

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityChatBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setupButtons()
        binding.textInputEditTextMessage.setText(
            intent.extras?.getString(Intent.EXTRA_TEXT) ?: "12345"
        ) //queremos pegar o valor do intent EXTRA TEXT desse objeto
    }

    fun setupButtons(){
        binding.buttonSendMessage.setOnClickListener{
            binding.messageValue.text = binding.textInputEditTextMessage.text
            clearText()
        }

        clearText()

        binding.buttonShareMessage.setOnClickListener {
            val sendIntent: Intent = Intent().apply {
                action = Intent.ACTION_SEND
                type = "text/plain"
                putExtra(
                    Intent.EXTRA_TEXT,
                    binding.messageValue.text.toString()
                )
            }

            val shareIntent = Intent.createChooser(
                sendIntent,
                getString(R.string.chooser_title)
            ) //no caso do Kotlin não precisamos declarar o valor da variavel, ele já vai entender qual é o tipo ao escolher ou igualar o método

           startActivity(shareIntent)
        }
    }

    private fun clearText(){
        //ele só vai chamar o clear() se ele tiver a segurança de que o texto não é nulo, por isso usamos o ? na frente
        binding.textInputEditTextMessage.text?.clear();
    }
}