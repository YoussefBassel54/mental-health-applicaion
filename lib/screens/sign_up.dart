import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_application/services/remote_service.dart';
import 'package:mental_health_application/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String username = "";
  String email = "";
  String password = "";
  String phoneNumber = "";
  DateTime selectedDate = DateTime.now();
  String gender = 'M';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1923, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text(
                        'SIGN UP',
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
                          username = value;
                        },
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.grey),
                          border: InputBorder.none,
                          hintText: 'Username',
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
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.grey),
                          border: InputBorder.none,
                          hintText: 'email',
                          prefixIcon: Icon(
                            Icons.mail_outline,
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
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.grey),
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
                      padding: const EdgeInsets.only(top: 30, left: 15),
                      child: TextField(
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                        obscureText: false,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.grey),
                          border: InputBorder.none,
                          hintText: 'phone number',
                          prefixIcon: Icon(
                            Icons.phone,
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
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 50,
                            color: orangeColor,
                          ),
                          FlatButton(
                            onPressed: () => _selectDate(context),
                            color: orangeColor,
                            child: Text(
                              "date of birth",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 15),
                      child: TextField(
                        onChanged: (value) {
                          if (value == "Male") {
                            gender = "M";
                          } else if (value == "Female") {
                            gender = "F";
                          }
                        },
                        obscureText: false,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(fontSize: 20, color: Colors.grey),
                          border: InputBorder.none,
                          hintText: 'gender',
                          prefixIcon: Icon(
                            Icons.male_outlined,
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
                        color: orangeColor,
                        child: Text('Sign up'),
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            // // final newUser =
                            // //     await _auth.createUserWithEmailAndPassword(
                            // //         email: email, password: password);
                            // if (newUser != null) {

                            // }

                            var response = await ApiService.instance
                                .post('user/sign-up/', {
                              "username": username,
                              "email": email,
                              "phone_number": phoneNumber,
                              "password": password,
                              "Date_of_Birth":
                                  selectedDate.toString().substring(0, 10),
                              "gender": gender
                            });

                            if (response != null) {
                              Navigator.pushNamed(context, '/login');
                            } else {
                              //display error message
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
