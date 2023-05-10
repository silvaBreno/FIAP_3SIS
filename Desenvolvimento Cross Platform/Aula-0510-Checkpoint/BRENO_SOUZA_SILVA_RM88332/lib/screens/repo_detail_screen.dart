import 'package:flutter/material.dart';
import 'package:githubrepo/constants/spacings.dart';
import 'package:githubrepo/constants/typography.dart';
import 'package:githubrepo/models/repository.dart';

import '../components/all.dart';
import '../mocks/repositories_mock.dart';

class RepoDetailScreen extends StatefulWidget {
  const RepoDetailScreen({super.key});

  @override
  State<RepoDetailScreen> createState() => _RepoDetailScreenState();
}

class _RepoDetailScreenState extends State<RepoDetailScreen> {
  final Repositories list = kRepositoriesMock;

  @override
  Widget build(BuildContext context) {
    Repository repository = list[0];
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Detalhes',
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const CustomDivider(
                  height: Spacings.xl,
                ),
                SizedBox(
                  height: Spacings.xxxxl,
                  width: Spacings.xxxxl,
                  child: CustomAvatar(
                    avatarUrl: repository.owner?.avatar,
                  ),
                ),
                const CustomDivider(
                  height: Spacings.xl,
                ),
                const CustomText(
                  text: 'Repositório:',
                  style: TypographyType.label,
                  color: Color(0xff2485E5),
                ),
                CustomText(
                  text: '${repository.name}',
                  style: TypographyType.header,
                ),
                const CustomDivider(
                  height: Spacings.xl,
                ),
                const CustomText(
                  text: 'Dono do Repositório:',
                  style: TypographyType.label,
                  color: Color(0xff2485E5),
                ),
                CustomText(
                  text: repository.owner?.login ?? '- ',
                  style: TypographyType.title,
                ),
                const CustomDivider(
                  height: Spacings.xl,
                ),
                const CustomText(
                  text: 'Descrição:',
                  style: TypographyType.label,
                  color: Color(0xff2485E5),
                ),
                CustomText(
                  text: repository.description ?? '- ',
                  style: TypographyType.body,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
