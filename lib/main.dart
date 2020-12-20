import 'package:flutter/material.dart';
import './pages/home_page.dart';
import './services/routes.dart';

void main() {
  FluroRoutes.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '포켓몬 실전배틀 유형테스트 | 당신의 실전배틀 성향을 알아보세요!',
      initialRoute: '/',
      onGenerateRoute: FluroRoutes.fluroRouter.generator,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Jua',
      ),
      home: HomePage(),
    );
  }
}
