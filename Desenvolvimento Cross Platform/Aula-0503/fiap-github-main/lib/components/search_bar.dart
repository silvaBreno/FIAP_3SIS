import 'package:flutter/material.dart';
import 'package:github/components/button.dart';
import 'package:github/components/search_input.dart';
import 'package:github/constants/spacings.dart';
import 'package:github/utils/extensions/theme_data_extensions.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final void Function(String) onChanged;
  final VoidCallback onPressed;

  const CustomSearchBar({
    super.key,
    required this.onChanged,
    required this.onPressed,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.kPrimaryColor,
      padding: const EdgeInsets.all(Spacings.M),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: CustomSearchInput(
              hint: 'Encontre um repositório',
              onChanged: onChanged,
            ),
          ),
          CustomButton(
            label: 'Pesquisar',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
