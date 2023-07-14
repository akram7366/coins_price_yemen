import 'package:coins_price_yemen/theme.dart';
import 'package:coins_price_yemen/view/home.dart';
import 'package:coins_price_yemen/view/widget/navigation_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller.dart';

const appName = 'أسعار العملات';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: MaterialApp(
        theme: myTheme(),
        darkTheme: myTheme(brightness: Brightness.dark),
        themeMode: ThemeMode.system,
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        ),
        home: const MyStyleNavigationBar(child: MyHomePage()),
      ),
    );
  }
}
