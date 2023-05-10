import 'package:flutter/material.dart';
import 'package:githubrepo/constants/spacings.dart';

class CustomLogo extends StatelessWidget {
  final String path;
  final Color? color;
  final double height;

  const CustomLogo({
    super.key,
    required this.path,
    this.color,
    this.height = Spacings.m,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        path,
        height: height,
      ),
    );
  }
}
