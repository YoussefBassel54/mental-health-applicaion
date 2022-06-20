import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

class Daily extends StatefulWidget {
  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily'),
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
                  padding: const EdgeInsets.only(top: 50, bottom: 5, left: 3),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/mood'),
                    child: Container(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 90,
                            color: orangeColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Current mood',
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
                    onTap: () => Navigator.pushNamed(context, '/rateday'),
                    child: Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.tag_faces,
                              size: 90,
                              color: orangeColor,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Rate your day',
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
                  padding: const EdgeInsets.only(top: 40, bottom: 5),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/dailygoals'),
                    child: Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.list_alt_outlined,
                              size: 90,
                              color: orangeColor,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Daily goals',
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
