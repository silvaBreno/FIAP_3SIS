package br.com.fiap.chatgpt.data

import java.io.Serializable

data class TalkModel(
    val question: String,
    val answers: List<AnswerModel>
): Serializable

data class AnswerModel(
    val answer: String,
    val hasShareAction: Boolean = false
): Serializable
//serializable utilizado para passar um atributo de uma activity para outra, sem ele o metodo goToAnswerActivity na parte do putextra iria dar erro
