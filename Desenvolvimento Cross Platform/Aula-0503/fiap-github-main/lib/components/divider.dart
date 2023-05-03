import 'package:flutter/material.dart';
import 'package:github/constants/borders.dart';
import 'package:github/constants/spacings.dart';
import 'package:github/utils/extensions/theme_data_extensions.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  final double height;
  final double width;

  const CustomDivider({
    super.key,
    this.color,
    this.height = Spacings.zero,
    this.width = Spacings.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: Divider(
        color: color ?? context.colors.kDisabledColor,
        height: height,
        thickness: borderWidth,
      ),
    );
  }
}
