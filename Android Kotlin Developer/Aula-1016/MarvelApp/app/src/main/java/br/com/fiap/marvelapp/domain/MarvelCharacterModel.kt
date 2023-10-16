package br.com.fiap.marvelapp.domain

import com.google.gson.annotations.SerializedName

data class MarvelCharacterModel(
    @SerializedName("data")
    val data: MarvelCharacterDataModel
)

data class MarvelCharacterDataModel(
    @SerializedName("results")
    val results: List<MarvelCharacterDataResultModel>
)

data class MarvelCharacterDataResultModel(
    @SerializedName("id")
    val id: Int?,
    @SerializedName("name")
    val name: String,
    @SerializedName("thumbnail")
    val thumbnail: MarvelCharacterDataResultThumbnailModel
) {
    fun getThumbnailFullUrl(): String? {
        //usamos o replace aqui apenas proque a API não carrega quando bate no protocolo HTTP
        // e por isso usamos o replace para mudar a string que volta da API de HTTP para HTTPS,
        // pois no HTTPS a API funciona e retorna a imagem normalmente
        return "${thumbnail.path?.replace(
            "http",
            "https"
        )}.${thumbnail.extension}"
    }
}

data class MarvelCharacterDataResultThumbnailModel(
    @SerializedName("path")
    val path: String?,
    @SerializedName("extension")
    val extension: String?
)