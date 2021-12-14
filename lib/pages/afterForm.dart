import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

var main_color = const Color(0xfffa9b70);

class AfterForm extends StatefulWidget {
  final calories;
  final fcoins;
  AfterForm({Key? key, required this.calories, this.fcoins}) : super(key: key);

  @override
  _AfterFormState createState() => _AfterFormState();
}

class _AfterFormState extends State<AfterForm> {
  double _opacity = 0.0;

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
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Scratch to reveal your Result!",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Scratcher(
                      accuracy: ScratchAccuracy.low,
                      threshold: 0,
                      brushSize: 50,
                      onThreshold: () {
                        setState(() {
                          _opacity = 1;
                        });
                      },
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 250),
                        opacity: _opacity,
                        child: Container(
                          height: 320,
                          width: 320,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Congratulations!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  color: Color(0xfffa9b70),
                                ),
                              ),
                              Text(
                                "Calories Burnt:",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Color(0xfffa9b70),
                                ),
                              ),
                              Text(
                                "${widget.calories}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Color(0xfffa9b70),
                                ),
                              ),
                              Text(
                                "FCoins Earned:",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Color(0xfffa9b70),
                                ),
                              ),
                              Text(
                                "${widget.fcoins}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50,
                                  color: Color(0xfffa9b70),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
