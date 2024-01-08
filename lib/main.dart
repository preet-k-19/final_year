import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Demo2(),
    );
  }
}

class Demo2 extends StatefulWidget {
  @override
  State<Demo2> createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            Text("Hello,"),
            LiquidSwipe(
              pages: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                          image: const AssetImage("imgs/img.png"),
                          height: size.height * 0.5),
                      const Column(
                        children: [
                          Text("Thing Beyoud Limit ...",
                              style: TextStyle(
                                fontSize: 25,
                              )),
                          Text("Explore now ..."),
                        ],
                      ),
                      const Text(
                        "1/3 ...",
                        style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                          image: const AssetImage("imgs/ss.png"),
                          height: size.height * 0.5),
                      const Column(
                        children: [
                          Text("Thing Beyoud Limit ...",
                              style: TextStyle(
                                fontSize: 25,
                              )),
                          Text("Explore now ..."),
                        ],
                      ),
                      const Text(
                        "1/3 ...",
                        style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
                Container(color: Colors.black),
                Container(color: Colors.blue),
                Container(color: Colors.yellow),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
