import 'package:flutter/material.dart';
import 'package:github/components/icon.dart';
import 'package:github/constants/assets.dart';
import 'package:github/constants/borders.dart';
import 'package:github/constants/spacings.dart';
import 'package:github/constants/typography.dart';
import 'package:github/utils/extensions/theme_data_extensions.dart';

class CustomSearchInput extends StatelessWidget {
  final String? hint;
  final void Function(String) onChanged;

  const CustomSearchInput({
    super.key,
    required this.onChanged,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorColor: context.colors.kAccentColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: typography[TypographyType.caption]?.copyWith(
          color: context.colors.kTextSecondaryColor,
        ),
        border: inputBorder(Colors.transparent),
        focusedBorder: inputBorder(context.colors.kAccentColor),
        focusColor: context.colors.kAccentColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: Spacings.M,
          horizontal: Spacings.M,
        ),
        filled: true,
        fillColor: context.colors.kBackgroundColor,
        prefixIcon: Container(
          alignment: Alignment.center,
          height: Spacings.XXL,
          width: Spacings.L,
          child: const CustomIcon(
            path: Assets.searchIcon,
            dimension: Spacings.M,
          ),
        ),
      ),
    );
  }
}
