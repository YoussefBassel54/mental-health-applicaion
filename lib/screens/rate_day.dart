import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';

enum faces { Great, Good, Ok, Poor, Bad, nothing }

class RateDay extends StatefulWidget {
  @override
  _RateDayState createState() => _RateDayState();
}

class _RateDayState extends State<RateDay> {
  faces selectedFace = faces.nothing;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Rate your day'),
        backgroundColor: Color(0xFFB2B9E2),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Rate your day",
                  style: TextStyle(
                      color: orangeColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedFace == faces.Great) {
                                selectedFace = faces.nothing;
                              } else {
                                selectedFace = faces.Great;
                              }
                            });
                          },
                          child: ClipOval(
                            child: ColorFiltered(
                              colorFilter: selectedFace == faces.Great
                                  ? ColorFilter.mode(
                                      orangeColorFaded, BlendMode.color)
                                  : ColorFilter.mode(noColor, BlendMode.color),
                              child: Image.asset(
                                'images/Great.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Great",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedFace == faces.Good) {
                                selectedFace = faces.nothing;
                              } else {
                                selectedFace = faces.Good;
                              }
                            });
                          },
                          child: ClipOval(
                            child: ColorFiltered(
                              colorFilter: selectedFace == faces.Good
                                  ? ColorFilter.mode(
                                      orangeColorFaded, BlendMode.color)
                                  : ColorFilter.mode(noColor, BlendMode.color),
                              child: Image.asset(
                                'images/Good.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Good",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedFace == faces.Ok) {
                                selectedFace = faces.nothing;
                              } else {
                                selectedFace = faces.Ok;
                              }
                            });
                          },
                          child: ClipOval(
                            child: ColorFiltered(
                              colorFilter: selectedFace == faces.Ok
                                  ? ColorFilter.mode(
                                      orangeColorFaded, BlendMode.color)
                                  : ColorFilter.mode(noColor, BlendMode.color),
                              child: Image.asset(
                                'images/Ok.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Ok",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedFace == faces.Poor) {
                                selectedFace = faces.nothing;
                              } else {
                                selectedFace = faces.Poor;
                              }
                            });
                          },
                          child: ClipOval(
                            child: ColorFiltered(
                              colorFilter: selectedFace == faces.Poor
                                  ? ColorFilter.mode(
                                      orangeColorFaded, BlendMode.color)
                                  : ColorFilter.mode(noColor, BlendMode.color),
                              child: Image.asset(
                                'images/Poor.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Poor",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedFace == faces.Bad) {
                                selectedFace = faces.nothing;
                              } else {
                                selectedFace = faces.Bad;
                              }
                            });
                          },
                          child: ClipOval(
                            child: ColorFiltered(
                              colorFilter: selectedFace == faces.Bad
                                  ? ColorFilter.mode(
                                      orangeColorFaded, BlendMode.color)
                                  : ColorFilter.mode(noColor, BlendMode.color),
                              child: Image.asset(
                                'images/Bad.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Bad",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      color: orangeColor,
                      onPressed: () {
                        print(selectedFace);
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FlatButton(
                      color: orangeColor,
                      onPressed: () {
                        Navigator.pushNamed(context, '/talkaboutyourday');
                      },
                      child: Text(
                        "talk about your day",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
