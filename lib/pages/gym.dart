import 'package:athleap/firebase/auth.dart';
import 'package:athleap/firebase/database.dart';
import 'package:athleap/pages/gymForm.dart';
import 'package:athleap/helpers/loading.dart';
import 'package:athleap/helpers/sort.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var main_color = const Color(0xfffa9b70);

class Row {
  final String date;
  final int calories;
  final int fcoins;
  final String workout;
  final int sets;
  final int reps;
  final int dumbbell_weight;
  final int time;
  final int energy;

  const Row({
    required this.date,
    required this.calories,
    required this.fcoins,
    required this.workout,
    required this.sets,
    required this.reps,
    required this.dumbbell_weight,
    required this.time,
    required this.energy,
  });
}

Row createObject(dynamic json) {
  return Row(
      date: DateFormat("dd/MM/yyyy")
          .format(DateTime.fromMillisecondsSinceEpoch(json["date"])),
      calories: json["calories"],
      fcoins: json["fcoins"],
      workout: json["workout"],
      sets: json["sets"],
      reps: json["reps"],
      dumbbell_weight: json["dumbbell_weight"],
      time: json["time"],
      energy: json["energy"]);
}

class GymHistory extends StatefulWidget {
  const GymHistory({Key? key}) : super(key: key);

  @override
  _GymHistoryState createState() => _GymHistoryState();
}

class _GymHistoryState extends State<GymHistory> {
  bool loading = true;
  String _email = AuthService().userEmail();
  List<Row> rows = [];
  @override
  void initState() {
    super.initState();
    fetchGymData();
  }

  final columns = [
    "#",
    "Date",
    "Calories Burnt",
    "Fcoins Rewarded",
    "Workout",
    "Sets",
    "Reps",
    "Heaviness of the Dumbbell",
    "Time Spent (minutes)",
    "Energy Level"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gym Records",
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: main_color,
        ),
        body: loading
            ? Loading()
            : RefreshIndicator(
                onRefresh: fetchGymData,
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(10.0),
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: buildDataTable()),
                        ))
                  ],
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Align(
          alignment: Alignment(0.9, 0.94),
          child: Transform.scale(
              scale: 1.5,
              child: FloatingActionButton(
                backgroundColor: Color(0xccfa9b70),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddGymData()));
                },
                tooltip: 'Add Data',
                child: Icon(Icons.add),
              )),
        ));
  }

  Widget buildDataTable() {
    if (rows.length == 0) {
      return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          width: MediaQuery.of(context).size.width - 20,
          child: Center(
            child: Text(
              "No Data!",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    } else {
      return DataTable(
        columns: getColumns(columns),
        rows: getRows(rows),
      );
    }
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
              label: Expanded(
                  child: Text(
            column,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ))))
      .toList();

  List<DataRow> getRows(List<Row> rows) => rows.map((Row row) {
        final cells = [
          rows.indexOf(row) + 1,
          row.date,
          row.calories,
          row.fcoins,
          row.workout,
          row.sets,
          row.reps,
          row.dumbbell_weight,
          row.time,
          row.energy
        ];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) => cells
      .map((data) => DataCell(Center(
              child: Text(
            '$data',
            textAlign: TextAlign.center,
          ))))
      .toList();

  Future fetchGymData() async {
    await Future.delayed(const Duration(seconds: 1),
        () {}); // Added this so that the refresh indicator stays for atleast a sec
    if (this.mounted) {
      setState(() {
        loading = true;
      });
    }
    DatabaseService().fetch("Gym", _email).then((snapshot) {
      if (snapshot == null) {
        // Either some error occured or no data found
        List<Row> allRows = <Row>[];
        setState(() {
          rows = allRows;
          loading = false;
        });
      } else {
        List json = sorter(snapshot);
        List<Row> allRows = <Row>[];
        for (dynamic i in json) {
          allRows.add(createObject(i));
        }
        setState(() {
          rows = allRows;
          loading = false;
        });
      }
    });
  }
}
