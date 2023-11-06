package br.com.fiap.checkpoint.domain

import android.os.Parcelable
import com.google.gson.annotations.SerializedName
import kotlinx.parcelize.Parcelize

//data class CountryModel(
//    @SerializedName("data")
//    val data: CountryDataModel
//)
//
//data class CountryDataModel(
//    @SerializedName("results")
//    val results: List<CountryDataResultModel>
//)

@Parcelize
data class CountryDataResultModel(
    @SerializedName("nome")
    val nome: CountryNomeModel?,
    @SerializedName("localizacao")
    val localizacao: CountryLocalizacaoModel?,
    @SerializedName("governo")
    val governo: CountryGovernoModel?
) : Parcelable

@Parcelize
data class CountryNomeModel(
    @SerializedName("abreviado")
    val abreviado: String?
) : Parcelable

@Parcelize
data class CountryLocalizacaoModel(
    @SerializedName("regiao")
    val regiao: CountryRegiaoModel?
) : Parcelable

@Parcelize
data class CountryRegiaoModel(
    @SerializedName("nome")
    val nome: String?
) : Parcelable

@Parcelize
data class CountryGovernoModel(
    @SerializedName("capital")
    val capital: CountryCapitalModel?
) : Parcelable

@Parcelize
data class CountryCapitalModel(
    @SerializedName("nome")
    val nome: String?
) : Parcelable