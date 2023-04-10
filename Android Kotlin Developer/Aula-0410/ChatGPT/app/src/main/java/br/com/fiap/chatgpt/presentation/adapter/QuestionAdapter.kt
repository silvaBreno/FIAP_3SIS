package br.com.fiap.chatgpt.presentation.adapter

import android.view.LayoutInflater
import androidx.recyclerview.widget.RecyclerView
import android.view.View
import android.view.ViewGroup
import br.com.fiap.chatgpt.R
import br.com.fiap.chatgpt.data.TalkDataSource.talkList
import br.com.fiap.chatgpt.data.TalkModel
import br.com.fiap.chatgpt.databinding.ViewQuestionItemBinding

class QuestionAdapter(
    private val talkList: List<TalkModel>
) : RecyclerView.Adapter<QuestionAdapter.QuestionViewHolder>(){
    //classe que vai gerar/criar lógicas na minha lista

    inner class QuestionViewHolder(
        itemView: View
    ): RecyclerView.ViewHolder(itemView) {
        private val binding = ViewQuestionItemBinding.bind(itemView)

        fun bind(item : TalkModel){
            binding.questionTitle.text = item.question
        }
    }
    //função que vai criar a minha celula
    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): QuestionViewHolder {
        return QuestionViewHolder(
            LayoutInflater.from(
                parent.context
            ).inflate(R.layout.view_question_item, parent, false)
        )
    }
    //o layoutinflater quem cria é a activity, por isso que nesse caso precisamos criar

    override fun onBindViewHolder(holder: QuestionViewHolder, position: Int) {
        holder.bind(
            talkList[position]
        )
    }

    override fun getItemCount(): Int {
        return talkList.size
    }
}