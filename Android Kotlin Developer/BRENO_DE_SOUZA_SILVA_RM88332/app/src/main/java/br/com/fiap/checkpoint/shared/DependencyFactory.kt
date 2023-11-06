package br.com.fiap.checkpoint.shared

import br.com.fiap.checkpoint.data.CountryRepository
import br.com.fiap.checkpoint.data.CountryRepositoryImpl
import br.com.fiap.checkpoint.data.ServiceApi
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object DependencyFactory {

    private const val BASE_URL = "https://servicodados.ibge.gov.br/api/"

    private val retrofit: Retrofit = Retrofit.Builder()
        .baseUrl(BASE_URL)
        .addConverterFactory(GsonConverterFactory.create())
        .build()

    private val serviceApi: ServiceApi = retrofit.create(
        ServiceApi::class.java
    )

    fun createRepository(): CountryRepository {
        return CountryRepositoryImpl(serviceApi)
    }
}