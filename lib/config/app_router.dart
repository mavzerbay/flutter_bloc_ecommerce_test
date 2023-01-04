import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../models/models.dart' as models;

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Route name: \'${settings.name}\'');
    }
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(
            product: settings.arguments as models.Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(
            category: settings.arguments as models.Category);

      default:
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/error '),
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: Center(
              child: Text('No route defined for \'${settings.name}\''),
            ),
          ),
        );
    }
  }
}
