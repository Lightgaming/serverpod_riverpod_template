import 'package:flutter/material.dart';

class AppMaterialApp extends StatelessWidget {
  const AppMaterialApp({
    super.key,
    required this.home,
  });

  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: home,
    );
  }
}
