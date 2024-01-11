import 'package:flutter/material.dart';
import 'app routes/app_route.dart';
import 'package:untitled2/src/utils/themes/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // ignore: constant_identifier_names
  static const String app_Name = "Clothify";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: app_Name,

      theme: TAppTheme.LightTheme,
      darkTheme: TAppTheme.DarkTheme,
      themeMode: ThemeMode.system,

      routes: AppRoutes.routes,
      initialRoute: AppRoutes.liquid,

      //home: const Demo2(),
    );
  }
}
