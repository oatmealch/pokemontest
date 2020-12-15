import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemon_test/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

mixin PortraitModeMixin on StatelessWidget {
  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Jua',
      ),
      home: HomePage(),
    );
  }
}
