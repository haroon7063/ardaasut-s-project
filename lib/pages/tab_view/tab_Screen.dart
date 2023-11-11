import 'package:flutter/material.dart';
import 'package:fiverr_project_ardaasut/pages/discover/discover_screen.dart';
import 'package:fiverr_project_ardaasut/pages/home/home_screen.dart';
import 'package:fiverr_project_ardaasut/pages/my_journey/my_journey_screen.dart';
import 'package:fiverr_project_ardaasut/pages/story/story_screen.dart';
import 'package:fiverr_project_ardaasut/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    DiscoverScreen(),
    StoryScreen(),
    MyJourneyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Utils.backgroundColor,
      systemNavigationBarContrastEnforced: false,
    ));

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Utils.backgroundColor),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.explore,
                  text: 'Discover',
                ),
                GButton(
                  icon: Icons.library_books,
                  text: 'Story',
                ),
                GButton(
                  icon: Icons.checklist,
                  text: 'My Journey',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
