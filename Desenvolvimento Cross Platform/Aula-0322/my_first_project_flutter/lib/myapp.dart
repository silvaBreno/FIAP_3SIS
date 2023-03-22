import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_first_project_flutter/user_screen.dart';

//dar comando stl statelessWidget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //o buildcontext é responvel por retornar o contexto que esse código se encontra
    return MaterialApp(
      debugShowCheckedModeBanner: false, //remover a marca d'agua
      home: Scaffold(
        appBar: AppBar(
          elevation: 20,
          backgroundColor: Colors.black,
          title: const Text(
            "Meu App",
            style: TextStyle(
              color: Colors.purple,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.home),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => UserScreen()));
                  },
                  icon: FaIcon(FontAwesomeIcons.user),
                ),
              ],
            ),
          ],
        ),
        //Parte 1 - ENSINANDO A PARTE DE COLOCAR CAIXAS
        // body: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: SizedBox( //criar uma caixa tem alutra, largura e filho. Ao contrario do container que tem muito mais propriedades
        //     height: double.infinity,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment
        //           .spaceAround, //espaçamento around "parecido com o css"
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       //: MainAxisAlignment.spaceBetween, //espaçamento entre elas
        //       children: [
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.blue,
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.pink,
        //         ),
        //         Container(
        //           width: 100,
        //           height: 100,
        //           color: Colors.orange,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        //Inicio da parte 2
        body: Center(
          child: Image.network(
            "https://images.contentstack.io/v3/assets/blt00454ccee8f8fe6b/blt97c1bbee61038a73/5fda86f202fd0c7d345f09a1/US_EmeraldLake_BritishColumbia_Header.jpg?width=1680&quality=70&auto=webp",
            width: 600,
            height: 600,
          ),
        ),
      ),
    );
  }
}
