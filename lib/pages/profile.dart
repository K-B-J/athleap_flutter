import 'package:athleap/helpers/ageCalculator.dart';
import 'package:athleap/firebase/database.dart';
import 'package:athleap/helpers/loading.dart';
import 'package:athleap/firebase/auth.dart';
import 'package:flutter/material.dart';
import "./profileElement.dart";
import 'package:intl/intl.dart';

var main_color = const Color(0xfffa9b70);

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
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

  String? _dobError;
  final _formKey = GlobalKey<FormState>();
  List<bool> _isSelected = [true, false, false];
  dynamic _password;
  dynamic _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: main_color,
        automaticallyImplyLeading:
            false, // this will hide Drawer hamburger icon
        actions: <Widget>[Container()],
      ),
      body: loading
          ? Loading()
          : Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    "Hello, $_name",
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
                  ProfileElement("Gender", _gender.toUpperCase()),
                  // Divider for Date of Birth
                  Divider(
                    color: Color(0xff707070),
                    indent: 20,
                    endIndent: 20,
                  ),
                  ProfileElement("DOB", _dob),
                  // Divider for height
                  Divider(
                    color: Color(0xff707070),
                    indent: 20,
                    endIndent: 20,
                  ),
                  ProfileElement("Height", "$_height cm"),
                  // divider for weight
                  Divider(
                    color: Color(0xff707070),
                    indent: 20, // empty space to the leading edge of divider.
                    endIndent: 20,
                  ),
                  ProfileElement("Weight", "$_weight kg"),
                  Divider(
                    color: Color(0xff707070),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Spacer(),
                  // edit button
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      child: Text(
                        "Edit Details",
                      ),
                      onPressed: () {
                        _key.currentState!.openDrawer();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xaa707070),
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
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
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
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Edit Details:-",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                // height: MediaQuery.of(context).size.height,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                        primaryColor:
                                                            main_color)
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
                                                // setState(() {
                                                //   _dob =
                                                //       DateFormat("dd/MM/yyyy")
                                                //           .format(value);
                                                // })
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
                                    decoration: InputDecoration(
                                      hintText: "Height",
                                      hintStyle: TextStyle(color: Colors.black),
                                    ),
                                  )),
                              Text("cm"),
                            ],
                          )),
                      Container(
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 22),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      constraints:
                                          BoxConstraints(maxWidth: 80.0),
                                      child: TextFormField(
                                        initialValue: _weight,
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if ((value == null ||
                                                  value.isEmpty) ||
                                              (double.parse(value) <= 0)) {
                                            return "Invalid Input!";
                                          }
                                        },
                                        onSaved: (value) {
                                          setState(() {
                                            _weight =
                                                value != null ? value : "";
                                          });
                                        },
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          hintText: "Weight",
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                        ),
                                      )),
                                  Text("kg"),
                                ],
                              ))),
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
                                  setState(() {
                                    loading = true;
                                  });
                                  print("$_dob,$_name,$_height,$_weight");
                                  DatabaseService()
                                      .fetch("Users", _email)
                                      .then((userSnapshot) {
                                    if (userSnapshot == null) {
                                      // Something went wrong
                                    } else {
                                      DatabaseService().update("Users", _email,
                                          userSnapshot.docs[0].id, {
                                        "name": _name,
                                        "dob": _dob,
                                        "height": _height,
                                        "weight": _weight,
                                      }).then((value) {
                                        if (value != null) {
                                          Navigator.of(context).pop();
                                          setState(() {
                                            fetchUserData();
                                          });
                                        }
                                      });
                                    }
                                  });
                                }
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xaa707070),
                              onPrimary: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
      drawerEnableOpenDragGesture: false,
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
          print("hellllllllo $_dob");
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
