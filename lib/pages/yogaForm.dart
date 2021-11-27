import 'dart:math';
import 'package:athleap/pages/afterForm.dart';
import 'package:athleap/helpers/ageCalculator.dart';
import 'package:athleap/firebase/database.dart';
import 'package:athleap/helpers/loading.dart';
import 'package:athleap/firebase/auth.dart';
import 'package:athleap/helpers/sort.dart';
import 'package:flutter/material.dart';

var main_color = const Color(0xfffa9b70);

class AddYogaData extends StatefulWidget {
  const AddYogaData({Key? key}) : super(key: key);

  @override
  _AddYogaDataState createState() => _AddYogaDataState();
}

class _AddYogaDataState extends State<AddYogaData> {
  bool loading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> yogaList = [
    "Nadisodhana",
    "Hatha",
    "Surya Namaskar",
    "Power Yoga"
  ];
  dynamic _yoga = "";
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
                        child: Text("Yoga:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: DropdownButtonFormField<String>(
                          items: yogaList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text('$item'),
                            );
                          }).toList(),
                          onChanged: (value) =>
                              (setState(() => _yoga = value as String)),
                          onSaved: (value) {
                            _yoga = value as String;
                          },
                          validator: (value) {
                            if ((value == null || value.isEmpty) ||
                                (!yogaList.contains(value))) {
                              return "Invalid Input!";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Choose the Yoga",
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
                        child: Text("Total time taken to complete the Yoga:",
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
                              calorieCalculator(dynamic _yoga, dynamic _age,
                                  dynamic _wt, dynamic _time, dynamic _energy) {
                                dynamic _met = 0;
                                if (_yoga == "Nadisodhana") {
                                  _met = 2;
                                } else if (_yoga == "Hatha") {
                                  _met = 2.5;
                                } else if (_yoga == "Surya Namaskar") {
                                  _met = 3.3;
                                } else {
                                  _met = 4;
                                }
                                if (_energy == 0) {
                                  _energy += 1;
                                }
                                dynamic _calories =
                                    ((_met * _wt * 3.5) / 200) * _time;
                                return _calories.floor();
                              }

                              fcoinsCalculator(dynamic _age, dynamic _calories,
                                  dynamic _previousYogaFcoins) {
                                dynamic _fcoins = (_calories / 80).floor() +
                                    (_age / 10).floor();
                                if (_fcoins > _previousYogaFcoins) {
                                  _fcoins += 1;
                                }
                                return _fcoins;
                              }

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
                                  double _weight = double.parse(
                                      userSnapshot.docs[0].data()["weight"]);
                                  String _dob =
                                      userSnapshot.docs[0].data()["dob"];
                                  int _age = ageCalculator(_dob);
                                  int _calories = calorieCalculator(
                                      _yoga, _age, _weight, _time, _energy);
                                  DatabaseService()
                                      .fetch("Yoga", _email)
                                      .then((yogaSnapshot) {
                                    if (yogaSnapshot == null) {
                                      // Something went wrong
                                    } else {
                                      int _previousYogaFcoins =
                                          yogaSnapshot.docs.length != 0
                                              ? sorter(yogaSnapshot)[0]["fcoins"]
                                              : 0;
                                      int _fcoins = fcoinsCalculator(
                                          _age, _calories, _previousYogaFcoins);
                                      DatabaseService().add("Yoga", {
                                        "email": _email,
                                        "date": _date,
                                        "calories": _calories,
                                        "fcoins": _fcoins,
                                        "yoga": _yoga,
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
