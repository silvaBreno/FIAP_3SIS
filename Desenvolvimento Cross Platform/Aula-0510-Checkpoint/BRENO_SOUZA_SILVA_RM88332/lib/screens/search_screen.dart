import 'package:flutter/material.dart';
import 'package:githubrepo/components/all.dart';
import 'package:githubrepo/constants/spacings.dart';
import 'package:githubrepo/constants/typography.dart';
import 'package:githubrepo/mocks/repositories_mock.dart';
import 'package:githubrepo/models/repository.dart';
import 'package:githubrepo/utils/extensions/theme_data_extensions.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Repositories repositories = kRepositoriesMock;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.compact(locale: 'pt_BR');

    return Scaffold(
      appBar: CustomAppBar(
        bottom: CustomSearchBar(
          onChanged: (search) => debugPrint('search'),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(Spacings.l),
                child: CustomText(
                  text: '${formatter.format(repositories.length)} Resultados',
                  textAlign: TextAlign.start,
                  style: TypographyType.header,
                ),
              ),
              ListView.separated(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: repositories.length,
                itemBuilder: (context, index) {
                  return repositoryItem(repositories[index]);
                },
                separatorBuilder: (context, index) {
                  return const CustomDivider();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile repositoryItem(Repository item) {
    return ListTile(
      leading: CustomAvatar(
        avatarUrl: item.owner?.avatar,
        radius: Spacings.xl,
      ),
      title: CustomText(
        text: item.name ?? '-',
        style: TypographyType.title,
      ),
      subtitle: CustomText(
        text: item.owner?.login ?? '-',
        color: context.colors.kAccentColor,
        style: TypographyType.label,
      ),
    );
  }
}
