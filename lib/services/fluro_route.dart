import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/results_page.dart';

class Routes {
  Routes._();

  static const String routeToResultPage = '/result';

  static final routes = <String, WidgetBuilder>{
    routeToResultPage: (BuildContext context) => ResultPage('1'),
  };
}

class FluroRoutes {
  static FluroRouter fluroRouter = FluroRouter();
  static const String routeToResultPage = '/result/:id';
  static void setupRouter() {
    var resultHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return ResultPage(params['id'][0]);
    });
    fluroRouter.define(routeToResultPage, handler: resultHandler);
  }
}
