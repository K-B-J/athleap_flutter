import 'package:athleap/firebase/auth.dart';
import 'package:athleap/helpers/loading.dart';
import 'package:athleap/pages/registerForm.dart';
import 'package:flutter/material.dart';

var main_color = const Color(0xfffa9b70);

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  dynamic _email;
  dynamic _password;
  dynamic _emailError;
  dynamic _passwordError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height) / 2.5,
              decoration: BoxDecoration(
                color: main_color,
                image: DecorationImage(
                  scale: 1.5,
                  image: AssetImage("assets/images/splash_screen.png"),
                ),
              ),
            ),
            loading
                ? Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height -
                            ((MediaQuery.of(context).size.height) / 2.5)),
                    child: Loading())
                : Container(
                    margin: EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 22),
                            child: TextFormField(
                              initialValue: _email,
                              validator: (value) {
                                RegExp email = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                if ((value == null || value.isEmpty) ||
                                    (!email.hasMatch(value))) {
                                  return "Invalid Input!";
                                }
                              },
                              onSaved: (value) {
                                _email = value != null ? value : "";
                              },
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
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 22),
                            child: TextFormField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 6) {
                                  return "Invalid Input!";
                                }
                              },
                              onSaved: (value) {
                                _password = value != null ? value : "";
                              },
                              decoration: InputDecoration(
                                hintText: "Password",
                                fillColor: Colors.white,
                                errorText: _passwordError,
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
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: main_color,
                                  onPrimary: Colors.white,
                                  shadowColor: Colors.deepOrangeAccent,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    _emailError = null;
                                    _passwordError = null;
                                    setState(() {
                                      loading = true;
                                    });
                                    AuthService()
                                        .signIn(_email, _password)
                                        .then((value) => {
                                              if (value == null)
                                                {
                                                  // It will automatically redirect to home due to stream
                                                }
                                              else if (value.message ==
                                                  "There is no user record corresponding to this identifier. The user may have been deleted.")
                                                {
                                                  setState(() {
                                                    loading = false;
                                                    _emailError =
                                                        "Email ID is not registered";
                                                  })
                                                }
                                              else if (value.message ==
                                                  "The password is invalid or the user does not have a password.")
                                                {
                                                  setState(() {
                                                    loading = false;
                                                    _passwordError =
                                                        "Incorrect password!";
                                                  })
                                                }
                                              else
                                                {
                                                  // Something went wrong!
                                                  print(value)
                                                }
                                            });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: InkWell(
                              child: Text(
                                "Register Now!",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterForm()));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
