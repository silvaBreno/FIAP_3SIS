package br.com.fiap.checkpoint.presentation

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.view.isVisible
import androidx.fragment.app.Fragment
import androidx.fragment.app.viewModels
import androidx.lifecycle.Observer
import androidx.lifecycle.lifecycleScope
import br.com.fiap.checkpoint.R
import br.com.fiap.checkpoint.databinding.FragmentCountryListBinding
import br.com.fiap.checkpoint.databinding.FragmentWelcomeBinding
import com.google.android.material.snackbar.Snackbar
import kotlinx.coroutines.launch


class CountryListFragment : Fragment() {

    private lateinit var binding: FragmentCountryListBinding
    private val viewModel: CountryListViewModel by viewModels()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = FragmentCountryListBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setupRecyclerView()
        setObservers()
        getCountries()
    }
    private fun setObservers() {
        viewModel.countriesErrorState.observe(
            viewLifecycleOwner,
            Observer {
                Snackbar.make(
                    binding.recyclerViewCountries,
                    it,
                    Snackbar.LENGTH_SHORT
                ).show()
            }
        )

        viewModel.countriesSuccessState.observe(
            viewLifecycleOwner,
            Observer {
                binding.recyclerViewCountries.isVisible = true
                countryListAdapter.setData(it)
            }
        )
    }

    private fun setupRecyclerView() {
        binding.recyclerViewCountries.setHasFixedSize(true)
        binding.recyclerViewCountries.adapter = countryListAdapter

    }

    private val countryListAdapter by lazy {
        CountryListAdapter()
    }

    private fun getCountries() {
        lifecycleScope.launch {
            viewModel.listCountries()
        }
    }
}
