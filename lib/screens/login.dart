import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Mental Health App'),
          backgroundColor: Color(0xFFB2B9E2),
        ),
        body: Stack(
          children: [
            Image.asset(
              'images/login.PNG',
              fit: BoxFit.fill,
              width: 411.4,
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, left: 15),
                    child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                        border: InputBorder.none,
                        hintText: 'email',
                        prefixIcon: Icon(
                          Icons.supervised_user_circle_outlined,
                          size: 50,
                          color: orangeColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 300,
                      height: 2,
                      child: Container(
                        color: Color(0xFFB2B9E2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 15),
                    child: TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                        border: InputBorder.none,
                        hintText: 'password',
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          size: 50,
                          color: orangeColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 300,
                      height: 2,
                      child: Container(
                        color: Color(0xFFB2B9E2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Color(0xFFB2B9E2),
                      child: Text('Login'),
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.pushNamed(context, '/mainScaffold');
                          }

                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          setState(() {
                            showSpinner = false;
                          });
                          print(e);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
