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
  final _formKey = GlobalKey<FormState>();
  var _name = "";
  double _height = 0;
  double _weight = 0;
  int _gender = 0;
  var _email = "";
  var _password = "";
  var _confirmPassword = "";
  bool _isPasswordInvisible = true;
  List<bool> _isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade300,
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
                      RegExp nameRegex = RegExp(r"^[A-Za-z]+$");
                      if (value == null || value.isEmpty) {
                        return "Name cannot be empty";
                      } else if (!nameRegex.hasMatch(value)) {
                        return "Name can only have alphabets";
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
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      InputDecoration(hintText: "Height"),
                                  validator: (value) {
                                    RegExp heightRegex =
                                        RegExp(r"^\d+(\.\d+)?$");
                                    if (value == null || value.isEmpty) {
                                      return "Enter height";
                                    } else if (!heightRegex.hasMatch(value)) {
                                      return "Invalid";
                                    } else {
                                      setState(() {
                                        _height = double.parse(value);
                                      });
                                    }
                                  },
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
                                  validator: (value) {
                                    RegExp weightRegex =
                                        RegExp(r"^\d+(\.\d+)?$");
                                    if (value == null || value.isEmpty) {
                                      return "Enter weight";
                                    } else if (!weightRegex.hasMatch(value)) {
                                      return "Invalid";
                                    } else {
                                      setState(() {
                                        _weight = double.parse(value);
                                      });
                                    }
                                  },
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
                              borderColor: Colors.deepOrange.shade300,
                              borderWidth: 3.0,
                              borderRadius: BorderRadius.circular(5.0),
                              constraints: BoxConstraints(minHeight: 25.0),
                              color: Colors.deepOrange.shade300,
                              fillColor: Colors.deepOrange.shade300,
                              selectedColor: Colors.white,
                              selectedBorderColor: Colors.deepOrange.shade300,
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
                                  _gender = _isSelected[index] ? 0 : 1;
                                  _isSelected[index] = !_isSelected[index];
                                });
                                if (index == 1) {
                                  setState(() {
                                    _isSelected[0] = !_isSelected[0];
                                  });
                                } else {
                                  setState(() {
                                    _isSelected[1] = !_isSelected[1];
                                    _gender = 0;
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
                      RegExp emailRegex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (value == null || value.isEmpty) {
                        return "Email cannot be empty";
                      } else if (!emailRegex.hasMatch(value)) {
                        return "Enter a valid E-mail address";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: _isPasswordInvisible,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: new GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordInvisible = !_isPasswordInvisible;
                            });
                          },
                          child: _isPasswordInvisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
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
                      RegExp passwordRegex = RegExp(
                          r"^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");
                      if (value == null || value.isEmpty) {
                        return "Password cannot be empty";
                      } else if (!passwordRegex.hasMatch(value)) {
                        return "Password should contain\n- Atleast one upper and lower case character\n- Atleast one digit and one special character\n- Must be 8 characters long";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: _isPasswordInvisible,
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
                      if (value == null ||
                          value.isEmpty ||
                          _password != _confirmPassword) {
                        return "Passwords don't match";
                      }
                    },
                  ),
                ),
              ],
            ),
          ))),
      bottomNavigationBar: Container(
          margin: EdgeInsets.all(10.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange.shade300,
              onPrimary: Colors.white,
              shadowColor: Colors.deepOrangeAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(400, 60), //////// HERE
            ),
            child: Text(
              "Register",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing data ')),
                );
              }
            },
          )),
    );
  }
}
