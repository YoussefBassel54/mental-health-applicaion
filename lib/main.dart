import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_application/screens/goals.dart';
import 'package:mental_health_application/screens/talk_about_day.dart';
import 'package:mental_health_application/screens/chat_selector.dart';
import 'package:mental_health_application/screens/login.dart';
import 'package:mental_health_application/screens/main_scaffold.dart';
import 'package:mental_health_application/screens/mood.dart';
import 'package:mental_health_application/screens/rate_day.dart';
import 'package:mental_health_application/screens/sign_up.dart';
import 'package:mental_health_application/screens/welcome_page2.dart';
import 'package:mental_health_application/screens/welcome_page3.dart';
import 'screens/welcome_page1.dart';
import 'screens/chat_space.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MentalApp());
}

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
        '/mood': (context) => MoodPage(),
        '/rateday': (context) => RateDay(),
        '/chatscreen': (context) => ChatSpace(),
        '/talkaboutyourday': (context) => TalkAboutDay(),
        '/dailygoals': (context) => GoalsPage(),
      },
    );
  }
}
