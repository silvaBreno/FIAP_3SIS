package br.com.fiap.checkpoint.presentation

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import br.com.fiap.checkpoint.R
import br.com.fiap.checkpoint.databinding.FragmentWelcomeBinding

class WelcomeFragment : Fragment(){

    private lateinit var binding: FragmentWelcomeBinding
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {

        binding = FragmentWelcomeBinding.inflate(inflater, container, false)

        binding.buttonListCountries.setOnClickListener{
            findNavController().navigate(R.id.action_welcomeFragment_to_countryListFragment)
        }

        return binding.root
    }
}