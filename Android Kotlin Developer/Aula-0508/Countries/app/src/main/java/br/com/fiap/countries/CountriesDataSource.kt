package br.com.fiap.countries

import br.com.fiap.countries.model.CountryModel

object CountriesDataSource {

    val countriesList: MutableList<CountryModel> = mutableListOf()

    //MUTABLELISTOF UTILIZADO PARA QUE NÃO SEJA NECESSÁRIO INICIAR COM DADOS A MUTABLELIST
    //NO KOTLIN TB EXISTE A LIST NORMAL DO JAVA, O PONTO É QUE SE UTILIZAMOS ELA NÃO CONSEGUIREMOS ADICIONAR OU REMOVER NOVOS ITENS TENHAMOS A INTENÇÃO DE INSERIR
}