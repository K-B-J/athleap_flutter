import 'package:athleap/afterForm.dart';
import 'package:flutter/material.dart';

var main_color = const Color(0xfffa9b70);

class AddGymData extends StatefulWidget {
  const AddGymData({Key? key}) : super(key: key);

  @override
  _AddGymDataState createState() => _AddGymDataState();
}

class _AddGymDataState extends State<AddGymData> {
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
      body: Container(
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
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      RegExp sets = RegExp(r"^\d+(\.\d+)?$");
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
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      RegExp repsRegex = RegExp(r"^\d+(\.\d+)?$");
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
                          onChanged: (value) =>
                              setState(() => _dumbbell_weight = value.round()),
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
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      RegExp timeRegex = RegExp(r"^\d+(\.\d+)?$");
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
                        _sets = int.parse(_sets);
                        _reps = int.parse(_reps);
                        _dumbbell_weight = _dumbbell_weight.round();
                        _time = int.parse(_time);
                        _energy = _energy.round();
                        // Saving the form in db logic will come here
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AfterForm(
                                    calories: 300, fcoins: 100)));
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
