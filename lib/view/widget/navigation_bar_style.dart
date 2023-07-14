import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyStyleNavigationBar extends StatelessWidget {
  final Widget child;

  const MyStyleNavigationBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.background,
        systemNavigationBarIconBrightness:
            Theme.of(context).colorScheme.brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
      ),
      child: child,
    );
  }
}
