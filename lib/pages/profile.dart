import 'package:athleap/firebase/database.dart';
import 'package:athleap/helpers/loading.dart';
import 'package:athleap/firebase/auth.dart';
import 'package:flutter/material.dart';
import '../helpers/profileElement.dart';

var main_color = const Color(0xfffa9b70);

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool loading = true;
  final _email = AuthService().userEmail();
  dynamic _name;
  dynamic _gender;
  dynamic _dob;
  dynamic _fcoins;
  dynamic _weight;
  dynamic _height;
  dynamic _phone;
  void initState() {
    super.initState();
    fetchUserData();
  }

  final _formKey = GlobalKey<FormState>();

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
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Hello, $_name",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Divider(
                        color: Color(0xff707070),
                      ),
                      ProfileElement("Phone Number", _phone),
                      Divider(
                        color: Color(0xff707070),
                      ),
                      ProfileElement("Date of Birth", _dob),
                      Divider(
                        color: Color(0xff707070),
                      ),
                      ProfileElement("Gender", _gender.toUpperCase()),
                      Divider(
                        color: Color(0xff707070),
                      ),
                      ProfileElement("Height", "$_height cm"),
                      Divider(
                        color: Color(0xff707070),
                      ),
                      ProfileElement("Weight", "$_weight kg"),
                      Divider(
                        color: Color(0xff707070),
                      ),
                      ProfileElement("Fcoins", "$_fcoins"),
                      Divider(
                        color: Color(0xff707070),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff707070),
                            onPrimary: Colors.white,
                            shadowColor: Color(0xaa707070),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                          onPressed: () {
                            _key.currentState!.openDrawer();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "Edit Details",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14,
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
                            setState(() {
                              loading = true;
                            });
                            AuthService().signOut();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "LogOut",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Edit Details",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
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
                        height: 20,
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
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
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
    DatabaseService().fetch("Users", _email).then((snapshot) {
      if (snapshot == null) {
        // Something went wrong
      } else {
        setState(() {
          _name = snapshot.docs[0].data()["name"];
          _gender = snapshot.docs[0].data()["gender"];
          _dob = snapshot.docs[0].data()["dob"];
          _fcoins = snapshot.docs[0].data()["fcoins"];
          _weight = snapshot.docs[0].data()["weight"];
          _height = snapshot.docs[0].data()["height"];
          _phone = snapshot.docs[0].data()["phone"];
          loading = false;
        });
      }
    });
  }
}
