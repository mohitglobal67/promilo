import 'package:flutter/material.dart';
import 'package:promilo/utils/routes/routes_name.dart';
import 'package:promilo/view/discription/dstails_screen.dart';
import 'package:promilo/view/login/login_screen.dart';
import 'package:promilo/view/meetup/meetup_screen.dart';
import 'package:promilo/widget/bottomnav.dart';

class Routes {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      case RoutesName.metting:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MeetupScreen());

      case RoutesName.details:
        return MaterialPageRoute(
            builder: (BuildContext context) => DetailsScreen());
      case RoutesName.bottomnav:
        return MaterialPageRoute(builder: (BuildContext context) => Bottom());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
