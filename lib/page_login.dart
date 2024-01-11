import 'package:flutter/material.dart';
import 'package:untitled2/src/persistant_navigate.dart';
import 'package:untitled2/src/utils/themes/theme.dart';

// ignore: camel_case_types
class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
          theme: TAppTheme.LightTheme,
        darkTheme: TAppTheme.DarkTheme,
    themeMode: ThemeMode.system,
      home:  const login_(),
      );
  }
}

// ignore: camel_case_types
class login_ extends StatefulWidget {
  const login_({super.key});

  @override
  State<login_> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text ("Sub-heading",style: Theme.of(context).textTheme.displayMedium,),
            Text("Paragraph",style: Theme.of(context).textTheme.displaySmall),
            ElevatedButton (onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => persistent_demo(),));
            }, child: const Text("Feed Page With Navigation Bar"), ),
            OutlinedButton (onPressed: () {}, child: const Text ("Outlined Button"),)

          ],
        ),
      ),
    );
  }
}
