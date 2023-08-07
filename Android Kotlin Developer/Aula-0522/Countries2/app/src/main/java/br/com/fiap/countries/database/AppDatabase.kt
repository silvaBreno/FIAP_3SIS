package br.com.fiap.countries.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase

const val COUNTRY_DATABASE_NAME = "COUNTRY_DATABASE_NAME"

//@database define que é uma classe q cuida do banco de dados
//entities define quais as classes
@Database(entities = [CountryModel::class], version = 1)
abstract class AppDatabase: RoomDatabase() {

    //aqui estou falando para o banco de dados criar todas as funções que ja existem na interface
    abstract fun countryDAO() : CountryDAO

    companion object{
        private var INSTANCE: AppDatabase? = null

        fun getDatabase(context: Context): AppDatabase{
            //criaando uma instancia
            val instance = Room.databaseBuilder(
                context,
                AppDatabase::class.java,
                COUNTRY_DATABASE_NAME
            ).allowMainThreadQueries() //nao façam isso em casa
                .build()

            //verifica se o INSTANCE É NULO -> NA PRIMEIRA VEZ O INSTANCE VAI CAIR NO INSTANCE e retornar INSTANCE,
            // NA SEGUNDA VEZ ELE JA VAI ESTAR INSTANCIADO E PORTANTO, INSTANCE VAI SER IGUAL instance e retorna instance
            return INSTANCE ?: let {
                INSTANCE = instance
                instance
            }
        }
    }
}