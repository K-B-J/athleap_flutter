import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  var main_color = const Color(0xfffa9b70);
  final _formKey = GlobalKey<FormState>();
  var _name = "";
  int _height = 0;
  int _weight = 0;
  int _gender = 0;
  var _email = "";
  var _password = "";
  var _confirmPassword = "";
  List<bool> _isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: main_color,
      ),
      body: Container(
          margin: EdgeInsets.all(10.0),
          height: height,
          child: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Name",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        _name = text;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name cannot be empty";
                      }
                    },
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Height",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 100.0),
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(hintText: "Height"),
                                )),
                            Text("cms"),
                          ],
                        ))),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Weight",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 100.0),
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(hintText: "Weight"),
                                )),
                            Text("kgs"),
                          ],
                        ))),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ToggleButtons(
                              borderColor: main_color,
                              borderWidth: 3.0,
                              borderRadius: BorderRadius.circular(5.0),
                              constraints: BoxConstraints(minHeight: 25.0),
                              color: main_color,
                              fillColor: main_color,
                              selectedColor: Colors.white,
                              selectedBorderColor: main_color,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        right: 20.0,
                                        bottom: 0.0,
                                        left: 20.0),
                                    child: Text("Male",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ))),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        right: 20.0,
                                        bottom: 0.0,
                                        left: 20.0),
                                    child: Text("Female",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ))),
                              ],
                              onPressed: (int index) {
                                setState(() {
                                  _isSelected[index] = !_isSelected[index];
                                });
                                if (index == 1) {
                                  setState(() {
                                    _isSelected[0] = !_isSelected[0];
                                  });
                                } else {
                                  setState(() {
                                    _isSelected[1] = !_isSelected[1];
                                  });
                                }
                              },
                              isSelected: _isSelected,
                            ),
                          ],
                        ))),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        _email = text;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email cannot be empty";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        _password = text;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password cannot be empty";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    onChanged: (text) {
                      setState(() {
                        _confirmPassword = text;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Passwords don't match";
                      }
                    },
                  ),
                ),
              ],
            ),
          ))),
      bottomNavigationBar: Container(
          margin:
              EdgeInsets.only(top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: main_color,
              onPrimary: Colors.white,
              shadowColor: Colors.deepOrangeAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(300, 60), //////// HERE
            ),
            child: Text(
              "Register",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          )),
    );
  }
}
