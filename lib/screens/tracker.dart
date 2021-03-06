import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Tracker'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      body: Stack(
        children: [
          Image.asset(
            'images/background.PNG',
            fit: BoxFit.fill,
            width: 411.4,
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 5),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/moodgraphpage'),
                    child: Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.stacked_bar_chart,
                              size: 90,
                              color: orangeColor,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Track down your mood',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Color(0xFF9FA8DA),
                  height: 2,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 5),
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/ratedaygraphpage'),
                    child: Container(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.stacked_line_chart,
                              size: 90,
                              color: orangeColor,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Track down your daily rating',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Color(0xFF9FA8DA),
                  height: 2,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
