import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_application/models/post_mood.dart';

import 'package:mental_health_application/utilities/constants.dart';

import '../services/remote_service.dart';

enum Btns {
  happy,
  sad,
  tired,
  stressed,
  angry,
  shy,
  grumpy,
  scared,
  worried,
  hurt,
  okay,
  good
}

class MoodPage extends StatefulWidget {
  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  List pressedBtns = [];
  Mood moodService = Mood();
  // List? posts;

  @override
  void initState() {
    super.initState();
    //getData();
  }

  // getData() async {
  //   posts = await RemoteService().getPosts();
  //   if (posts != null) {
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   }
  // }

  bool isPressed(Btns button) {
    for (int i = 0; i < pressedBtns.length; i++) {
      if (button == pressedBtns[i]) {
        return true;
      }
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
                          color: isPressed(Btns.happy)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Happy'),
                          onPressed: () {
                            setState(() {
                              if (isPressed(Btns.happy) == true) {
                                pressedBtns.remove(Btns.happy);
                              } else {
                                pressedBtns.add(Btns.happy);
                              }
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
                          color: isPressed(Btns.sad)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Sad'),
                          onPressed: () {
                            setState(() {
                              if (isPressed(Btns.sad) == true) {
                                pressedBtns.remove(Btns.sad);
                              } else {
                                pressedBtns.add(Btns.sad);
                              }
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
                          color: isPressed(Btns.tired)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Tired'),
                          onPressed: () {
                            setState(() {
                              if (isPressed(Btns.tired) == true) {
                                pressedBtns.remove(Btns.tired);
                              } else {
                                pressedBtns.add(Btns.tired);
                              }
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
                          color: isPressed(Btns.stressed)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Stressed'),
                          onPressed: () {
                            setState(() {
                              if (isPressed(Btns.stressed) == true) {
                                pressedBtns.remove(Btns.stressed);
                              } else {
                                pressedBtns.add(Btns.stressed);
                              }
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
                        color: isPressed(Btns.angry)
                            ? activeBtnColor
                            : inactiveBtnColor,
                        child: Text('Angry'),
                        onPressed: () {
                          setState(() {
                            if (isPressed(Btns.angry) == true) {
                              pressedBtns.remove(Btns.angry);
                            } else {
                              pressedBtns.add(Btns.angry);
                            }
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        textColor: Color(0xF65299FF),
                        color: isPressed(Btns.shy)
                            ? activeBtnColor
                            : inactiveBtnColor,
                        child: Text('Shy'),
                        onPressed: () {
                          setState(() {
                            if (isPressed(Btns.shy) == true) {
                              pressedBtns.remove(Btns.shy);
                            } else {
                              pressedBtns.add(Btns.shy);
                            }
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        textColor: Color(0xF65299FF),
                        color: isPressed(Btns.grumpy)
                            ? activeBtnColor
                            : inactiveBtnColor,
                        child: Text('Grumpy'),
                        onPressed: () {
                          setState(() {
                            if (isPressed(Btns.grumpy) == true) {
                              pressedBtns.remove(Btns.grumpy);
                            } else {
                              pressedBtns.add(Btns.grumpy);
                            }
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
                          color: isPressed(Btns.scared)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Scared'),
                          onPressed: () {
                            setState(() {
                              if (isPressed(Btns.scared) == true) {
                                pressedBtns.remove(Btns.scared);
                              } else {
                                pressedBtns.add(Btns.scared);
                              }
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
                          color: isPressed(Btns.worried)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Worried'),
                          onPressed: () {
                            setState(() {
                              if (isPressed(Btns.worried) == true) {
                                pressedBtns.remove(Btns.worried);
                              } else {
                                pressedBtns.add(Btns.worried);
                              }
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
                          color: isPressed(Btns.hurt)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Hurt'),
                          onPressed: () {
                            setState(() {
                              if (isPressed(Btns.hurt) == true) {
                                pressedBtns.remove(Btns.hurt);
                              } else {
                                pressedBtns.add(Btns.hurt);
                              }
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
                          color: isPressed(Btns.okay)
                              ? activeBtnColor
                              : inactiveBtnColor,
                          child: Text('Okay'),
                          onPressed: () {
                            setState(() {
                              if (isPressed(Btns.okay) == true) {
                                pressedBtns.remove(Btns.okay);
                              } else {
                                pressedBtns.add(Btns.okay);
                              }
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
                        color: isPressed(Btns.good)
                            ? activeBtnColor
                            : inactiveBtnColor,
                        child: Text('Good'),
                        onPressed: () {
                          setState(() {
                            if (isPressed(Btns.good) == true) {
                              pressedBtns.remove(Btns.good);
                            } else {
                              pressedBtns.add(Btns.good);
                            }
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
                    onPressed: () {
                      //dummy function that tests whether the data is collected successfully from the array
                      for (int i = 0; i < pressedBtns.length; i++) {
                        print(pressedBtns[i]);
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: FutureBuilder<List>(
                        future: moodService.getAllMoods(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data?.length,
                                itemBuilder: (context, index) {
                                  print(snapshot.data);
                                  return Card(
                                    child: ListTile(
                                      title: Text(
                                        snapshot.data![index]['mood'],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      subtitle: Text(
                                        snapshot.data![index]['date'],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  );
                                });
                          } else {
                            return const Center(
                              child: Text('No data found'),
                            );
                          }
                        },
                      ),
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
