import 'package:flutter/material.dart';
import 'package:githubrepo/components/icon.dart';
import 'package:githubrepo/components/text.dart';
import 'package:githubrepo/constants/spacings.dart';
import 'package:githubrepo/constants/typography.dart';
import 'package:githubrepo/utils/extensions/theme_data_extensions.dart';

class CustomEmptyState extends StatelessWidget {
  final String icon;
  final String description;

  const CustomEmptyState({
    super.key,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Spacings.s,
                horizontal: Spacings.m,
              ),
              child: CustomIcon(path: icon),
            ),
            const SizedBox(height: Spacings.m),
            CustomText(
              color: context.colors.kTextSecondaryColor,
              style: TypographyType.body,
              text: description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
