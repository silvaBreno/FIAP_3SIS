import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//após baixar a extensao awesome flutter
//começar a escrever statefulW para criar um projeto usando o widget Stateful
//depois nomear o projeto
//dar ctrl+. para importar o material.dart
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Se eu selecionar o Container e dar um control+.
      //wrap with widget
      //e insiro o SafeArea ele ajuda o Hello World não ficar na area onde os celular novos tem alguma parte que não aparece
      body: SafeArea(
        child: Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Text(
              'Hello World!',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.favorite,
              size: 100,
              color: Color(0xffEA1D5D),
            ),
          ],
        )

            // child: Text('Hello World!',
            //   style: TextStyle(
            //     color: Colors.blueAccent,
            //     fontSize: 50,
            //     fontWeight: FontWeight.bold,),

            // child: Icon(
            //   Icons.favorite,
            //   size: 100,
            //   color: Color(0xffEA1D5D),
            // ),

            // child: Image.asset('assets/svg/wholepizza.jpg'),

            // child: SvgPicture.asset(
            //   'assets/svg/wholepizza.svg',
            //color: Colors.blue,
            // ),
            ),
      ),
    );
  }
}
