import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

class SessionsPage extends StatefulWidget {
  @override
  _SessionsPageState createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sessions'),
        backgroundColor: mainAppColor,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 5, left: 3),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/booksessions'),
                child: Container(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark,
                        size: 45,
                        color: orangeColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Book a session',
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
                onTap: () => Navigator.pushNamed(context, '/upcomingsessions'),
                child: Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.list_alt_outlined,
                          size: 45,
                          color: orangeColor,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Upcoming sessions',
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
                onTap: () => Navigator.pushNamed(context, '/sessionhistory'),
                child: Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.history,
                          size: 45,
                          color: orangeColor,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Session history',
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
    );
  }
}
