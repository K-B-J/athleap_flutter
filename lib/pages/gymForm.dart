import 'dart:math';
import 'package:athleap/pages/afterForm.dart';
import 'package:athleap/helpers/ageCalculator.dart';
import 'package:athleap/firebase/database.dart';
import 'package:athleap/helpers/loading.dart';
import 'package:athleap/firebase/auth.dart';
import 'package:athleap/helpers/sort.dart';
import 'package:flutter/material.dart';

var main_color = const Color(0xfffa9b70);

class AddGymData extends StatefulWidget {
  const AddGymData({Key? key}) : super(key: key);

  @override
  _AddGymDataState createState() => _AddGymDataState();
}

class _AddGymDataState extends State<AddGymData> {
  bool loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> workoutList = [
    "Hammer Curl",
    "Biceps Curl",
    "Latteral Raise",
    "Lunge"
  ];
  dynamic _workout = "";
  dynamic _sets = "";
  dynamic _reps = "";
  dynamic _dumbbell_weight = 50.0;
  dynamic _time = "";
  dynamic _energy = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Today's Workout",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: main_color,
      ),
      body: loading
          ? Loading()
          : Container(
              margin: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text("Workout:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: DropdownButtonFormField<String>(
                          items: workoutList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text('$item'),
                            );
                          }).toList(),
                          onChanged: (value) =>
                              (setState(() => _workout = value as String)),
                          onSaved: (value) {
                            _workout = value as String;
                          },
                          validator: (value) {
                            if ((value == null || value.isEmpty) ||
                                (!workoutList.contains(value))) {
                              return "Invalid Input!";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Choose the Workout",
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text("Number of sets:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: TextFormField(
                          initialValue: _sets.toString(),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            RegExp sets = RegExp(r"^[0-9]*$");
                            if ((value == null || value.isEmpty) ||
                                (!sets.hasMatch(value))) {
                              return "Invalid Input!";
                            }
                          },
                          onSaved: (value) {
                            _sets = value != null ? value : "";
                          },
                          decoration: InputDecoration(
                            hintText: "Enter No of Sets",
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text("Number of reps:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: TextFormField(
                          initialValue: _reps.toString(),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            RegExp repsRegex = RegExp(r"^[0-9]*$");
                            if ((value == null || value.isEmpty) ||
                                (!repsRegex.hasMatch(value))) {
                              return "Invalid Input!";
                            }
                          },
                          onSaved: (value) {
                            _reps = value != null ? value : "";
                          },
                          decoration: InputDecoration(
                            hintText: "Enter No of Reps",
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text("Rate the heaviness of the Dumbbell:",
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
                                value: _dumbbell_weight.toDouble(),
                                min: 0.0,
                                max: 100.0,
                                divisions: 100,
                                onChanged: (value) => setState(
                                    () => _dumbbell_weight = value.round()),
                              ),
                            ),
                            Text("100"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text("Total time taken to complete all sets:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: TextFormField(
                          initialValue: _time.toString(),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            RegExp timeRegex = RegExp(r"^[0-9]*$");
                            if ((value == null || value.isEmpty) ||
                                (!timeRegex.hasMatch(value))) {
                              return "Invalid Input!";
                            }
                          },
                          onSaved: (value) {
                            _time = value != null ? value : "";
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Total Time",
                            fillColor: Colors.white,
                            suffixText: "minutes",
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
                                  dynamic _sets,
                                  dynamic _reps,
                                  dynamic _dumbbell_weight,
                                  dynamic _time,
                                  dynamic _energy) {
                                if (_energy == 0) {
                                  _energy += 1;
                                }
                                if (_dumbbell_weight == 0) {
                                  _dumbbell_weight += 1;
                                }
                                dynamic _calories = (_sets *
                                        _reps *
                                        (_bmi / 1.4) *
                                        (_dumbbell_weight / 28)) /
                                    ((_age / 10) *
                                        (_time / 10) *
                                        (_energy / 10));
                                return _calories.floor();
                              }

                              ;
                              fcoinsCalculator(dynamic _age, dynamic _calories,
                                  dynamic _previousGymFcoins) {
                                dynamic _fcoins =
                                    (_calories / _age / 4).floor();
                                if (_fcoins > _previousGymFcoins) {
                                  _fcoins += 1;
                                }
                                return _fcoins;
                              }

                              ;
                              _sets = int.parse(_sets);
                              _reps = int.parse(_reps);
                              _dumbbell_weight = _dumbbell_weight.round();
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
                                  int _calories = calorieCalculator(
                                      _age,
                                      _bmi,
                                      _sets,
                                      _reps,
                                      _dumbbell_weight,
                                      _time,
                                      _energy);
                                  DatabaseService()
                                      .fetch("Gym", _email)
                                      .then((gymSnapshot) {
                                    if (gymSnapshot == null) {
                                      // Something went wrong
                                    } else {
                                      int _previousGymFcoins =
                                          gymSnapshot.docs.length != 0
                                              ? sorter(gymSnapshot)[0]["fcoins"]
                                              : 0;
                                      int _fcoins = fcoinsCalculator(
                                          _age, _calories, _previousGymFcoins);
                                      DatabaseService().add("Gym", {
                                        "email": _email,
                                        "date": _date,
                                        "calories": _calories,
                                        "fcoins": _fcoins,
                                        "workout": _workout,
                                        "sets": _sets,
                                        "reps": _reps,
                                        "dumbbell_weight": _dumbbell_weight,
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
