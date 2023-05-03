import 'package:flutter/material.dart';
import 'package:github/constants/theme.dart';
import 'package:github/screens/search_screen.dart';

void main() {
  runApp(const GitHubApp());
}

class GitHubApp extends StatelessWidget {
  const GitHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub',
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      darkTheme: themeDark,
      home: const SearchScreen(),
    );
  }
}


//não podemos deixar telas aqui por isso utilizamos o screen
// apagamos o empty e criamos a searchscreen para substituir no metodo assim
