import 'package:flutter/material.dart';

class WelcomePage2 extends StatefulWidget {
  @override
  _WelcomePage2State createState() => _WelcomePage2State();
}

class _WelcomePage2State extends State<WelcomePage2> {
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
            'images/welcome2.PNG',
            fit: BoxFit.fill,
            width: 411.4,
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.white,
                    size: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text(
                    'Book sessions with professionals',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: FlatButton(
                    textColor: Color(0xF65299FF),
                    color: Colors.white,
                    child: Text('Next'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/welcome3');
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
