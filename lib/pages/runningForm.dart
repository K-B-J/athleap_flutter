import 'dart:math';
import 'package:athleap/pages/afterForm.dart';
import 'package:athleap/helpers/ageCalculator.dart';
import 'package:athleap/firebase/database.dart';
import 'package:athleap/helpers/loading.dart';
import 'package:athleap/firebase/auth.dart';
import 'package:athleap/helpers/sort.dart';
import 'package:flutter/material.dart';

var main_color = const Color(0xfffa9b70);

class AddRunningData extends StatefulWidget {
  const AddRunningData({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _AddRunningDataState();
  }
}

class _AddRunningDataState extends State<AddRunningData> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  dynamic _distance = "";
  dynamic _elevation = "";
  dynamic _time = "";
  dynamic _energy = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Today's Workout",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: main_color,
      ),
      body: loading
          ? Loading()
          : Container(
              margin: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Total distance of the run",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ))),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Total distance of the run",
                            fillColor: Colors.white,
                            suffixText: "kilometers",
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
                          onChanged: (text) {},
                          validator: (value) {
                            RegExp distanceRegex = RegExp(r"^\d+(\.\d+)?$");
                            if (value == null || value.isEmpty) {
                              return "Enter distance";
                            } else if (!distanceRegex.hasMatch(value)) {
                              return "Invalid";
                            } else {
                              setState(() {
                                _distance = value != null ? value : "";
                              });
                            }
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Total elevation of the run",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ))),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Total elevation of the run",
                            fillColor: Colors.white,
                            suffixText: "meters",
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
                          onChanged: (text) {},
                          validator: (value) {
                            RegExp elevationRegex = RegExp(r"^\d+(\.\d+)?$");
                            if (value == null || value.isEmpty) {
                              return "Enter elevation";
                            } else if (!elevationRegex.hasMatch(value)) {
                              return "Invalid";
                            } else {
                              setState(() {
                                _elevation = value != null ? value : "";
                              });
                            }
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Total time of the run",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ))),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffixText: "minutes",
                            hintText: "Total time of the run",
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
                          onChanged: (text) {},
                          validator: (value) {
                            RegExp timeRegex = RegExp(r"^\d+(\.\d+)?$");
                            if (value == null || value.isEmpty) {
                              return "Enter time";
                            } else if (!timeRegex.hasMatch(value)) {
                              return "Invalid";
                            } else {
                              setState(() {
                                _time = value != null ? value : "";
                              });
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text("How energetic do you feel?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text("0"),
                            Expanded(
                              child: Slider(
                                value: _energy.toDouble(),
                                min: 0.0,
                                max: 100.0,
                                divisions: 100,
                                onChanged: (value) =>
                                    setState(() => _energy = value.round()),
                              ),
                            ),
                            Text("100"),
                          ],
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
                              setState(() {
                                loading = true;
                              });
                              calorieCalculator(
                                  dynamic _age,
                                  dynamic _bmi,
                                  dynamic _distance,
                                  dynamic _elevation,
                                  dynamic _time,
                                  dynamic _energy) {
                                if (_energy == 0) {
                                  _energy += 1;
                                }
                                dynamic _calories =
                                    (_distance * _bmi * _elevation * 2.2) /
                                        ((_age / 10) *
                                            (_time / 10) *
                                            (_energy / 10));
                                return _calories.floor();
                              }

                              fcoinsCalculator(dynamic _age, dynamic _calories,
                                  dynamic _previousRunningFcoins) {
                                dynamic _fcoins =
                                    (_calories / _age / 4).floor();
                                if (_fcoins > _previousRunningFcoins) {
                                  _fcoins += 1;
                                }
                                return _fcoins;
                              }

                              _distance = double.parse(_distance);
                              _elevation = double.parse(_elevation);
                              _time = int.parse(_time);
                              _energy = _energy.round();
                              dynamic _email = AuthService().userEmail();
                              dynamic _date =
                                  DateTime.now().millisecondsSinceEpoch;

                              DatabaseService()
                                  .fetch("Users", _email)
                                  .then((userSnapshot) {
                                if (userSnapshot == null) {
                                  // Something went wrong
                                } else {
                                  double _bmi = double.parse(userSnapshot
                                          .docs[0]
                                          .data()["weight"]) /
                                      pow(
                                          (double.parse(userSnapshot.docs[0]
                                                  .data()["height"]) /
                                              100),
                                          2);
                                  String _dob =
                                      userSnapshot.docs[0].data()["dob"];
                                  int _age = ageCalculator(_dob);
                                  int _calories = calorieCalculator(_age, _bmi,
                                      _distance, _elevation, _time, _energy);
                                  DatabaseService()
                                      .fetch("Running", _email)
                                      .then((runningSnapshot) {
                                    if (runningSnapshot == null) {
                                      // Something went wrong
                                    } else {
                                      int _previousRunningFcoins =
                                          runningSnapshot.docs.length != 0
                                              ? sorter(runningSnapshot)[0]
                                                  ["fcoins"]
                                              : 0;
                                      int _fcoins = fcoinsCalculator(_age,
                                          _calories, _previousRunningFcoins);
                                      DatabaseService().add("Running", {
                                        "email": _email,
                                        "date": _date,
                                        "calories": _calories,
                                        "fcoins": _fcoins,
                                        "distance": _distance,
                                        "elevation": _elevation,
                                        "time": _time,
                                        "energy": _energy
                                      }).then((value) {
                                        if (value == null) {
                                          int _oldFcoins = userSnapshot.docs[0]
                                              .data()["fcoins"];
                                          int _newFcoins = _oldFcoins + _fcoins;
                                          DatabaseService().update("Users",
                                              _email, userSnapshot.docs[0].id, {
                                            "fcoins": _newFcoins
                                          }).then((value2) => {
                                                if (value2 == 1)
                                                  {
                                                    Navigator.pop(context),
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                AfterForm(
                                                                    calories:
                                                                        _calories,
                                                                    fcoins:
                                                                        _fcoins)))
                                                  }
                                                else
                                                  {
                                                    // Something went wrong
                                                  }
                                              });
                                        } else {
                                          // Something went wrong
                                          print(value);
                                        }
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
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
