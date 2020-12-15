import 'package:flutter/material.dart';
import '../model/route_path.dart';

class ServiceRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.length == 0) {
      return RoutePath.home();
    } else if (uri.pathSegments.length == 1) {
      final id = int.tryParse(uri.pathSegments.first);
      return RoutePath.results(id);
    } else {
      return RoutePath.unknown();
    }

    @override
    RouteInformation restoreRouteInformation(RoutePath path) {
      if (path.isHomePage) return RouteInformation(location: '/');
      if (path.isUnknown) return RouteInformation(location: '/404');
      if (path.isResultPage) return RouteInformation(location: '/${path.id}');
    }

    return null;
  }
}

class ServiceRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  RoutePath get currentConfiguration {}

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) {
    throw UnimplementedError();
  }
}
