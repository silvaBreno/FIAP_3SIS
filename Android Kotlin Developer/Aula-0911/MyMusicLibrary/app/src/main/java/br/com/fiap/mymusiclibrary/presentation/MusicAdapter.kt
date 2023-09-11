package br.com.fiap.mymusiclibrary.presentation

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.core.view.isVisible
import androidx.recyclerview.widget.RecyclerView
import br.com.fiap.mymusiclibrary.R
import br.com.fiap.mymusiclibrary.data.MusicModel
import br.com.fiap.mymusiclibrary.databinding.ViewMusicItemBinding

class MusicAdapter : RecyclerView.Adapter<MusicAdapter.MusicViewHolder>(){

    private val musicList: MutableList<MusicModel> = mutableListOf()

    inner class MusicViewHolder(

        private val view: ViewMusicItemBinding
    ): RecyclerView.ViewHolder(view.root){

        fun bindView(item: MusicModel){
            view.musicArtist.text = item.artist
            view.musicTitle.text = item.title
            view.musicFavorite.isVisible = item.favorite
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MusicViewHolder {

        //aqui definimos como nossa celula vai ser criada;
        val binding = ViewMusicItemBinding.bind(
            //layoutinflater é responsavel por fazer a renderização dos layouts e componentes
            // a funcao from pede um contexto e pegamos ele o parent pois ele é um ViewGroup
            //o R é um classe que o android sempre cria, ele pega tudo que é do pacote Res e cria no meu projeto
            LayoutInflater.from(parent.context).inflate(
                R.layout.view_music_item,
                parent,
                false
            )
        )
        return MusicViewHolder(binding)
    }

    fun setData(list: List<MusicModel>){
        musicList.clear()
        musicList.addAll(list)

        notifyDataSetChanged()
    }

    override fun getItemCount(): Int {
        return musicList.size;
    }

    override fun onBindViewHolder(holder: MusicViewHolder, position: Int) {
        holder.bindView(musicList[position])
    }



}