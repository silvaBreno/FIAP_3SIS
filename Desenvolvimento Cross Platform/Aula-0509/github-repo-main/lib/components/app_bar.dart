import 'package:flutter/material.dart';
import 'package:githubrepo/components/icon.dart';
import 'package:githubrepo/components/logo.dart';
import 'package:githubrepo/components/text.dart';
import 'package:githubrepo/constants/assets.dart';
import 'package:githubrepo/constants/spacings.dart';
import 'package:githubrepo/constants/typography.dart';
import 'package:githubrepo/utils/extensions/theme_data_extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String? text;
  final bool hasBackButton;
  final VoidCallback? backButtonPressed;
  final PreferredSizeWidget? bottom;

  CustomAppBar({
    super.key,
    this.text,
    this.backButtonPressed,
    this.hasBackButton = false,
    this.bottom,
  }) : preferredSize = Size.fromHeight(
            bottom == null ? kToolbarHeight : kToolbarHeight * 2.5);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.kPrimaryColor,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      elevation: Spacings.zero,
      title: text == null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomLogo(
                  path: Logos.logoWhite,
                  height: kToolbarHeight,
                ),
                CustomText(
                  text: 'Repo',
                  color: context.colors.kBackgroundColor,
                  style: TypographyType.title,
                ),
              ],
            )
          : CustomText(
              text: text!,
              color: context.colors.kBackgroundColor,
              style: TypographyType.title,
            ),
      leading: hasBackButton
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: CustomIcon(
                path: Assets.arrowLeftIcon,
                color: context.colors.kBackgroundColor,
                dimension: Spacings.xl,
              ))
          : Container(),
      bottom: bottom,
    );
  }
}
