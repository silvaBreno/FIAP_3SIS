package br.com.fiap.marvelapp.data

import br.com.fiap.marvelapp.domain.MarvelCharacterModel
import retrofit2.Response
import retrofit2.http.GET
import retrofit2.http.Query

interface MarvelService {

    //USAMOS O GET PORQUE QUEREMOS BATER EM UMA REQUISIÇÃO GET
    @GET("/v1/public/characters")
    suspend fun listCharacters(
        //o query passa na URL o valor que foi definido dentro dele
        @Query("timestamp")
        timestamp: String,
        @Query("apiKey")
        apiKey: String,
        @Query("hash")
        hash: String,
        @Query("offset")
        offset: Int = 1241
    ) : Response<MarvelCharacterModel>

    @GET("/v1/public/characters/{characterId}/comics")
    suspend fun listComics(
            @Query("timestamp") timestamp: String,
            @Query("apiKey") apiKey: String,
            @Query("hash") hash: String,
            @Path("characterId") characterId: Int
    ) : Response<ComicModel>
}