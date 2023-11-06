package br.com.fiap.checkpoint.presentation

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import br.com.fiap.checkpoint.R
import br.com.fiap.checkpoint.databinding.ViewCountryItemBinding
import br.com.fiap.checkpoint.domain.CountryDataResultModel

class CountryListAdapter : RecyclerView.Adapter<CountryListAdapter.CountryItemViewHolder>()  {

    private val countryList: MutableList<CountryDataResultModel> = mutableListOf()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CountryItemViewHolder {
        val binding = ViewCountryItemBinding.bind(
            LayoutInflater.from(parent.context).inflate(
                R.layout.view_country_item,
                parent, false
            )
        )
        return CountryItemViewHolder(binding)
    }

    override fun onBindViewHolder(holder: CountryItemViewHolder, position: Int) {
        holder.bindView(countryList[position])
    }

    override fun getItemCount(): Int {
        return countryList.size
    }

    fun setData(list: List<CountryDataResultModel>){
        countryList.clear()
        countryList.addAll(list)
        notifyDataSetChanged()
    }

    inner class CountryItemViewHolder(
        private val view: ViewCountryItemBinding
    ) : RecyclerView.ViewHolder(view.root) {

        fun bindView(country: CountryDataResultModel){
            with(view.root){
                view.countryShortName.text = country.nome?.abreviado
                view.locationRegionName.text = country.localizacao?.regiao?.nome
                view.governmentCapitalName.text = country.governo?.capital?.nome
            }
        }
    }
}