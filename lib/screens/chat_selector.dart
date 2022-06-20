import 'package:flutter/material.dart';

class ChatSelector extends StatefulWidget {
  @override
  _ChatSelectorState createState() => _ChatSelectorState();
}

class _ChatSelectorState extends State<ChatSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Online'),
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
                  padding: const EdgeInsets.only(top: 120, bottom: 5),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/chatscreen'),
                    child: Container(
                      child: Text(
                        'CHATBOT',
                        style: TextStyle(
                          color: Color(0xFF9FA8DA),
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                        ),
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
                      child: Text(
                        'CHAT WITH DOCTOR',
                        style: TextStyle(
                          color: Color(0xFF9FA8DA),
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                        ),
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
                      child: Text(
                        'CHAT ONLINE WITH USER',
                        style: TextStyle(
                          color: Color(0xFF9FA8DA),
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                        ),
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
