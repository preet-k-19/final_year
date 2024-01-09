import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:untitled2/page_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final Lcontroller = LiquidController();
  int currentPage =0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Directionality(
            textDirection: TextDirection.ltr,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text("Hello,"),
                LiquidSwipe(
                  liquidController: Lcontroller,
                  onPageChangeCallback: onPageChnagedCallback,
                  pages: [
                    //1st
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                              image: const AssetImage("assets/images/img.png"),
                              height: size.height * 0.5),
                          const Column(
                            children: [
                              Text("Think Beyoud Limit ...",
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
                            height: 100,
                          )
                        ],
                      ),
                    ),
                    //2nd
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Lottie.asset("assets/json/lt.json",
                                //width: 250,
                                height: size.height * 0.5,
                                fit: BoxFit.fitWidth),
                          )
                          // ,Image(
                          //     image: const AssetImage("imgs/ss.png"),
                          //     height: size.height * 0.5),
                          ,
                          const Column(
                            children: [
                              Text("Customise Yuur Stuffs ...",
                                  style: TextStyle(
                                    fontSize: 25,
                                  )),
                              Text("As your thinking capability ..."),
                            ],
                          ),
                          const Text(
                            "2/3 ...",
                            style: TextStyle(
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                    //3rd
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.blueGrey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Image(
                                image: const AssetImage("assets/images/img.png"),
                                height: size.height * 0.5),
                          ),
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
                            "3/3 ...",
                            style: TextStyle(
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                    Container(color: Colors.blue),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.blue, Colors.white],
                        ),
                      ),
                    ),
                  ],
                  slideIconWidget: const Icon(Icons.arrow_back_ios),
                  enableSideReveal: true,
                ),

                Positioned(
                    bottom: 55,
                    child: OutlinedButton(
                      onPressed: () {
                        int nextpage = Lcontroller.currentPage + 1;
                        Lcontroller.animateToPage(page: nextpage);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black26),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: const Icon(Icons.arrow_forward_ios),
                      ),
                    )),
                //skip
                Positioned(
                    top: 40,
                    right: 20,
                    child: TextButton(
                      onPressed: () {
                        Lcontroller.jumpToPage(page: 2);
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )),
                //
                Positioned(
                    bottom: 20,
                    child: AnimatedSmoothIndicator(
                      activeIndex: Lcontroller.currentPage,
                      count: 5,
                      effect: const WormEffect(
                          activeDotColor: Colors.black, dotHeight: 5.0),
                    ))
              ],
            ),
        ));
  }
  void onPageChnagedCallback(int activePageIndex)
  {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
