package br.com.fiap.countries.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase

const val COUNTRY_DATABASE_NAME = "COUNTRY_DATABASE_NAME"

@Database(entities = [CountryModel::class], version = 1)
abstract class AppDatabase: RoomDatabase() {

    abstract fun countryDAO(): CountryDAO

    companion object {
        private var INSTANCE: AppDatabase? = null

        fun getDatabase(context: Context): AppDatabase {
            if (INSTANCE != null) {
                return INSTANCE!! //as duas !! é uma forma de forçar para o kotlin de que não vai ser null
            } else {
                val instance = Room.databaseBuilder(
                    context,
                    AppDatabase::class.java,
                    COUNTRY_DATABASE_NAME
                ).allowMainThreadQueries().build() //gambiarra para rodar na thread main, mas não é bom porque trava o app
                INSTANCE = instance //vai definir o INSTANCE
                return instance //retornar instance
            }

//            return INSTANCE ?: let { //Se INSTANCE for null ?: vai chamar o let
//                val instance = Room.databaseBuilder(
//                    context,
//                    AppDatabase::class.java,
//                    COUNTRY_DATABASE_NAME
//                ).allowMainThreadQueries().build() //gambiarra para rodar na thread main, mas não é bom porque trava o app
//                INSTANCE = instance //vai definir o INSTANCE
//                instance //retornar instance
//            }
        }
    }

}