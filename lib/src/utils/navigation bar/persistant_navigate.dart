import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:untitled2/colorPicking_page.dart';
import '../../../draw.dart';
import '../../../page_login.dart';

// ignore: camel_case_types
class persistent_Demo extends StatefulWidget {
  const persistent_Demo({super.key});

  @override
  State<persistent_Demo> createState() => _persistent_demoState();
}

// ignore: camel_case_types
class _persistent_demoState extends State<persistent_Demo> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: PersistentTabView(
          context,
          screens: screens(),
          items: _navBarsItems(),
          navBarStyle: NavBarStyle.style9,
        ),
      ),
    );
  }

  //list of class screens
  List<Widget> screens() {
    return [
      const home_Navigate(),
      color_picker(),
      const ImagePainterExample(),
      const login(),
      const profile_Navigate()
    ];
  }

  //navigation item style for each icon/pellete
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.paintbrush),
        title: ("Paint"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.bell),
        title: ("Notification"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

//Lists of classes tha will be called when tapped on the particular item

// ignore: camel_case_types
class home_Navigate extends StatelessWidget {
  const home_Navigate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Home navigation Page",style: Theme.of(context).textTheme.titleLarge),
        Lottie.asset("assets/json/lt.json")
      ],
    );
  }
}

// ignore: camel_case_types
class chat_Navigate extends StatelessWidget {
  const chat_Navigate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Chat Navigation Page",style: Theme.of(context).textTheme.titleLarge),
        Lottie.asset("assets/json/lt.json")
      ],
    );
  }
}

// ignore: camel_case_types
class noti_Navigate extends StatelessWidget {
  const noti_Navigate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Notification Handling Page",style: Theme.of(context).textTheme.titleLarge),
        Lottie.asset("assets/json/lt.json")
      ],
    );
  }
}

// ignore: camel_case_types
class profile_Navigate extends StatelessWidget {
  const profile_Navigate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Profile",style: Theme.of(context).textTheme.titleLarge),
        Lottie.asset("assets/json/lt.json")
      ],
    );
  }
}
