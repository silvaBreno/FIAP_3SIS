import 'package:flutter/material.dart';
import 'package:github/components/all.dart';
import 'package:github/constants/assets.dart';
import 'package:github/constants/spacings.dart';
import 'package:github/constants/typography.dart';
import 'package:github/utils/extensions/theme_data_extensions.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

void main() => runApp(const StorybookApp());

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) => Storybook(
        stories: [
          Story(
            name: 'AppBar/Logo',
            builder: (context) {
              return Scaffold(
                appBar: CustomAppBar(
                  hasBackButton: context.knobs.boolean(
                    label: 'hasBackButton',
                    initial: false,
                  ),
                  backButtonPressed: () {
                    debugPrint('backButtonPressed');
                  },
                ),
              );
            },
          ),
          Story(
            name: 'AppBar/Text',
            builder: (context) {
              return Scaffold(
                appBar: CustomAppBar(
                  text: context.knobs.text(
                    label: 'Text',
                    initial: 'Storyboard',
                  ),
                  hasBackButton: context.knobs.boolean(
                    label: 'hasBackButton',
                    initial: false,
                  ),
                  backButtonPressed: () {
                    debugPrint('backButtonPressed');
                  },
                ),
              );
            },
          ),
          Story(
            name: 'AppBar/SearchBar',
            builder: (context) {
              return Scaffold(
                appBar: CustomAppBar(
                  hasBackButton: context.knobs.boolean(
                    label: 'hasBackButton',
                    initial: false,
                  ),
                  backButtonPressed: () {
                    debugPrint('backButtonPressed');
                  },
                  bottom: CustomSearchBar(
                    onChanged: (search) {
                      debugPrint(search);
                    },
                    onPressed: () {
                      debugPrint('onPressed');
                    },
                  ),
                ),
              );
            },
          ),
          Story(
            name: 'Avatar',
            builder: (context) {
              return const CustomAvatar(
                radius: Spacings.XXL,
              );
            },
          ),
          Story(
            name: 'Button',
            builder: (context) {
              return CustomButton(
                label: 'Search',
                isDisabled: context.knobs.boolean(
                  label: 'isDisabled',
                  initial: false,
                ),
                onPressed: () {
                  debugPrint('onPressed');
                },
              );
            },
          ),
          Story(
            name: 'Divider',
            builder: (context) {
              return const CustomDivider();
            },
          ),
          Story(
            name: 'EmptyState',
            builder: (context) {
              return const CustomEmptyState(
                icon: Assets.searchIcon,
                description:
                    'Aspernatur accusantium similique voluptatem veniam iusto sunt.',
              );
            },
          ),
          Story(
            name: 'Icon',
            builder: (context) {
              return const CustomIcon(
                path: Assets.searchIcon,
              );
            },
          ),
          Story(
            name: 'Loader',
            builder: (context) {
              return const CustomLoader();
            },
          ),
          Story(
            name: 'Logo',
            builder: (context) {
              return Container(
                color: context.colors.kAccentColor,
                child: CustomLogo(
                  path: context.knobs.options(
                    label: 'Logo',
                    initial: Logos.logoBlack,
                    options: [
                      const Option(
                        label: 'Black',
                        value: Logos.logoBlack,
                      ),
                      const Option(
                        label: 'White',
                        value: Logos.logoWhite,
                      ),
                    ],
                  ),
                  height: Spacings.XXL,
                ),
              );
            },
          ),
          Story(
            name: 'SearchBar',
            builder: (context) {
              return CustomSearchInput(
                hint: 'Find a repository...',
                onChanged: (text) {
                  debugPrint(text);
                },
              );
            },
          ),
          Story(
            name: 'Text',
            builder: (context) {
              return CustomText(
                text:
                    'Impedit rerum excepturi consequatur enim nam corporis ex non architecto.',
                style: context.knobs.options(
                  label: 'Logo',
                  initial: TypographyType.header,
                  options: [
                    const Option(
                      label: 'Header',
                      value: TypographyType.header,
                    ),
                    const Option(
                      label: 'Title',
                      value: TypographyType.title,
                    ),
                    const Option(
                      label: 'Body',
                      value: TypographyType.body,
                    ),
                    const Option(
                      label: 'Label',
                      value: TypographyType.label,
                    ),
                    const Option(
                      label: 'Button',
                      value: TypographyType.button,
                    ),
                    const Option(
                      label: 'Caption',
                      value: TypographyType.caption,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      );
}
