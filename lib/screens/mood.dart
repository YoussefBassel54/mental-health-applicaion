import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mental_health_application/utilities/constants.dart';

import '../services/remote_service.dart';

enum Btns {
  Happy,
  Sad,
  Tired,
  Stressed,
  Angry,
  Shy,
  Grumpy,
  Scared,
  Worried,
  Hurt,
  Okay,
  Good,
  none
}

class MoodPage extends StatefulWidget {
  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  Btns pressedBtn = Btns.none;

  @override
  void initState() {
    super.initState();
  }

  bool isPressed(Btns button) {
    if (button == pressedBtn) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'images/background.PNG',
              fit: BoxFit.fill,
              width: 411.4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Text(
                    "How are you feeling ?",
                    style: TextStyle(
                        color: orangeColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FlatButton(
                          textColor: Color(0xF65299FF),
                          color: isPressed(Btns.Happy)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Happy'),
                          onPressed: () {
                            setState(() {
                              pressedBtn = Btns.Happy;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FlatButton(
                          textColor: Color(0xF65299FF),
                          color: isPressed(Btns.Sad)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Sad'),
                          onPressed: () {
                            setState(() {
                              pressedBtn = Btns.Sad;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FlatButton(
                          textColor: Color(0xF65299FF),
                          color: isPressed(Btns.Tired)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Tired'),
                          onPressed: () {
                            setState(() {
                              pressedBtn = Btns.Tired;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FlatButton(
                          textColor: Color(0xF65299FF),
                          color: isPressed(Btns.Stressed)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Stressed'),
                          onPressed: () {
                            setState(() {
                              pressedBtn = Btns.Stressed;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        textColor: Color(0xF65299FF),
                        color: isPressed(Btns.Angry)
                            ? activeBtnColor
                            : inactiveBtnColor,
                        child: Text('Angry'),
                        onPressed: () {
                          setState(() {
                            pressedBtn = Btns.Angry;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        textColor: Color(0xF65299FF),
                        color: isPressed(Btns.Shy)
                            ? activeBtnColor
                            : inactiveBtnColor,
                        child: Text('Shy'),
                        onPressed: () {
                          setState(() {
                            pressedBtn = Btns.Shy;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        textColor: Color(0xF65299FF),
                        color: isPressed(Btns.Grumpy)
                            ? activeBtnColor
                            : inactiveBtnColor,
                        child: Text('Grumpy'),
                        onPressed: () {
                          setState(() {
                            pressedBtn = Btns.Grumpy;
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FlatButton(
                          textColor: Color(0xF65299FF),
                          color: isPressed(Btns.Scared)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Scared'),
                          onPressed: () {
                            setState(() {
                              pressedBtn = Btns.Scared;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FlatButton(
                          textColor: Color(0xF65299FF),
                          color: isPressed(Btns.Worried)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Worried'),
                          onPressed: () {
                            setState(() {
                              pressedBtn = Btns.Worried;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FlatButton(
                          textColor: Color(0xF65299FF),
                          color: isPressed(Btns.Hurt)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Hurt'),
                          onPressed: () {
                            setState(() {
                              pressedBtn = Btns.Hurt;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FlatButton(
                          textColor: Color(0xF65299FF),
                          color: isPressed(Btns.Okay)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Okay'),
                          onPressed: () {
                            setState(() {
                              pressedBtn = Btns.Okay;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        textColor: Color(0xF65299FF),
                        color: isPressed(Btns.Good)
                            ? activeBtnColor
                            : inactiveBtnColor,
                        child: Text('Good'),
                        onPressed: () {
                          setState(() {
                            pressedBtn = Btns.Good;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  FlatButton(
                    color: orangeColor,
                    onPressed: () async {
                      print(pressedBtn);
                      if (pressedBtn != Btns.none) {
                        var response =
                            await ApiService.instance.post('daily/mood/', {
                          "user": ApiService.instance.userID,
                          "date": DateTime.now().toString(),
                          "mood": pressedBtn.name,
                        });
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
