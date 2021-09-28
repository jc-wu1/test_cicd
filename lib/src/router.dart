import 'package:flutter/material.dart';
import 'package:test_cicd/src/account.dart';
import 'package:test_cicd/src/cart.dart';
import 'package:test_cicd/src/constants.dart';
import 'package:test_cicd/src/myhomepage.dart';
import 'package:test_cicd/src/newpage.dart';
import 'package:test_cicd/src/profile.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case RoutesName.account:
        return MaterialPageRoute(builder: (_) => const Account());
      case RoutesName.profile:
        return MaterialPageRoute(builder: (_) => const Profile());
      case RoutesName.cart:
        return MaterialPageRoute(builder: (_) => const Cart());
      case RoutesName.newPage:
        return MaterialPageRoute(builder: (_) => const NewPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
