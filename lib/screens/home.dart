import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/reusable_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(children: [
              ReusableCard(
                image: Image.asset(
                  'images/flowers.png',
                  fit: BoxFit.fill,
                  width: 411.4,
                ),
                onPress: () {
                  Navigator.pushNamed(context, '/welcome1');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 40),
                child: Text(
                  '"You will smile again"',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            ]),
          ),
          Expanded(
            child: Stack(children: [
              ReusableCard(
                image: Image.asset(
                  'images/thinker.jpg',
                  fit: BoxFit.fill,
                  width: 411.4,
                ),
                onPress: () {
                  Navigator.pushNamed(context, '/chatselector');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 320, top: 130),
                child: Text(
                  'Chat coming soon',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            ]),
          ),
          Row(
            children: [
              Expanded(
                child: Stack(children: [
                  ReusableCard(
                    image: Image.asset('images/target.jpg'),
                    onPress: () {
                      Navigator.pushNamed(context, '/welcome1');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 170, left: 100),
                    child: Text(
                      'Add your goal now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                ]),
              ),
              Expanded(
                child: Stack(children: [
                  ReusableCard(
                    image: Image.asset('images/butterfly.jpg'),
                    onPress: () {
                      Navigator.pushNamed(context, '/welcome1');
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 155, left: 125),
                    child: Text(
                      'Track your mood',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
