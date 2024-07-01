import 'dart:ui';

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
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.stylus,
        },
      ),
      darkTheme: ThemeData.dark(),
      home: home,
    );
  }
}
