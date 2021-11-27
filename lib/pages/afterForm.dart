import 'package:flutter/material.dart';

var main_color = const Color(0xfffa9b70);

class AfterForm extends StatelessWidget {
  const AfterForm({Key? key, required this.calories, this.fcoins})
      : super(key: key);
  final calories;
  final fcoins;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Results",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: main_color,
      ),
      body: Row(
        children: <Widget>[
          Text("Calories: $calories"),
          Text(", Fcoins: $fcoins")
        ],
      ),
    );
  }
}
