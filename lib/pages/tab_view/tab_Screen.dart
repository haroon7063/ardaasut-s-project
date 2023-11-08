import 'package:fiverr_project_ardaasut/pages/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Color(0xff23282C),
      systemNavigationBarContrastEnforced: false,
    ));
    return PersistentTabView(
      context,
      screens: [
        HomeScreen(),
        Icon(Icons.ac_unit),
        Icon(Icons.abc_sharp),
        Icon(Icons.travel_explore)
      ],
      backgroundColor: Color(0xff23282C),
      navBarStyle: NavBarStyle.style1,
      navBarHeight: 80,
      items: [
        PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            title: 'Home',
            inactiveColorPrimary: Colors.grey,
            activeColorPrimary: Colors.white),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.explore),
            title: 'Discover',
            inactiveColorPrimary: Colors.grey,
            activeColorPrimary: Colors.white),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.library_books),
            title: 'Story',
            inactiveColorPrimary: Colors.grey,
            activeColorPrimary: Colors.white),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.checklist),
            title: 'My Journey',
            inactiveColorPrimary: Colors.grey,
            activeColorPrimary: Colors.white),
      ],
    );
  }
}
