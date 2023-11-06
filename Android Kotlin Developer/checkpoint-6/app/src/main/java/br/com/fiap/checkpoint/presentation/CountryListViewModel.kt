package br.com.fiap.checkpoint.presentation

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import br.com.fiap.checkpoint.domain.CountryDataResultModel
import br.com.fiap.checkpoint.shared.DependencyFactory
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class CountryListViewModel : ViewModel() {

    val countriesSuccessState = MutableLiveData<List<CountryDataResultModel>>()
    val countriesErrorState = MutableLiveData<String>()

    suspend fun listCountries() {
        withContext(Dispatchers.Main) {
            val result = DependencyFactory.createRepository().listCountries()

            if (result.isSuccessful) {
                result.body()?.let {
                    countriesSuccessState.value = it
                }
            } else{
                countriesErrorState.value = "Ocorreu um erro ao buscar os países"
            }
        }
    }
}