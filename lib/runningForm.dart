import 'package:flutter/material.dart';

class AddRunningData extends StatefulWidget {
  const AddRunningData({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _AddRunningDataState();
  }
}

class _AddRunningDataState extends State<AddRunningData> {
  final _formKey = GlobalKey<FormState>();
  double _distance = 0;
  double _elevation = 0;
  double _time = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Today's Run",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade300,
      ),
      body: Container(
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
                          _distance = double.parse(value);
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
                          _elevation = double.parse(value);
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
                          _time = double.parse(value);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.all(10.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepOrange.shade300,
              onPrimary: Colors.white,
              shadowColor: Colors.deepOrangeAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(400, 60), //////// HERE
            ),
            child: Text(
              "Complete Run",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing data ')),
                );
              }
            },
          )),
    );
  }
}
