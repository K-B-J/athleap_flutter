import 'package:athleap/helpers/ageCalculator.dart';
import 'package:athleap/firebase/auth.dart';
import 'package:athleap/firebase/database.dart';
import 'package:athleap/helpers/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  bool loading = false;
  var main_color = const Color(0xfffa9b70);
  final _formKey = GlobalKey<FormState>();
  dynamic _name;
  dynamic _phone;
  dynamic _dob;
  String? _dobError;
  dynamic _height;
  dynamic _weight;
  List<bool> _isSelected = [true, false, false];
  dynamic _gender;
  dynamic _email;
  dynamic _emailError;
  dynamic _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTER", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: main_color,
      ),
      body: loading
          ? Loading()
          : Container(
              margin: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                  child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 22),
                      child: TextFormField(
                        initialValue: _name,
                        decoration: InputDecoration(
                          hintText: "Name",
                          fillColor: Colors.white,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
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
                        onSaved: (value) {
                          setState(() {
                            _name = value != null ? value : "";
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Invalid Input!";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 22),
                      child: TextFormField(
                        initialValue: _phone,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          fillColor: Colors.white,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
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
                        onSaved: (value) {
                          setState(() {
                            _phone = value != null ? value : "";
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Invalid Input!";
                          }
                          RegExp phoneRegex = RegExp(r"^[0-9]{10}$");
                          if (!phoneRegex.hasMatch(value)) {
                            return "Enter 10 digit mobile number";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 22),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Date of Birth",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 120.0),
                            child: InkWell(
                              onTap: () {
                                showDatePicker(
                                        builder: (context, child) {
                                          return Theme(
                                              data: ThemeData(
                                                      primaryColor: main_color)
                                                  .copyWith(
                                                      colorScheme:
                                                          ColorScheme.light(
                                                primary: main_color,
                                                onPrimary: Colors.white,
                                                surface: main_color,
                                              )),
                                              child: child!);
                                        },
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime.now())
                                    .then((value) => {
                                          if (value != null)
                                            {
                                              setState(() {
                                                _dob = DateFormat("dd/MM/yyyy")
                                                    .format(value);
                                              })
                                            }
                                        });
                              },
                              child: IgnorePointer(
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText:
                                        _dob != null ? _dob : "DD/MM/YYYY",
                                    hintStyle: TextStyle(color: Colors.black),
                                    fillColor: Colors.white,
                                    errorText: _dobError,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 22),
                        child: Row(
                          children: [
                            Text(
                              "Height",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 80.0),
                                child: TextFormField(
                                  initialValue: _height,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if ((value == null || value.isEmpty) ||
                                        (double.parse(value) <= 0)) {
                                      return "Invalid Input!";
                                    }
                                  },
                                  onSaved: (value) {
                                    setState(() {
                                      _height = value != null ? value : "";
                                    });
                                  },
                                  textAlign: TextAlign.center,
                                  decoration:
                                      InputDecoration(hintText: "Height"),
                                )),
                            Text("cm"),
                          ],
                        )),
                    Container(
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 22),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Weight",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 80.0),
                                    child: TextFormField(
                                      initialValue: _weight,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if ((value == null || value.isEmpty) ||
                                            (double.parse(value) <= 0)) {
                                          return "Invalid Input!";
                                        }
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          _weight = value != null ? value : "";
                                        });
                                      },
                                      textAlign: TextAlign.center,
                                      decoration:
                                          InputDecoration(hintText: "Weight"),
                                    )),
                                Text("kg"),
                              ],
                            ))),
                    Padding(
                        padding: EdgeInsets.only(bottom: 22),
                        child: Row(
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
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
                                        right: 18.0,
                                        bottom: 0.0,
                                        left: 18.0),
                                    child: Text("Male",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ))),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        right: 18.0,
                                        bottom: 0.0,
                                        left: 18.0),
                                    child: Text("Female",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ))),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        right: 18.0,
                                        bottom: 0.0,
                                        left: 18.0),
                                    child: Text("Other",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ))),
                              ],
                              onPressed: (int index) {
                                _isSelected[0] =
                                    _isSelected[1] = _isSelected[2] = false;
                                setState(() {
                                  _isSelected[index] = !_isSelected[index];
                                });
                              },
                              isSelected: _isSelected,
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(bottom: 22),
                      child: TextFormField(
                        initialValue: _email,
                        decoration: InputDecoration(
                          hintText: "Email",
                          fillColor: Colors.white,
                          errorText: _emailError,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
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
                        onSaved: (value) {
                          setState(() {
                            _email = value != null ? value : "";
                          });
                        },
                        validator: (value) {
                          RegExp emailReg = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if ((value == null || value.isEmpty) ||
                              (!emailReg.hasMatch(value))) {
                            return "Invalid Input!";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 22),
                      child: TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: "Password",
                          fillColor: Colors.white,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
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
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Invalid Input!";
                          }
                          if (value.length < 6) {
                            return "Password should contain minimum 6 characters!";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 22),
                      child: TextFormField(
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          fillColor: Colors.white,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
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
                        validator: (value) {
                          if ((value == null || value.isEmpty) ||
                              (value != _password)) {
                            return "Passwords don't match!";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: main_color,
                          onPrimary: Colors.white,
                          shadowColor: Colors.deepOrangeAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _dobError = null;
                            _emailError = null;
                            if (_dob == null) {
                              setState(() {
                                _dobError = "Invalid Input!";
                              });
                            } else {
                              if (ageCalculator(_dob) < 18) {
                                setState(() {
                                  _dobError = "Not an adult!";
                                });
                              } else {
                                if (_isSelected[0] == true) {
                                  _gender = "male";
                                } else if (_isSelected[1] == true) {
                                  _gender = "female";
                                } else {
                                  _gender = "other";
                                }
                                setState(() {
                                  loading = true;
                                });
                                AuthService()
                                    .signUp(_email, _password)
                                    .then((value) {
                                  if (value == null) {
                                    DatabaseService().add("Users", {
                                      "email": _email,
                                      "name": _name,
                                      "phone": _phone,
                                      "dob": _dob,
                                      "height": _height,
                                      "weight": _weight,
                                      "gender": _gender,
                                      "fcoins": 0
                                    }).then((result) {
                                      if (result == null) {
                                        Navigator.pop(context);
                                      } else {
                                        // Something went wrong!
                                        print(result);
                                      }
                                    });
                                  } else if (value.message ==
                                      "The email address is already in use by another account.") {
                                    setState(() {
                                      loading = false;
                                      _emailError =
                                          "Email ID is already registered!";
                                    });
                                  } else {
                                    // Something went wrong!
                                    print(value);
                                  }
                                });
                              }
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
