import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_scaffold.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('omak'),
            accountEmail: Text('omak@gmail.com'),
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
            title: Text('Chat'),
            onTap: () => Navigator.pushNamed(context, '/chatselector'),
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Daily Journal'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Sessions'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
