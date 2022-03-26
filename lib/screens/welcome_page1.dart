import 'package:flutter/material.dart';

class WelcomePage1 extends StatefulWidget {
  @override
  _WelcomePage1State createState() => _WelcomePage1State();
}

class _WelcomePage1State extends State<WelcomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Health App'),
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'images/welcome1.PNG',
              fit: BoxFit.fill,
              width: 411.4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Find your inner peace and heal your soul',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    textColor: Color(0xF65299FF),
                    color: Colors.white,
                    child: Text('Get Started'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/welcome2');
                    },
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
