import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/overview_page.dart';
import '../pages/results_page.dart';

class FluroRoutes {
  static FluroRouter fluroRouter = FluroRouter();
  static const String routeToResultPage = '/result/:id/:sharedCheck';
  static const String routeToOverviewPage = '/overview';

  static Handler resultHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ResultPage(params['id'][0], params['sharedCheck'][0]);
  });

  static Handler overviewHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return OverviewPage();
  });

  static void setupRouter() {
    fluroRouter.define(routeToResultPage, handler: resultHandler);
    fluroRouter.define(routeToOverviewPage, handler: overviewHandler);
  }
}
