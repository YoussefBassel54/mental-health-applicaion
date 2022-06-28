import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mental_health_application/services/remote_service.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final _auth = FirebaseAuth.instance;

  late User loggedInUser;

  String userEmail = '';

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
        userEmail = loggedInUser.email!;
      }
    } catch (e) {
      print(e);
    }
  }

  // final Uri _url = Uri.parse(
  //     'http://localhost:63343/Rasa/index.html?_ijt=u6c788d7h5111gu7802s8r6d1r&_ij_reload=RELOAD_ON_SAVE');
  // void _launchUrl() async {
  //   if (!await launchUrl(_url)) throw 'Could not launch $_url';
  // }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // UserAccountsDrawerHeader(
          //   accountName: Text('user'),
          //   accountEmail: Text(userEmail),
          //   currentAccountPicture: ClipOval(
          //     child: CircleAvatar(
          //       child: Image.asset(
          //         'images/youssef.png',
          //         width: 90,
          //         height: 90,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Color(0xFF9FA8DA),
          //   ),
          // ),
          ListTile(
            onTap: () => null,
          ),
          // ListTile(
          //   leading: Icon(Icons.chat),
          //   title: Text('Chatbot'),
          //   onTap: () => Navigator.pushNamed(context, '/chatscreen'),
          // ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Daily Journal'),
            onTap: () => Navigator.pushNamed(context, '/talkaboutyourday'),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Sessions'),
            onTap: () => Navigator.pushNamed(context, '/sessions'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // getCurrentUser();
              // _auth.signOut();
              Navigator.pushNamed(context, '/welcome3');
            },
          ),
        ],
      ),
    );
  }
}
