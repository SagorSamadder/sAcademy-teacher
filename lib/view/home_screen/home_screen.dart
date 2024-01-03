// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_question/add_question.dart';
import 'all_screen_code/home_section.dart';
import 'all_screen_code/profile.dart';
import 'all_screen_code/report.dart';
import 'all_screen_code/setting.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //setting the expansion function for the navigation rail
  bool isExpanded = false;
  // ignore: prefer_final_fields
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //Let's start by adding the Navigation Rail
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            extended: isExpanded,
            backgroundColor: Colors.deepPurple.shade400,
            unselectedIconTheme:
                const IconThemeData(color: Colors.white, opacity: 1),
            unselectedLabelTextStyle: const TextStyle(
              color: Colors.white,
            ),
            selectedIconTheme: IconThemeData(color: Colors.deepPurple.shade900),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text("Home"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bar_chart),
                label: Text("Rapports"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text("Profile"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text("Settings"),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: PageController(initialPage: _selectedIndex),
              children: [
                // Create widgets for different sections based on the index
                // For example, based on your NavigationRailDestinations
                buildHomeSection(),
                buildRapportsSection(),
                buildProfileSection(),
                buildSettingsSection(),
              ],
            ),
          ),
        ],
      ),
      //let's add the floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddQuestionScreen());
        },
        backgroundColor: Colors.deepPurple.shade400,
        child: const Icon(Icons.add),
      ),
    );
  }
}
