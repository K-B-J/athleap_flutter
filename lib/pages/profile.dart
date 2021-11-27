import 'package:athleap/firebase/auth.dart';
import 'package:athleap/helpers/loading.dart';
import 'package:flutter/material.dart';

var main_color = const Color(0xfffa9b70);

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: main_color,
      ),
      body: loading
          ? Loading()
          : Center(
              child: ElevatedButton(
                child: Text("Log Out"),
                onPressed: () {
                  setState(() {
                    loading = true;
                  });
                  AuthService().signOut();
                },
              ),
            ),
    );
  }
}
