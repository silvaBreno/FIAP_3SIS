package br.com.fiap.checkpoint.data

import br.com.fiap.checkpoint.domain.CountryDataResultModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import retrofit2.Response

interface CountryRepository {

    suspend fun listCountries(): Response<List<CountryDataResultModel>>
}

class CountryRepositoryImpl (
    private val service: ServiceApi
): CountryRepository {
    override suspend fun listCountries(
    ): Response<List<CountryDataResultModel>> {
        return withContext(Dispatchers.IO) {
            service.listCountries()
        }
    }

}