package br.com.fiap.checkpoint.data

import br.com.fiap.checkpoint.domain.CountryDataResultModel
import retrofit2.Response
import retrofit2.http.GET

interface ServiceApi {

    @GET("v1/paises/todos")
    suspend fun listCountries(): Response<List<CountryDataResultModel>>

}