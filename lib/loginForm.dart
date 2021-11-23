import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var _email = "";
  var _password = "";
  var _isEmail = false;
  var _isPassword = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange.shade300,
        ),
        body: Container(
            margin: EdgeInsets.all(10),
            height: height,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                      child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter Email",
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
                                        color: Colors.red,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  onChanged: (text) {
                                    if (text != "") {
                                      setState(() {
                                        _isEmail = true;
                                        _email = text;
                                      });
                                    } else {
                                      setState(() {
                                        _isEmail = false;
                                        _email = text;
                                      });
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email cannot be empty";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Enter password",
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
                                        color: Colors.red,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  onChanged: (text) {
                                    if (text != "") {
                                      setState(() {
                                        _isPassword = true;
                                        _password = text;
                                      });
                                    } else {
                                      setState(() {
                                        _isPassword = false;
                                        _password = text;
                                      });
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Password cannot be empty";
                                    }
                                  },
                                ),
                              ),
                            ],
                          ))),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange.shade300,
                      onPrimary: Colors.white,
                      shadowColor: Colors.deepOrangeAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(400, 60), //////// HERE
                    ),
                    onPressed: _isEmail && _isPassword
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing data ')),
                              );
                            }
                          }
                        : null,
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ])));
  }
}
