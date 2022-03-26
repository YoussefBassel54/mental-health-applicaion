import 'package:flutter/material.dart';

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
                  padding: const EdgeInsets.only(top: 80, bottom: 5),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/welcome1'),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.pie_chart,
                            size: 90,
                            color: Color(0xFFFD9A04),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Discover what you most spend your time on',
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
                    onTap: null,
                    child: Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.stacked_bar_chart,
                              size: 90,
                              color: Color(0xFFFD9A04),
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
                    onTap: null,
                    child: Container(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.stacked_line_chart,
                              size: 90,
                              color: Color(0xFFFD9A04),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Monthly Reports',
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
