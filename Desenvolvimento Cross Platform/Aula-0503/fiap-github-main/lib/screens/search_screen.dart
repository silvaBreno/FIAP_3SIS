import 'package:flutter/material.dart';
import 'package:github/components/all.dart';
import 'package:github/components/app_bar.dart';
import 'package:github/components/avatar.dart';
import 'package:github/components/text.dart';
import 'package:github/constants/typography.dart';

import '../mocks/repositories_mock.dart';
import '../models/repository.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Repositories list = kRepositoriesMock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bottom: CustomSearchBar(
          onChanged: (search) => debugPrint('search'),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        //ele torna a lista scrollavel caso ultrapasse o tamanho da tela;
        child: Column(
          children: [
            const CustomText(
              text: 'Resultados',
              style: TypographyType.title,
            ),
            ListView.separated(
              physics:
                  const ClampingScrollPhysics(), // sensacao de scroll na tela
              shrinkWrap: true, //ajusta para o tamanho da tela
              itemCount: list.length,
              itemBuilder: (context, index) {
                Repository repository = list[index];
                return ListTile(
                  leading: CustomAvatar(
                    avatarUrl: repository.owner?.avatar,
                  ),
                  title: CustomText(
                    text: '${repository.name}',
                    style: TypographyType.body,
                  ),
                  subtitle: CustomText(
                    text: repository.owner?.login ??
                        '- ', // poderia ser isso '${repository.owner?.login}'
                    style: TypographyType.body,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const CustomDivider();
              },
            )
          ],
        ),
      )),
    );
  }
}

//o safe area ajuda proteger quando os celular tem uma camera no meio que "come" a tela
