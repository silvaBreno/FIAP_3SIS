import 'package:flutter/material.dart';
import 'package:github/components/icon.dart';
import 'package:github/constants/assets.dart';
import 'package:github/constants/spacings.dart';
import 'package:github/utils/extensions/theme_data_extensions.dart';

class CustomAvatar extends StatelessWidget {
  final String? avatarUrl;
  final double radius;

  const CustomAvatar({
    super.key,
    this.avatarUrl,
    this.radius = Spacings.L,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      child: avatarUrl != null
          ? CircleAvatar(
              radius: radius,
              backgroundColor: context.colors.kAccentColor,
              backgroundImage: NetworkImage(avatarUrl!),
            )
          : CustomIcon(
              path: Logos.invertocat,
              dimension: radius,
            ),
    );
  }
}
