import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_application/screens/daily.dart';
import 'package:mental_health_application/screens/settings.dart';
import 'package:mental_health_application/screens/tracker.dart';
import 'package:mental_health_application/screens/notifications.dart';
import 'navbar.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  int currentIndex = 0;
  final screens = [
    Home(), //0
    Notifications(), //1
    Tracker(), //2
    Daily(), //3
    Settings(), //4
  ];

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: NavBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Color(0xFF9FA8DA),
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 13,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xFF9FA8DA),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            backgroundColor: Color(0xFF9FA8DA),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Tracker',
            backgroundColor: Color(0xFF9FA8DA),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Daily',
            backgroundColor: Color(0xFF9FA8DA),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Color(0xFF9FA8DA),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
    );
  }
}
