import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import './pages/home_page.dart';
import './services/routes.dart';

void main() async {
  FluroRoutes.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '포켓몬 실전배틀 유형테스트 | 당신의 실전배틀 성향을 알아보세요!',
      initialRoute: '/',
      onGenerateRoute: FluroRoutes.fluroRouter.generator,
      navigatorObservers: <NavigatorObserver>[observer],
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(
        analytics: analytics,
        observer: observer,
      ),
    );
  }
}
