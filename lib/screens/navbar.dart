import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
          UserAccountsDrawerHeader(
            accountName: Text('user'),
            accountEmail: Text(userEmail),
            currentAccountPicture: ClipOval(
              child: CircleAvatar(
                child: Image.asset(
                  'images/youssef.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF9FA8DA),
            ),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chatbot'),
            onTap: () => Navigator.pushNamed(context, '/chatscreen'),
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Daily Journal'),
            onTap: () => null,
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
              getCurrentUser();
              _auth.signOut();
              Navigator.pushNamed(context, '/welcome3');
            },
          ),
        ],
      ),
    );
  }
}
