import 'package:flutter/material.dart';

var main_color = const Color(0xfffa9b70);

class GymHistory extends StatelessWidget {
  const GymHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Gym Records", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: main_color,
      ),
    );
  }
}
