import 'package:flutter/material.dart';
import 'package:githubrepo/components/all.dart';
import 'package:githubrepo/constants/spacings.dart';

import '../constants/typography.dart';
import '../mocks/repositories_mock.dart';
import '../models/repository.dart';

class RepoDetailScreen extends StatefulWidget {
  const RepoDetailScreen({super.key});

  @override
  State<RepoDetailScreen> createState() => _RepoDetailScreenState();
}

class _RepoDetailScreenState extends State<RepoDetailScreen> {
  final Repositories list = kRepositoriesMock;

  @override
  Widget build(BuildContext context) {
    Repository repository = list.elementAt(0);
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Detalhes',
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const CustomDivider(
                  height: Spacings.xl,
                ),
                SizedBox(
                  height: Spacings.xxxl,
                  width: Spacings.xxxl,
                  child: CustomAvatar(
                    avatarUrl: repository.owner?.avatar,
                  ),
                ),
                const CustomDivider(
                  height: Spacings.xl,
                ),
                const CustomText(
                  text: 'Repositório',
                  style: TypographyType.caption,
                ),
                CustomText(
                  text: '${repository.name}',
                  style: TypographyType.body,
                ),
                const CustomDivider(
                  height: Spacings.xl,
                ),
                const CustomText(
                  text: 'Dono do Repositório',
                  style: TypographyType.caption,
                ),
                CustomText(
                  text: repository.owner?.login ?? '- ',
                  style: TypographyType.body,
                ),
                const CustomDivider(
                  height: Spacings.xl,
                ),
                const CustomText(
                  text: 'Descrição',
                  style: TypographyType.caption,
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
