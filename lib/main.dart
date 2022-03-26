import 'package:flutter/material.dart';
import 'package:mental_health_application/screens/chat_selector.dart';
import 'package:mental_health_application/screens/home.dart';
import 'package:mental_health_application/screens/login.dart';
import 'package:mental_health_application/screens/main_scaffold.dart';
import 'package:mental_health_application/screens/sign_up.dart';
import 'package:mental_health_application/screens/welcome_page2.dart';
import 'package:mental_health_application/screens/welcome_page3.dart';
import 'screens/welcome_page1.dart';

void main() => runApp(MentalApp());

class MentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome1',
      routes: {
        '/welcome1': (context) => WelcomePage1(),
        '/welcome2': (context) => WelcomePage2(),
        '/welcome3': (context) => WelcomePage3(),
        '/signup': (context) => SignUp(),
        '/login': (context) => Login(),
        '/mainScaffold': (context) => MainScaffold(),
        '/chatselector': (context) => ChatSelector(),
      },
    );
  }
}
