import 'package:flutter/material.dart';
import 'package:untitled2/src/utils/themes/theme.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
          theme: TAppTheme.LightTheme,
        darkTheme: TAppTheme.DarkTheme,
    themeMode: ThemeMode.system,
      home:  login_(),
      );


  }
}

class login_ extends StatefulWidget {
  const login_({super.key});

  @override
  State<login_> createState() => _loginState();
}

class _loginState extends State<login_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text ("Sub-heading",style: Theme.of(context).textTheme.displayMedium,),
          Text("Paragraph",style: Theme.of(context).textTheme.displaySmall),
          ElevatedButton (onPressed: () {}, child: const Text("Elevated Button"), ),
          OutlinedButton (onPressed: () {}, child: const Text ("Outlined Button"),)

        ],
      ),
    );
  }
}
