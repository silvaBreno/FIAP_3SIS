import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github/constants/spacings.dart';
import 'package:github/utils/extensions/theme_data_extensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS || Platform.isMacOS
          ? CupertinoActivityIndicator(
              color: context.colors.kAccentColor,
              radius: Spacings.XXL,
            )
          : SizedBox.square(
              dimension: Spacings.XXL,
              child: CircularProgressIndicator(
                color: context.colors.kAccentColor,
                strokeWidth: Spacings.XS,
              ),
            ),
    );
  }
}
