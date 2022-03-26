import 'package:flutter/material.dart';

class WelcomePage3 extends StatefulWidget {
  @override
  _WelcomePage3State createState() => _WelcomePage3State();
}

class _WelcomePage3State extends State<WelcomePage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Health App'),
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: [
          Image.asset(
            'images/welcome3.PNG',
            fit: BoxFit.fill,
            width: 411.4,
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Icon(
                    Icons.library_books_outlined,
                    color: Colors.white,
                    size: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Write down your goals',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Track your mood, express how your day was and set daily objectives.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        textColor: Color(0xF65299FF),
                        color: Colors.white,
                        child: Text('Login'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      FlatButton(
                        textColor: Color(0xF65299FF),
                        color: Colors.white,
                        child: Text('Sign up'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
