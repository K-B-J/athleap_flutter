import 'package:athleap/gymForm.dart';
import 'package:flutter/material.dart';

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

class GymHistory extends StatefulWidget {
  const GymHistory({Key? key}) : super(key: key);

  @override
  _GymHistoryState createState() => _GymHistoryState();
}

class _GymHistoryState extends State<GymHistory> {
  late List<Row> rows;
  final allRows = <Row>[
    Row(
        date: "23/11/2021",
        calories: 267,
        fcoins: 3,
        workout: "Hammer Curl",
        sets: 3,
        reps: 12,
        dumbbell_weight: 94,
        time: 30,
        energy: 11),
    Row(
        date: "23/11/2021",
        calories: 267,
        fcoins: 3,
        workout: "Hammer Curl",
        sets: 3,
        reps: 12,
        dumbbell_weight: 94,
        time: 30,
        energy: 11),
    Row(
        date: "23/11/2021",
        calories: 267,
        fcoins: 3,
        workout: "Hammer Curl",
        sets: 3,
        reps: 12,
        dumbbell_weight: 94,
        time: 30,
        energy: 11),
  ];
  void initState() {
    super.initState();
    this.rows = List.of(allRows);
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
        body: Container(
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: buildDataTable(),
                ))),
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
}
