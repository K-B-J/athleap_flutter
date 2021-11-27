import 'dart:math';
import 'package:athleap/pages/afterForm.dart';
import 'package:athleap/helpers/ageCalculator.dart';
import 'package:athleap/firebase/database.dart';
import 'package:athleap/helpers/loading.dart';
import 'package:athleap/firebase/auth.dart';
import 'package:athleap/helpers/sort.dart';
import 'package:flutter/material.dart';

var main_color = const Color(0xfffa9b70);

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool loading = false;
  final _email = AuthService().userEmail();
  String _name = "";
  String _gender = "";
  String _dob = "";
  var _fcoins;
  var _weight;
  var _height;
  double _textFontSize = 20;
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: main_color,
      ),
      body: loading
          ? Loading()
          : Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    "Hello,",
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    "$_name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  // Divider for Gender
                  Divider(
                    color: Color(0xff707070),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: _textFontSize,
                              color: Color(0xff707070),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "${_gender.toUpperCase()}",
                            style: TextStyle(
                              fontSize: _textFontSize,
                              color: Color(0xfffa9b70),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Divider for Date of Birth
                  Divider(
                    color: Color(0xff707070),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "DOB",
                            style: TextStyle(
                              fontSize: _textFontSize,
                              color: Color(0xff707070),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "$_dob",
                            style: TextStyle(
                              fontSize: _textFontSize,
                              color: Color(0xfffa9b70),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Divider for height
                  Divider(
                    color: Color(0xff707070),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Height",
                            style: TextStyle(
                              fontSize: _textFontSize,
                              color: Color(0xff707070),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "$_height cm",
                            style: TextStyle(
                              fontSize: _textFontSize,
                              color: Color(0xfffa9b70),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // divider for weight
                  Divider(
                    color: Color(0xff707070),
                    indent: 20, // empty space to the leading edge of divider.
                    endIndent: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: _textFontSize,
                              color: Color(0xff707070),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "$_weight kg",
                            style: TextStyle(
                              fontSize: _textFontSize,
                              color: Color(0xfffa9b70),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xff707070),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                      child: Text(
                        "Log Out",
                      ),
                      onPressed: () {
                        setState(() {
                          loading = true;
                        });
                        AuthService().signOut();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xfffa9b70),
                        ),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: 20),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future fetchUserData() async {
    await Future.delayed(const Duration(milliseconds: 80),
        () {}); // Added this so that the refresh indicator stays
    if (this.mounted) {
      setState(() {
        loading = true;
      });
    }
    DatabaseService().fetch("Users", _email).then((snapshot) {
      if (snapshot == null) {
        // Either some error occured or no data found
        setState(() {
          loading = false;
        });
      } else {
        setState(() {
          _name = snapshot.docs[0].data()["name"];
          _gender = snapshot.docs[0].data()["gender"];
          _dob = snapshot.docs[0].data()["dob"];
          _fcoins = snapshot.docs[0].data()["fcoins"];
          _weight = snapshot.docs[0].data()["weight"];
          _height = snapshot.docs[0].data()["height"];
          loading = false;
        });
      }
    });
  }
}
