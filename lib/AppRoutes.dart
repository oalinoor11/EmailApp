import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'HomeScreen.dart';


class AppRoutes {
  static const String HOMESCREEN = "/homescreen";

  static List<GetPage> routes = [
    GetPage(
        name: HOMESCREEN,
        page: () => HomeScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
  ];
}
