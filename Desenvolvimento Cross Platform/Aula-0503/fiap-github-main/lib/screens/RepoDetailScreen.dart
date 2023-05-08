import 'package:flutter/material.dart';
import 'package:github/components/all.dart';
import 'package:github/constants/spacings.dart';

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
                  height: Spacings.XL,
                ),
                SizedBox(
                  height: Spacings.XXXL,
                  width: Spacings.XXXL,
                  child: CustomAvatar(
                    avatarUrl: repository.owner?.avatar,
                  ),
                ),
                const CustomDivider(
                  height: Spacings.XL,
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
                  height: Spacings.XL,
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
                  height: Spacings.XL,
                ),
                const CustomText(
                  text: 'Dono do Repositório',
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
