import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../page_login.dart';

class persistent_demo extends StatefulWidget {
  const persistent_demo({super.key});

  @override
  State<persistent_demo> createState() => _persistent_demoState();
}

class _persistent_demoState extends State<persistent_demo> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Persistent"),
          elevation: 0,
          backgroundColor: Colors.blueGrey,
        ),
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
      Home_navigate(),

      Chat_navigate(),
      login(),
      Profile_navigate()
    ];
  }

  //navigation item style for each icon/pellete\
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
        icon: const Icon(CupertinoIcons.bell),
        title: ("Notifivation"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: ("Prifle"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}

//Lists of classes tha will be called when tapped on the particular item

class Home_navigate extends StatelessWidget {
  const Home_navigate({super.key});

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

class Chat_navigate extends StatelessWidget {
  const Chat_navigate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Chat Navigation Page",style: Theme.of(context).textTheme.titleLarge),
        Lottie.asset("assets/json/lt.json")
      ],
    );;
  }
}

class Noti_navigate extends StatelessWidget {
  const Noti_navigate({super.key});

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

class Profile_navigate extends StatelessWidget {
  const Profile_navigate({super.key});

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
