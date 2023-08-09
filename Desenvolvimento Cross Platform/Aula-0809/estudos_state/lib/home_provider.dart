import 'package:flutter/material.dart';

class HomeProvider extends InheritedWidget {
  final Widget child;
  final int counter;

  const HomeProvider({super.key, required this.child, required this.counter})
      : super(child: child);

  static HomeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeProvider>();
  }

  @override
  bool updateShouldNotify(HomeProvider oldWidget) {
    return true;
  }
}
