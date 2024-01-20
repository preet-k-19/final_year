import 'package:flutter/material.dart';
import '../draw.dart';
import '../page_liquid_effect.dart';

class AppRoutes {
  static const String liquid = '/main.dart';

  // ignore: constant_identifier_names
  static const String pic_painter = '/the_img_paint.dart';

  static const String splashScreen = '/splash_screen';

  static const String regScreen = '/reg_screen';

  static const String loginScreen = '/login_screen';

  static const String dashboardScreen = '/dashboard_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {

    liquid: (context) => const liquid_Pages(),

    pic_painter: (context) => const ImagePainterExample(),

    //splashScreen: (context) => SplashScreen(),
    //regScreen: (context) => RegScreen(),
    //loginScreen: (context) => LoginScreen(),
    //dashboardScreen: (context) => DashboardScreen(),
    //appNavigationScreen: (context) => AppNavigationScreen()
  };
}
