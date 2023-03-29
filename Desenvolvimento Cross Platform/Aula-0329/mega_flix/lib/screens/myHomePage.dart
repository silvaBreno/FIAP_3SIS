import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          __containerPrincipal(),
          
          Container(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "images/logo.png", 
                  width: 72,
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, 
                    icon: const FaIcon(
                      FontAwesomeIcons.home,
                      color: Colors.white,
                      ),
                    ),
                    IconButton(onPressed: (){}, 
                    icon: const FaIcon(
                      FontAwesomeIcons.user,
                      color: Colors.white,
                      ),
                    ),
                    IconButton(onPressed: (){}, 
                    icon: const FaIcon(
                      FontAwesomeIcons.searchengin,
                      color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

__containerPrincipal(){
  return Container(
            width: double.infinity,
            height: 600,
            decoration: const BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage("images/filmes.png"),
                fit:BoxFit.cover,
            ),
          ),
        );
}