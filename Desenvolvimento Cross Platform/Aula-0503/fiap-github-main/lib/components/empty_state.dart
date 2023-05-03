import 'package:flutter/material.dart';
import 'package:github/components/icon.dart';
import 'package:github/components/text.dart';
import 'package:github/constants/spacings.dart';
import 'package:github/constants/typography.dart';
import 'package:github/utils/extensions/theme_data_extensions.dart';

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
                vertical: Spacings.S,
                horizontal: Spacings.M,
              ),
              child: CustomIcon(path: icon),
            ),
            const SizedBox(height: Spacings.M),
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
