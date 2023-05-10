import 'package:flutter/material.dart';
import 'package:githubrepo/components/icon.dart';
import 'package:githubrepo/constants/assets.dart';
import 'package:githubrepo/constants/spacings.dart';
import 'package:githubrepo/utils/extensions/theme_data_extensions.dart';

class CustomAvatar extends StatelessWidget {
  final String? avatarUrl;
  final double radius;

  const CustomAvatar({
    super.key,
    this.avatarUrl,
    this.radius = Spacings.l,
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
